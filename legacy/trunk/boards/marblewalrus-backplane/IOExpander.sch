EESchema Schematic File Version 2
LIBS:analog-azonenberg
LIBS:cmos
LIBS:cypress-azonenberg
LIBS:hirose-azonenberg
LIBS:memory-azonenberg
LIBS:microchip-azonenberg
LIBS:osc-azonenberg
LIBS:passive-azonenberg
LIBS:power-azonenberg
LIBS:special-azonenberg
LIBS:xilinx-azonenberg
LIBS:device
LIBS:conn
LIBS:marblewalrus-backplane-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 7
Title "MARBLEWALRUS Backplane"
Date "2015-11-15"
Rev "$Rev: 2241 $"
Comp "Andrew Zonenberg"
Comment1 "I2C I/O expander"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 8050 2400 2    60   Input ~ 0
3V3
Text HLabel 8050 2600 2    60   Input ~ 0
GND
$Comp
L TCA6424A U22
U 1 1 564A400D
P 6750 4950
F 0 "U22" H 6750 4900 60  0000 L CNN
F 1 "TCA6424A" H 6750 4800 60  0000 L CNN
F 2 "azonenberg_pcb:QFN_32_0.5MM_5x5MM" H 6750 4950 60  0001 C CNN
F 3 "" H 6750 4950 60  0000 C CNN
	1    6750 4950
	1    0    0    -1  
$EndComp
Text HLabel 6200 4900 0    60   Output ~ 0
PWREN_CB0
Wire Wire Line
	6200 4900 6550 4900
Text HLabel 6200 4500 0    60   Output ~ 0
PWREN_CB1
Wire Wire Line
	6200 2400 6550 2400
Text HLabel 6200 4300 0    60   Output ~ 0
PWREN_CB2
Wire Wire Line
	6200 2500 6550 2500
Text HLabel 6200 3900 0    60   Output ~ 0
PWREN_CB3
Wire Wire Line
	6200 2600 6550 2600
Text HLabel 6200 3300 0    60   Output ~ 0
PWREN_CB4
Wire Wire Line
	6200 2700 6550 2700
Text HLabel 6200 3100 0    60   Output ~ 0
PWREN_CB5
Wire Wire Line
	6200 2800 6550 2800
Text HLabel 6200 2500 0    60   Output ~ 0
PWREN_CB6
Wire Wire Line
	6200 2900 6550 2900
Text HLabel 6200 2400 0    60   Output ~ 0
PWREN_CB7
Wire Wire Line
	6200 3000 6550 3000
Wire Wire Line
	8050 2400 7750 2400
Wire Wire Line
	7850 2400 7850 2500
Wire Wire Line
	7850 2500 7750 2500
Connection ~ 7850 2400
Wire Wire Line
	8050 2600 7750 2600
Text HLabel 8050 2800 2    60   Input ~ 0
I2C_SCL
Wire Wire Line
	8050 2800 7750 2800
Text HLabel 8050 2900 2    60   BiDi ~ 0
I2C_SDA
Wire Wire Line
	8050 2900 7750 2900
$Comp
L R R38
U 1 1 564AAEC9
P 8700 2950
F 0 "R38" V 8780 2950 50  0000 C CNN
F 1 "10K" V 8700 2950 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 8630 2950 30  0001 C CNN
F 3 "" H 8700 2950 30  0000 C CNN
	1    8700 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 3100 8700 3100
Text Label 7850 3100 0    60   ~ 0
IEXP_RESET_N
$Comp
L R R40
U 1 1 564AAF48
P 9250 2950
F 0 "R40" V 9330 2950 50  0000 C CNN
F 1 "10K" V 9250 2950 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 9180 2950 30  0001 C CNN
F 3 "" H 9250 2950 30  0000 C CNN
	1    9250 2950
	-1   0    0    1   
$EndComp
Wire Wire Line
	7750 3300 9250 3300
$Comp
L R R39
U 1 1 564AB232
P 9000 2950
F 0 "R39" V 9080 2950 50  0000 C CNN
F 1 "10K" V 9000 2950 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 8930 2950 30  0001 C CNN
F 3 "" H 9000 2950 30  0000 C CNN
	1    9000 2950
	-1   0    0    1   
$EndComp
Text Label 8700 2650 2    60   ~ 0
3V3
Wire Wire Line
	8700 2650 8700 2800
