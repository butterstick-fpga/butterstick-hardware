EESchema Schematic File Version 4
LIBS:ButterStick-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 9150 1700 2    60   Input ~ 0
FPGA_CDONE
Text GLabel -450 2650 2    60   Input ~ 0
SD_DAT0
Text GLabel -450 2750 2    60   Input ~ 0
SD_DAT1
Text GLabel -450 2850 2    60   Input ~ 0
SD_DAT2
Text GLabel -450 2950 2    60   Input ~ 0
SD_DAT3
Text GLabel -450 2550 2    60   Input ~ 0
SD_CMD
Text GLabel -450 2450 2    60   Input ~ 0
SD_CK
Text GLabel 9600 6300 2    60   Input ~ 0
SD_CD
Text GLabel 1950 5000 2    60   Input ~ 0
HB0_CS#
Text GLabel 1950 5600 2    60   Input ~ 0
HB0_RESET#
Text GLabel 1950 6200 2    60   Input ~ 0
HB0_CK
Text GLabel 1950 6100 2    60   Input ~ 0
HB0_CK#
Text GLabel 1950 5500 2    60   Input ~ 0
HB0_DQ0
Text GLabel 1950 5300 2    60   Input ~ 0
HB0_DQ1
Text GLabel 1950 5700 2    60   Input ~ 0
HB0_DQ2
Text GLabel 1950 5100 2    60   Input ~ 0
HB0_DQ3
Text GLabel 1950 5900 2    60   Input ~ 0
HB0_DQ4
Text GLabel 1950 5200 2    60   Input ~ 0
HB0_DQ5
Text GLabel 1950 5400 2    60   Input ~ 0
HB0_DQ6
Text GLabel 1950 6000 2    60   Input ~ 0
HB0_DQ7
Text GLabel 9150 2900 2    60   Input ~ 0
SPI_CONFIG_SS
Text GLabel 9150 1300 2    60   Input ~ 0
SPI_CONFIG_SCK
Text GLabel 9150 2500 2    60   Input ~ 0
SPI_CONFIG_MISO
Text GLabel 9150 2600 2    60   Input ~ 0
SPI_CONFIG_MOSI
$Comp
L gkl_power:+2V5 #PWR051
U 1 1 5AC13A0C
P 9500 5550
F 0 "#PWR051" H 9500 5400 50  0001 C CNN
F 1 "+2V5" V 9504 5656 50  0000 L CNN
F 2 "" H 9500 5550 50  0001 C CNN
F 3 "" H 9500 5550 50  0001 C CNN
	1    9500 5550
	0    -1   -1   0   
$EndComp
Text GLabel 9150 2400 2    60   Input ~ 0
QSPI_D2
Text GLabel 9150 2300 2    60   Input ~ 0
QSPI_D3
Text GLabel 10450 3200 2    60   Input ~ 0
FPGA_RESET
Text GLabel 9150 2100 2    60   Input ~ 0
LED_A
Text GLabel 9600 6700 2    60   Input ~ 0
IO_A_DIR
Text GLabel 9600 6600 2    60   Input ~ 0
IO_A_INTERNAL
Text GLabel 9600 6800 2    60   Input ~ 0
IO_B_DIR
Text GLabel 9600 6500 2    60   Input ~ 0
IO_B_INTERNAL
Text GLabel -150 3100 2    60   Input ~ 0
16MHZ_IN
$Comp
L gkl_time:TYETBCSANF-32.000000 X1
U 1 1 5ABDAC6C
P 8200 5750
F 0 "X1" H 8450 6050 50  0000 L CNN
F 1 "ASDMB" H 8450 5950 50  0000 L CNN
F 2 "Oscillators:Oscillator_SMD_SeikoEpson_SG210-4pin_2.5x2.0mm" H 8900 5400 50  0001 C CNN
F 3 "http://www.abracon.com/Oscillators/ASV.pdf" H 8100 5750 50  0001 C CNN
F 4 " 1473-30509-1-ND " H -200 -100 50  0001 C CNN "SN-DK"
F 5 " SIT8008BI-71-18E-24.000000G " H -200 -100 50  0001 C CNN "PN"
	1    8200 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 5700 8800 5300
