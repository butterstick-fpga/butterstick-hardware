EESchema Schematic File Version 5
EELAYER 33 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 16
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
BusAlias DRAM_DAT0 DQ[15.0] LDQS_P LDQS_N UDQS_P UDQS_N
BusAlias DRAM_DAT1 DQ[15..0] LDQS_N LDQS_P UDQS_N UDQS_P
BusAlias DRAM_CTRL A[15..0] BA[2..0] LDM UDM ODT RAS CAS WE RESET CS CK_P CK_N CKE
Wire Wire Line
	1700 -1100 2350 -1100
Wire Wire Line
	1700 -1000 2350 -1000
Wire Wire Line
	1700 -900 2350 -900
Wire Wire Line
	1700 -800 2350 -800
Wire Wire Line
	1700 -700 2350 -700
Wire Wire Line
	1700 -600 2350 -600
Wire Wire Line
	1700 -500 2150 -500
Wire Wire Line
	1700 -400 2150 -400
Wire Wire Line
	1700 -300 2350 -300
Wire Wire Line
	1700 -200 2350 -200
Wire Wire Line
	1700 -100 2350 -100
Wire Wire Line
	1700 0    2350 0   
Wire Wire Line
	1700 100  2350 100 
Wire Wire Line
	1700 200  2350 200 
Wire Wire Line
	1700 300  2350 300 
Wire Wire Line
	1700 400  2350 400 
Wire Wire Line
	1700 500  2150 500 
Wire Wire Line
	1700 600  2150 600 
Wire Wire Line
	1700 700  2150 700 
Wire Wire Line
	1700 800  2150 800 
Wire Wire Line
	1700 900  2150 900 
Wire Wire Line
	1700 1000 2150 1000
Wire Wire Line
	1700 1100 2150 1100
Wire Wire Line
	1700 1200 2150 1200
Wire Wire Line
	1700 1300 2150 1300
Wire Wire Line
	1700 1400 2150 1400
Wire Wire Line
	1700 1500 2350 1500
Wire Wire Line
	1700 1600 2350 1600
Wire Wire Line
	1700 1700 2650 1700
Wire Wire Line
	1700 1800 2650 1800
Wire Wire Line
	1700 1900 2650 1900
Wire Wire Line
	1700 2000 2650 2000
Wire Wire Line
	5550 -3200 6500 -3200
Wire Wire Line
	5550 -3100 6500 -3100
Wire Wire Line
	5550 -3000 6500 -3000
Wire Wire Line
	5550 -2900 6500 -2900
Wire Wire Line
	5550 -2800 6000 -2800
Wire Wire Line
	5550 -2700 6000 -2700
Wire Wire Line
	5550 -2600 6000 -2600
Wire Wire Line
	5550 -2500 6000 -2500
Wire Wire Line
	5550 -2400 6200 -2400
Wire Wire Line
	5550 -2300 6200 -2300
Wire Wire Line
	5550 -2200 6000 -2200
Wire Wire Line
	5550 -2100 6000 -2100
Wire Wire Line
	5550 -2000 6200 -2000
Wire Wire Line
	5550 -1900 6200 -1900
Wire Wire Line
	5550 -1800 6000 -1800
Wire Wire Line
	5550 -1700 6000 -1700
Wire Wire Line
	5550 -1600 6200 -1600
Wire Wire Line
	5550 -1500 6200 -1500
Wire Wire Line
	5550 -1400 6000 -1400
Wire Wire Line
	5550 -1300 6000 -1300
Wire Wire Line
	5550 -1200 6200 -1200
Wire Wire Line
	5550 -1100 6200 -1100
Wire Wire Line
	5550 -1000 6000 -1000
Wire Wire Line
	5550 -900 6000 -900
Wire Wire Line
	5550 -800 6200 -800
Wire Wire Line
	5550 -700 6200 -700
Wire Wire Line
	5550 -600 6200 -600
Wire Wire Line
	5550 -500 6200 -500
Wire Wire Line
	5550 -400 6200 -400
Wire Wire Line
	5550 -300 6200 -300
Wire Wire Line
	5550 -200 6200 -200
Wire Wire Line
	5550 -100 6200 -100
Wire Wire Line
	9900 -2400 10000 -2400
Wire Wire Line
	9900 -2300 9900 -2400