Text Label 9000 2650 2    60   ~ 0
GND
Wire Wire Line
	9000 2650 9000 2800
Text Label 9250 2650 2    60   ~ 0
3V3
Wire Wire Line
	9250 2650 9250 2800
Wire Wire Line
	9000 3100 9000 3200
Wire Wire Line
	9000 3200 7750 3200
Wire Wire Line
	9250 3300 9250 3100
Text Label 7850 3200 0    60   ~ 0
IEXP_ADDR
Text Label 7850 3300 0    60   ~ 0
IEXP_INT_N
$Comp
L C C31
U 1 1 564AB8DF
P 9700 2950
F 0 "C31" H 9725 3050 50  0000 L CNN
F 1 "0.1 uF" H 9725 2850 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0402_CAP_NOSILK" H 9738 2800 30  0001 C CNN
F 3 "" H 9700 2950 60  0000 C CNN
	1    9700 2950
	1    0    0    -1  
$EndComp
Text Label 9700 2800 2    60   ~ 0
3V3
Text Label 9700 3100 2    60   ~ 0
GND
$Comp
L C C32
U 1 1 564AB956
P 10000 2950
F 0 "C32" H 10025 3050 50  0000 L CNN
F 1 "0.1 uF" H 10025 2850 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0402_CAP_NOSILK" H 10038 2800 30  0001 C CNN
F 3 "" H 10000 2950 60  0000 C CNN
	1    10000 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 2800 10000 2800
Wire Wire Line
	9700 3100 10000 3100
$Comp
L SSM6N58NU_DUAL_NMOS Q1
U 1 1 564AC2DA
P 2050 1350
F 0 "Q1" H 2060 1520 60  0000 R CNN
F 1 "SSM6N58NU" H 2000 1200 60  0000 R CNN
F 2 "azonenberg_pcb:DFN_6_0.65MM_2x2MM_GDS" H 2050 1350 60  0001 C CNN
F 3 "" H 2050 1350 60  0000 C CNN
	1    2050 1350
	-1   0    0    -1  
$EndComp
Text Label 1700 1550 2    60   ~ 0
GND
Wire Wire Line
	1700 1550 1950 1550
Text HLabel 1700 1150 0    60   Output ~ 0
CB0_RESET_N
$Comp
L SSM6N58NU_DUAL_NMOS Q1
U 2 1 564AD8FE
P 2050 1850
F 0 "Q1" H 2060 2020 60  0000 R CNN
F 1 "SSM6N58NU" H 2000 1700 60  0000 R CNN
F 2 "azonenberg_pcb:DFN_6_0.65MM_2x2MM_GDS" H 2050 1850 60  0001 C CNN
F 3 "" H 2050 1850 60  0000 C CNN
	2    2050 1850
	-1   0    0    -1  
$EndComp
Text Label 1700 2050 2    60   ~ 0
GND
Wire Wire Line
	1700 2050 1950 2050
Wire Wire Line
	1700 1150 1950 1150
Text HLabel 1700 1650 0    60   Output ~ 0
CB1_RESET_N
Wire Wire Line
	1700 1650 1950 1650
Text Label 6200 4600 2    60   ~ 0
CB0_RESET
Wire Wire Line
	6200 4600 6550 4600
Text Label 6200 4700 2    60   ~ 0
CB1_RESET
Wire Wire Line
	6200 4700 6550 4700
Text Label 6200 3800 2    60   ~ 0
CB2_RESET
Wire Wire Line
	6200 4200 6550 4200
Text Label 6200 4000 2    60   ~ 0
CB3_RESET
Wire Wire Line
	6200 4300 6550 4300
Text Label 6200 3400 2    60   ~ 0
CB4_RESET
Wire Wire Line
	6200 3700 6550 3700
Text Label 6200 3500 2    60   ~ 0
CB5_RESET
Wire Wire Line
	6200 3800 6550 3800
Text Label 6200 2700 2    60   ~ 0
CB6_RESET
Wire Wire Line
	6200 3300 6550 3300
Text Label 6200 2800 2    60   ~ 0
CB7_RESET
Wire Wire Line
	6200 3400 6550 3400
Text Label 2500 1350 0    60   ~ 0
CB0_RESET
Wire Wire Line
	2500 1350 2250 1350
Text Label 2500 1850 0    60   ~ 0
CB1_RESET
Wire Wire Line
	2500 1850 2250 1850