Text GLabel 8600 5800 2    60   Input ~ 0
16MHZ_IN
$Comp
L Device:R R4
U 1 1 5AC144E9
P 10250 2950
F 0 "R4" H 10320 2996 50  0000 L CNN
F 1 "10k" H 10320 2905 50  0000 L CNN
F 2 "Resistors_SMD:R_0402" V 10180 2950 50  0001 C CNN
F 3 "" H 10250 2950 50  0001 C CNN
F 4 "P10KDECT-ND" H 0   400 50  0001 C CNN "SN-DK"
F 5 "ERA-2AED103X" H 0   400 50  0001 C CNN "PN"
	1    10250 2950
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10450 3200 10250 3200
Wire Wire Line
	10250 3100 10250 3200
Connection ~ 10250 3200
$Comp
L gkl_power:+3V3 #PWR059
U 1 1 5AC1A3A6
P 10250 2700
F 0 "#PWR059" H 10250 2550 50  0001 C CNN
F 1 "+3V3" V 10254 2806 50  0000 L CNN
F 2 "" H 10250 2700 50  0001 C CNN
F 3 "" H 10250 2700 50  0001 C CNN
	1    10250 2700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10250 2800 10250 2700
$Comp
L gkl_lattice:ECP5U25-BG381 U3
U 1 1 5B09968A
P 1900 850
F 0 "U3" H 2750 1000 60  0000 L CNN
F 1 "ECP5U25" H 2100 1000 60  0000 L CNN
F 2 "" H 1900 850 50  0001 C CNN
F 3 "" H 1900 850 50  0001 C CNN
F 4 " 220-2052-ND " H 0   0   50  0001 C CNN "SN-DK"
F 5 " LFE5U-25F-6BG381I " H 0   0   50  0001 C CNN "PN"
F 6 "Lattice" H 0   0   50  0001 C CNN "Mfg"
	1    1900 850 
	-1   0    0    -1  
$EndComp
$Comp
L gkl_lattice:ECP5U25-BG381 U3
U 6 1 5B09970F
P 3850 4500
F 0 "U3" H 4700 4650 60  0000 L CNN
F 1 "ECP5U25" H 4050 4650 60  0000 L CNN
F 2 "" H 3850 4500 50  0001 C CNN
F 3 "" H 3850 4500 50  0001 C CNN
F 4 " 220-2052-ND " H 1950 150 50  0001 C CNN "SN-DK"
F 5 " LFE5U-25F-6BG381I " H 1950 150 50  0001 C CNN "PN"
F 6 "Lattice" H 1950 150 50  0001 C CNN "Mfg"
	6    3850 4500
	-1   0    0    -1  
$EndComp
$Comp
L gkl_lattice:ECP5U25-BG381 U3
U 5 1 5B0997FD
P 6250 850
F 0 "U3" H 7350 1050 60  0000 L CNN
F 1 "ECP5U25" H 6450 1050 60  0000 L CNN
F 2 "" H 6250 850 50  0001 C CNN
F 3 "" H 6250 850 50  0001 C CNN
F 4 " 220-2052-ND " H 0   -3550 50  0001 C CNN "SN-DK"
F 5 " LFE5U-25F-6BG381I " H 0   -3550 50  0001 C CNN "PN"
F 6 "Lattice" H 0   -3550 50  0001 C CNN "Mfg"
	5    6250 850 
	-1   0    0    -1  
$EndComp
$Comp
L gkl_lattice:ECP5U25-BG381 U3
U 3 1 5B099856
P 3850 850
F 0 "U3" H 4950 1050 60  0000 L CNN
F 1 "ECP5U25" H 4050 1050 60  0000 L CNN
F 2 "" H 3850 850 50  0001 C CNN
F 3 "" H 3850 850 50  0001 C CNN
F 4 " 220-2052-ND " H -2400 0   50  0001 C CNN "SN-DK"
F 5 " LFE5U-25F-6BG381I " H -2400 0   50  0001 C CNN "PN"
F 6 "Lattice" H -2400 0   50  0001 C CNN "Mfg"
	3    3850 850 
	-1   0    0    -1  
