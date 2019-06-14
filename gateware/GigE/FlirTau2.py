from liteeth.common import *
from litex.soc.cores.clock import *



from litex.soc.cores.uart import RS232PHYTX
from pycrc.algorithms import Crc

from litex.soc.interconnect.stream import AsyncFIFO

# calculate a 16bit CIRTT-CRC
FLIR_CRC = Crc(width=16, poly=0x1021, xor_in=0x0000, xor_out=0x0000, reflect_in=False, reflect_out=False)
def flirCRC(payload):
	crc = FLIR_CRC.bit_by_bit(bytes(payload))
	return [ (crc >> 8) & 0xff, crc & 0xff ]

# Assemble a FLIR packet
def flir_packet(func, args):
    header = [0x6e, 0x00, 0x00, func, (len(args) >> 8 & 0xff), (len(args) & 0xff)]
    payload = header + flirCRC(header) + args
    return Array(payload + flirCRC(payload))

# Commands to be sent on powerup
flirInitPackets = Array([
    flir_packet(0x0C, [0x00, 0x00]),
    flir_packet(0x12, [0x00, 0x00]),
    flir_packet(0x12, [0x05, 0x01]),
    flir_packet(0x12, [0x07, 0x00]),
    flir_packet(0x12, [0x21, 0x01]),
])


class FlirTauConfig(Module):
    def __init__(self, pads):
        baudrate=57600
        tuning_word = int((baudrate/125e6)*2**32)

        self.submodules.tx = tx = RS232PHYTX(pads, tuning_word)
        #self.sink = self.tx.sink

        self.submodules.fsm = fsm = FSM(reset_state="WAIT")

        fsmCounter = Signal(max=int(125e6), reset=0)
        currentPacket = Signal(max=10, reset=0)
        currentByte = Signal(max=20, reset=0)

        fsm.act("WAIT",
            NextValue(fsmCounter, fsmCounter + 1),
            If(fsmCounter >= int(125e3*200),
                NextState("XMIT"),
                NextValue(fsmCounter, 0)
            ),
        )


        fsm.act("XMIT",
            If(currentByte >= len(flirInitPackets[0]),
                If(currentPacket >= len(flirInitPackets),
                    NextValue(currentPacket,0),
                    NextState("DONE"),
                ).Else(
                    NextValue(currentPacket, currentPacket + 1),
                    NextState("WAIT"),
                ),
                NextValue(currentByte, 0),
            ),
            tx.sink.data.eq(flirInitPackets[currentPacket][currentByte]),
            tx.sink.valid.eq(1),
            If(tx.sink.ready,
                NextValue(currentByte, currentByte + 1)
            )
        ) 

        fsm.act("DONE",
            # done
            NextState("DONE")
        )



class FlirTau2Rx(Module):
    def __init__(self, pads):
        self.source = source = stream.Endpoint(eth_tty_description(16))

        # # #

        sync_bit = Signal()
        data_bit = Signal(2)
        
        self.specials += [
            Instance("DELAYF",
                p_DEL_MODE="SCLK_ALIGNED",
                p_DEL_VALUE="DELAY0", # FIXME: adjust
                i_A=pads.sync_p,
                i_LOADN=1,
                i_MOVE=0,
                i_DIRECTION=0,
                o_Z=sync_bit),
        ]
        for i in range(2):
            self.specials += [
                Instance("DELAYF",
                    p_DEL_MODE="SCLK_ALIGNED",
                    p_DEL_VALUE="DELAY0", # FIXME: adjust
                    i_A=pads.dat_p[i],
                    i_LOADN=1,
                    i_MOVE=0,
                    i_DIRECTION=0,
                    o_Z=data_bit[i])
            ]
        self.comb += [
            pads.debug0.eq(data_bit[0]),
            pads.debug1.eq(sync_bit),
        ]

        data_reg = Signal(14)
        sync_reg = Signal(7)
        
        
        self.sync += [
            sync_reg.eq(Cat(sync_bit,sync_reg[0:6])),
            data_reg.eq(Cat(data_bit[0],data_reg[0:6],data_bit[1],data_reg[7:13]))
        ]
        
        dataCount = Signal(max=640*512)

        self.sync += [
            source.valid.eq(0),
            source.data.eq(0),

            If(sync_reg == 0b1100100, # Valid data
                source.valid.eq(1),
                source.data.eq(data_reg),
                dataCount.eq(dataCount + 1),
            ).Elif(sync_reg == 0b1110000, # Start of Frame
                source.valid.eq(1),
                source.data.eq(0xFFFF),
                dataCount.eq(0),
            )
        ]

        #self.comb += source.last.eq(dataCount >= 640*512)


class FlirTauClock(Module):
    def __init__(self, pads):
        
        # # #

        self.clock_domains.cd_flir_rx = ClockDomain()
        
        # RX
        rx_clk_ibuf = Signal()
        self.comb += self.cd_flir_rx.clk.eq(pads.clk_p)



class FlirTau2(Module):
    def __init__(self, platform):
        self.source = source = stream.Endpoint(eth_tty_description(8))

        pads = platform.request("flir_lvds")

        ### Camera connections
        self.submodules.conf = FlirTauConfig(platform.request("flir_ctrl"))


        self.submodules.clk = clk = FlirTauClock(pads)
        self.submodules.rx = rx = ClockDomainsRenamer("flir_rx")(FlirTau2Rx(pads))
        

        platform.add_period_constraint(clk.cd_flir_rx.clk, period_ns(75e6))


        fifo = stream.AsyncFIFO([("data",16)], 512)
        self.submodules.fifo = ClockDomainsRenamer({"write": "flir_rx", "read": "sys"})(fifo)

        self.submodules.converter = converter = stream.StrideConverter(eth_tty_description(16), eth_tty_description(8))


        self.comb += [
            rx.source.connect(fifo.sink),
            fifo.source.connect(converter.sink),
            converter.source.connect(source)
        ]
        

