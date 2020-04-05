EESchema Schematic File Version 5
EELAYER 33 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 20
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
	4650 4700 4750 4600
Entry Wire Line
	4750 3750 4650 3650
Entry Wire Line
	5700 2050 5800 2150
Entry Wire Line
	5700 2150 5800 2250
Entry Wire Line
	5700 2250 5800 2350
Entry Wire Line
	5700 2350 5800 2450
Entry Wire Line
	5700 2450 5800 2550
Entry Wire Line
	5700 2550 5800 2650
Entry Wire Line
	5700 2650 5800 2750
Entry Wire Line
	5700 2750 5800 2850
Entry Wire Line
	5700 2850 5800 2950
Entry Wire Line
	5700 2950 5800 3050
Entry Wire Line
	5700 3050 5800 3150
Entry Wire Line
	5700 3150 5800 3250
Entry Wire Line
	5700 3250 5800 3350
Entry Wire Line
	5700 3350 5800 3450
Entry Wire Line
	5700 3450 5800 3550
Entry Wire Line
	5700 3550 5800 3650
Entry Wire Line
	5700 3750 5800 3850
Entry Wire Line
	5700 3850 5800 3950
Entry Wire Line
	5700 3950 5800 4050
Wire Wire Line
	4750 3750 4750 4250
Wire Wire Line
	4750 4250 6100 4250
Wire Wire Line
	4750 4450 6100 4450
Wire Wire Line
	4750 4600 4750 4450
Wire Wire Line
	5800 2150 6100 2150
Wire Wire Line
	5800 2250 6100 2250
Wire Wire Line
	5800 2350 6100 2350
Wire Wire Line
	5800 2450 6100 2450
Wire Wire Line
	5800 2550 6100 2550
Wire Wire Line
	5800 2650 6100 2650
Wire Wire Line
	5800 2750 6100 2750
Wire Wire Line
	5800 2850 6100 2850
Wire Wire Line
	5800 2950 6100 2950
Wire Wire Line
	5800 3050 6100 3050
Wire Wire Line
	5800 3150 6100 3150
Wire Wire Line
	5800 3250 6100 3250
Wire Wire Line
	5800 3350 6100 3350
Wire Wire Line
	5800 3450 6100 3450
Wire Wire Line
	5800 3550 6100 3550
Wire Wire Line
	5800 3650 6100 3650
Wire Wire Line
	5800 3850 6100 3850
Wire Wire Line
	5800 3950 6100 3950
Wire Wire Line
	5800 4050 6100 4050
Wire Bus Line
	4000 2000 5700 2000
Wire Bus Line
	4100 3650 5300 3650
Wire Bus Line
	4100 4700 5300 4700
Wire Bus Line
	5700 2000 5700 2050
Wire Bus Line
	5700 2050 5700 2250
Wire Bus Line
	5700 2250 5700 2350
Wire Bus Line
	5700 2350 5700 2550
Wire Bus Line
	5700 2550 5700 2750
Wire Bus Line
	5700 2750 5700 2850
Wire Bus Line
	5700 2850 5700 3050
Wire Bus Line
	5700 3050 5700 3250
Wire Bus Line
	5700 3250 5700 3450
Wire Bus Line
	5700 3450 5700 3750
Wire Bus Line
	5700 3750 5700 3950
Text Label 4900 4250 0    50   ~ 0
DRAM1.DQ0
Text Label 4900 4450 0    50   ~ 0
DRAM0.DQ1
Text Label 5200 2000 2    50   ~ 0
{DRAM_CTRL}
Text Label 5800 2150 0    50   ~ 0
A0
Text Label 5800 2250 0    50   ~ 0
A1
Text Label 5800 2350 0    50   ~ 0
A2
Text Label 5800 2450 0    50   ~ 0
A3
Text Label 5800 2550 0    50   ~ 0
A4
Text Label 5800 2650 0    50   ~ 0
A5
Text Label 5800 2750 0    50   ~ 0
A6
Text Label 5800 2850 0    50   ~ 0
A7
Text Label 5800 2950 0    50   ~ 0
A8
Text Label 5800 3050 0    50   ~ 0
A9
Text Label 5800 3150 0    50   ~ 0
A10
Text Label 5800 3250 0    50   ~ 0
A11
Text Label 5800 3350 0    50   ~ 0
A12
Text Label 5800 3450 0    50   ~ 0
A13
Text Label 5800 3550 0    50   ~ 0
A14
Text Label 5800 3650 0    50   ~ 0
A15
Text Label 5800 3850 0    50   ~ 0
BA0
Text Label 5800 3950 0    50   ~ 0
BA1
Text Label 5800 4050 0    50   ~ 0
BA2
Text HLabel 4000 2000 0    50   Input ~ 0
DRAM{DRAM_CTRL}
Text HLabel 4100 3650 0    50   UnSpc ~ 0
DRAM1{DRAM_DAT0}
Text HLabel 4100 4700 0    50   UnSpc ~ 0
DRAM0{DRAM_DAT0}
$Comp
L gkl_lattice:ECP5U25-BG381 U3
U 2 1 5E681E08
P 6100 2150
F 0 "U3" H 6950 2300 60  0000 L CNN
F 1 "ECP5U25" H 6300 2300 60  0000 L CNN
F 2 "gkl_housings_bga:caBGA_381_17x17" H 6100 2150 50  0001 C CNN
F 3 "" H 6100 2150 50  0001 C CNN
F 4 " 220-2052-ND " H 4200 1300 50  0001 C CNN "SN-DK"
F 5 "LFE5U-45F-8BG381C" H 4200 1300 50  0001 C CNN "PN"
F 6 "Lattice" H 4200 1300 50  0001 C CNN "Mfg"
	2    6100 2150
	1    0    0    -1  
$EndComp
$EndSCHEMATC
