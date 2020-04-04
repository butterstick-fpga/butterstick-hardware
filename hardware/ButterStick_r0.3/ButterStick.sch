EESchema Schematic File Version 5
EELAYER 33 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 15
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
Connection ~ -2300 -300
Connection ~ -2300 450 
Connection ~ -800 -700
Connection ~ -800 550 
Connection ~ -700 -600
Connection ~ -700 650 
Wire Wire Line
	-2300 -800 -2300 -300
Wire Wire Line
	-2300 -300 -2300 100 
Wire Wire Line
	-2300 -300 650  -300
Wire Wire Line
	-2300 450  -2300 200 
Wire Wire Line
	-2300 450  -2300 950 
Wire Wire Line
	-2300 950  -550 950 
Wire Wire Line
	-2000 -800 -2300 -800
Wire Wire Line
	-2000 450  -2300 450 
Wire Wire Line
	-900 -800 -850 -800
Wire Wire Line
	-900 -700 -800 -700
Wire Wire Line
	-900 -600 -700 -600
Wire Wire Line
	-900 550  -800 550 
Wire Wire Line
	-900 650  -700 650 
Wire Wire Line
	-900 1600 -350 1600
Wire Wire Line
	-900 1700 -800 1700
Wire Wire Line
	-850 -900 100  -900
Wire Wire Line
	-850 -800 -850 -900
Wire Wire Line
	-800 -800 650  -800
Wire Wire Line
	-800 -700 -800 -800
Wire Wire Line
	-800 550  -800 -700
Wire Wire Line
	-800 1700 -800 550 
Wire Wire Line
	-700 -700 -700 -600
Wire Wire Line
	-700 -600 -700 650 
Wire Wire Line
	-700 650  -700 1800
Wire Wire Line
	-700 1800 -900 1800
Wire Wire Line
	-550 -200 650  -200
Wire Wire Line
	-550 950  -550 -200
Wire Wire Line
	-450 -100 650  -100
Wire Wire Line
	-450 2100 -450 -100
Wire Wire Line
	-350 550  -200 550 
Wire Wire Line
	-350 1600 -350 550 
Wire Wire Line
	-300 200  -300 450 
Wire Wire Line
	-300 450  -900 450 
Wire Wire Line
	-200 300  650  300 
Wire Wire Line
	-200 550  -200 300 
Wire Wire Line
	100  -900 100  100 
Wire Wire Line
	100  100  650  100 
Wire Wire Line
	650  -700 -700 -700
Wire Wire Line
	650  200  -300 200 
Wire Bus Line
	4800 3100 5350 3100
Wire Bus Line
	4800 3300 5350 3300
Wire Bus Line
	4800 3400 5350 3400
$Comp
L gkl_misc:SYZYGY-TXR-4 J8
U 1 1 5E87B4DB
P 10300 3300
F 0 "J8" H 10300 4419 50  0000 C CNN
F 1 "SYZYGY-TXR-4" H 10300 4328 50  0000 C CNN
F 2 "gkl_conn:SYZYGY_Transcieiver" H 10300 4300 50  0001 C CNN
F 3 "" H 10300 4300 50  0001 C CNN
	1    10300 3300
	1    0    0    -1  
$EndComp
$Sheet
S 3250 2650 1550 1000
U 5E602F01
F0 "FPGA-DDR3L" 50
F1 "FPGA-DDR3L.sch" 50
F2 "{DRAM_DAT1}" U R 4800 3400 50 
F3 "{DRAM_DAT0}" U R 4800 3300 50 
F4 "{DRAM_CTRL}" I R 4800 3100 50 
$EndSheet
$Sheet
S 5350 2650 1800 1000
U 5ABD38F2
F0 "Memory-DDR3L" 60
F1 "memory-DDR3L.sch" 60
F2 "{DRAM_DAT0}" U L 5350 3300 50 
F3 "{DRAM_DAT1}" U L 5350 3400 50 
F4 "{DRAM_CTRL}" O L 5350 3100 50 
$EndSheet
$Sheet
S 650  -1250 1100 1800
U 5C9D13FE
F0 "SmartVIO" 50
F1 "SmartVIO.sch" 50
F2 "SYZYGY_SDA" I L 650 -1050 50 
F3 "SYZYGY_SCL" I L 650 -1150 50 
F4 "PMIC_SDA" I L 650 -700 50 
F5 "PMIC_SCL" I L 650 -800 50 
F6 "SENSE0" I L 650 -300 50 
F7 "SENSE1" I L 650 -200 50 
F8 "SENSE2" I L 650 -100 50 
F9 "EN0" I L 650 100 50 
F10 "EN1" I L 650 200 50 
F11 "EN2" I L 650 300 50 
$EndSheet
$Sheet
S -2000 -900 1100 450 
U 5C80F19A
F0 "SyzygyPort0" 50
F1 "SYZYGY_PORT0.sch" 50
F2 "VCCIO" I L -2000 -800 50 
F3 "pmicSCL" I R -900 -700 50 
F4 "pmicSDA" I R -900 -600 50 
F5 "EN" I R -900 -800 50 
$EndSheet
$Sheet
S -2000 350  1100 450 
U 5C80F19D
F0 "SyzygyPort1" 50
F1 "SYZYGY_PORT1.sch" 50
F2 "VCCIO" I L -2000 450 50 
F3 "pmicSCL" I R -900 550 50 
F4 "pmicSDA" I R -900 650 50 
F5 "EN" I R -900 450 50 
$EndSheet
$Sheet
S -2000 1500 1100 450 
U 5C80F1A0
F0 "SyzygyPort2" 50
F1 "SYZYGY_PORT2.sch" 50
F2 "VCCIO" I L -2000 1600 50 
F3 "pmicSCL" I R -900 1700 50 
F4 "pmicSDA" I R -900 1800 50 
F5 "EN" I R -900 1600 50 
$EndSheet
$Sheet
S -2200 4750 1850 950 
U 5D127B63
F0 "TestPoints" 50
F1 "TestPonts.sch" 50
$EndSheet
$Sheet
S -2250 3450 1900 1000
U 5BA0BA35
F0 "sheetEthernet" 50
F1 "fileEthernet.sch" 50
$EndSheet
$Sheet
S 6300 5300 1800 900 
U 5AB8ACB7
F0 "sheetFPGA" 60
F1 "fileFPGA.sch" 60
F2 "PORT0_VCCIO" I R 8100 5400 50 
F3 "PORT1_VCCIO" I R 8100 5500 50 
F4 "PORT2_VCCIO" I R 8100 5600 50 
$EndSheet
$Sheet
S 50   6050 1900 900 
U 5ABC9A87
F0 "sheetIO" 60
F1 "fileIO.sch" 60
$EndSheet
$Sheet
S 50   4650 1900 1000
U 5BBD18EA
F0 "sheetPower" 50
F1 "filePower.sch" 50
$EndSheet
$EndSCHEMATC