Wire Wire Line
	11100 -2700 11200 -2700
Wire Wire Line
	11200 -2700 11200 -2800
Wire Wire Line
	15200 1150 15250 1150
Wire Wire Line
	15250 1150 15250 1050
Wire Bus Line
	4000 3400 4550 3400
Wire Bus Line
	4000 3600 4550 3600
Wire Bus Line
	4000 3700 4550 3700
Text Notes 650  -1300 0    50   ~ 0
BANK2 - 1V8
Text Notes 4400 -3400 0    50   ~ 0
BANK3 - 1V8
Text Label 2150 -500 2    50   ~ 0
S25
Text Label 2150 -400 2    50   ~ 0
S17
Text Label 2150 500  2    50   ~ 0
S20
Text Label 2150 600  2    50   ~ 0
S24
Text Label 2150 700  2    50   ~ 0
S26
Text Label 2150 800  2    50   ~ 0
S27
Text Label 2150 900  2    50   ~ 0
S22
Text Label 2150 1000 2    50   ~ 0
S19
Text Label 2150 1100 2    50   ~ 0
S23
Text Label 2150 1200 2    50   ~ 0
S18
Text Label 2150 1300 2    50   ~ 0
S21
Text Label 2150 1400 2    50   ~ 0
S16
Text Label 2350 -1100 2    50   ~ 0
D6_P
Text Label 2350 -1000 2    50   ~ 0
D6_N
Text Label 2350 -900 2    50   ~ 0
D7_P
Text Label 2350 -800 2    50   ~ 0
D7_N
Text Label 2350 -700 2    50   ~ 0
D4_P
Text Label 2350 -600 2    50   ~ 0
D4_N
Text Label 2350 -300 2    50   ~ 0
D2_P
Text Label 2350 -200 2    50   ~ 0
D2_N
Text Label 2350 -100 2    50   ~ 0
D3_P
Text Label 2350 0    2    50   ~ 0
D3_N
Text Label 2350 100  2    50   ~ 0
D0_P
Text Label 2350 200  2    50   ~ 0
D0_N
Text Label 2350 300  2    50   ~ 0
D1_P
Text Label 2350 400  2    50   ~ 0
D1_N
Text Label 2350 1500 2    50   ~ 0
D5_P
Text Label 2350 1600 2    50   ~ 0
D5_N
Text Label 2650 1700 2    50   ~ 0
C2P_CLK_P
Text Label 2650 1800 2    50   ~ 0
C2P_CLK_N
Text Label 2650 1900 2    50   ~ 0
P2C_CLK_P
Text Label 2650 2000 2    50   ~ 0
P2C_CLK_N
Text Label 6000 -2800 2    50   ~ 0
S17
Text Label 6000 -2700 2    50   ~ 0
S21
Text Label 6000 -2600 2    50   ~ 0
S20
Text Label 6000 -2500 2    50   ~ 0
S23
Text Label 6000 -2200 2    50   ~ 0
S26
Text Label 6000 -2100 2    50   ~ 0
S27
Text Label 6000 -1800 2    50   ~ 0
S19
Text Label 6000 -1700 2    50   ~ 0
S25
Text Label 6000 -1400 2    50   ~ 0
S18
Text Label 6000 -1300 2    50   ~ 0
S16
Text Label 6000 -1000 2    50   ~ 0
S24
Text Label 6000 -900 2    50   ~ 0
S22
Text Label 6200 -2400 2    50   ~ 0
D0_P
Text Label 6200 -2300 2    50   ~ 0
D0_N
Text Label 6200 -2000 2    50   ~ 0
D2_P
Text Label 6200 -1900 2    50   ~ 0
D2_N
Text Label 6200 -1600 2    50   ~ 0
D6_P
Text Label 6200 -1500 2    50   ~ 0
D6_N
Text Label 6200 -1200 2    50   ~ 0
D4_P
Text Label 6200 -1100 2    50   ~ 0
D4_N
Text Label 6200 -800 2    50   ~ 0
D7_P
Text Label 6200 -700 2    50   ~ 0
D7_N
Text Label 6200 -600 2    50   ~ 0
D5_P
Text Label 6200 -500 2    50   ~ 0
D5_N
Text Label 6200 -400 2    50   ~ 0
D3_P
Text Label 6200 -300 2    50   ~ 0
D3_N
Text Label 6200 -200 2    50   ~ 0
D1_P
Text Label 6200 -100 2    50   ~ 0
D1_N
Text Label 6500 -3200 2    50   ~ 0
C2P_CLK_P
Text Label 6500 -3100 2    50   ~ 0
C2P_CLK_N
Text Label 6500 -3000 2    50   ~ 0
P2C_CLK_P
Text Label 6500 -2900 2    50   ~ 0
P2C_CLK_N
Text GLabel 10000 -2700 0    60   Input ~ 0
SPI_CONFIG_SS
Text GLabel 10000 -2600 0    60   Input ~ 0
SPI_CONFIG_MISO
Text GLabel 10000 -2500 0    60   Input ~ 0
QSPI_D2
Text GLabel 11100 -2600 2    60   Input ~ 0
QSPI_D3
Text GLabel 11100 -2500 2    60   Input ~ 0
SPI_CONFIG_SCK
Text GLabel 11100 -2400 2    60   Input ~ 0
SPI_CONFIG_MOSI
$Comp
L gkl_power:GND #PWR04
U 1 1 5ABD9FB0
P 9900 -2300
F 0 "#PWR04" H 9900 -2550 50  0001 C CNN
F 1 "GND" H 9903 -2426 50  0000 C CNN
F 2 "" H 9800 -2650 50  0001 C CNN
F 3 "" H 9900 -2300 50  0001 C CNN
	1    9900 -2300
	1    0    0    -1  
