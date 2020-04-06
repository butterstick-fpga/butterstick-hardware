EESchema Schematic File Version 5
EELAYER 33 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 16 18
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
	4700 2800 4800 2700
Wire Wire Line
	4800 2700 5200 2700
Wire Bus Line
	1800 1950 4700 1950
Wire Bus Line
	4700 1950 4700 5900
Text Notes 6650 2450 2    50   ~ 0
PIC Differential Mappings\n - PIOA/B : Transmit/Receive\n - PIOC/D : Receive
Text Label 4800 2700 0    50   ~ 0
S0_D0P
Text HLabel 1800 1950 0    50   Input ~ 0
{SYZYGY_STD}
$Comp
L ECP5UM5G-85Pinout:ECP5UM5G_85_CABGA381 U2
U 5 1 5E95B457
P 5200 2700
AR Path="/5E975EE3/5E95B457" Ref="U2"  Part="5" 
AR Path="/5E97F31F/5E95B457" Ref="U?"  Part="5" 
AR Path="/5E994FDA/5E95B457" Ref="U?"  Part="5" 
AR Path="/5E95B457" Ref="U2"  Part="5" 
AR Path="/5E9F0D78/5E95B457" Ref="U?"  Part="5" 
F 0 "U2" H 7031 1559 60  0000 L CNN
F 1 "ECP5UM5G_85_CABGA381" H 7031 1453 60  0000 L CNN
F 2 "gkl_housings_bga:caBGA_381_17x17" H 5350 2750 60  0001 R CNN
F 3 "" H 5350 2550 60  0001 R CNN
F 4 "ECP5UM5G_85" H 5350 2650 60  0001 R CNN "manf#"
	5    5200 2700
	1    0    0    -1  
$EndComp
$EndSCHEMATC
