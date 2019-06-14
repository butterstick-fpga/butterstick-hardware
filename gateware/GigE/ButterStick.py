#!/usr/bin/env python3
import sys
import argparse

from migen import *
from migen.genlib.resetsync import AsyncResetSynchronizer

from litex.build.generic_platform import *
from litex.boards.platforms import versa_ecp5

from litex.soc.cores.clock import *
from litex.soc.integration.soc_core import *
from litex.soc.integration.builder import *
from litex.soc.cores.uart import UARTWishboneBridge

from litescope import LiteScopeAnalyzer

from liteeth.common import *
from liteeth.core import LiteEthUDPIPCore

from eth.ecp5rgmii import LiteEthPHYRGMII

from platform import FireSensePlatform

from liteeth.common import *
from liteeth.core import LiteEthUDPIPCore,LiteEthMAC
from UDPStreamer import LiteEthTTY

from platform.pll import pll

from DummyCamera import DummyCamera
from FlirTau2 import FlirTau2



class _CRG(Module):
    def __init__(self, platform, sys_clk_freq):
        self.clock_domains.cd_sys = ClockDomain()
        #self.clock_domains.cd_clk125 = ClockDomain()

        # # #

        # clk / rst
        clk25 = platform.request("clk_in")
        #rst_n = platform.request("rst_n")
        platform.add_period_constraint(clk25, period_ns(25e6))

        # pll
        self.submodules.pll = pll = ECP5PLL()
        pll.register_clkin(clk25, 25e6)

       # pll.create_clkout(self.cd_clk125, 125e6)
        pll.create_clkout(self.cd_sys, sys_clk_freq)
        self.specials += AsyncResetSynchronizer(self.cd_sys, ~pll.locked)
        #self.specials += AsyncResetSynchronizer(self.cd_clk125, ~pll.locked)


        #platform.add_period_constraint(self.cd_clk125.clk, period_ns(125e6))
        platform.add_period_constraint(self.cd_sys.clk, period_ns(sys_clk_freq))

        
class DevSoC(SoCCore):
    csr_map = {
        "analyzer":  17
    }
    csr_map.update(SoCCore.csr_map)
    def __init__(self):
        self.platform = platform = FireSensePlatform()
        sys_clk_freq = int(150e6)
        SoCCore.__init__(self, platform, clk_freq=sys_clk_freq,
                         cpu_type=None, with_uart=False,
                         csr_data_width=32,
                         ident="Versa ECP5 test SoC", ident_version=True)

        # crg
        self.submodules.crg = _CRG(platform, sys_clk_freq)

        # uart
        self.submodules.bridge = UARTWishboneBridge(platform.request("serial"), sys_clk_freq, baudrate=1000000)
        self.add_wb_master(self.bridge.wishbone)

        # ethernet phy
        ethphy = LiteEthPHYRGMII(platform.request("eth_clocks"),
                        platform.request("eth"))
        ethcore = LiteEthUDPIPCore(ethphy,
                                   mac_address=0x10e2d5000000,
                                   ip_address=convert_ip("192.168.1.50"),
                                   clk_freq=sys_clk_freq,
                                   with_icmp=False)
        self.submodules += ethphy,ethcore

        # led blinking
        led_counter = Signal(32)
        self.sync += led_counter.eq(led_counter + 1)
        self.comb += platform.request("user_led", 0).eq(led_counter[25])

        # analyzer
        analyzer_signals = [
        #    ethphy.sink,
            ethcore.mac.core.crc32_checker.source
        ]
        self.submodules.analyzer = LiteScopeAnalyzer(analyzer_signals, 128, "eth_rx")

        #self.comb += ethphy.source.connect(ethphy.sink)

    def do_exit(self, vns):
        if hasattr(self, "analyzer"):
            self.analyzer.export_csv(vns, "test/analyzer.csv")

class BaseSoC(SoCCore):
    def __init__(self):
        self.platform = platform = FireSensePlatform()
        sys_clk_freq = int(125e6)
        SoCCore.__init__(self, platform, clk_freq=sys_clk_freq,
                          cpu_type=None, with_uart=True,
                          csr_data_width=32,
                          ident="Versa ECP5 test SoC", ident_version=True)

        # crg
        self.submodules.crg = _CRG(platform, sys_clk_freq)

        # ethernet mac/udp/ip stack
        ethphy = LiteEthPHYRGMII(platform.request("eth_clocks"),
                        platform.request("eth"))
        ethcore = LiteEthUDPIPCore(ethphy,
                                   mac_address=0x10e2d5000000,
                                   ip_address=convert_ip("192.168.1.50"),
                                   clk_freq=sys_clk_freq,
                                   with_icmp=False)
        self.submodules += ethphy, ethcore

        ethphy.crg.cd_eth_rx.clk.attr.add("keep")
        ethphy.crg.cd_eth_tx.clk.attr.add("keep")
        platform.add_period_constraint(ethphy.crg.cd_eth_rx.clk, period_ns(125e6))
        platform.add_period_constraint(ethphy.crg.cd_eth_tx.clk, period_ns(125e6))

        # led blinking
        #led_counter = Signal(32)
        #self.sync += led_counter.eq(led_counter + 1)
        #self.comb += platform.request("user_led", 0).eq(led_counter[0])

        cam = DummyCamera()
        #cam = FlirTau2(platform)
        self.submodules += cam

        ethTTY = LiteEthTTY(ethcore.udp, convert_ip("192.168.1.100"), 9000, tx_fifo_depth=2*1024)
        self.submodules += ethTTY

        self.comb += cam.source.connect(ethTTY.sink)   
        # led blinking
        led_counter = Signal(32)
        self.sync += led_counter.eq(led_counter + 1)
        self.comb += platform.request("user_led", 0).eq(led_counter[26])     
        

