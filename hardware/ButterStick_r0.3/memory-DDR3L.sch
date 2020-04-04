EESchema Schematic File Version 5
EELAYER 33 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 16
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
Connection ~ 3650 1950
Wire Bus Line
	3500 1950 3650 1950
Wire Bus Line
	3650 1950 6400 1950
Wire Bus Line
	3650 2250 3650 1950
Wire Bus Line
	3700 2550 3800 2550
Wire Bus Line
	3800 2250 3650 2250
Wire Bus Line
	6400 1950 6400 2250
Wire Bus Line
	6400 2250 6600 2250
Wire Bus Line
	6500 2550 6600 2550
Text HLabel 3500 1950 0    50   Input ~ 10
DRAM{DRAM_CTRL}
Text HLabel 3700 2550 0    50   Input ~ 10
DRAM0{DRAM_DAT0}
Text HLabel 6500 2550 0    50   Input ~ 10
DRAM1{DRAM_DAT0}
$Sheet
S 6600 2150 1800 1150
U 5EB15CF3
F0 "DDR3L" 50
F1 "DDR3L.sch" 50
F2 "DRAM{DRAM_DAT0}" I L 6600 2550 50 
F3 "DRAM{DRAM_CTRL}" I L 6600 2250 50 
$EndSheet
$Sheet
S 3800 2150 1800 1150
U 5EB207D6
F0 "DDR3L1" 50
F1 "DDR3L.sch" 50
F2 "DRAM{DRAM_DAT0}" I L 3800 2550 50 
F3 "DRAM{DRAM_CTRL}" I L 3800 2250 50 
$EndSheet
$EndSCHEMATC
