#!/usr/bin/env python3
import os

from liteeth.common import *

from migen.genlib.io import DDROutput
from migen.genlib.resetsync import AsyncResetSynchronizer

from liteeth.phy.common import *

from migen.genlib.cdc import PulseSynchronizer,BusSynchronizer


class LiteEthPHYRGMIITX(Module):
    def __init__(self, clock_pads, pads):
        self.sink = sink = stream.Endpoint(eth_phy_description(16))

        self.sync += sink.ready.eq(1)


        ready  = Signal()
        tx_sclk = Signal()
        tx_data = Signal(16)

        tx_valid = Signal(4)
        valid_ff = Signal()
        data_ff = Signal(16)


        self.comb += [
            #If(sink.valid & valid_ff,
                tx_valid.eq(Cat(valid_ff,valid_ff,valid_ff,valid_ff)),
            #).Else(
            #    tx_valid.eq(Cat(valid_ff,valid_ff,0,0))
            #),
            #tx_data.eq(Cat(sink.data[8:16],sink.data[0:8]))
            #tx_data.eq(Cat(sink.data[8:16],sink.data[0:8]))
            
            #tx_valid.eq(0xF),

            If(valid_ff,
                #tx_data.eq()
                tx_data.eq(data_ff)
            #    tx_data.eq(Cat(sink.data[4:8],sink.data[0:4],sink.data[12:16],sink.data[8:12]))
            ).Else(
                tx_data.eq(0x0000)
            )
            


            #tx_data.eq(0x0001)
        ]

        self.sync += [
            data_ff.eq(Cat(sink.data[0:4],sink.data[4:8],sink.data[8:12],sink.data[12:16])),
            
            data_ff.eq(sink.data),
            valid_ff.eq(sink.valid)
        ]

        

        self.specials += [
            Instance("oddr_eth_x2",
                i_clkop=ClockSignal("clk125"),
                #i_clkos=ClockSignal("clk125_90"),
                i_start=~ResetSignal("eth_tx_sclk"),
                i_sync_clk=ClockSignal("eth_tx_sclk"),
                i_sync_reset=ResetSignal("eth_tx_sclk"),
                i_data=tx_data,
                i_ctrl=tx_valid,
                o_clkout=clock_pads.tx,
                o_ready=ready,
                o_sclk=tx_sclk,
                o_dout=pads.tx_data,
                o_ctrlout=pads.tx_ctl
            )
        ]

        self.clock_domains.cd_eth_tx_sclk = ClockDomain()
        self.comb += self.cd_eth_tx_sclk.clk.eq(tx_sclk)



class LiteEthPHYRGMIIRX(Module):
    def __init__(self, clock_pads,pads,platform):
        self.source = source = stream.Endpoint(eth_phy_description(16))

        # # #
        delcnt = Signal(8)
        ready  = Signal()
        rx_sclk = Signal()
        
        rx_data = Signal(16)
        rx_ctl = Signal(4)

        rx_dv = Signal(2)
        rx_err = Signal(2)
        self.comb += rx_dv.eq(Cat(rx_ctl[0],rx_ctl[2]))
        self.comb += rx_err.eq(Cat(rx_ctl[1],rx_ctl[3]))

        align = Signal()

        reset = Signal()

        self.specials += [
            Instance("eth_iddr_x2",
                i_alignwd=0,
                i_clkin=clock_pads.rx,
                i_sync_clk=ClockSignal("eth_rx_sclk"),
                i_sync_reset=ResetSignal("eth_rx_sclk"),
                i_datain=pads.rx_data,
                i_ctrlin=pads.rx_ctl,
                o_ready=ready,
                o_sclk=rx_sclk,
                o_data=rx_data,
                o_ctrl=rx_ctl
            )
        ]
      
        self.clock_domains.cd_eth_rx_sclk = ClockDomain()
        # RX : Let the synthesis tool insert the appropriate clock buffer
        #self.comb += self.cd_eth_rx.clk.eq(rx_sclk)
        self.comb += self.cd_eth_rx_sclk.clk.eq(rx_sclk)
        #clock_detect = Signal()
        
        #self.specials += AsyncResetSynchronizer(self.cd_eth_rx, (clock_detect))


        led = platform.request("user_led")

        #self.submodules.blink = Blinker(led, 24)

        rx_data_d = Signal(16)
        rx_dv_d = Signal(2)

        self.sync.eth_rx += [
            If(rx_dv == 0, 
                align.eq(0)
            ).Else(
                If(rx_dv_d == 0, 
                    align.eq((rx_dv == 0x1) | (rx_dv == 0x2) | align)
                )
            ),
            rx_data_d.eq(rx_data),
            rx_dv_d.eq(rx_dv)
        ]


        # demangle data 
        rx_demangle = Signal(16)
        rx_dv_demangle = Signal(2)
        rx_dv_demangle_d = Signal(2)

        self.comb += [
            If(align,
                rx_demangle.eq(Cat(rx_data_d[8:16],rx_data[0:8])),
                rx_dv_demangle.eq(Cat(rx_dv_d[1], rx_dv[0]))
            ).Else(
                rx_demangle.eq(rx_data),
                rx_dv_demangle.eq(rx_dv)
            )
        ]


