EESchema Schematic File Version 5
EELAYER 33 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 20
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
Connection ~ 2800 3300
Connection ~ 2700 3600
Entry Wire Line
	3050 3300 3150 3400
Entry Wire Line
	3050 4650 3150 4750
Wire Wire Line
	3150 3400 3450 3400
Wire Wire Line
	3150 4750 3450 4750
Wire Bus Line
	2450 3000 2800 3000
Wire Bus Line
	2450 3600 2700 3600
Wire Bus Line
	2700 3600 2700 4950
Wire Bus Line
	2700 3600 3450 3600
Wire Bus Line
	2700 4950 3450 4950
Wire Bus Line
	2800 3300 2800 3000
Wire Bus Line
	2800 3300 2800 4650
Wire Bus Line
	2800 3300 3450 3300
Wire Bus Line
	2800 4650 3450 4650
Text Label 3150 3400 0    50   ~ 0
CS0
Text Label 3150 4750 0    50   ~ 0
CS1
Text HLabel 2450 3000 0    50   Input ~ 10
{DRAM_CTRL}
Text HLabel 2450 3600 0    50   Input ~ 10
{DRAM_DAT}
$Sheet
S 3450 4550 1800 1150
U 5EB15CF3
F0 "DDR3L" 50
F1 "DDR3L.sch" 50
F2 "{DRAM_DAT}" I L 3450 4950 50 
F3 "{DRAM_CTRL}" I L 3450 4650 50 
F4 "DRAM_CS" I L 3450 4750 50 
$EndSheet
$Sheet
S 3450 3200 1800 1150
U 5EB207D6
F0 "DDR3L1" 50
F1 "DDR3L.sch" 50
F2 "{DRAM_DAT}" I L 3450 3600 50 
F3 "{DRAM_CTRL}" I L 3450 3300 50 
F4 "DRAM_CS" I L 3450 3400 50 
$EndSheet
$EndSCHEMATC
