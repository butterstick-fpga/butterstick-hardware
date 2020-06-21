#!/usr/bin/env python
import re
import os.path
import sys
sys.path.insert(1, '/usr/lib/kicad-nightly/lib/python3/dist-packages/')
import pcbnew
import time
import click
from collections import defaultdict
import textwrap
from dataclasses import dataclass
from typing import Any, Sequence, Union, Dict

"""
--- Bus aware automated length matching verification tool for KiCad ---

This script allows you to define length relations between several nets in your 
design and helps you to automatically verify them. To tell the script your 
length requirements, place a text box within your KiCad schematic and place 
the structed definition inside (called 'annotation' here). Each annotation 
must be contained within its own text box!

Call it by: script_name.py layout.kicad_pcb schematic.sch

Matching all the nets (DATA_0, DATA_1, ...) to relative tolerance of 2.0 mm:
    LENGTH MATCHING:
    id: data1_rule
    netnames: "DATA_[0-9]+"
    tolerance: 2.0 mm
    vialength: 0.0 mm
-> The structured annotation begins with "LENGTH MATCHING:", "#" is used as a 
comment on line beginnings.
-> "id" is your descriptive name for the rule (only alphanumerics).
-> "netnames" is a regex by which the net names of interest for this 
annotation are selected.
-> "tolerance" is the maximum allowed length tolerance between the shortest 
and longest net within your selection. Dimensions can be 'mm' or 'mil'.
-> "vialength" is used to account for length of the via additional to the pure 
track length. Enter zero to ignore vias. It is not distinguished between 
different via types!

Matching all the nets within the net class "RAM_DATA" to relative tolerance of 
2.0 mm:
    LENGTH MATCHING:
    id: data2_rule
    netclass: RAM_DATA
    tolerance: 2.0 mm
    vialength: 0.0 mm
-> "netclass" is the (pure) name of the net class defined in KiCad. Can be 
used together with "netnames" to further limit the selection (AND logic).

Matching all the nets (DATA_0, DATA_0_R, DATA_1, DATA_1_R,...) to relative 
tolerance of 2.0 mm, but treat DATA_0 and DATA_0_R as one net:
    LENGTH MATCHING:
    id: data3_rule
    netnames: "DATA_[0-9]+"
    merge: "(DATA_[0-9]+)(?:_R)?"
    tolerance: 2.0 mm
    vialength: 0.0 mm
-> "merge" defines a regex to group several net names to treat them as one 
single net with summed length. Its main application is to match series 
terminated data lines. First capture group defines the common basename.

Match a both lines of a differential clock (CLK_P, CLK_N) to relative 0.05 mm 
and the whole pair to 5.0 mm tolerance with respect to data1_rule:
    LENGTH MATCHING:
    id: dclk1_rule
    netnames: "CLK_[PN]"
    tolerance: 0.05 mm
    vialength: 0.0 mm
    
    LENGTH MATCHING:
    id: dclk2_rule
    netnames: "CLK_[PN]"
    tolerance: 5.0 mm
    vialength: 0.0 mm
    reflength: group data1_rule
-> "reflength" is the absolute target length of a trace. This can be a static 
target by just supplying a constant length, or a dynamic one as shown. In the 
later case, "group" followed by an annotation id is required.

Basic assumptions:
- The field order within an annotation doesn't matter.
- The order in which annotations are defined doesn't matter, especially 
between referenced ones.
- The annotation id should be unique!
- You can have multiple annotations for one net, but the tool will check each 
separately! If they are mutual exclusive, you never get a green light :P
- If the "reflength" of an annotation depends on another annotation, then the 
first one will only be checked and listed once the referenced one is 
fulfilled!
- Regular expressions must be enclosed in quotes.
- Always be very polite to the annotation block parser, it is written in very 
simple manner and quite dumb! It tries to complain on errors, but who knows.
- To speed things up and have more overview, use separate sheets and don't put
everything on one sheet. Verification is done on a per-sheet-basis.

Typical output:
    Constraint ftdi MEETS TOLERANCE 5.000 mm (max variance 4.955 mm)
       FTDI_BE0   20.304 mm  (from med  3.418 mm | from max  0.000 mm)   2 vias
-> NETNAME
-> TOTAL NET LENGTH
-> DEVIATION FROM MEDIAN LENGTH
-> DEVIATION FROM MAX LENGTH
-> VIA COUNT

This program is still work in progress and not refined yet! Do not expect a 
perfect 100% solution, but it won't burn your house...at least I hope so.
If you find a bug or have an improvement, let me and others know.
--- Happy hardware hacking!

Inspired and originally based on:
(C)2014 Angus Gratton @projectgus, Licensed under New BSD License
https://github.com/mithro/kicad-length-matching-checks

Hacked on by:
(C) 2020 JOP aka Knusperkeks
(C) 2020 Greg Davill @gregdavill
"""