$Comp
L SSM6N58NU_DUAL_NMOS Q2
U 1 1 564AE035
P 2050 2350
F 0 "Q2" H 2060 2520 60  0000 R CNN
F 1 "SSM6N58NU" H 2000 2200 60  0000 R CNN
F 2 "azonenberg_pcb:DFN_6_0.65MM_2x2MM_GDS" H 2050 2350 60  0001 C CNN
F 3 "" H 2050 2350 60  0000 C CNN
	1    2050 2350
	-1   0    0    -1  
$EndComp
Text Label 1700 2550 2    60   ~ 0
GND
Wire Wire Line
	1700 2550 1950 2550
Text HLabel 1700 2150 0    60   Output ~ 0
CB2_RESET_N
$Comp
L SSM6N58NU_DUAL_NMOS Q2
U 2 1 564AE03E
P 2050 2850
F 0 "Q2" H 2060 3020 60  0000 R CNN
F 1 "SSM6N58NU" H 2000 2700 60  0000 R CNN
F 2 "azonenberg_pcb:DFN_6_0.65MM_2x2MM_GDS" H 2050 2850 60  0001 C CNN
F 3 "" H 2050 2850 60  0000 C CNN
	2    2050 2850
	-1   0    0    -1  
$EndComp
Text Label 1700 3050 2    60   ~ 0
GND
Wire Wire Line
	1700 3050 1950 3050
Wire Wire Line
	1700 2150 1950 2150
Text HLabel 1700 2650 0    60   Output ~ 0
CB3_RESET_N
Wire Wire Line
	1700 2650 1950 2650
Text Label 2500 2350 0    60   ~ 0
CB2_RESET
Wire Wire Line
	2500 2350 2250 2350
Text Label 2500 2850 0    60   ~ 0
CB3_RESET
Wire Wire Line
	2500 2850 2250 2850
$Comp
L SSM6N58NU_DUAL_NMOS Q3
U 1 1 564AE60C
P 2050 3350
F 0 "Q3" H 2060 3520 60  0000 R CNN
F 1 "SSM6N58NU" H 2000 3200 60  0000 R CNN
F 2 "azonenberg_pcb:DFN_6_0.65MM_2x2MM_GDS" H 2050 3350 60  0001 C CNN
F 3 "" H 2050 3350 60  0000 C CNN
	1    2050 3350
	-1   0    0    -1  
$EndComp
Text Label 1700 3550 2    60   ~ 0
GND
Wire Wire Line
	1700 3550 1950 3550
Text HLabel 1700 3150 0    60   Output ~ 0
CB4_RESET_N
$Comp
L SSM6N58NU_DUAL_NMOS Q3
U 2 1 564AE615
P 2050 3850
F 0 "Q3" H 2060 4020 60  0000 R CNN
F 1 "SSM6N58NU" H 2000 3700 60  0000 R CNN
F 2 "azonenberg_pcb:DFN_6_0.65MM_2x2MM_GDS" H 2050 3850 60  0001 C CNN
F 3 "" H 2050 3850 60  0000 C CNN
	2    2050 3850
	-1   0    0    -1  
$EndComp
Text Label 1700 4050 2    60   ~ 0
GND
Wire Wire Line
	1700 4050 1950 4050
Wire Wire Line
	1700 3150 1950 3150
Text HLabel 1700 3650 0    60   Output ~ 0
CB5_RESET_N
Wire Wire Line
	1700 3650 1950 3650
Text Label 2500 3350 0    60   ~ 0
CB4_RESET
Wire Wire Line
	2500 3350 2250 3350
Text Label 2500 3850 0    60   ~ 0
CB5_RESET
Wire Wire Line
	2500 3850 2250 3850
$Comp
L SSM6N58NU_DUAL_NMOS Q4
U 1 1 564AE624
P 2050 4350
F 0 "Q4" H 2060 4520 60  0000 R CNN
F 1 "SSM6N58NU" H 2000 4200 60  0000 R CNN
F 2 "azonenberg_pcb:DFN_6_0.65MM_2x2MM_GDS" H 2050 4350 60  0001 C CNN
F 3 "" H 2050 4350 60  0000 C CNN
	1    2050 4350
	-1   0    0    -1  
$EndComp
Text Label 1700 4550 2    60   ~ 0
GND
Wire Wire Line
	1700 4550 1950 4550
