# ButterStick

    A compact Lattice ECP5 based development board with breakouts for lots of high-speed I/O and serdes.

    With onboard DDR3, High Speed USB and Ethernet.

## Latest Revision: 
* __Stable:__ [ButterStick r1.0](hardware/ButterStick_r1.0/) (active group buy campaign: [GroupGets](https://groupgets.com/campaigns/868-butterstick))

Previous Revisions:
* [ButterStick r0.2](hardware/ButterStick_r0.2/)
* [ButterStick r0.1](hardware/ButterStick_r0.1/)

![alt-text](documentation/images/800px/butterstick_r1d0_003.jpg "Populated ButterStick r1.0 board with Size Comparison")

## Hardware (r1.0)

* ECP5 25F/85F (BGA381 package)
* USB 2.0 High Speed (480 Mbit/s)
* Gigabit Ethernet
* 2Gbit/8Gbit DDR3L RAM (dual rank)
* 128Mbit QSPI FLASH Memory (Bitstream + User storage)
* MicroSD socket (4 bit SD interface)
* Onboard oscillators:
  * 60 MHz
  * 25 MHz (RGMII PHY)
* 0.1" pitch JTAG connector
* 7x User RGB LEDs
* 2x User Buttons
* 2x Standard [SYZYGY compatible connectors](https://syzygyfpga.io/)
  * Adjustable VCCIO 1.2V-3.3V
  * Up to 32 single ended I/O
  * 10 differential pairs
  * Dedicated clock input pins
* 1x Transceiver [SYZYGY compatible connector](https://syzygyfpga.io/)
  * Adjustable VCCIO 1.2V-3.3V
  * Up to 14 single ended I/O
  * 2x/4x Lanes TX (5 Gbps SERDES)
  * 2x/4x Lanes RX (5 Gbps SERDES)
  * 1x Reference clock input

Board dimensions: 80mm x 49mm

### Variants

The ButterStick is offered with two variants, a cheaper version with the smallest ECP5 and a fully loaded variant, featuring the largest 85F ECP5.

The part changes between the two variants are listed in the table below.

|      | ButterStick-r1.0-2G-25F | ButterStick-r1.0-8G-85F | 
|------|-------------------------|-------------------------|
| FPGA | LFE5UM5G-25F-8BG381C    | LFE5UM5G-85F-8BG381C    | 
| DDR3 | 2x MT41K64M16TW-107     | 2x MT41K256M16TW-107    |

The 25F also has the following limitations on the ButterStick:
* 25F Only provides 2x SERDES lanes.
* 25F does not connect I/O pins S8/S9 on SYZYGY.C


![alt-text](documentation/images/800px/butterstick_r1d0_001.jpg "Populated r1.0 board front with stylish unpopulated board backdrop")
![alt-text](documentation/images/800px/butterstick_r1d0_002.jpg "Populated r1.0 board back with stylish unpopulated board backdrop")