$EndComp
$Comp
L gkl_power:+3V3 #PWR05
U 1 1 5ABD9FB6
P 11200 -2800
F 0 "#PWR05" H 11200 -2950 50  0001 C CNN
F 1 "+3V3" V 11204 -2694 50  0000 L CNN
F 2 "" H 11200 -2800 50  0001 C CNN
F 3 "" H 11200 -2800 50  0001 C CNN
	1    11200 -2800
	1    0    0    -1  
$EndComp
$Comp
L gkl_mem:AT25SF081 U6
U 1 1 5ABD9FA9
P 10550 -2550
F 0 "U6" H 10550 -2109 60  0000 C CNN
F 1 "S25FL127S" H 10550 -2215 60  0000 C CNN
F 2 "Package_SO:SOIJ-8_5.3x5.3mm_P1.27mm" H 10550 -2100 60  0001 C CNN
F 3 "" H 10550 -2100 60  0001 C CNN
F 4 "1092-1178-1-ND" H 6400 -6500 50  0001 C CNN "SN-DK"
F 5 "S25FL127SABMFI101" H 6400 -6500 50  0001 C CNN "PN"
F 6 "Cypress Semiconductor Corp" H 6550 -8900 50  0001 C CNN "Mfg"
	1    10550 -2550
	1    0    0    -1  
$EndComp
$Comp
L gkl_misc:SYZYGY-TXR-4 J8
U 1 1 5E87B4DB
P 12800 550
F 0 "J8" H 12800 1669 50  0000 C CNN
F 1 "SYZYGY-TXR-4" H 12800 1578 50  0000 C CNN
F 2 "gkl_conn:SYZYGY_Transcieiver" H 12800 1550 50  0001 C CNN
F 3 "" H 12800 1550 50  0001 C CNN
	1    12800 550 
	1    0    0    -1  
$EndComp
$Comp
L gkl_lattice:ECP5U25-BG381 U?
U 3 1 5C80F1CC
P 1700 -1100
AR Path="/5AB8ACB7/5C80F1CC" Ref="U?"  Part="3" 
AR Path="/5C80F19A/5C80F1CC" Ref="U3"  Part="3" 
AR Path="/5C80F1CC" Ref="U3"  Part="3" 
F 0 "U3" H 2800 -900 60  0000 L CNN
F 1 "ECP5U25" H 1900 -900 60  0000 L CNN
F 2 "gkl_housings_bga:caBGA_381_17x17" H 1700 -1100 50  0001 C CNN
F 3 "" H 1700 -1100 50  0001 C CNN
F 4 " 220-2052-ND " H -4550 -1950 50  0001 C CNN "SN-DK"
F 5 "LFE5U-45F-8BG381C" H -4550 -1950 50  0001 C CNN "PN"
F 6 "Lattice" H -4550 -1950 50  0001 C CNN "Mfg"
	3    1700 -1100
	-1   0    0    -1  
