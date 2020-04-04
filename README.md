# ButterStick

## A simple FPGA board for experiments with high speed LVDS interfaces. 3 Standard connectors with an onboard GigE link.

	Still in active Development (Use stuff here if you want, but there is limited support.)


## Latest Revision: 
* __Stable:__ [ButterStick r0.2](hardware/ButterStick_r0.2/)
* _In Development:_ _[ButterStick r0.3](hardware/ButterStick_r0.3/)_

Previous Revisions:
* [ButterStick r0.1](hardware/ButterStick_r0.1/)

![alt-text](documentation/images/photo_001.jpg "Board")

## Hardware

* ECP5 
* Gigabit Ethernet
* 256Mbit PSRAM (Dual HyperRAM upto 166MHz)
* 128Mbit QSPI FLASH Memory (Bitstream + User storage)
* MicroSD socket
* TCXO Oscillator
* JST GH SM06 locking JTAG port
* 5x USER controlable LEDs
* 3x Stardard SYZYGY compatible connectors
* Smart VCCIO controller to support SZYZGY DNA
* Power:
  * 3.3V/3A
  * 5V/2A  
  * Adjustable VCCIO 1.2V-3.3V/150mA (per bank)


![alt-text](documentation/images/render_001.jpg "Board")
![alt-text](documentation/images/ButterStick-Front.png "Top Render")
![alt-text](documentation/images/ButterStick-Back.png "Bot Render")
