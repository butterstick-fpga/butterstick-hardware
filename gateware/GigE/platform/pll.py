#!/usr/bin/env python3
import os



from migen.genlib.resetsync import AsyncResetSynchronizer
from migen import *


class pll(Module):
    def __init__(self, platform):
        ref_clk = platform.request("clk_in")

        self.clock_domains.cd_clk50 = ClockDomain()
        #self.clock_domains.cd_clk25_90 = ClockDomain()
        self.clock_domains.cd_clk125 = ClockDomain()
        self.clock_domains.cd_clk125_90 = ClockDomain()
        self.clock_domains.cd_por = ClockDomain()

        clk_0_125 = Signal()
        clk_1_125_90 = Signal()
        clk_2_25 = Signal()
        clk_lock = Signal()
        

        self.specials += [
            Instance("pll_test",
                i_CLKI=ref_clk,
                o_CLKOP=clk_0_125,
                o_CLKOS=clk_1_125_90,
                o_CLKOS2=clk_2_25,
                #o_CLKOS3=clk_3_125_90,
                o_LOCK=clk_lock,
            ),
        ]

        reset_delay = Signal(12, reset=2048)

        self.comb += [
            self.cd_clk50.clk.eq(clk_2_25),
            self.cd_clk125.clk.eq(clk_0_125),
            self.cd_clk125_90.clk.eq(clk_1_125_90),

            self.cd_clk50.rst.eq(reset_delay != 0),
            self.cd_clk125.rst.eq(reset_delay != 0),
            self.cd_clk125_90.rst.eq(reset_delay != 0),
        ]

        self.comb += [
            self.cd_por.clk.eq(clk_2_25)
        ]
        self.sync.por += \
            If((reset_delay != 0) & (clk_lock != 0),
                reset_delay.eq(reset_delay - 1)
            )

        vdir = os.path.join(os.path.abspath(os.path.dirname(__file__)), "verilog")
        platform.add_source(os.path.join(vdir, "pll.v"))



