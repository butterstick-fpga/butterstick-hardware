import os
import subprocess
from migen.build.generic_programmer import GenericProgrammer


__all__ = ['FireSenseProgrammer']


class FireSenseProgrammer(GenericProgrammer):
    # def flash(self, address, bitstream_file):
    #     pass

    def load_bitstream(self, bitstream_file):
        config_file = bitstream_file.replace(".bit", ".config")
        svf_file = bitstream_file.replace(".bit", ".svf")
        subprocess.call(["ecpunpack", "--textcfg", config_file, "--input", bitstream_file])
        subprocess.call(["ecppack", "--svf", svf_file, config_file])
        #openocd -c "interface ftdi; ftdi_vid_pid 0x0403 0x6014; ftdi_channel 0; ftdi_layout_init 0xFFF8 0xFFFb; adapter_khz 5000; jtag newtap ecp5 tap -irlen 8 -expected-id 0x81113043; init; svf build/top.svf; exit"
        subprocess.call([
            "openocd", 
            "-c", 
            "interface ftdi; ftdi_vid_pid 0x0403 0x6014; ftdi_channel 0; ftdi_layout_init 0xFFF8 0xFFFb; adapter_khz 5000; jtag newtap ecp5 tap -irlen 8 -expected-id 0x81113043; init; svf "+ svf_file +"; exit",
        ])

        #subprocess.call(["glasgow", "", "build/top.svf"])
        