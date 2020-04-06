EESchema Schematic File Version 5
EELAYER 33 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 10 18
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
	4200 2900 4300 2800
Wire Wire Line
	4300 2800 4700 2800
Wire Bus Line
	1300 2050 4200 2050
Wire Bus Line
	4200 2050 4200 6000
Text Notes 6250 2600 2    50   ~ 0
PIC Differential Mappings\n - PIOA/B : Transmit/Receive\n - PIOC/D : Receive
Text Label 4300 2800 0    50   ~ 0
S0_D0P
Text HLabel 1300 2050 0    50   Input ~ 0
{SYZYGY_STD}
$Comp
L ECP5UM5G-85Pinout:ECP5UM5G_85_CABGA381 U2
U 6 1 5E95CD57
P 4700 2800
AR Path="/5E97F31F/5E95CD57" Ref="U2"  Part="6" 
AR Path="/5E95CD57" Ref="U2"  Part="6" 
AR Path="/5E9F0D7B/5E95CD57" Ref="U?"  Part="6" 
F 0 "U2" H 6531 1659 60  0000 L CNN
F 1 "ECP5UM5G_85_CABGA381" H 6531 1553 60  0000 L CNN
F 2 "gkl_housings_bga:caBGA_381_17x17" H 4850 2850 60  0001 R CNN
F 3 "" H 4850 2650 60  0001 R CNN
F 4 "ECP5UM5G_85" H 4850 2750 60  0001 R CNN "manf#"
	6    4700 2800
	1    0    0    -1  
$EndComp
$EndSCHEMATC