BRIGHTGREEN = '\033[92;1m'
BRIGHTRED = '\033[91;1m'
ENDC = '\033[0m'
CLEARPAGE = '\033c'


@dataclass
class Net:
    netname: str
    netclass: str
    netlength: int
    viacount: int

    def length(self, annotation):
        return self.netlength + self.viacount * annotation.via_length


@dataclass
class Annotation:
    id: str
    netnames: str
    netclass: str
    merge: str
    ref_length_type: str
    ref_length_value: Any
    tolerance: float
    via_length: float


class NetDB(object):
    """Database holding all nets within a design and providing filtered output.
    """

    def __init__(self):
        self.db = {}

    @classmethod
    def load_from_pcb(cls, filepath: str):
        """Initialize database by loading a complete pcb layout in.
        
        While loading, all tracks within a net get summed up and the number of 
        vias get counted.
        """
        obj = cls()

        pcb = pcbnew.LoadBoard(filepath)
        pcb.BuildListOfNets()  # required so 'pcb' contains valid netclass data
        for track in pcb.GetTracks():
            name = track.GetNet().GetNetname()
            clsname = track.GetNet().GetClassName()
            length = track.GetLength()
            if name in obj.db:
                obj.db[name].netlength += length
            else:
                obj.db[name] = Net(name, clsname, length, 0)
            if track.Type() == pcbnew.PCB_VIA_T:
                obj.db[name].viacount += 1
        return obj

    def netclasses(self, *netnames: str) -> Sequence[str]:
        """Get net classes of given net names or all within the design.
        """
        if not netnames:
            return tuple(set(net.netclass for net in self.db.values()))
        else:
            return tuple(set(net.netclass for net in self.db.values() if net.netname in netnames))

    def netnames(self, *netclasses: str) -> Sequence[str]:
        """Get net names of given net classes or all within the design.
        """
        if not netclasses:
            return tuple(self.db.keys())
        else:
            return tuple(net.netname for net in self.db.values() if net.netclass in netclasses)

    def nets_by_name(self, *netnames: str) -> Sequence[Net]:
        """Get all net objects of given net names or all within the design.
        """
        if netnames and any(netnames):
            return tuple(net for net in self.db.values() if net.netname in netnames)
        else:
            return tuple(self.db.values())

    def nets_by_class(self, *netclasses: str) -> Sequence[Net]:
        """Get all net objects of given net classes or all within the design.
        """
        if netclasses and any(netclasses):
            return tuple(net for net in self.db.values() if net.netclass in netclasses)
        else:
            return tuple(self.db.values())

    def nets_by_annotation(self, annotation: Annotation, merge: bool = True) -> Sequence[Net]:
        """Get all net objects matched by a given annotation definition.
        
        Merge controls, whether the corresponding regex from the annotation
        shall be applied to group net objects based on their name.
        """
        nets_classed = self.nets_by_class(annotation.netclass)
        nets_named = list(filter(lambda x: re.match(annotation.netnames, x.netname), nets_classed))
        if merge and annotation.merge:
            merged = {}
            for n in nets_named:
                m = re.match(annotation.merge, n.netname)
                if not m:
                    merged[n.netname] = n
                    continue
                else:
                    short_name = ''.join(m.groups())
                    if short_name in merged:
                        merged[short_name].netlength += n.netlength
                        merged[short_name].viacount += n.viacount
                    else:
                        merged[short_name] = n
                        merged[short_name].netname = short_name
            return list(merged.values())
        else:
            return nets_named


def print_color(color, s):
    print(color + s + ENDC)


def nm_to_mm(nm):
    return float(nm) / 1e6


def mm_to_nm(mm):
    return int(mm * 1e6)