# work out how to handle last data...
        last = Signal()
        self.sync.eth_rx += [
            source.valid.eq(rx_dv_demangle),
            source.data.eq(rx_demangle),
            rx_dv_demangle_d.eq(rx_dv_demangle),
        ]
        self.comb += [
            last.eq((rx_dv_demangle_d != 0) & (rx_dv_demangle == 0)),
            source.last.eq(last)
        ]
        self.comb += led.eq(last)

       

class LiteEthPHYRGMIICRG(Module, AutoCSR):
    def __init__(self, clock_pads, pads, with_hw_init_reset, mii_mode=0):
        self._reset = CSRStorage()

        # # #

        self.clock_domains.cd_eth_rx = ClockDomain()
        self.clock_domains.cd_eth_tx = ClockDomain()

        self.comb += self.cd_eth_tx.clk.eq(ClockSignal("eth_tx_sclk"))
        #self.clock_domains.cd_eth_rx = ClockDomain()
        #self.clock_domains.cd_eth_tx = ClockDomain()

        # RX : Let the synthesis tool insert the appropriate clock buffer
        self.comb += self.cd_eth_rx.clk.eq(ClockSignal("eth_rx_sclk"))


        # TX : GMII: Drive clock_pads.gtx, clock_pads.tx unused
        #      MII: Use PHY clock_pads.tx as eth_tx_clk, do not drive clock_pads.gtx
        #self.specials += DDROutput(1, 0, clock_pads.tx, ClockSignal("eth_tx"))
        

        # hack to pass signal through the PLL to bring it from GR to Clock routing
        #self.comb += self.cd_eth_tx.clk.eq(ClockSignal("clk125"))
      
        #eth_rx_clk_ibuf = Signal()
        #self.comb += self.cd_eth_rx.clk.eq(clock_pads.rx)



        
        # Reset
        reset = Signal()
        if with_hw_init_reset:
            self.submodules.hw_reset = LiteEthPHYHWReset()
            self.comb += reset.eq(self._reset.storage | self.hw_reset.reset)
        else:
            self.comb += reset.eq(self._reset.storage)
        if hasattr(pads, "rst_n"):
            self.comb += pads.rst_n.eq(~reset)
        self.specials += [
            AsyncResetSynchronizer(self.cd_eth_tx, reset),
            AsyncResetSynchronizer(self.cd_eth_rx, reset),
        ]


class LiteEthPHYRGMII(Module, AutoCSR):
    def __init__(self, clock_pads, pads, platform,with_hw_init_reset=True):
        self.dw = 16
        self.submodules.crg = LiteEthPHYRGMIICRG(clock_pads, pads, with_hw_init_reset)
        self.submodules.tx = ClockDomainsRenamer("eth_tx")(LiteEthPHYRGMIITX(clock_pads,pads))
        self.submodules.rx = ClockDomainsRenamer("eth_rx")(LiteEthPHYRGMIIRX(clock_pads,pads, platform))
        self.sink, self.source = self.tx.sink, self.rx.source

        if hasattr(pads, "mdc"):
            self.submodules.mdio = LiteEthPHYMDIO(pads)

        vdir = os.path.join(os.path.abspath(os.path.dirname(__file__)), "verilog")
        platform.add_source(os.path.join(vdir, "iddr_x2.v"))
        platform.add_source(os.path.join(vdir, "oddr_x2.v"))