$EndComp
$Comp
L gkl_lattice:ECP5U25-BG381 U3
U 4 1 5B0998E9
P 6250 4400
F 0 "U3" H 7200 4550 60  0000 L CNN
F 1 "ECP5U25" H 6450 4550 60  0000 L CNN
F 2 "" H 6250 4400 50  0001 C CNN
F 3 "" H 6250 4400 50  0001 C CNN
F 4 " 220-2052-ND " H 2400 0   50  0001 C CNN "SN-DK"
F 5 " LFE5U-25F-6BG381I " H 2400 0   50  0001 C CNN "PN"
F 6 "Lattice" H 2400 0   50  0001 C CNN "Mfg"
	4    6250 4400
	-1   0    0    -1  
$EndComp
$Comp
L gkl_lattice:ECP5U25-BG381 U3
U 7 1 5B099944
P 9150 1300
F 0 "U3" H 10750 1500 60  0000 L CNN
F 1 "ECP5U25" H 9350 1500 60  0000 L CNN
F 2 "" H 9150 1300 50  0001 C CNN
F 3 "" H 9150 1300 50  0001 C CNN
F 4 " 220-2052-ND " H 0   0   50  0001 C CNN "SN-DK"
F 5 " LFE5U-25F-6BG381I " H 0   0   50  0001 C CNN "PN"
F 6 "Lattice" H 0   0   50  0001 C CNN "Mfg"
	7    9150 1300
	-1   0    0    -1  
$EndComp
$Comp
L gkl_lattice:ECP5U25-BG381 U3
U 8 1 5B0999B9
P 9850 5600
F 0 "U3" H 10650 5800 60  0000 L CNN
F 1 "ECP5U25" H 10050 5800 60  0000 L CNN
F 2 "" H 9850 5600 50  0001 C CNN
F 3 "" H 9850 5600 50  0001 C CNN
F 4 " 220-2052-ND " H 0   0   50  0001 C CNN "SN-DK"
F 5 " LFE5U-25F-6BG381I " H 0   0   50  0001 C CNN "PN"
F 6 "Lattice" H 0   0   50  0001 C CNN "Mfg"
	8    9850 5600
	1    0    0    1   
$EndComp
Text GLabel 1950 5800 2    60   Input ~ 0
HB0_RWDS
$Comp
L gkl_power:GND #PWR0104
U 1 1 5B1207AF
P 10000 1650
F 0 "#PWR0104" H 10000 1400 50  0001 C CNN
F 1 "GND" H 10003 1524 50  0000 C CNN
F 2 "" H 9900 1300 50  0001 C CNN
F 3 "" H 10000 1650 50  0001 C CNN
	1    10000 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 3200 10250 3200
$Comp
L gkl_power:+1V8 #PWR0105
U 1 1 5B19EB6D
P 8800 5300
F 0 "#PWR0105" H 8800 5150 50  0001 C CNN
F 1 "+1V8" V 8804 5406 50  0000 L CNN
F 2 "" H 8800 5300 50  0001 C CNN
F 3 "" H 8800 5300 50  0001 C CNN
	1    8800 5300
	1    0    0    -1  
$EndComp
Text Notes 8050 900  0    80   ~ 0
BANK 8
$Comp
L gkl_power:+3V3 #PWR0107
U 1 1 5B1B6FEA
P 10100 1500
F 0 "#PWR0107" H 10100 1350 50  0001 C CNN
F 1 "+3V3" V 10104 1606 50  0000 L CNN
F 2 "" H 10100 1500 50  0001 C CNN
F 3 "" H 10100 1500 50  0001 C CNN
	1    10100 1500
	0    1    -1   0   
$EndComp
Text Notes 8200 1000 0    50   ~ 0
3V3
Text Notes 7850 700  0    100  ~ 0
QSPI Config
Text Notes 750  6250 1    100  ~ 0
HyperBus
Text Notes 750  2950 1    100  ~ 0
MISC CAMERA CONTROLS\n
Text GLabel 9150 2200 2    60   Input ~ 0
FPGA_RESET
Text GLabel 9350 3600 2    60   Input ~ 0
JTAG_TMS
Text GLabel 9350 3500 2    60   Input ~ 0
JTAG_TDO
Text GLabel 9350 3400 2    60   Input ~ 0
JTAG_TDI
Text GLabel 9350 3300 2    60   Input ~ 0
JTAG_TCK
Wire Wire Line
	9150 3300 9350 3300
Wire Wire Line
	9350 3400 9150 3400
Wire Wire Line
	9150 3500 9350 3500
Wire Wire Line
	9350 3600 9150 3600
