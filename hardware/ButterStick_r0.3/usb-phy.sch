EESchema Schematic File Version 5
EELAYER 33 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 18 18
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
Connection ~ 7900 3650
Connection ~ 7900 3550
Connection ~ 4350 2650
Entry Wire Line
	4350 3450 4450 3550
Entry Wire Line
	4350 3550 4450 3650
Entry Wire Line
	4350 3650 4450 3750
Entry Wire Line
	4350 3750 4450 3850
Entry Wire Line
	4350 3850 4450 3950
Entry Wire Line
	4350 3950 4450 4050
Entry Wire Line
	4350 4050 4450 4150
Entry Wire Line
	4350 4150 4450 4250
Entry Wire Line
	4350 4250 4450 4350
Entry Wire Line
	4350 4350 4450 4450
Entry Wire Line
	4350 4450 4450 4550
Entry Wire Line
	6550 3350 6650 3250
Entry Wire Line
	6550 4350 6650 4250
Wire Wire Line
	4450 3550 4950 3550
Wire Wire Line
	4450 3650 4950 3650
Wire Wire Line
	4450 3750 4950 3750
Wire Wire Line
	4450 3850 4950 3850
Wire Wire Line
	4450 3950 4950 3950
Wire Wire Line
	4450 4050 4950 4050
Wire Wire Line
	4450 4150 4950 4150
Wire Wire Line
	4450 4250 4950 4250
Wire Wire Line
	4450 4350 4950 4350
Wire Wire Line
	4450 4450 4950 4450
Wire Wire Line
	4450 4550 4950 4550
Wire Wire Line
	4850 2450 4850 3450
Wire Wire Line
	4950 3450 4850 3450
Wire Wire Line
	5550 4750 5550 4850
Wire Wire Line
	6150 3350 6550 3350
Wire Wire Line
	6150 3550 7250 3550
Wire Wire Line
	6150 3650 7900 3650
Wire Wire Line
	6150 3750 7200 3750
Wire Wire Line
	6150 4350 6550 4350
Wire Wire Line
	6250 4550 6150 4550
Wire Wire Line
	6250 4650 6250 4550
Wire Wire Line
	6250 4950 6250 5050
Wire Wire Line
	7200 3750 7400 3550
Wire Wire Line
	7250 2950 8000 2950
Wire Wire Line
	7250 3100 7250 2950
Wire Wire Line
	7250 3550 7250 3400
Wire Wire Line
	7400 3550 7900 3550
Wire Wire Line
	7900 3450 7900 3550
Wire Wire Line
	7900 3550 8000 3550
Wire Wire Line
	7900 3650 8000 3650
Wire Wire Line
	7900 3750 7900 3650
Wire Wire Line
	8000 3450 7900 3450
Wire Wire Line
	8000 3750 7900 3750
Wire Bus Line
	1750 2650 4350 2650
Wire Bus Line
	4350 2650 4350 3450
Wire Bus Line
	4350 2650 6650 2650
Wire Bus Line
	4350 3450 4350 3650
Wire Bus Line
	4350 3650 4350 3850
Wire Bus Line
	4350 3850 4350 4050
Wire Bus Line
	4350 4050 4350 4250
Wire Bus Line
	4350 4250 4350 4450
Wire Bus Line
	6650 2650 6650 4250
Text Label 4450 3550 0    50   ~ 0
DATA0
Text Label 4450 3650 0    50   ~ 0
DATA1
Text Label 4450 3750 0    50   ~ 0
DATA2
Text Label 4450 3850 0    50   ~ 0
DATA3
Text Label 4450 3950 0    50   ~ 0
DATA4
Text Label 4450 4050 0    50   ~ 0
DATA5
Text Label 4450 4150 0    50   ~ 0
DATA6
Text Label 4450 4250 0    50   ~ 0
DATA7
Text Label 4450 4350 0    50   ~ 0
DIR
Text Label 4450 4450 0    50   ~ 0
STP
Text Label 4450 4550 0    50   ~ 0
NXT
Text Label 6550 3350 2    50   ~ 0
RESET
Text Label 6550 4350 2    50   ~ 0
REFCLK
Text HLabel 1750 2650 0    50   Input ~ 0
{ULPI}
$Comp
L gkl_power:GND #PWR0346
U 1 1 5EA17AA5
P 5550 4850
F 0 "#PWR0346" H 5550 4600 50  0001 C CNN
F 1 "GND" H 5553 4724 50  0000 C CNN
F 2 "" H 5450 4500 50  0001 C CNN
F 3 "" H 5550 4850 50  0001 C CNN
	1    5550 4850
	1    0    0    -1  
$EndComp
$Comp
L gkl_power:GND #PWR0347
U 1 1 5EA32568
P 6250 5050
F 0 "#PWR0347" H 6250 4800 50  0001 C CNN
F 1 "GND" H 6253 4924 50  0000 C CNN
F 2 "" H 6150 4700 50  0001 C CNN
F 3 "" H 6250 5050 50  0001 C CNN
	1    6250 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R87
U 1 1 5EA1E2B3
P 6250 4800
F 0 "R87" H 6180 4755 50  0000 R CNN
F 1 "R" H 6180 4845 50  0000 R CNN
F 2 "" V 6180 4800 50  0001 C CNN
F 3 "~" H 6250 4800 50  0001 C CNN
	1    6250 4800
	-1   0    0    1   
$EndComp
$Comp
L Device:R R94
U 1 1 5EA1D83A
P 7250 3250
F 0 "R94" H 7180 3205 50  0000 R CNN
F 1 "20K" H 7180 3295 50  0000 R CNN
F 2 "" V 7180 3250 50  0001 C CNN
F 3 "~" H 7250 3250 50  0001 C CNN
	1    7250 3250
	-1   0    0    1   
$EndComp
$Comp
L Connector:USB_C_Receptacle_USB2.0 J10
U 1 1 5EA0B3D6
P 8600 3550
F 0 "J10" H 8170 3489 50  0000 R CNN
F 1 "USB_C_Receptacle_USB2.0" H 8170 3398 50  0000 R CNN
F 2 "Connector_USB:USB_C_Receptacle_Palconn_UTC16-G" H 8750 3550 50  0001 C CNN
F 3 "https://www.usb.org/sites/default/files/documents/usb_type-c.zip" H 8750 3550 50  0001 C CNN
	1    8600 3550
	-1   0    0    -1  
$EndComp
$Comp
L Interface_USB:USB3343 U14
U 1 1 5EA0F414
P 5550 3850
F 0 "U14" H 5950 3000 50  0000 C CNN
F 1 "USB3343" H 5200 3000 50  0000 C CNN
F 2 "Package_DFN_QFN:QFN-24-1EP_4x4mm_P0.5mm_EP2.6x2.6mm" H 6050 4050 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/334x.pdf" H 6050 4150 50  0001 C CNN
	1    5550 3850
	-1   0    0    -1  
$EndComp
$EndSCHEMATC
