from liteeth.common import *



class DummyCamera(Module):
    def __init__(self):
        self.source = source = stream.Endpoint(eth_tty_description(8))

        counter = Signal(8)
        lineCounter = Signal(max=1024)
        rowCounter = Signal(max=1024)
        active = Signal()
        active_ff = Signal()

        self.sync += [
            lineCounter.eq(lineCounter + 1),
            If(lineCounter >= 900,
                lineCounter.eq(0),
                rowCounter.eq(rowCounter + 1),
                If(rowCounter >= 1000,
                    rowCounter.eq(0)
                )
            ),

            active.eq(0),
            If((lineCounter < 640) & (rowCounter < 512),
                active.eq(1),
                counter.eq(counter + 1)
            ),
            active_ff.eq(active)
        ]

        
        self.comb += [
            source.valid.eq(active),
            source.data.eq(counter),
            source.last.eq(~active & active_ff)
        ]

