EESchema Schematic File Version 4
LIBS:ButterStick-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 8400 5800 0    60   Input ~ 0
LED_A
$Comp
L Device:LED D1
U 1 1 5ABC9AAA
P 8700 5800
F 0 "D1" H 8692 5545 50  0000 C CNN
F 1 "LED" H 8692 5636 50  0000 C CNN
F 2 "LEDs:LED_0402" H 8700 5800 50  0001 C CNN
F 3 "" H 8700 5800 50  0001 C CNN
F 4 " 754-1105-1-ND " H -50 3850 50  0001 C CNN "SN-DK"
F 5 " APHHS1005SYCK " H -50 3850 50  0001 C CNN "PN"
	1    8700 5800
	-1   0    0    1   
$EndComp
$Comp
L Device:R R3
U 1 1 5ABC9C1C
P 9250 5800
F 0 "R3" V 9043 5800 50  0000 C CNN
F 1 "1k" V 9134 5800 50  0000 C CNN
F 2 "Resistors_SMD:R_0402" V 9180 5800 50  0001 C CNN
F 3 "" H 9250 5800 50  0001 C CNN
F 4 "311-1.0KJRCT-ND" H -50 3850 50  0001 C CNN "SN-DK"
F 5 "RC0402JR-071KL" H -50 3850 50  0001 C CNN "PN"
	1    9250 5800
	0    1    1    0   
$EndComp
Wire Wire Line
	8400 5800 8550 5800
Wire Wire Line
	8850 5800 9100 5800
Wire Wire Line
	9400 5800 9650 5800
$Comp
L gkl_power:GND #PWR02
U 1 1 5ABCA494
P 9650 5800
F 0 "#PWR02" H 9650 5550 50  0001 C CNN
F 1 "GND" V 9654 5720 50  0000 R CNN
F 2 "" H 9550 5450 50  0001 C CNN
F 3 "" H 9650 5800 50  0001 C CNN
	1    9650 5800
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x06_Male J2
U 1 1 5B1121F1
P 9800 4650
F 0 "J2" H 9700 5100 50  0000 C CNN
F 1 "JST GH Series" H 9650 5000 50  0000 C CNN
F 2 "Connectors_JST:JST_GH_BM06B-GHS-TBT_06x1.25mm_Straight" H 9800 4650 50  0001 C CNN
F 3 "~" H 9800 4650 50  0001 C CNN
F 4 " 455-1582-1-ND " H 3000 1250 50  0001 C CNN "SN-DK"
F 5 " BM06B-GHS-TBT(LF)(SN)(N) " H 3000 1250 50  0001 C CNN "PN"
	1    9800 4650
	-1   0    0    -1  
$EndComp
Text GLabel 9600 4550 0    60   Input ~ 0
JTAG_TMS
Text GLabel 9600 4650 0    60   Input ~ 0
JTAG_TCK
Text GLabel 9600 4750 0    60   Input ~ 0
JTAG_TDI
Text GLabel 9600 4850 0    60   Input ~ 0
JTAG_TDO
$Comp
L gkl_power:GND #PWR0121
U 1 1 5B11D31F
P 9500 5000
F 0 "#PWR0121" H 9500 4750 50  0001 C CNN
F 1 "GND" H 9503 4874 50  0000 C CNN
F 2 "" H 9400 4650 50  0001 C CNN
F 3 "" H 9500 5000 50  0001 C CNN
	1    9500 5000
	1    0    0    -1  
$EndComp
$Comp
L gkl_power:+3V3 #PWR0122
U 1 1 5B11D6E2
P 9500 4400
F 0 "#PWR0122" H 9500 4250 50  0001 C CNN
F 1 "+3V3" H 9503 4551 50  0000 C CNN
F 2 "" H 9500 4400 50  0001 C CNN
F 3 "" H 9500 4400 50  0001 C CNN
	1    9500 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 4450 9500 4450
Wire Wire Line
	9500 4450 9500 4400
Wire Wire Line
	9600 4950 9500 4950
Wire Wire Line
	9500 4950 9500 5000
$Comp
L gkl_misc:SYZYGY-STD J8
U 1 1 5CACDB71
P 2300 5300
F 0 "J8" H 2300 6419 50  0000 C CNN
F 1 "SYZYGY-STD" H 2300 6328 50  0000 C CNN
F 2 "" H 2300 6300 50  0001 C CNN
F 3 "" H 2300 6300 50  0001 C CNN
	1    2300 5300
	1    0    0    -1  
$EndComp
$Comp
L gkl_misc:SYZYGY-STD J1
U 1 1 5CACDBDB
P 2300 2350
F 0 "J1" H 2300 3469 50  0000 C CNN
F 1 "SYZYGY-STD" H 2300 3378 50  0000 C CNN
F 2 "" H 2300 3350 50  0001 C CNN
F 3 "" H 2300 3350 50  0001 C CNN
	1    2300 2350
	1    0    0    -1  