Text HLabel 1700 4150 0    60   Output ~ 0
CB6_RESET_N
$Comp
L SSM6N58NU_DUAL_NMOS Q4
U 2 1 564AE62D
P 2050 4850
F 0 "Q4" H 2060 5020 60  0000 R CNN
F 1 "SSM6N58NU" H 2000 4700 60  0000 R CNN
F 2 "azonenberg_pcb:DFN_6_0.65MM_2x2MM_GDS" H 2050 4850 60  0001 C CNN
F 3 "" H 2050 4850 60  0000 C CNN
	2    2050 4850
	-1   0    0    -1  
$EndComp
Text Label 1700 5050 2    60   ~ 0
GND
Wire Wire Line
	1700 5050 1950 5050
Wire Wire Line
	1700 4150 1950 4150
Text HLabel 1700 4650 0    60   Output ~ 0
CB7_RESET_N
Wire Wire Line
	1700 4650 1950 4650
Text Label 2500 4350 0    60   ~ 0
CB6_RESET
Wire Wire Line
	2500 4350 2250 4350
Text Label 2500 4850 0    60   ~ 0
CB7_RESET
Wire Wire Line
	2500 4850 2250 4850
$Comp
L R R41
U 1 1 564B0DF4
P 1550 7300
F 0 "R41" V 1630 7300 50  0000 C CNN
F 1 "10K" V 1550 7300 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 1480 7300 30  0001 C CNN
F 3 "" H 1550 7300 30  0000 C CNN
	1    1550 7300
	1    0    0    -1  
$EndComp
Text Label 1550 7150 2    60   ~ 0
CB0_RESET
Text Label 1450 7450 2    60   ~ 0
GND
Wire Wire Line
	1450 7450 5550 7450
$Comp
L R R42
U 1 1 564B0FA0
P 2100 7300
F 0 "R42" V 2180 7300 50  0000 C CNN
F 1 "10K" V 2100 7300 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2030 7300 30  0001 C CNN
F 3 "" H 2100 7300 30  0000 C CNN
	1    2100 7300
	1    0    0    -1  
$EndComp
Text Label 2100 7150 2    60   ~ 0
CB1_RESET
$Comp
L R R43
U 1 1 564B10C2
P 2650 7300
F 0 "R43" V 2730 7300 50  0000 C CNN
F 1 "10K" V 2650 7300 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2580 7300 30  0001 C CNN
F 3 "" H 2650 7300 30  0000 C CNN
	1    2650 7300
	1    0    0    -1  
$EndComp
Text Label 2650 7150 2    60   ~ 0
CB2_RESET
$Comp
L R R44
U 1 1 564B1136
P 3250 7300
F 0 "R44" V 3330 7300 50  0000 C CNN
F 1 "10K" V 3250 7300 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3180 7300 30  0001 C CNN
F 3 "" H 3250 7300 30  0000 C CNN
	1    3250 7300
	1    0    0    -1  
$EndComp
Text Label 3250 7150 2    60   ~ 0
CB3_RESET
$Comp
L R R45
U 1 1 564B1238
P 3800 7300
F 0 "R45" V 3880 7300 50  0000 C CNN
F 1 "10K" V 3800 7300 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3730 7300 30  0001 C CNN
F 3 "" H 3800 7300 30  0000 C CNN
	1    3800 7300
	1    0    0    -1  
$EndComp
Text Label 3800 7150 2    60   ~ 0
CB4_RESET
$Comp
L R R46
U 1 1 564B123F
P 4400 7300
F 0 "R46" V 4480 7300 50  0000 C CNN
F 1 "10K" V 4400 7300 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 4330 7300 30  0001 C CNN
F 3 "" H 4400 7300 30  0000 C CNN
	1    4400 7300
	1    0    0    -1  
$EndComp
Text Label 4400 7150 2    60   ~ 0
CB5_RESET
$Comp
L R R47
U 1 1 564B1324
P 4950 7300
F 0 "R47" V 5030 7300 50  0000 C CNN
F 1 "10K" V 4950 7300 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 4880 7300 30  0001 C CNN
F 3 "" H 4950 7300 30  0000 C CNN
	1    4950 7300
	1    0    0    -1  
$EndComp
Text Label 4950 7150 2    60   ~ 0
CB6_RESET
$Comp
L R R48
U 1 1 564B132B
P 5550 7300
F 0 "R48" V 5630 7300 50  0000 C CNN
F 1 "10K" V 5550 7300 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 5480 7300 30  0001 C CNN
F 3 "" H 5550 7300 30  0000 C CNN
	1    5550 7300
	1    0    0    -1  
