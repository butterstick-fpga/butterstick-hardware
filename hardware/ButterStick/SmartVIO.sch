EESchema Schematic File Version 4
LIBS:ButterStick-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 14 14
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Microchip_ATmega:ATmega328PB-MU U19
U 1 1 5C9D15B2
P 3650 3950
F 0 "U19" H 3200 5400 50  0000 C CNN
F 1 "ATmega328PB-MU" H 4200 5400 50  0000 C CNN
F 2 "Package_DFN_QFN:QFN-32-1EP_5x5mm_P0.5mm_EP3.1x3.1mm" H 3650 3950 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/40001906C.pdf" H 3650 3950 50  0001 C CNN
	1    3650 3950
	1    0    0    -1  
$EndComp
$Comp
L gkl_power:+3V3 #PWR0224
U 1 1 5C9D64ED
P 2450 1600
F 0 "#PWR0224" H 2450 1450 50  0001 C CNN
F 1 "+3V3" H 2453 1751 50  0000 C CNN
F 2 "" H 2450 1600 50  0001 C CNN
F 3 "" H 2450 1600 50  0001 C CNN
	1    2450 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:Ferrite_Bead_Small FB1
U 1 1 5C9D6656
P 2950 1750
F 0 "FB1" V 2713 1750 50  0000 C CNN
F 1 "Ferrite_Bead_Small" V 2804 1750 50  0000 C CNN
F 2 "pkl_dipol:L_0402" V 2880 1750 50  0001 C CNN
F 3 "~" H 2950 1750 50  0001 C CNN
	1    2950 1750
	0    1    1    0   
$EndComp
$Comp
L Device:Ferrite_Bead_Small FB2
U 1 1 5C9D66B1
P 3750 1750
F 0 "FB2" V 3513 1750 50  0000 C CNN
F 1 "Ferrite_Bead_Small" V 3604 1750 50  0000 C CNN
F 2 "pkl_dipol:L_0402" V 3680 1750 50  0001 C CNN
F 3 "~" H 3750 1750 50  0001 C CNN
	1    3750 1750
	0    1    1    0   
$EndComp
Wire Wire Line
	2450 1600 2450 1750
Wire Wire Line
	2450 1750 2850 1750
Wire Wire Line
	3050 1750 3350 1750
Wire Wire Line
	3750 2450 3750 2100
Wire Wire Line
	3750 2100 4000 2100
Wire Wire Line
	4000 2100 4000 1750
Wire Wire Line
	4000 1750 3850 1750
Wire Wire Line
	3650 2450 3650 2100
Wire Wire Line
	3650 2100 3350 2100
Wire Wire Line
	3350 2100 3350 1750
Connection ~ 3350 1750
Wire Wire Line
	3350 1750 3650 1750
$Comp
L gkl_power:GND #PWR0225
U 1 1 5C9D6870
P 3650 5450
F 0 "#PWR0225" H 3650 5200 50  0001 C CNN
F 1 "GND" H 3653 5324 50  0000 C CNN
F 2 "" H 3550 5100 50  0001 C CNN
F 3 "" H 3650 5450 50  0001 C CNN
	1    3650 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 3650 5000 3650
Wire Wire Line
	4250 3750 5000 3750
Wire Wire Line
	4250 3850 5000 3850
Text Label 4400 3650 0    50   ~ 0
ADC_0
Text Label 4400 3750 0    50   ~ 0
ADC_1
Text Label 4400 3850 0    50   ~ 0
ADC_2
Wire Wire Line
	4250 4050 5000 4050
Wire Wire Line
	4250 4150 5000 4150
Text Label 4400 4050 0    50   ~ 0
SDA0
Text Label 4400 4150 0    50   ~ 0
SCL0
Wire Wire Line
	3050 4450 2550 4450
Wire Wire Line
	3050 4550 2550 4550
Text Label 2750 4450 0    50   ~ 0
SDA1
Text Label 2750 4550 0    50   ~ 0
SCL1
Wire Wire Line
	4250 4450 5000 4450
Wire Wire Line
	4250 4550 5000 4550
Text Label 4400 4450 0    50   ~ 0
RXD0
Text Label 4400 4550 0    50   ~ 0
TXD0
Text Notes 6850 2400 0    50   ~ 0
ADC Reference voltage 1.1V
$EndSCHEMATC
