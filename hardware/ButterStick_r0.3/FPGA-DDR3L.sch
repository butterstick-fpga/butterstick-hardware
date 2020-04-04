EESchema Schematic File Version 5
EELAYER 33 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 16
Title ""
Date ""
Rev ""
Comp ""
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
Entry Wire Line
	3850 4850 3950 4750
Entry Wire Line
	3950 3900 3850 3800
Entry Wire Line
	4900 2200 5000 2300
Entry Wire Line
	4900 2300 5000 2400
Entry Wire Line
	4900 2400 5000 2500
Entry Wire Line
	4900 2500 5000 2600
Entry Wire Line
	4900 2600 5000 2700
Entry Wire Line
	4900 2700 5000 2800
Entry Wire Line
	4900 2800 5000 2900
Entry Wire Line
	4900 2900 5000 3000
Entry Wire Line
	4900 3000 5000 3100
Entry Wire Line
	4900 3100 5000 3200
Entry Wire Line
	4900 3200 5000 3300
Entry Wire Line
	4900 3300 5000 3400
Entry Wire Line
	4900 3400 5000 3500
Entry Wire Line
	4900 3500 5000 3600
Entry Wire Line
	4900 3600 5000 3700
Entry Wire Line
	4900 3700 5000 3800
Entry Wire Line
	4900 3900 5000 4000
Entry Wire Line
	4900 4000 5000 4100
Entry Wire Line
	4900 4100 5000 4200
Wire Wire Line
	3950 3900 3950 4400
Wire Wire Line
	3950 4400 5300 4400
Wire Wire Line
	3950 4600 5300 4600
Wire Wire Line
	3950 4750 3950 4600
Wire Wire Line
	5000 2300 5300 2300
Wire Wire Line
	5000 2400 5300 2400
Wire Wire Line
	5000 2500 5300 2500
Wire Wire Line
	5000 2600 5300 2600
Wire Wire Line
	5000 2700 5300 2700
Wire Wire Line
	5000 2800 5300 2800
Wire Wire Line
	5000 2900 5300 2900
Wire Wire Line
	5000 3000 5300 3000
Wire Wire Line
	5000 3100 5300 3100
Wire Wire Line
	5000 3200 5300 3200
Wire Wire Line
	5000 3300 5300 3300
Wire Wire Line
	5000 3400 5300 3400
Wire Wire Line
	5000 3500 5300 3500
Wire Wire Line
	5000 3600 5300 3600
Wire Wire Line
	5000 3700 5300 3700
Wire Wire Line
	5000 3800 5300 3800
Wire Wire Line
	5000 4000 5300 4000
Wire Wire Line
	5000 4100 5300 4100
Wire Wire Line
	5000 4200 5300 4200
Wire Bus Line
	3200 2150 4900 2150
Wire Bus Line
	3300 3800 4500 3800
Wire Bus Line
	3300 4850 4500 4850
Wire Bus Line
	4900 2150 4900 2200
Wire Bus Line
	4900 2200 4900 2400
Wire Bus Line
	4900 2400 4900 2600
Wire Bus Line
	4900 2600 4900 2800
Wire Bus Line
	4900 2800 4900 3000
Wire Bus Line
	4900 3000 4900 3200
Wire Bus Line
	4900 3200 4900 3400
Wire Bus Line
	4900 3400 4900 3500
Wire Bus Line
	4900 3500 4900 3700
Wire Bus Line
	4900 3700 4900 4000
Wire Bus Line
	4900 4000 4900 4100
Text Label 4100 4400 0    50   ~ 0
DRAM1.DQ0
Text Label 4100 4600 0    50   ~ 0
DRAM0.DQ1
Text Label 4400 2150 2    50   ~ 0
{DRAM_CTRL}
Text Label 5000 2300 0    50   ~ 0
A0
Text Label 5000 2400 0    50   ~ 0
A1
Text Label 5000 2500 0    50   ~ 0
A2
Text Label 5000 2600 0    50   ~ 0
A3
Text Label 5000 2700 0    50   ~ 0
A4
Text Label 5000 2800 0    50   ~ 0
A5
Text Label 5000 2900 0    50   ~ 0
A6
Text Label 5000 3000 0    50   ~ 0
A7
Text Label 5000 3100 0    50   ~ 0
A8
Text Label 5000 3200 0    50   ~ 0
A9
Text Label 5000 3300 0    50   ~ 0
A10
Text Label 5000 3400 0    50   ~ 0
A11
Text Label 5000 3500 0    50   ~ 0
A12
Text Label 5000 3600 0    50   ~ 0
A13
Text Label 5000 3700 0    50   ~ 0
A14
Text Label 5000 3800 0    50   ~ 0
A15
Text Label 5000 4000 0    50   ~ 0
BA0
Text Label 5000 4100 0    50   ~ 0
BA1
Text Label 5000 4200 0    50   ~ 0
BA2
Text HLabel 3200 2150 0    50   Input ~ 0
DRAM{DRAM_CTRL}
Text HLabel 3300 3800 0    50   UnSpc ~ 0
DRAM1{DRAM_DAT0}
Text HLabel 3300 4850 0    50   UnSpc ~ 0
DRAM0{DRAM_DAT0}
$Comp
L gkl_lattice:ECP5U25-BG381 U3
U 2 1 5E681E08
P 5300 2300
F 0 "U3" H 6150 2450 60  0000 L CNN
F 1 "ECP5U25" H 5500 2450 60  0000 L CNN
F 2 "gkl_housings_bga:caBGA_381_17x17" H 5300 2300 50  0001 C CNN
F 3 "" H 5300 2300 50  0001 C CNN
F 4 " 220-2052-ND " H 3400 1450 50  0001 C CNN "SN-DK"
F 5 "LFE5U-45F-8BG381C" H 3400 1450 50  0001 C CNN "PN"
F 6 "Lattice" H 3400 1450 50  0001 C CNN "Mfg"
	2    5300 2300
	1    0    0    -1  
$EndComp
$EndSCHEMATC