$EndComp
Text Label 5550 7150 2    60   ~ 0
CB7_RESET
Connection ~ 1550 7450
Connection ~ 2650 7450
Connection ~ 2100 7450
Connection ~ 3250 7450
Connection ~ 3800 7450
Connection ~ 4400 7450
Connection ~ 4950 7450
$Comp
L R R49
U 1 1 564B1D58
P 1550 6700
F 0 "R49" V 1630 6700 50  0000 C CNN
F 1 "10K" V 1550 6700 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 1480 6700 30  0001 C CNN
F 3 "" H 1550 6700 30  0000 C CNN
	1    1550 6700
	1    0    0    -1  
$EndComp
Text Label 1450 6850 2    60   ~ 0
GND
Wire Wire Line
	1450 6850 5550 6850
$Comp
L R R50
U 1 1 564B1D61
P 2100 6700
F 0 "R50" V 2180 6700 50  0000 C CNN
F 1 "10K" V 2100 6700 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2030 6700 30  0001 C CNN
F 3 "" H 2100 6700 30  0000 C CNN
	1    2100 6700
	1    0    0    -1  
$EndComp
$Comp
L R R51
U 1 1 564B1D68
P 2650 6700
F 0 "R51" V 2730 6700 50  0000 C CNN
F 1 "10K" V 2650 6700 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2580 6700 30  0001 C CNN
F 3 "" H 2650 6700 30  0000 C CNN
	1    2650 6700
	1    0    0    -1  
$EndComp
$Comp
L R R52
U 1 1 564B1D6F
P 3250 6700
F 0 "R52" V 3330 6700 50  0000 C CNN
F 1 "10K" V 3250 6700 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3180 6700 30  0001 C CNN
F 3 "" H 3250 6700 30  0000 C CNN
	1    3250 6700
	1    0    0    -1  
$EndComp
$Comp
L R R53
U 1 1 564B1D76
P 3800 6700
F 0 "R53" V 3880 6700 50  0000 C CNN
F 1 "10K" V 3800 6700 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3730 6700 30  0001 C CNN
F 3 "" H 3800 6700 30  0000 C CNN
	1    3800 6700
	1    0    0    -1  
$EndComp
$Comp
L R R54
U 1 1 564B1D7D
P 4400 6700
F 0 "R54" V 4480 6700 50  0000 C CNN
F 1 "10K" V 4400 6700 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 4330 6700 30  0001 C CNN
F 3 "" H 4400 6700 30  0000 C CNN
	1    4400 6700
	1    0    0    -1  
$EndComp
$Comp
L R R55
U 1 1 564B1D84
P 4950 6700
F 0 "R55" V 5030 6700 50  0000 C CNN
F 1 "10K" V 4950 6700 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 4880 6700 30  0001 C CNN
F 3 "" H 4950 6700 30  0000 C CNN
	1    4950 6700
	1    0    0    -1  
$EndComp
$Comp
L R R56
U 1 1 564B1D8B
P 5550 6700
F 0 "R56" V 5630 6700 50  0000 C CNN
F 1 "10K" V 5550 6700 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 5480 6700 30  0001 C CNN
F 3 "" H 5550 6700 30  0000 C CNN
	1    5550 6700
	1    0    0    -1  
$EndComp
Connection ~ 1550 6850
Connection ~ 2650 6850
Connection ~ 2100 6850
Connection ~ 3250 6850
Connection ~ 3800 6850
Connection ~ 4400 6850
Connection ~ 4950 6850
Text Label 1550 6550 2    60   ~ 0
PWREN_CB0
Text Label 2100 6450 2    60   ~ 0
PWREN_CB1
Wire Wire Line
	2100 6450 2100 6550
Text Label 2650 6550 2    60   ~ 0
PWREN_CB2
Text Label 3800 6550 2    60   ~ 0
PWREN_CB4
Text Label 4950 6550 2    60   ~ 0
PWREN_CB6
Text Label 3250 6450 2    60   ~ 0
PWREN_CB3
Wire Wire Line
	3250 6450 3250 6550
Text Label 4400 6450 2    60   ~ 0
PWREN_CB5
Wire Wire Line
	4400 6450 4400 6550
Text Label 5550 6450 2    60   ~ 0
PWREN_CB7
Wire Wire Line
	5550 6450 5550 6550