def median(x: Union[int, float]) -> float:
    """Return median from a list of values.
    
    Thanks to http://stackoverflow.com/a/25791644
    """
    if len(x) % 2 != 0:
        return sorted(x)[len(x) // 2]
    else:
        midavg = (sorted(x)[len(x) // 2] + sorted(x)[len(x) // 2 - 1]) / 2.0
        return midavg


def match_netgroup(annotation: Annotation, nets: Sequence[Net]) -> bool:
    """Match nets for the given length tolerance from annotation.
    
    Returns whether the test defined by the annotation is fulfilled or not and 
    prints a status message for each net on the console output.
    """
    nets = sorted(nets, key=lambda x: x.netname)

    minlen = min(net.length(annotation) for net in nets)
    maxlen = max(net.length(annotation) for net in nets)
    delta = maxlen - minlen
    meets = delta < annotation.tolerance

    print_color(BRIGHTGREEN if meets else BRIGHTRED,
                f"Constraint {annotation.id} {'MEETS' if meets else 'FAILS'} TOLERANCE {nm_to_mm(annotation.tolerance):.3f} mm (max variance {nm_to_mm(delta):.3f} mm)")
    # print individual net lengths, relative to the median/max length
    medlen = median([net.length(annotation) for net in nets])
    alignment = max(len(net.netname) for net in nets) + 1
    for net in nets:
        actual_length = nm_to_mm(net.length(annotation))
        from_median = nm_to_mm(net.length(annotation) - medlen)
        from_max = nm_to_mm(net.length(annotation) - maxlen)
        via_string = f'  {net.viacount:2d} vias' if net.viacount > 0 else ''
        print(
            f"  {net.netname:^{alignment}s} {actual_length:6.3f} mm  (from med {from_median: 6.3f} mm | from max {from_max: 6.3f} mm){via_string}")

    return meets


def match_netgroup_reflength(annotation: Annotation, nets: Sequence[Net], ref_length: float) -> bool:
    """Match nets for the given length tolerance from annotation to a ref length.
    
    Returns whether the test defined by the annotation is fulfilled or not and 
    prints a status message for each net on the console output.
    """
    nets = sorted(nets, key=lambda x: x.netname)

    delta = max(abs(net.length(annotation) - ref_length) for net in nets)
    meets = delta < annotation.tolerance

    print_color(BRIGHTGREEN if meets else BRIGHTRED,
                f"Constraint {annotation.id} {'MEETS' if meets else 'FAILS'} TOLERANCE {nm_to_mm(annotation.tolerance):.3f} mm (max variance {nm_to_mm(delta):.3f} mm | reference {nm_to_mm(ref_length):.3f} mm)")
    # print individual net lengths, relative to the reference length
    alignment = max(len(net.netname) for net in nets) + 1
    for net in nets:
        actual_length = nm_to_mm(net.length(annotation))
        from_reference = nm_to_mm(net.length(annotation) - ref_length)
        via_string = f'  {net.viacount:2d} vias' if net.viacount > 0 else ''
        print(
            f"  {net.netname:^{alignment}s} {actual_length:6.3f} mm  (from reference {from_reference: 6.3f} mm){via_string}")

    return meets


def generate_reflength(annotation: Annotation, annotations_by_id: Dict[str, Annotation], netdb: NetDB) -> float:
    """Generates the dynamic ref length for a given annotation.
    
    Supports ref length requests of type 'length' and 'group'.
    """
    if not annotation.ref_length_type:
        raise ValueError('no ref length type defined for this annotation', annotation)

    if annotation.ref_length_type == 'length':
        return annotation.ref_length_value
    elif annotation.ref_length_type == 'group':
        a = annotations_by_id[annotation.ref_length_value]
        nets = netdb.nets_by_annotation(a)
        minlen = min(net.length(a) for net in nets)
        maxlen = max(net.length(a) for net in nets)
        if (maxlen - minlen) > a.tolerance:
            raise RuntimeError('linked net group is not within its tolerance requirements')
        return (maxlen + minlen) / 2
    else:
        raise ValueError('invalid ref length type requested', annotation)


def parse_schematic_annotation(filepath) -> Sequence[Annotation]:
    """
    Parse text box from schematic to get length matching information.
    
    Formating for the text box is as following:
      LENGTH MATCHING:
      id: ftdi_io_traces
      netclass: FTDI_IO
      netnames: "FTDI_\w+"
      merge: "(.*?)(?:_R)?$"
      tolerance: 1.0 mm
      reflength: 10.0 mm
      vialength: 1.6 mm

    Either 'netclass' or 'netnames' is required for selected the nets for a rule.
    Per text box, only one length matching definition is allowed.
    Regular expressions need to be within double quotes.
    Comments start with a pound sign.
    """
    
    # Very basic schematic parser for the new kicad format, pull out strings with "LENGTH MATCHING" in them."
    texts = []
    schematic = open(filepath, 'r').read().encode('utf-8').decode()

    text_elements = re.findall(r'\"LENGTH MATCHING.*', schematic, re.MULTILINE)
    # Remove first and last `"` in string
    for text in text_elements:
        l = text.find('"')
        r = text.rfind('"')
        texts += [text[l+1:r].encode('utf-8').decode('unicode_escape')]

    annotations = []
    for text in texts:
        mm = re.search(r'^LENGTH MATCHING:[ \t]*\n', text, re.M)
        if mm:
            content = textwrap.indent(text[mm.start():], prefix='    ')


            annotation_id = ''
            netclass = ''
            netnames = '.*'
            merge = None
            ref_length_type = ''
            ref_length_value = None
            tolerance = None
            via_length = 0.0
            for line in text[mm.end():].splitlines():
                line = line.strip()
                if not line or line[0] == '#':
                    continue

                m = re.match(r'^id:[ \t]*(\w+)$', line)
                if m:
                    annotation_id = m.group(1)
                    continue
                m = re.match(r'^netclass:[ \t]*(\w+)$', line)
                if m:
                    netclass = m.group(1)
                    continue
                m = re.match(r'^netnames:[ \t]*(.+?)$', line)
                if m:
                    x = m.group(1).strip()
                    if x[0] == '"' and x[-1] == '"':
                        netnames = repr(x[1:-1])[1:-1]  # escape string
                        continue
                m = re.match(r'^merge:[ \t]*(.+?)$', line)
                if m:
                    x = m.group(1).strip()
                    if x[0] == '"' and x[-1] == '"':
                        merge = repr(x[1:-1])[1:-1]  # escape string
                        continue
                m = re.match(r'^reflength:[ \t]*(.+)$', line)
                if m:
                    x = m.group(1).strip()
                    m = re.match(r'^(\d+(?:[.]\d+)?)[ ]*(mm|mil)$', x)
                    if m:
                        conversion = {'mm': 1.0, 'mil': 25.4e-3}
                        ref_length_type = 'length'
                        ref_length_value = mm_to_nm(float(m.group(1)) * conversion[m.group(2)])
                        continue
                    m = re.match(r'^group[ \t]+(\w+)$', x)
                    if m:
                        ref_length_type = 'group'
                        ref_length_value = m.group(1)
                        continue
                    print(
                        f'Parameter for "reflength" could not be parsed correctly in schematic ({filepath}):\n{content}',
                        file=sys.stderr, flush=True)
                m = re.match(r'^tolerance:[ \t]*(\d+(?:[.]\d+)?)[ ]*(mm|mil)$', line)
                if m:
                    conversion = {'mm': 1.0, 'mil': 25.4e-3}
                    tolerance = mm_to_nm(float(m.group(1)) * conversion[m.group(2)])
                    continue
                m = re.match(r'^vialength:[ \t]*(\d+(?:[.]\d+)?)[ ]*(mm|mil)$', line)
                if m:
                    conversion = {'mm': 1.0, 'mil': 25.4e-3}
                    via_length = mm_to_nm(float(m.group(1)) * conversion[m.group(2)])
                    continue

            if tolerance is None:
                print(f'Tolerance is not specified in schematic ({filepath}):\n{content}', file=sys.stderr, flush=True)
                sys.exit(1)
            if not annotation_id:
                print(f'Annotation id is not specified in schematic ({filepath}):\n{content}', file=sys.stderr,
                      flush=True)
                sys.exit(1)
            annotations.append(
                Annotation(annotation_id, netnames, netclass, merge, ref_length_type, ref_length_value, tolerance,
                           via_length))
    return annotations


@click.command()
@click.argument('filepath_pcblayout', type=click.Path(exists=True))
@click.argument('filepath_schematic', type=click.Path(exists=True))
def main(filepath_pcblayout, filepath_schematic):
    first = True

    while True:
        # wait for the file contents to change
        lastmtime_pcb = os.path.getmtime(filepath_pcblayout)
        lastmtime_sch = os.path.getmtime(filepath_schematic)
        mtime_pcb = lastmtime_pcb
        mtime_sch = lastmtime_sch
        while mtime_pcb == lastmtime_pcb and mtime_sch == lastmtime_sch and not first:
            try:
                mtime_pcb = os.path.getmtime(filepath_pcblayout)
                mtime_sch = os.path.getmtime(filepath_schematic)
            except OSError:
                pass  # kicad save process seems to momentarily delete file, so there's a race here with "No such file.."
            time.sleep(0.1)
        first = False

        allmatches = True
        annotations = parse_schematic_annotation(filepath_schematic)
        annotations_by_id = {a.id: a for a in annotations}
        for a in annotations:
            if a.ref_length_type == 'group' and a.ref_length_value not in annotations_by_id:
                print(f'Annotation block "{a.id}" references unknown block "{a.ref_length_value}"', file=sys.stderr,
                      flush=True)
                sys.exit(1)

        #print(CLEARPAGE, end='')
        for a in annotations:
            netdb = NetDB.load_from_pcb(filepath_pcblayout)
            nets = netdb.nets_by_annotation(a)
            if a.ref_length_type:
                try:
                    ref_length = generate_reflength(a, annotations_by_id, netdb)
                except RuntimeError:
                    continue
                allmatches = match_netgroup_reflength(a, nets, ref_length) and allmatches
            else:
                allmatches = match_netgroup(a, nets) and allmatches
        if allmatches:
            print('\nâ†’ Finished =)')
            sys.exit(0)
        #  print(CLEARPAGE, end='')


if __name__ == "__main__":
    main()