$EndComp
$Comp
L gkl_lattice:ECP5U25-BG381 U?
U 4 1 5C810715
P 5550 -3200
AR Path="/5AB8ACB7/5C810715" Ref="U?"  Part="4" 
AR Path="/5C80F19D/5C810715" Ref="U3"  Part="4" 
AR Path="/5C80F19A/5C810715" Ref="U3"  Part="4" 
AR Path="/5C810715" Ref="U3"  Part="4" 
F 0 "U3" H 6500 -3050 60  0000 L CNN
F 1 "ECP5U25" H 5750 -3050 60  0000 L CNN
F 2 "gkl_housings_bga:caBGA_381_17x17" H 5550 -3200 50  0001 C CNN
F 3 "" H 5550 -3200 50  0001 C CNN
F 4 " 220-2052-ND " H 1700 -7600 50  0001 C CNN "SN-DK"
F 5 "LFE5U-45F-8BG381C" H 1700 -7600 50  0001 C CNN "PN"
F 6 "Lattice" H 1700 -7600 50  0001 C CNN "Mfg"
	4    5550 -3200
	-1   0    0    -1  
$EndComp
$Sheet
S 2450 2950 1550 1000
U 5E602F01
F0 "FPGA-DDR3L" 50
F1 "FPGA-DDR3L.sch" 50
F2 "DRAM1{DRAM_DAT0}" U R 4000 3700 50 
F3 "DRAM0{DRAM_DAT0}" U R 4000 3600 50 
F4 "DRAM{DRAM_CTRL}" I R 4000 3400 50 
$EndSheet
$Sheet
S 4550 2950 1800 1000
U 5ABD38F2
F0 "Memory-DDR3L" 60
F1 "memory-DDR3L.sch" 60
F2 "DRAM{DRAM_CTRL}" I L 4550 3400 50 
F3 "DRAM0{DRAM_DAT0}" I L 4550 3600 50 
F4 "DRAM1{DRAM_DAT0}" I L 4550 3700 50 
$EndSheet
$Sheet
S 14100 1050 1100 450 
U 5C80F19A
F0 "SyzygyPort0" 50
F1 "SYZYGY_PORT0.sch" 50
F2 "VCCIO" I L 14100 1150 50 
F3 "pmicSCL" I R 15200 1250 50 
F4 "pmicSDA" I R 15200 1350 50 
F5 "EN" I R 15200 1150 50 
$EndSheet
$Sheet
S 14100 2300 1100 450 
U 5C80F19D
F0 "SyzygyPort1" 50
F1 "SYZYGY_PORT1.sch" 50
F2 "VCCIO" I L 14100 2400 50 
F3 "pmicSCL" I R 15200 2500 50 
F4 "pmicSDA" I R 15200 2600 50 
F5 "EN" I R 15200 2400 50 
$EndSheet
$Sheet
S 14100 3450 1100 450 
U 5C80F1A0
F0 "SyzygyPort2" 50
F1 "SYZYGY_PORT2.sch" 50
F2 "VCCIO" I L 14100 3550 50 
F3 "pmicSCL" I R 15200 3650 50 
F4 "pmicSDA" I R 15200 3750 50 
F5 "EN" I R 15200 3550 50 
$EndSheet
$Sheet
S 12400 6100 1850 950 
U 5D127B63
F0 "TestPoints" 50
F1 "TestPonts.sch" 50
$EndSheet
$Sheet
S 12350 4800 1900 1000
U 5BA0BA35
F0 "sheetEthernet" 50
F1 "fileEthernet.sch" 50
$EndSheet
$Sheet
S 500  6900 1800 900 
U 5AB8ACB7
F0 "sheetFPGA" 60
F1 "fileFPGA.sch" 60
F2 "PORT0_VCCIO" I R 2300 7000 50 
F3 "PORT1_VCCIO" I R 2300 7100 50 
F4 "PORT2_VCCIO" I R 2300 7200 50 
$EndSheet
$Sheet
S 14650 7400 1900 900 
U 5ABC9A87
F0 "sheetIO" 60
F1 "fileIO.sch" 60
$EndSheet
$Sheet
S 14650 6000 1900 1000
U 5BBD18EA
F0 "sheetPower" 50
F1 "filePower.sch" 50
$EndSheet
$EndSCHEMATC