$Comp
L gkl_power:GND #PWR0119
U 1 1 5B1085E7
P 9750 5700
F 0 "#PWR0119" H 9750 5450 50  0001 C CNN
F 1 "GND" H 9753 5574 50  0000 C CNN
F 2 "" H 9650 5350 50  0001 C CNN
F 3 "" H 9750 5700 50  0001 C CNN
	1    9750 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 5700 9750 5600
Wire Wire Line
	9750 5600 9850 5600
$Comp
L gkl_power:+1V1 #PWR0120
U 1 1 5B108EEB
P 9550 4700
F 0 "#PWR0120" H 9550 4550 50  0001 C CNN
F 1 "+1V1" V 9550 4900 50  0000 C CNN
F 2 "" H 9550 4700 50  0001 C CNN
F 3 "" H 9550 4700 50  0001 C CNN
	1    9550 4700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9550 4700 9850 4700
Text Notes 800  650  0    50   ~ 0
BANK0 - 3V3
Text Notes 900  4300 0    50   ~ 0
BANK1 - 1V8
Text Notes 2800 4200 0    50   ~ 0
BANK7 - 1V8
Text Notes 2800 650  0    50   ~ 0
BANK2 - 1V8
Text Notes 5000 600  0    50   ~ 0
BANK6 - 3V3 / 1V8\n
Text Notes 5000 4150 0    50   ~ 0
BANK3 - 1V8
Text GLabel 1950 6400 2    60   Input ~ 0
HB1_CS#
Text GLabel 1950 7600 2    60   Input ~ 0
HB1_RESET#
Text GLabel 1950 6600 2    60   Input ~ 0
HB1_CK
Text GLabel 1950 6500 2    60   Input ~ 0
HB1_CK#
Text GLabel 1950 7200 2    60   Input ~ 0
HB1_DQ0
Text GLabel 1950 7100 2    60   Input ~ 0
HB1_DQ1
Text GLabel 1950 7000 2    60   Input ~ 0
HB1_DQ2
Text GLabel 1950 7400 2    60   Input ~ 0
HB1_DQ3
Text GLabel 1950 7500 2    60   Input ~ 0
HB1_DQ4
Text GLabel 1950 6900 2    60   Input ~ 0
HB1_DQ5
Text GLabel 1950 6800 2    60   Input ~ 0
HB1_DQ6
Text GLabel 1950 6700 2    60   Input ~ 0
HB1_DQ7
Text GLabel 1950 7300 2    60   Input ~ 0
HB1_RWDS
Wire Wire Line
	9150 1400 10000 1400
Wire Wire Line
	10000 1400 10000 1600
Wire Wire Line
	9150 1500 10100 1500
Wire Wire Line
	9150 1600 10000 1600
Connection ~ 10000 1600
Wire Wire Line
	10000 1600 10000 1650