$Comp
L R R59
U 1 1 564C5438
P 4700 5550
F 0 "R59" V 4650 5750 50  0000 C CNN
F 1 "330" V 4700 5550 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 4630 5550 30  0001 C CNN
F 3 "" H 4700 5550 30  0000 C CNN
	1    4700 5550
	0    1    1    0   
$EndComp
$Comp
L R R60
U 1 1 564C560F
P 4700 5150
F 0 "R60" V 4650 5350 50  0000 C CNN
F 1 "330" V 4700 5150 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 4630 5150 30  0001 C CNN
F 3 "" H 4700 5150 30  0000 C CNN
	1    4700 5150
	0    1    1    0   
$EndComp
$Comp
L R R61
U 1 1 564C56AB
P 4700 5650
F 0 "R61" V 4650 5850 50  0000 C CNN
F 1 "330" V 4700 5650 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 4630 5650 30  0001 C CNN
F 3 "" H 4700 5650 30  0000 C CNN
	1    4700 5650
	0    1    1    0   
$EndComp
$Comp
L R R62
U 1 1 564C56B1
P 4700 5250
F 0 "R62" V 4650 5450 50  0000 C CNN
F 1 "330" V 4700 5250 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 4630 5250 30  0001 C CNN
F 3 "" H 4700 5250 30  0000 C CNN
	1    4700 5250
	0    1    1    0   
$EndComp
$Comp
L R R63
U 1 1 564C576B
P 4700 5750
F 0 "R63" V 4650 5950 50  0000 C CNN
F 1 "330" V 4700 5750 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 4630 5750 30  0001 C CNN
F 3 "" H 4700 5750 30  0000 C CNN
	1    4700 5750
	0    1    1    0   
$EndComp
$Comp
L R R64
U 1 1 564C5771
P 4700 5350
F 0 "R64" V 4650 5550 50  0000 C CNN
F 1 "330" V 4700 5350 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 4630 5350 30  0001 C CNN
F 3 "" H 4700 5350 30  0000 C CNN
	1    4700 5350
	0    1    1    0   
$EndComp
$Comp
L R R65
U 1 1 564C5777
P 4700 5850
F 0 "R65" V 4650 6050 50  0000 C CNN
F 1 "330" V 4700 5850 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 4630 5850 30  0001 C CNN
F 3 "" H 4700 5850 30  0000 C CNN
	1    4700 5850
	0    1    1    0   
$EndComp
$Comp
L R R66
U 1 1 564C577D
P 4700 5450
F 0 "R66" V 4650 5650 50  0000 C CNN
F 1 "330" V 4700 5450 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 4630 5450 30  0001 C CNN
F 3 "" H 4700 5450 30  0000 C CNN
	1    4700 5450
	0    1    1    0   
$EndComp
Wire Wire Line
	4850 5150 5100 5150
Wire Wire Line
	5100 5250 4850 5250
Wire Wire Line
	4850 5350 5100 5350
Wire Wire Line
	5100 5450 4850 5450
Wire Wire Line
	4850 5550 5100 5550
Wire Wire Line
	5100 5650 4850 5650
Wire Wire Line
	4850 5750 5100 5750
Wire Wire Line
	5100 5850 4850 5850
$Comp
L LED D5
U 1 1 564C5E37
P 4100 5550
F 0 "D5" H 4300 5600 50  0000 C CNN
F 1 "GREEN" H 4300 5500 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0603_LED" H 4100 5550 60  0001 C CNN
F 3 "" H 4100 5550 60  0000 C CNN
	1    4100 5550
	1    0    0    -1  
$EndComp
$Comp
L LED D1
U 1 1 564C6050
P 4100 5150
F 0 "D1" H 4300 5200 50  0000 C CNN
F 1 "GREEN" H 4300 5100 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0603_LED" H 4100 5150 60  0001 C CNN
F 3 "" H 4100 5150 60  0000 C CNN
	1    4100 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 5150 4300 5150
Wire Wire Line
	3350 5150 3900 5150
Wire Wire Line
	3350 5150 3350 5850
Wire Wire Line
	3350 5250 3500 5250
Text Label 3350 5150 2    60   ~ 0
GND
Wire Wire Line
	3900 5250 4550 5250
