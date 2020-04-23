EESchema Schematic File Version 5
EELAYER 33 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 12 20
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
	2450 2850 2550 2750
Entry Wire Line
	2450 2950 2550 2850
Entry Wire Line
	2450 3050 2550 2950
Entry Wire Line
	2450 3150 2550 3050
Entry Wire Line
	2450 3350 2550 3250
Entry Wire Line
	2450 3450 2550 3350
Entry Wire Line
	2450 3550 2550 3450
Entry Wire Line
	2450 3650 2550 3550
Entry Wire Line
	2450 3850 2550 3750
Entry Wire Line
	2450 3950 2550 3850
Entry Wire Line
	2450 4500 2550 4400
Entry Wire Line
	2450 4600 2550 4500
Entry Wire Line
	2450 4700 2550 4600
Entry Wire Line
	2450 4800 2550 4700
Entry Wire Line
	2450 5000 2550 4900
Entry Wire Line
	2450 5100 2550 5000
Entry Wire Line
	2450 5200 2550 5100
Entry Wire Line
	2450 5300 2550 5200
Wire Wire Line
	2550 2750 3050 2750
Wire Wire Line
	2550 2850 3050 2850
Wire Wire Line
	2550 2950 3050 2950
Wire Wire Line
	2550 3050 3050 3050
Wire Wire Line
	2550 3750 3050 3750
Wire Wire Line
	2550 3850 3050 3850
Wire Wire Line
	2550 4400 3050 4400
Wire Wire Line
	2550 4500 3050 4500
Wire Wire Line
	2550 4600 3050 4600
Wire Wire Line
	2550 4700 3050 4700
Wire Wire Line
	3050 3250 2550 3250
Wire Wire Line
	3050 3350 2550 3350
Wire Wire Line
	3050 3450 2550 3450
Wire Wire Line
	3050 3550 2550 3550
Wire Wire Line
	3050 4900 2550 4900
Wire Wire Line
	3050 5000 2550 5000
Wire Wire Line
	3050 5100 2550 5100
Wire Wire Line
	3050 5200 2550 5200
Wire Bus Line
	2000 5500 2250 5500
Wire Bus Line
	2250 5500 2450 5500
Wire Bus Line
	2450 2850 2450 3050
Wire Bus Line
	2450 3050 2450 3350
Wire Bus Line
	2450 3350 2450 3550
Wire Bus Line
	2450 3550 2450 3650
Wire Bus Line
	2450 3650 2450 3950
Wire Bus Line
	2450 3950 2450 4500
Wire Bus Line
	2450 4500 2450 4700
Wire Bus Line
	2450 4700 2450 4800
Wire Bus Line
	2450 4800 2450 5100
Wire Bus Line
	2450 5100 2450 5300
Wire Bus Line
	2450 5300 2450 5500
Text Label 2550 2750 0    50   ~ 0
RX0_P
Text Label 2550 2850 0    50   ~ 0
RX0_N
Text Label 2550 2950 0    50   ~ 0
RX1_P
Text Label 2550 3050 0    50   ~ 0
RX1_N
Text Label 2550 3250 0    50   ~ 0
TX0_P
Text Label 2550 3350 0    50   ~ 0
TX0_N
Text Label 2550 3450 0    50   ~ 0
TX1_P
Text Label 2550 3550 0    50   ~ 0
TX1_N
Text Label 2550 3750 0    50   ~ 0
REFCLK_P
Text Label 2550 3850 0    50   ~ 0
REFCLK_N
Text Label 2550 4400 0    50   ~ 0
RX3_P
Text Label 2550 4500 0    50   ~ 0
RX3_N
Text Label 2550 4600 0    50   ~ 0
RX4_P
Text Label 2550 4700 0    50   ~ 0
RX4_N
Text Label 2550 4900 0    50   ~ 0
TX3_P
Text Label 2550 5000 0    50   ~ 0
TX3_N
Text Label 2550 5100 0    50   ~ 0
TX4_P
Text Label 2550 5200 0    50   ~ 0
TX4_N
Text HLabel 2000 5500 0    50   Input ~ 0
{SYZYGY_TXR4}
$Comp
L gkl_lattice:ECP5UM5G_85_CABGA381 U2
U 10 1 5E963655
P 3050 2850
AR Path="/5E96F9BA/5E963655" Ref="U2"  Part="10" 
AR Path="/5E975EE3/5E963655" Ref="U?"  Part="10" 
AR Path="/5E963655" Ref="U2"  Part="10" 
AR Path="/5E9F0D7A/5E963655" Ref="U?"  Part="10" 
F 0 "U2" H 3300 3250 60  0000 L CNN
F 1 "ECP5UM5G_85_CABGA381" H 3300 3150 60  0000 L CNN
F 2 "gkl_housings_bga:caBGA_381_17x17" H 3200 2900 60  0001 R CNN
F 3 "" H 3200 2700 60  0001 R CNN
F 4 "ECP5UM5G_85" H 3200 2800 60  0001 R CNN "manf#"
	10   3050 2850
	1    0    0    -1  
$EndComp
$Comp
L gkl_lattice:ECP5UM5G_85_CABGA381 U2
U 11 1 5E964ACF
P 3050 4500
AR Path="/5E96F9BA/5E964ACF" Ref="U2"  Part="11" 
AR Path="/5E975EE3/5E964ACF" Ref="U?"  Part="11" 
AR Path="/5E964ACF" Ref="U2"  Part="11" 
AR Path="/5E9F0D7A/5E964ACF" Ref="U?"  Part="11" 
F 0 "U2" H 3300 4900 60  0000 L CNN
F 1 "ECP5UM5G_85_CABGA381" H 3300 4800 60  0000 L CNN
F 2 "gkl_housings_bga:caBGA_381_17x17" H 3200 4550 60  0001 R CNN
F 3 "" H 3200 4350 60  0001 R CNN
F 4 "ECP5UM5G_85" H 3200 4450 60  0001 R CNN "manf#"
	11   3050 4500
	1    0    0    -1  
$EndComp
$EndSCHEMATC
