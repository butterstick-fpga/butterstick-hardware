from migen.build.generic_platform import *
from migen.build.lattice import LatticePlatform
from .programmer import FireSenseProgrammer
#from .programmer import GlasgowProgrammer


__all__ = ['FireSensePlatform']


_io = [
    
    ("clk_in", 0, Pins("B12"), IOStandard("LVCMOS18")),
    #("ref_clk125", 0, Pins("L20"), IOStandard("LVCMOS18")),
    ("user_led", 0, Pins("C7"), IOStandard("LVCMOS33")),

    ("serial", 0,
        Subsignal("tx", Pins("D8"), IOStandard("LVCMOS33")),
        Subsignal("rx", Pins("C8"), IOStandard("LVCMOS33"))
    ),

    

    ("eth_clocks", 0,
        Subsignal("tx", Pins("E2")),
        Subsignal("rx", Pins("G3")),
        IOStandard("LVCMOS18"),Misc("SLEWRATE=FAST")
    ),
    ("eth", 0,
        Subsignal("rst_n", Pins("A5")),
        Subsignal("mdio", Pins("C4")),
        Subsignal("mdc", Pins("B4")),
#        Subsignal("rx_ctl", Pins("E4")),
        Subsignal("rx_data", Pins("C2 A2 B2 B1")),
        Subsignal("tx_ctl", Pins("F3")),
        Subsignal("rx_ctl", Pins("G5")),
        Subsignal("tx_data", Pins("C1 D1 D2 E1")),
        IOStandard("LVCMOS18"),Misc("SLEWRATE=FAST")
    ),    

]

_connectors = [
]


class FireSensePlatform(LatticePlatform):
    default_clk_name = "clk_sys"
    default_clk_period = 1e9 / 125e6

    def __init__(self):
#        LatticePlatform.__init__(self, "lfe5u-45f-8bg381i", _io, _connectors, toolchain="trellis")
        LatticePlatform.__init__(self, "LFE5U-45F-8BG381C", _io, _connectors, toolchain="diamond")

        self.add_platform_command("""DEFINE PORT GROUP "ETH_TX" "eth_tx_data[3]" 
                                    "eth_tx_data[2]" 
                                    "eth_tx_data[1]" 
                                    "eth_tx_data[0]" 
                                    "eth_tx_ctl" ;""")

        self.add_platform_command("""DEFINE PORT GROUP "ETH_RX" "eth_rx_data[3]" 
                                    "eth_rx_data[2]" 
                                    "eth_rx_data[1]" 
                                    "eth_rx_data[0]" 
                                    "eth_rx_ctl" ;""")

        #self.add_platform_command("""CLOCK_TO_OUT GROUP "ETH_TX" -3 ns MIN -2.2 ns CLKNET "main_ethernetsoc_clk_0"  CLKOUT PORT "eth_clocks_tx";""")
        #self.add_platform_command("""INPUT_SETUP GROUP "ETH_RX" 1.2 ns HOLD 0.4 ns CLKPORT "eth_clocks_rx" ;""")
        #self.add_platform_command("""FREQUENCY NET "clk_in_c" 125.000000 MHz ;""")
        self.add_platform_command("""FREQUENCY NET "clk_in_c" 125.000000 MHz ;""")
        self.add_platform_command("""FREQUENCY NET "eth_tx_clk" 125.000000 MHz ; """)
        


        


    def do_finalize(self, fragment):
        LatticePlatform.do_finalize(self, fragment)
        try:
            self.add_period_constraint(self.lookup_request("eth_clocks", 0).rx, 8.0)
        except ConstraintError:
            pass
        try:
            self.add_period_constraint(self.lookup_request("eth_clocks", 0).tx, 8.0)
        except ConstraintError:
            pass


    def create_programmer(self):
        return FireSenseProgrammer()
