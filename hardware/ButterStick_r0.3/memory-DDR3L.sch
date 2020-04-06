EESchema Schematic File Version 5
EELAYER 33 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 18
Title "ButterStick"
Date "2019-06-14"
Rev "r0.2"
Comp "GsD"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
Comment5 ""
Comment6 ""
Comment7 ""
Comment8 ""
Comment9 ""
$EndDescr
Connection ~ 3550 2950
Wire Bus Line
	3400 2950 3550 2950
Wire Bus Line
	3550 2950 6300 2950
Wire Bus Line
	3550 3250 3550 2950
Wire Bus Line
	3600 3550 3700 3550
Wire Bus Line
	3700 3250 3550 3250
Wire Bus Line
	6300 2950 6300 3250
Wire Bus Line
	6300 3250 6500 3250
Wire Bus Line
	6400 3550 6500 3550
Text HLabel 3400 2950 0    50   Input ~ 10
DRAM{DRAM_CTRL}
Text HLabel 3600 3550 0    50   Input ~ 10
DRAM0{DRAM_DAT0}
Text HLabel 6400 3550 0    50   Input ~ 10
DRAM1{DRAM_DAT0}
$Sheet
S 6500 3150 1800 1150
U 5EB15CF3
F0 "DDR3L" 50
F1 "DDR3L.sch" 50
F2 "DRAM{DRAM_DAT0}" I L 6500 3550 50 
F3 "DRAM{DRAM_CTRL}" I L 6500 3250 50 
$EndSheet
$Sheet
S 3700 3150 1800 1150
U 5EB207D6
F0 "DDR3L1" 50
F1 "DDR3L.sch" 50
F2 "DRAM{DRAM_DAT0}" I L 3700 3550 50 
F3 "DRAM{DRAM_CTRL}" I L 3700 3250 50 
$EndSheet
$EndSCHEMATC