$EndComp
$Comp
L gkl_misc:SYZYGY-STD J10
U 1 1 5CACDC45
P 5950 2350
F 0 "J10" H 5950 3469 50  0000 C CNN
F 1 "SYZYGY-STD" H 5950 3378 50  0000 C CNN
F 2 "" H 5950 3350 50  0001 C CNN
F 3 "" H 5950 3350 50  0001 C CNN
	1    5950 2350
	1    0    0    -1  
$EndComp
Text GLabel 1650 1700 0    60   Input ~ 0
SYZYGY_0_D0_P
Text GLabel 1650 1800 0    60   Input ~ 0
SYZYGY_0_D0_N
Text GLabel 2950 1700 2    60   Input ~ 0
SYZYGY_0_D1_P
Text GLabel 2950 1800 2    60   Input ~ 0
SYZYGY_0_D1_N
Text GLabel 1650 1900 0    60   Input ~ 0
SYZYGY_0_D2_P
Text GLabel 1650 2000 0    60   Input ~ 0
SYZYGY_0_D2_N
Text GLabel 2950 1900 2    60   Input ~ 0
SYZYGY_0_D3_P
Text GLabel 2950 2000 2    60   Input ~ 0
SYZYGY_0_D3_N
Text GLabel 1650 2100 0    60   Input ~ 0
SYZYGY_0_D4_P
Text GLabel 1650 2200 0    60   Input ~ 0
SYZYGY_0_D4_N
Text GLabel 2950 2200 2    60   Input ~ 0
SYZYGY_0_D5_N
Text GLabel 2950 2100 2    60   Input ~ 0
SYZYGY_0_D5_P
Text GLabel 1650 2400 0    60   Input ~ 0
SYZYGY_0_D6_N
Text GLabel 1650 2300 0    60   Input ~ 0
SYZYGY_0_D6_P
Text GLabel 2950 3200 2    60   Input ~ 0
SYZYGY_0_CLK0_N
Text GLabel 2950 3100 2    60   Input ~ 0
SYZYGY_0_CLK0_P
Text GLabel 1650 3200 0    60   Input ~ 0
SYZYGY_0_CLK1_N
Text GLabel 1650 3100 0    60   Input ~ 0
SYZYGY_0_CLK1_P
Text GLabel 2950 2400 2    60   Input ~ 0
SYZYGY_0_D7_N
Text GLabel 2950 2300 2    60   Input ~ 0
SYZYGY_0_D7_P
Text GLabel 1650 2500 0    60   Input ~ 0
SYZYGY_0_S16
Text GLabel 2950 2500 2    60   Input ~ 0
SYZYGY_0_S17
Text GLabel 1650 2600 0    60   Input ~ 0
SYZYGY_0_S18
Text GLabel 2950 2600 2    60   Input ~ 0
SYZYGY_0_S19
Text GLabel 1650 2700 0    60   Input ~ 0
SYZYGY_0_S20
Text GLabel 2950 2700 2    60   Input ~ 0
SYZYGY_0_S21
Text GLabel 1650 2800 0    60   Input ~ 0
SYZYGY_0_S22
Text GLabel 2950 2800 2    60   Input ~ 0
SYZYGY_0_S23
Text GLabel 1650 2900 0    60   Input ~ 0
SYZYGY_0_S24
Text GLabel 2950 2900 2    60   Input ~ 0
SYZYGY_0_S25
Text GLabel 1650 3000 0    60   Input ~ 0
SYZYGY_0_S26
Text GLabel 2950 3000 2    60   Input ~ 0
SYZYGY_0_S27
Text GLabel 5300 1700 0    60   Input ~ 0
SYZYGY_1_D0_P
Text GLabel 5300 1800 0    60   Input ~ 0
SYZYGY_1_D0_N
Text GLabel 6600 1700 2    60   Input ~ 0
SYZYGY_1_D1_P
Text GLabel 6600 1800 2    60   Input ~ 0
SYZYGY_1_D1_N
Text GLabel 5300 1900 0    60   Input ~ 0
SYZYGY_1_D2_P
Text GLabel 5300 2000 0    60   Input ~ 0
SYZYGY_1_D2_N
Text GLabel 6600 1900 2    60   Input ~ 0
SYZYGY_1_D3_P
Text GLabel 6600 2000 2    60   Input ~ 0
SYZYGY_1_D3_N
Text GLabel 5300 2100 0    60   Input ~ 0
SYZYGY_1_D4_P
Text GLabel 5300 2200 0    60   Input ~ 0
SYZYGY_1_D4_N
Text GLabel 6600 2200 2    60   Input ~ 0
SYZYGY_1_D5_N
Text GLabel 6600 2100 2    60   Input ~ 0
SYZYGY_1_D5_P
Text GLabel 5300 2400 0    60   Input ~ 0
SYZYGY_1_D6_N
Text GLabel 5300 2300 0    60   Input ~ 0
SYZYGY_1_D6_P
Text GLabel 6600 3200 2    60   Input ~ 0
SYZYGY_1_CLK0_N
Text GLabel 6600 3100 2    60   Input ~ 0
SYZYGY_1_CLK0_P
Text GLabel 5300 3200 0    60   Input ~ 0
SYZYGY_1_CLK1_N
Text GLabel 5300 3100 0    60   Input ~ 0
SYZYGY_1_CLK1_P
Text GLabel 6600 2400 2    60   Input ~ 0
SYZYGY_1_D7_N
Text GLabel 6600 2300 2    60   Input ~ 0
SYZYGY_1_D7_P
Text GLabel 1650 4650 0    60   Input ~ 0
SYZYGY_2_D0_P
Text GLabel 1650 4750 0    60   Input ~ 0
SYZYGY_2_D0_N
Text GLabel 2950 4650 2    60   Input ~ 0
SYZYGY_2_D1_P
Text GLabel 2950 4750 2    60   Input ~ 0
SYZYGY_2_D1_N
Text GLabel 1650 4850 0    60   Input ~ 0
SYZYGY_2_D2_P
Text GLabel 1650 4950 0    60   Input ~ 0
SYZYGY_2_D2_N
Text GLabel 2950 4850 2    60   Input ~ 0
SYZYGY_2_D3_P
Text GLabel 2950 4950 2    60   Input ~ 0
SYZYGY_2_D3_N
Text GLabel 1650 5050 0    60   Input ~ 0
SYZYGY_2_D4_P
Text GLabel 1650 5150 0    60   Input ~ 0
SYZYGY_2_D4_N
Text GLabel 2950 5150 2    60   Input ~ 0
SYZYGY_2_D5_N
Text GLabel 2950 5050 2    60   Input ~ 0
SYZYGY_2_D5_P
Text GLabel 1650 5350 0    60   Input ~ 0
SYZYGY_2_D6_N
Text GLabel 1650 5250 0    60   Input ~ 0
SYZYGY_2_D6_P
Text GLabel 2950 6150 2    60   Input ~ 0
SYZYGY_2_CLK0_N
Text GLabel 2950 6050 2    60   Input ~ 0
SYZYGY_2_CLK0_P
Text GLabel 1650 6150 0    60   Input ~ 0
SYZYGY_2_CLK1_N
Text GLabel 1650 6050 0    60   Input ~ 0
SYZYGY_2_CLK1_P
Text GLabel 2950 5350 2    60   Input ~ 0
SYZYGY_2_D7_N
Text GLabel 2950 5250 2    60   Input ~ 0
SYZYGY_2_D7_P
Text GLabel 1650 5450 0    60   Input ~ 0
SYZYGY_2_S16
Text GLabel 2950 5450 2    60   Input ~ 0
SYZYGY_2_S17
Text GLabel 1650 5550 0    60   Input ~ 0
SYZYGY_2_S18
Text GLabel 2950 5550 2    60   Input ~ 0
SYZYGY_2_S19
Text GLabel 1650 5650 0    60   Input ~ 0
SYZYGY_2_S20
Text GLabel 2950 5650 2    60   Input ~ 0
SYZYGY_2_S21
Text GLabel 1650 5750 0    60   Input ~ 0
SYZYGY_2_S22
Text GLabel 2950 5750 2    60   Input ~ 0
SYZYGY_2_S23
Text GLabel 1650 5850 0    60   Input ~ 0
SYZYGY_2_S24
Text GLabel 2950 5850 2    60   Input ~ 0
SYZYGY_2_S25
Text GLabel 1650 5950 0    60   Input ~ 0
SYZYGY_2_S26
Text GLabel 2950 5950 2    60   Input ~ 0
SYZYGY_2_S27
Text GLabel 5300 2500 0    60   Input ~ 0
SYZYGY_1_S16
Text GLabel 6600 2500 2    60   Input ~ 0
SYZYGY_1_S17
Text GLabel 5300 2600 0    60   Input ~ 0
SYZYGY_1_S18
Text GLabel 6600 2600 2    60   Input ~ 0
SYZYGY_1_S19
Text GLabel 5300 2700 0    60   Input ~ 0
SYZYGY_1_S20
Text GLabel 6600 2700 2    60   Input ~ 0
SYZYGY_1_S21
Text GLabel 5300 2800 0    60   Input ~ 0
SYZYGY_1_S22
Text GLabel 6600 2800 2    60   Input ~ 0
SYZYGY_1_S23
Text GLabel 5300 2900 0    60   Input ~ 0
SYZYGY_1_S24
Text GLabel 6600 2900 2    60   Input ~ 0
SYZYGY_1_S25
Text GLabel 5300 3000 0    60   Input ~ 0
SYZYGY_1_S26
Text GLabel 6600 3000 2    60   Input ~ 0
SYZYGY_1_S27
$EndSCHEMATC