Text GLabel 3850 5000 2    50   Input ~ 0
ETH_MDC
Text GLabel 3850 4900 2    50   Input ~ 0
ETH_MDIO
Text GLabel 3850 6500 2    50   Input ~ 0
ETH_TXD0
Text GLabel 3850 6600 2    50   Input ~ 0
ETH_TXD1
Text GLabel 3850 6700 2    50   Input ~ 0
ETH_TXD2
Text GLabel 3850 6800 2    50   Input ~ 0
ETH_TXD3
Text GLabel 3850 6400 2    50   Input ~ 0
ETH_RXD0
Text GLabel 3850 6100 2    50   Input ~ 0
ETH_RXD1
Text GLabel 3850 6300 2    50   Input ~ 0
ETH_RXD2
Text GLabel 3850 6200 2    50   Input ~ 0
ETH_RXD3
Text GLabel 3850 7400 2    50   Input ~ 0
ETH_TX_CTRL
Text GLabel 3850 7600 2    50   Input ~ 0
ETH_TX_CLK
Text GLabel 3850 7000 2    50   Input ~ 0
ETH_RX_CTRL
Text GLabel 3850 7300 2    50   Input ~ 0
ETH_RX_CLK
Text GLabel 3850 4700 2    50   Input ~ 0
ETH_INT
Text GLabel 9600 6200 2    60   Input ~ 0
IO_C_DIR
Text GLabel 9600 6400 2    60   Input ~ 0
IO_C_INTERNAL
Text GLabel -700 3350 2    50   Input ~ 0
DISP0_SCLK
Text GLabel -700 3450 2    50   Input ~ 0
DISP0_SI
Text GLabel -700 3550 2    50   Input ~ 0
DISP0_SCS
Text GLabel -700 3650 2    50   Input ~ 0
DISP0_EXTCOMIN
Text GLabel -700 3750 2    50   Input ~ 0
DISP0_DISP
Text GLabel 3850 4600 2    50   Input ~ 0
ETH_RST
Text GLabel 1950 4800 2    60   Input ~ 0
PCLKC6_0
Text GLabel 1950 4700 2    60   Input ~ 0
PCLKT6_0
Text GLabel 1950 4600 2    60   Input ~ 0
PCLKC6_1
Text GLabel 1950 4500 2    60   Input ~ 0
PCLKT6_1
Text GLabel 3850 7500 2    50   Input ~ 0
PCLKT7_0
Text GLabel 3850 2050 2    60   Input ~ 0
SYZYGY_0_D0_P
Text GLabel 3850 2150 2    60   Input ~ 0
SYZYGY_0_D0_N
Text GLabel 3850 3050 2    60   Input ~ 0
SYZYGY_0_D1_P
Text GLabel 3850 3150 2    60   Input ~ 0
SYZYGY_0_D1_N
Text GLabel 3850 1650 2    60   Input ~ 0
SYZYGY_0_D2_P
Text GLabel 3850 1750 2    60   Input ~ 0
SYZYGY_0_D2_N
Text GLabel 3850 2850 2    60   Input ~ 0
SYZYGY_0_D3_P
Text GLabel 3850 2950 2    60   Input ~ 0
SYZYGY_0_D3_N
Text GLabel 3850 1250 2    60   Input ~ 0
SYZYGY_0_D4_P
Text GLabel 3850 1350 2    60   Input ~ 0
SYZYGY_0_D4_N
Text GLabel 3850 2750 2    60   Input ~ 0
SYZYGY_0_D5_N
Text GLabel 3850 2650 2    60   Input ~ 0
SYZYGY_0_D5_P
Text GLabel 3850 950  2    60   Input ~ 0
SYZYGY_0_D6_N
Text GLabel 3850 850  2    60   Input ~ 0
SYZYGY_0_D6_P
Text GLabel 3850 2550 2    60   Input ~ 0
SYZYGY_0_CLK0_N
Text GLabel 3850 2450 2    60   Input ~ 0
SYZYGY_0_CLK0_P
Text GLabel 3850 3950 2    60   Input ~ 0
SYZYGY_0_CLK1_N
Text GLabel 3850 3850 2    60   Input ~ 0
SYZYGY_0_CLK1_P
Text GLabel 3850 3750 2    60   Input ~ 0
SYZYGY_0_D7_N
Text GLabel 3850 3650 2    60   Input ~ 0
SYZYGY_0_D7_P
Text GLabel 3850 3250 2    60   Input ~ 0
SYZYGY_0_S16
Text GLabel 3850 1550 2    60   Input ~ 0
SYZYGY_0_S17
Text GLabel 3850 3350 2    60   Input ~ 0
SYZYGY_0_S18
Text GLabel 3850 1450 2    60   Input ~ 0
SYZYGY_0_S19
Text GLabel 3850 3550 2    60   Input ~ 0
SYZYGY_0_S20
Text GLabel 3850 1150 2    60   Input ~ 0
SYZYGY_0_S21
Text GLabel 3850 1050 2    60   Input ~ 0
SYZYGY_0_S22
Text GLabel 3850 1950 2    60   Input ~ 0
SYZYGY_0_S23
Text GLabel 3850 3450 2    60   Input ~ 0
SYZYGY_0_S24
Text GLabel 3850 1850 2    60   Input ~ 0
SYZYGY_0_S25
Text GLabel 3850 2350 2    60   Input ~ 0
SYZYGY_0_S26
Text GLabel 3850 2250 2    60   Input ~ 0
SYZYGY_0_S27
Text GLabel 6250 6400 2    60   Input ~ 0
SYZYGY_1_D0_P
Text GLabel 6250 6500 2    60   Input ~ 0
SYZYGY_1_D0_N
Text GLabel 6250 7400 2    60   Input ~ 0
SYZYGY_1_D1_P
Text GLabel 6250 7500 2    60   Input ~ 0
SYZYGY_1_D1_N
Text GLabel 6250 6000 2    60   Input ~ 0
SYZYGY_1_D2_P
Text GLabel 6250 6100 2    60   Input ~ 0
SYZYGY_1_D2_N
Text GLabel 6250 7200 2    60   Input ~ 0
SYZYGY_1_D3_P
Text GLabel 6250 7300 2    60   Input ~ 0
SYZYGY_1_D3_N
Text GLabel 6250 5600 2    60   Input ~ 0
SYZYGY_1_D4_P
Text GLabel 6250 5700 2    60   Input ~ 0
SYZYGY_1_D4_N
Text GLabel 6250 7100 2    60   Input ~ 0
SYZYGY_1_D5_N
Text GLabel 6250 7000 2    60   Input ~ 0
SYZYGY_1_D5_P
Text GLabel 6250 5300 2    60   Input ~ 0
SYZYGY_1_D6_N
Text GLabel 6250 5200 2    60   Input ~ 0
SYZYGY_1_D6_P
Text GLabel 6250 4500 2    60   Input ~ 0
SYZYGY_1_CLK0_N
Text GLabel 6250 4400 2    60   Input ~ 0
SYZYGY_1_CLK0_P
Text GLabel 6250 4700 2    60   Input ~ 0
SYZYGY_1_CLK1_N
Text GLabel 6250 4600 2    60   Input ~ 0
SYZYGY_1_CLK1_P
Text GLabel 6250 6900 2    60   Input ~ 0
SYZYGY_1_D7_N
Text GLabel 6250 6800 2    60   Input ~ 0
SYZYGY_1_D7_P
Text GLabel 6250 1250 2    60   Input ~ 0
SYZYGY_2_D0_P
Text GLabel 6250 1350 2    60   Input ~ 0
SYZYGY_2_D0_N
Text GLabel 6250 1650 2    60   Input ~ 0
SYZYGY_2_D1_P
Text GLabel 6250 1750 2    60   Input ~ 0
SYZYGY_2_D1_N
Text GLabel 6250 2050 2    60   Input ~ 0
SYZYGY_2_D2_P
Text GLabel 6250 2150 2    60   Input ~ 0
SYZYGY_2_D2_N
Text GLabel 6250 1450 2    60   Input ~ 0
SYZYGY_2_D3_P
Text GLabel 6250 1550 2    60   Input ~ 0
SYZYGY_2_D3_N
Text GLabel 6250 2450 2    60   Input ~ 0
SYZYGY_2_D4_P
Text GLabel 6250 2550 2    60   Input ~ 0
SYZYGY_2_D4_N
Text GLabel 6250 3350 2    60   Input ~ 0
SYZYGY_2_D5_N
Text GLabel 6250 3250 2    60   Input ~ 0
SYZYGY_2_D5_P
Text GLabel 6250 2950 2    60   Input ~ 0
SYZYGY_2_D6_N
Text GLabel 6250 2850 2    60   Input ~ 0
SYZYGY_2_D6_P
Text GLabel 6250 950  2    60   Input ~ 0
SYZYGY_2_CLK0_N
Text GLabel 6250 850  2    60   Input ~ 0
SYZYGY_2_CLK0_P
Text GLabel 6250 1150 2    60   Input ~ 0
SYZYGY_2_CLK1_N
Text GLabel 6250 1050 2    60   Input ~ 0
SYZYGY_2_CLK1_P
Text GLabel 6250 3750 2    60   Input ~ 0
SYZYGY_2_D7_N
Text GLabel 6250 3650 2    60   Input ~ 0
SYZYGY_2_D7_P
Text GLabel 6250 2350 2    60   Input ~ 0
SYZYGY_2_S16
Text GLabel 6250 2650 2    60   Input ~ 0
SYZYGY_2_S17
Text GLabel 6250 3150 2    60   Input ~ 0
SYZYGY_2_S18
Text GLabel 6250 2750 2    60   Input ~ 0
SYZYGY_2_S19
Text GLabel 6250 3450 2    60   Input ~ 0
SYZYGY_2_S20
Text GLabel 6250 1850 2    60   Input ~ 0
SYZYGY_2_S21
Text GLabel 6250 3550 2    60   Input ~ 0
SYZYGY_2_S22
Text GLabel 6250 3050 2    60   Input ~ 0
SYZYGY_2_S23
Text GLabel 6250 3850 2    60   Input ~ 0
SYZYGY_2_S24
Text GLabel 6250 2250 2    60   Input ~ 0
SYZYGY_2_S25
Text GLabel 6250 3950 2    60   Input ~ 0
SYZYGY_2_S26
Text GLabel 6250 1950 2    60   Input ~ 0
SYZYGY_2_S27
Text GLabel 6250 4800 2    60   Input ~ 0
SYZYGY_1_S16
Text GLabel 6250 4900 2    60   Input ~ 0
SYZYGY_1_S17
Text GLabel 6250 5000 2    60   Input ~ 0
SYZYGY_1_S18
Text GLabel 6250 5800 2    60   Input ~ 0
SYZYGY_1_S19
Text GLabel 6250 5100 2    60   Input ~ 0
SYZYGY_1_S20
Text GLabel 6250 5400 2    60   Input ~ 0
SYZYGY_1_S21
Text GLabel 6250 5500 2    60   Input ~ 0
SYZYGY_1_S22
Text GLabel 6250 6300 2    60   Input ~ 0
SYZYGY_1_S23
Text GLabel 6250 5900 2    60   Input ~ 0
SYZYGY_1_S24
Text GLabel 6250 6700 2    60   Input ~ 0
SYZYGY_1_S25
Text GLabel 6250 6600 2    60   Input ~ 0
SYZYGY_1_S26
Text GLabel 6250 6200 2    60   Input ~ 0
SYZYGY_1_S27
$Comp
L gkl_lattice:ECP5U25-BG381 U3
U 2 1 5B099786
P 1950 4500
F 0 "U3" H 2850 4650 60  0000 L CNN
F 1 "ECP5U25" H 2150 4650 60  0000 L CNN
F 2 "" H 1950 4500 50  0001 C CNN
F 3 "" H 1950 4500 50  0001 C CNN
F 4 " 220-2052-ND " H -1900 3650 50  0001 C CNN "SN-DK"
F 5 " LFE5U-25F-6BG381I " H -1900 3650 50  0001 C CNN "PN"
F 6 "Lattice" H -1900 3650 50  0001 C CNN "Mfg"
	2    1950 4500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9850 4800 9650 4800