$Comp
L LED D6
U 1 1 564C666E
P 3700 5650
F 0 "D6" H 3900 5700 50  0000 C CNN
F 1 "GREEN" H 3900 5600 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0603_LED" H 3700 5650 60  0001 C CNN
F 3 "" H 3700 5650 60  0000 C CNN
	1    3700 5650
	1    0    0    -1  
$EndComp
$Comp
L LED D2
U 1 1 564C6674
P 3700 5250
F 0 "D2" H 3900 5300 50  0000 C CNN
F 1 "GREEN" H 3850 5200 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0603_LED" H 3700 5250 60  0001 C CNN
F 3 "" H 3700 5250 60  0000 C CNN
	1    3700 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 5350 4300 5350
Wire Wire Line
	3350 5350 3900 5350
Wire Wire Line
	3350 5450 3500 5450
Wire Wire Line
	3900 5450 4550 5450
$Comp
L LED D7
U 1 1 564C6732
P 4100 5750
F 0 "D7" H 4300 5800 50  0000 C CNN
F 1 "GREEN" H 4300 5700 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0603_LED" H 4100 5750 60  0001 C CNN
F 3 "" H 4100 5750 60  0000 C CNN
	1    4100 5750
	1    0    0    -1  
$EndComp
$Comp
L LED D3
U 1 1 564C6738
P 4100 5350
F 0 "D3" H 4300 5400 50  0000 C CNN
F 1 "GREEN" H 4300 5300 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0603_LED" H 4100 5350 60  0001 C CNN
F 3 "" H 4100 5350 60  0000 C CNN
	1    4100 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 5550 4300 5550
Wire Wire Line
	3350 5550 3900 5550
Wire Wire Line
	3350 5650 3500 5650
Wire Wire Line
	3900 5650 4550 5650
$Comp
L LED D8
U 1 1 564C67C0
P 3700 5850
F 0 "D8" H 3900 5900 50  0000 C CNN
F 1 "GREEN" H 3900 5800 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0603_LED" H 3700 5850 60  0001 C CNN
F 3 "" H 3700 5850 60  0000 C CNN
	1    3700 5850
	1    0    0    -1  
$EndComp
$Comp
L LED D4
U 1 1 564C67C6
P 3700 5450
F 0 "D4" H 3900 5500 50  0000 C CNN
F 1 "GREEN" H 3900 5400 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0603_LED" H 3700 5450 60  0001 C CNN
F 3 "" H 3700 5450 60  0000 C CNN
	1    3700 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 5750 4300 5750
Wire Wire Line
	3350 5750 3900 5750
Wire Wire Line
	3350 5850 3500 5850
Wire Wire Line
	3900 5850 4550 5850
Connection ~ 3350 5350
Connection ~ 3350 5250
Connection ~ 3350 5550
Connection ~ 3350 5450
Connection ~ 3350 5650
Connection ~ 3350 5750
Text Label 5100 5150 0    60   ~ 0
CB0_LED
Text Label 5100 5250 0    60   ~ 0
CB1_LED
Text Label 5100 5350 0    60   ~ 0
CB2_LED
Text Label 5100 5450 0    60   ~ 0
CB3_LED
Text Label 5100 5550 0    60   ~ 0
CB4_LED
Text Label 5100 5650 0    60   ~ 0
CB5_LED
Text Label 5100 5750 0    60   ~ 0
CB6_LED
Text Label 5100 5850 0    60   ~ 0
CB7_LED
Text Label 6200 4800 2    60   ~ 0
CB0_LED
Wire Wire Line
	6200 4800 6550 4800
Text Label 6200 4400 2    60   ~ 0
CB1_LED
Wire Wire Line
	6200 4500 6550 4500
Text Label 6200 4200 2    60   ~ 0
CB2_LED
Wire Wire Line
	6200 4400 6550 4400
Text Label 6200 3700 2    60   ~ 0
CB3_LED
Wire Wire Line
	6200 4000 6550 4000
Text Label 6200 3600 2    60   ~ 0
CB4_LED
Wire Wire Line
	6200 3900 6550 3900
Text Label 6200 3000 2    60   ~ 0
CB5_LED
Text Label 6200 2900 2    60   ~ 0
CB6_LED
Wire Wire Line
	6200 3500 6550 3500
Wire Wire Line
	6200 3600 6550 3600
Text Label 6200 2600 2    60   ~ 0
CB7_LED
Wire Wire Line
	6200 3100 6550 3100
Text Notes 8050 3950 0    60   ~ 0
TODO: Terminators for reset lines?
$EndSCHEMATC
