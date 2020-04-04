EESchema Schematic File Version 5
EELAYER 33 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 14 15
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
	4900 2200 5000 2300
Wire Wire Line
	5000 2300 5300 2300
Wire Bus Line
	2400 6550 6050 6550
Wire Bus Line
	2400 6650 9000 6650
Wire Bus Line
	3200 2150 4900 2150
Wire Bus Line
	4900 2150 4900 3400
Text Label 4600 2000 2    50   ~ 0
{DRAM_CTRL}
Text Label 5000 2300 0    50   ~ 0
ADR0
Text HLabel 2400 6550 0    50   UnSpc ~ 10
{DRAM_DAT0}
Text HLabel 2400 6650 0    50   UnSpc ~ 10
{DRAM_DAT1}
Text HLabel 3200 2150 0    50   Input ~ 0
{DRAM_CTRL}
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