class BaseSoCEth(SoCCore):
    def __init__(self):
        self.platform = platform = FireSensePlatform()
        sys_clk_freq = int(125e6)
        SoCCore.__init__(self, platform, clk_freq=sys_clk_freq,
                          cpu_type="picorv32", with_uart=True,
                          csr_data_width=32,
                          ident="Versa ECP5 test SoC", ident_version=True)

        # crg
        self.submodules.crg = _CRG(platform, sys_clk_freq)

        # ethernet mac/udp/ip stack
        ethphy = LiteEthPHYRGMII(platform.request("eth_clocks"),
                        platform.request("eth"))
        ethcore = LiteEthUDPIPCore(ethphy,
                                   mac_address=0x10e2d5000000,
                                   ip_address=convert_ip("192.168.1.50"),
                                   clk_freq=sys_clk_freq,
                                   with_icmp=True)
        self.submodules += ethphy, ethcore

        ethphy.crg.cd_eth_rx.clk.attr.add("keep")
        ethphy.crg.cd_eth_tx.clk.attr.add("keep")
        platform.add_period_constraint(ethphy.crg.cd_eth_rx.clk, period_ns(125e6))
        platform.add_period_constraint(ethphy.crg.cd_eth_tx.clk, period_ns(125e6))

        # led blinking
        #led_counter = Signal(32)
        #self.sync += led_counter.eq(led_counter + 1)
        #self.comb += platform.request("user_led", 0).eq(led_counter[0])

        cam = DummyCamera()
        #cam = FlirTau2(platform)
        self.submodules += cam

        ethTTY = LiteEthTTY(ethcore.udp, convert_ip("192.168.1.100"), 9000, tx_fifo_depth=2*1024)
        self.submodules += ethTTY

        self.comb += cam.source.connect(ethTTY.sink)   
        # led blinking
        led_counter = Signal(32)
        self.sync += led_counter.eq(led_counter + 1)
        self.comb += platform.request("user_led", 0).eq(led_counter[26])     
     
# EthernetSoC --------------------------------------------------------------------------------------

class EthernetSoC(BaseSoCEth):
    mem_map = {
        "ethmac": 0x30000000,  # (shadow @0xb0000000)
    }
    mem_map.update(BaseSoCEth.mem_map)

    def __init__(self):
        self.platform = platform = FireSensePlatform()
        sys_clk_freq = int(62.5e6)
        SoCCore.__init__(self, platform, clk_freq=sys_clk_freq,
                          cpu_type="picorv32", with_uart=True,
                          csr_data_width=32,
                          integrated_rom_size=0x8000,
                          ident="Versa ECP5 test SoC", ident_version=True)

        # crg
        self.submodules.crg = _CRG(platform, sys_clk_freq)

        self.submodules.ethphy = LiteEthPHYRGMII(
            self.platform.request("eth_clocks"),
            self.platform.request("eth"))
        self.add_csr("ethphy")
        self.submodules.ethmac = LiteEthMAC(phy=self.ethphy, dw=32,
            interface="wishbone", endianness=self.cpu.endianness)
        self.add_wb_slave(mem_decoder(self.mem_map["ethmac"]), self.ethmac.bus)
        self.add_memory_region("ethmac", self.mem_map["ethmac"] | self.shadow_base, 0x2000)
        self.add_csr("ethmac")
        self.add_interrupt("ethmac")

        self.ethphy.crg.cd_eth_rx.clk.attr.add("keep")
        self.ethphy.crg.cd_eth_tx.clk.attr.add("keep")
        self.platform.add_period_constraint(self.ethphy.crg.cd_eth_rx.clk, 1e9/125e6)
        self.platform.add_period_constraint(self.ethphy.crg.cd_eth_tx.clk, 1e9/125e6)


def main():
    


    soc = BaseSoC()

    if "dev" in sys.argv[1:]:
        soc = DevSoC()

    if "eth" in sys.argv[1:]:
        soc = EthernetSoC()
    #builder = Builder(soc)
    builder = Builder(soc, output_dir="build", csr_csv="test/csr.csv")

    bitstream_file = os.path.join(builder.output_dir,"gateware","impl", "top_impl.bit")

    platform = soc.platform

    if "program-only" in sys.argv[1:]:
        platform.create_programmer().load_bitstream(bitstream_file)
    else:
        #builder.build()
        vns = builder.build()
        soc.do_exit(vns)

        if "program" in sys.argv[1:]:
            platform.create_programmer().load_bitstream(bitstream_file)

if __name__ == "__main__":
    main()