Wire Wire Line
	9650 4800 9650 4550
$Comp
L gkl_power:+3V3 #PWR0106
U 1 1 5C7C78F9
P 9650 4550
F 0 "#PWR0106" H 9650 4400 50  0001 C CNN
F 1 "+3V3" V 9650 4750 50  0000 C CNN
F 2 "" H 9650 4550 50  0001 C CNN
F 3 "" H 9650 4550 50  0001 C CNN
	1    9650 4550
	1    0    0    -1  
$EndComp
Text GLabel 9650 5400 0    60   Input ~ 0
VCCIO0
Text GLabel 9650 5300 0    60   Input ~ 0
VCCIO1
Text GLabel 9650 5200 0    60   Input ~ 0
VCCIO2
Text GLabel 9650 5100 0    60   Input ~ 0
VCCIO3
Text GLabel 9650 4900 0    60   Input ~ 0
VCCIO7
Text GLabel 9650 5000 0    60   Input ~ 0
VCCIO6
Wire Wire Line
	9500 5550 9650 5550
Wire Wire Line
	9650 5550 9650 5500
Wire Wire Line
	9650 5500 9850 5500
Wire Wire Line
	9650 4900 9850 4900
Wire Wire Line
	9650 5000 9850 5000
Wire Wire Line
	9650 5100 9850 5100
Wire Wire Line
	9650 5200 9850 5200
Wire Wire Line
	9650 5300 9850 5300
Wire Wire Line
	9650 5400 9850 5400
Wire Wire Line
	8800 5700 8600 5700
$Comp
L gkl_power:GND #PWR0123
U 1 1 5C7CB5AD
P 7750 5900
F 0 "#PWR0123" H 7750 5650 50  0001 C CNN
F 1 "GND" H 7753 5774 50  0000 C CNN
F 2 "" H 7650 5550 50  0001 C CNN
F 3 "" H 7750 5900 50  0001 C CNN
	1    7750 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 5900 7750 5800
Wire Wire Line
	7750 5800 7800 5800
NoConn ~ 7800 5700
$EndSCHEMATC
