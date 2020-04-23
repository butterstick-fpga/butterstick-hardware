EESchema Schematic File Version 5
EELAYER 33 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 20
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
	7900 4450 8000 4550
Entry Wire Line
	7900 4550 8000 4650
Entry Wire Line
	7900 4650 8000 4750
Entry Wire Line
	7900 4750 8000 4850
Entry Wire Line
	7900 4850 8000 4950
Entry Wire Line
	7900 4950 8000 5050
Entry Wire Line
	7900 5050 8000 5150
Entry Wire Line
	7900 5150 8000 5250
Entry Wire Line
	7900 5250 8000 5350
Entry Wire Line
	7900 5350 8000 5450
Entry Wire Line
	7900 5450 8000 5550
Entry Wire Line
	7900 5550 8000 5650
Entry Wire Line
	7900 5650 8000 5750
Entry Wire Line
	7900 5750 8000 5850
Wire Wire Line
	8000 4550 8450 4550
Wire Wire Line
	8000 4650 8450 4650
Wire Wire Line
	8000 4750 8450 4750
Wire Wire Line
	8000 4850 8450 4850
Wire Wire Line
	8000 4950 8450 4950
Wire Wire Line
	8000 5050 8450 5050
Wire Wire Line
	8000 5150 8450 5150
Wire Wire Line
	8000 5250 8450 5250
Wire Wire Line
	8000 5350 8450 5350
Wire Wire Line
	8000 5450 8450 5450
Wire Wire Line
	8000 5550 8450 5550
Wire Wire Line
	8000 5650 8450 5650
Wire Wire Line
	8000 5750 8450 5750
Wire Wire Line
	8000 5850 8450 5850
Wire Bus Line
	6100 6300 7900 6300
Wire Bus Line
	7900 4350 7900 4450
Wire Bus Line
	7900 4450 7900 4650
Wire Bus Line
	7900 4650 7900 4850
Wire Bus Line
	7900 4850 7900 5050
Wire Bus Line
	7900 5050 7900 5250
Wire Bus Line
	7900 5250 7900 5350
Wire Bus Line
	7900 5350 7900 5550
Wire Bus Line
	7900 5550 7900 5750
Wire Bus Line
	7900 5750 7900 6300
Text Notes 4750 2500 2    50   ~ 0
1v8
Text Notes 10150 3100 2    50   ~ 0
3v3
Text Label 8000 4550 0    50   ~ 0
LED0
Text Label 8000 4650 0    50   ~ 0
LED1
Text Label 8000 4750 0    50   ~ 0
LED2
Text Label 8000 4850 0    50   ~ 0
LED3
Text Label 8000 4950 0    50   ~ 0
LED4
Text Label 8000 5050 0    50   ~ 0
LED5
Text Label 8000 5150 0    50   ~ 0
LEDC3
Text Label 8000 5250 0    50   ~ 0
LEDC4
Text Label 8000 5350 0    50   ~ 0
LEDC0
Text Label 8000 5450 0    50   ~ 0
LED6
Text Label 8000 5550 0    50   ~ 0
LED7
Text Label 8000 5650 0    50   ~ 0
LEDC1
Text Label 8000 5750 0    50   ~ 0
LEDC5
Text Label 8000 5850 0    50   ~ 0
LEDC2
Text HLabel 6100 6300 0    50   Input ~ 0
{LED[0..7] LEDC[0..5]}
$Comp
L gkl_lattice:ECP5UM5G_85_CABGA381 U2
U 2 1 5E943748
P 8450 3250
F 0 "U2" H 8750 3550 60  0000 L CNN
F 1 "ECP5UM5G_85_CABGA381" H 8700 3450 60  0000 L CNN
F 2 "gkl_housings_bga:caBGA_381_17x17" H 8600 3300 60  0001 R CNN
F 3 "" H 8600 3100 60  0001 R CNN
F 4 "ECP5UM5G_85" H 8600 3200 60  0001 R CNN "manf#"
	2    8450 3250
	1    0    0    -1  
$EndComp
$Comp
L gkl_lattice:ECP5UM5G_85_CABGA381 U2
U 3 1 5E956B05
P 3050 2650
F 0 "U2" H 3300 2950 60  0000 L CNN
F 1 "ECP5UM5G_85_CABGA381" H 3300 2850 60  0000 L CNN
F 2 "gkl_housings_bga:caBGA_381_17x17" H 3200 2700 60  0001 R CNN
F 3 "" H 3200 2500 60  0001 R CNN
F 4 "ECP5UM5G_85" H 3200 2600 60  0001 R CNN "manf#"
	3    3050 2650
	1    0    0    -1  
$EndComp
$EndSCHEMATC
