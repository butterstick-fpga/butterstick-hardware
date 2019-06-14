#!/usr/bin/env python3
import os

from liteeth.common import *

from migen.genlib.io import DDROutput
from migen.genlib.resetsync import AsyncResetSynchronizer

from liteeth.phy.common import *

from migen.genlib.cdc import PulseSynchronizer,BusSynchronizer


class LiteEthPHYRGMIITX(Module):
    def __init__(self, clock_pads, pads):
        self.sink = sink = stream.Endpoint(eth_phy_description(8))

        self.comb += sink.ready.eq(1)

        tx_data = Signal(8)

        tx_valid = Signal()
        self.comb += [
            tx_valid.eq(sink.valid),
            tx_data.eq(sink.data)
        ]

        self.specials += [
            Instance("oddr_1x",
                i_refclk=ClockSignal("clk125"),
                i_data=Cat(tx_data,tx_valid),
                o_clkout=clock_pads.tx,
                o_dout=Cat(pads.tx_data,pads.tx_en)
            )
        ]

        self.clock_domains.cd_eth_tx = ClockDomain()
        self.comb += self.cd_eth_tx.clk.eq(ClockSignal("clk125"))



class LiteEthPHYRGMIIRX(Module):
    def __init__(self, clock_pads,pads,platform):
        self.source = source = stream.Endpoint(eth_phy_description(8))

        # # #
        delcnt = Signal(8)
        ready  = Signal()
        rx_sclk = Signal()
        
        rx_data = Signal(8)
        rx_ctl = Signal(2)

        rx_dv = Signal()
        rx_err = Signal()
        self.comb += rx_dv.eq(rx_ctl[0])
        self.comb += rx_err.eq(rx_ctl[1])

        

        reset = Signal()



        self.specials += [
            Instance("iddr_x1",
                i_clkin=clock_pads.rx,
                i_sync_clk=ClockSignal("sys"),
                i_sync_reset=ResetSignal("sys"),
                i_update=0,
                i_datain=Cat(pads.rx_data,pads.rx_dv),
                o_dcntl=delcnt,
                o_ready=ready,
                o_sclk=rx_sclk,
                o_q=Cat(rx_data,rx_ctl)
            )
        ]
      
        self.clock_domains.cd_eth_rx = ClockDomain()
        # RX : Let the synthesis tool insert the appropriate clock buffer
        self.comb += self.cd_eth_rx.clk.eq(rx_sclk)

#        self.clock_domains.cd_eth_detect = ClockDomain()
 #       self.comb += self.cd_eth_detect.clk.eq()


        #clock_detect = Signal()
        
        #self.specials += AsyncResetSynchronizer(self.cd_eth_rx, (clock_detect))


        led = platform.request("user_led")

        #self.submodules.blink = Blinker(led, 24)
        self.comb += led.eq(rx_sclk)

        
        rx_dv_d = Signal()
        self.sync.eth_rx += rx_dv_d.eq(rx_dv)

# work out how to handle last data...
        last = Signal()
        self.comb += last.eq(~rx_dv & rx_dv_d)
        self.sync.eth_rx += [
            source.valid.eq(rx_dv),
            source.data.eq(rx_data)
        ]
        self.comb += source.last.eq(last)


class LiteEthPHYRGMIICRG(Module, AutoCSR):
    def __init__(self, clock_pads, pads, with_hw_init_reset, mii_mode=0):
        self._reset = CSRStorage()

        # # #

        #self.clock_domains.cd_eth_rx_sclk = ClockDomain()
        #self.clock_domains.cd_eth_tx = ClockDomain()

        # RX : Let the synthesis tool insert the appropriate clock buffer
        #self.comb += self.cd_eth_rx_sclk.clk.eq(ClockSignal("eth_rx"))


        # TX : GMII: Drive clock_pads.gtx, clock_pads.tx unused
        #      MII: Use PHY clock_pads.tx as eth_tx_clk, do not drive clock_pads.gtx
        #self.specials += DDROutput(1, 0, clock_pads.tx, ClockSignal("eth_tx"))
        

        # hack to pass signal through the PLL to bring it from GR to Clock routing
        #self.comb += self.cd_eth_tx.clk.eq(ClockSignal("clk125"))
      


        
        reset = Signal()
        if with_hw_init_reset:
            self.submodules.hw_reset = LiteEthPHYHWReset()
            self.comb += reset.eq(self._reset.storage | self.hw_reset.reset)
        else:
            self.comb += reset.eq(self._reset.storage)

        self.comb += pads.rst_n.eq(~reset)
        self.specials += [
            #AsyncResetSynchronizer(self.cd_eth_tx, reset),
            #AsyncResetSynchronizer(ClockSignal("eth_rx"), reset),
        ]


class LiteEthPHYRGMII(Module, AutoCSR):
    def __init__(self, clock_pads, pads, platform,with_hw_init_reset=True):
        self.dw = 16
        self.submodules.crg = LiteEthPHYRGMIICRG(clock_pads, pads, with_hw_init_reset)
        self.submodules.tx = LiteEthPHYRGMIITX(clock_pads,pads)
        self.submodules.rx = LiteEthPHYRGMIIRX(clock_pads,pads, platform)
        self.sink, self.source = self.tx.sink, self.rx.source

        if hasattr(pads, "mdc"):
            self.submodules.mdio = LiteEthPHYMDIO(pads)

        vdir = os.path.join(os.path.abspath(os.path.dirname(__file__)), "verilog")
        platform.add_source(os.path.join(vdir, "iddr_x1.v"))
        platform.add_source(os.path.join(vdir, "oddr_x1.v"))
