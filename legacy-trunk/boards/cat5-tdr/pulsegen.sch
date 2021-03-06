EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
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
LIBS:analog-azonenberg
LIBS:cat5-tdr-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 11
Title "TDR Pulse Shaping"
Date "Fri 16 Jan 2015"
Rev "$Rev: 1703 $"
Comp "Andrew Zonenberg"
Comment1 "Quad-Channel 1.25 GSa/s 12-bit Time-Domain Reflectometer"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 4150 1350 0    60   Input ~ 0
GND
Text HLabel 4150 1200 0    60   Input ~ 0
2V5
Text HLabel 4250 1600 0    60   Input ~ 0
CH1_PULSE_P
Text HLabel 4250 1700 0    60   Input ~ 0
CH1_PULSE_N
$Comp
L SY58603U U4
U 1 1 54A34BEB
P 4550 2000
F 0 "U4" H 4550 1900 60  0000 L CNN
F 1 "SY58603U" H 5300 1900 60  0000 R CNN
F 2 "azonenberg:DFN_8_0.5MM_2x2MM" H 5400 1450 60  0001 C CNN
F 3 "" H 5400 1450 60  0000 C CNN
	1    4550 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 1200 4350 1200
Wire Wire Line
	4150 1300 4350 1300
Text Label 4350 1200 2    60   ~ 0
2V5
Wire Wire Line
	4250 1600 4350 1600
Wire Wire Line
	4350 1700 4250 1700
Wire Wire Line
	4350 2000 4350 1900
Text Label 4350 1900 2    60   ~ 0
CH1_VT
$Comp
L C C34
U 1 1 54A34BFB
P 4150 2200
F 0 "C34" H 4200 2300 50  0000 L CNN
F 1 "10 nF" H 4200 2100 50  0000 L CNN
F 2 "azonenberg:EIA_0402_CAP_NOSILK" H 4150 2200 60  0001 C CNN
F 3 "" H 4150 2200 60  0000 C CNN
	1    4150 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 2000 3800 2000
Wire Wire Line
	4150 2000 4350 2000
Text Label 3450 2400 2    60   ~ 0
GND
Text Label 3450 2000 2    60   ~ 0
2V5
$Comp
L C C26
U 1 1 54A34C05
P 3450 2200
F 0 "C26" H 3500 2300 50  0000 L CNN
F 1 "0.1 uF" H 3500 2100 50  0000 L CNN
F 2 "azonenberg:EIA_0402_CAP_NOSILK" H 3450 2200 60  0001 C CNN
F 3 "" H 3450 2200 60  0000 C CNN
	1    3450 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 2400 4150 2400
$Comp
L C C30
U 1 1 54A34C0E
P 3800 2200
F 0 "C30" H 3850 2300 50  0000 L CNN
F 1 "10 nF" H 3850 2100 50  0000 L CNN
F 2 "azonenberg:EIA_0402_CAP_NOSILK" H 3800 2200 60  0001 C CNN
F 3 "" H 3800 2200 60  0000 C CNN
	1    3800 2200
	1    0    0    -1  
$EndComp
Connection ~ 3800 2400
Wire Wire Line
	5750 1600 5500 1600
Wire Wire Line
	5750 1700 5500 1700
Text HLabel 4250 3300 0    60   Input ~ 0
CH2_PULSE_P
Text HLabel 4250 3400 0    60   Input ~ 0
CH2_PULSE_N
$Comp
L SY58603U U5
U 1 1 54A34C1D
P 4550 3700
F 0 "U5" H 4550 3600 60  0000 L CNN
F 1 "SY58603U" H 5300 3600 60  0000 R CNN
F 2 "azonenberg:DFN_8_0.5MM_2x2MM" H 5400 3150 60  0001 C CNN
F 3 "" H 5400 3150 60  0000 C CNN
	1    4550 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 2900 4350 2900
Wire Wire Line
	4150 3000 4350 3000
Text Label 4150 2900 2    60   ~ 0
2V5
Wire Wire Line
	4250 3300 4350 3300
Wire Wire Line
	4350 3400 4250 3400
Wire Wire Line
	4350 3700 4350 3600
Text Label 4350 3600 2    60   ~ 0
CH2_VT
$Comp
L C C35
U 1 1 54A34C2D
P 4150 3900
F 0 "C35" H 4200 4000 50  0000 L CNN
F 1 "10 nF" H 4200 3800 50  0000 L CNN
F 2 "azonenberg:EIA_0402_CAP_NOSILK" H 4150 3900 60  0001 C CNN
F 3 "" H 4150 3900 60  0000 C CNN
	1    4150 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 3700 3800 3700
Wire Wire Line
	4150 3700 4350 3700
Text Label 3450 4100 2    60   ~ 0
GND
Text Label 3450 3700 2    60   ~ 0
2V5
$Comp
L C C27
U 1 1 54A34C37
P 3450 3900
F 0 "C27" H 3500 4000 50  0000 L CNN
F 1 "0.1 uF" H 3500 3800 50  0000 L CNN
F 2 "azonenberg:EIA_0402_CAP_NOSILK" H 3450 3900 60  0001 C CNN
F 3 "" H 3450 3900 60  0000 C CNN
	1    3450 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 4100 4150 4100
$Comp
L C C31
U 1 1 54A34C40
P 3800 3900
F 0 "C31" H 3850 4000 50  0000 L CNN
F 1 "10 nF" H 3850 3800 50  0000 L CNN
F 2 "azonenberg:EIA_0402_CAP_NOSILK" H 3800 3900 60  0001 C CNN
F 3 "" H 3800 3900 60  0000 C CNN
	1    3800 3900
	1    0    0    -1  
$EndComp
Connection ~ 3800 4100
Wire Wire Line
	5750 3300 5500 3300
Wire Wire Line
	5750 3400 5500 3400
Text HLabel 4250 5000 0    60   Input ~ 0
CH3_PULSE_P
Text HLabel 4250 5100 0    60   Input ~ 0
CH3_PULSE_N
$Comp
L SY58603U U6
U 1 1 54A34C4F
P 4550 5400
F 0 "U6" H 4550 5300 60  0000 L CNN
F 1 "SY58603U" H 5300 5300 60  0000 R CNN
F 2 "azonenberg:DFN_8_0.5MM_2x2MM" H 5400 4850 60  0001 C CNN
F 3 "" H 5400 4850 60  0000 C CNN
	1    4550 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 4600 4350 4600
Text Label 4150 4600 2    60   ~ 0
2V5
Wire Wire Line
	4250 5000 4350 5000
Wire Wire Line
	4350 5100 4250 5100
Wire Wire Line
	4350 5400 4350 5300
Text Label 4350 5300 2    60   ~ 0
CH3_VT
$Comp
L C C36
U 1 1 54A34C5F
P 4150 5600
F 0 "C36" H 4200 5700 50  0000 L CNN
F 1 "10 nF" H 4200 5500 50  0000 L CNN
F 2 "azonenberg:EIA_0402_CAP_NOSILK" H 4150 5600 60  0001 C CNN
F 3 "" H 4150 5600 60  0000 C CNN
	1    4150 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 5400 3800 5400
Wire Wire Line
	4150 5400 4350 5400
Text Label 3450 5800 2    60   ~ 0
GND
Text Label 3450 5400 2    60   ~ 0
2V5
$Comp
L C C28
U 1 1 54A34C69
P 3450 5600
F 0 "C28" H 3500 5700 50  0000 L CNN
F 1 "0.1 uF" H 3500 5500 50  0000 L CNN
F 2 "azonenberg:EIA_0402_CAP_NOSILK" H 3450 5600 60  0001 C CNN
F 3 "" H 3450 5600 60  0000 C CNN
	1    3450 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 5800 4150 5800
$Comp
L C C32
U 1 1 54A34C72
P 3800 5600
F 0 "C32" H 3850 5700 50  0000 L CNN
F 1 "10 nF" H 3850 5500 50  0000 L CNN
F 2 "azonenberg:EIA_0402_CAP_NOSILK" H 3800 5600 60  0001 C CNN
F 3 "" H 3800 5600 60  0000 C CNN
	1    3800 5600
	1    0    0    -1  
$EndComp
Connection ~ 3800 5800
Wire Wire Line
	5750 5000 5500 5000
Wire Wire Line
	5750 5100 5500 5100
Text HLabel 4250 6700 0    60   Input ~ 0
CH4_PULSE_P
Text HLabel 4250 6800 0    60   Input ~ 0
CH4_PULSE_N
$Comp
L SY58603U U7
U 1 1 54A34C81
P 4550 7100
F 0 "U7" H 4550 7000 60  0000 L CNN
F 1 "SY58603U" H 5300 7000 60  0000 R CNN
F 2 "azonenberg:DFN_8_0.5MM_2x2MM" H 5400 6550 60  0001 C CNN
F 3 "" H 5400 6550 60  0000 C CNN
	1    4550 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 6300 4350 6300
Text Label 4150 6300 2    60   ~ 0
2V5
Wire Wire Line
	4250 6700 4350 6700
Wire Wire Line
	4350 6800 4250 6800
Wire Wire Line
	4350 7100 4350 7000
Text Label 4350 7000 2    60   ~ 0
CH4_VT
$Comp
L C C37
U 1 1 54A34C91
P 4150 7300
F 0 "C37" H 4200 7400 50  0000 L CNN
F 1 "10 nF" H 4200 7200 50  0000 L CNN
F 2 "azonenberg:EIA_0402_CAP_NOSILK" H 4150 7300 60  0001 C CNN
F 3 "" H 4150 7300 60  0000 C CNN
	1    4150 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 7100 3800 7100
Wire Wire Line
	4150 7100 4350 7100
Text Label 3450 7500 2    60   ~ 0
GND
Text Label 3450 7100 2    60   ~ 0
2V5
$Comp
L C C29
U 1 1 54A34C9B
P 3450 7300
F 0 "C29" H 3500 7400 50  0000 L CNN
F 1 "0.1 uF" H 3500 7200 50  0000 L CNN
F 2 "azonenberg:EIA_0402_CAP_NOSILK" H 3450 7300 60  0001 C CNN
F 3 "" H 3450 7300 60  0000 C CNN
	1    3450 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 7500 4150 7500
$Comp
L C C33
U 1 1 54A34CA4
P 3800 7300
F 0 "C33" H 3850 7400 50  0000 L CNN
F 1 "10 nF" H 3850 7200 50  0000 L CNN
F 2 "azonenberg:EIA_0402_CAP_NOSILK" H 3800 7300 60  0001 C CNN
F 3 "" H 3800 7300 60  0000 C CNN
	1    3800 7300
	1    0    0    -1  
$EndComp
Connection ~ 3800 7500
Wire Wire Line
	5750 6700 5500 6700
Wire Wire Line
	5750 6800 5500 6800
Text HLabel 5750 1600 2    60   Output ~ 0
CAT5_CH1_P
Text HLabel 5750 1700 2    60   Output ~ 0
CAT5_CH1_N
Text HLabel 5750 3300 2    60   Output ~ 0
CAT5_CH2_P
Text HLabel 5750 3400 2    60   Output ~ 0
CAT5_CH2_N
Text HLabel 5750 5000 2    60   Output ~ 0
CAT5_CH3_P
Text HLabel 5750 5100 2    60   Output ~ 0
CAT5_CH3_N
Text HLabel 5750 6700 2    60   Output ~ 0
CAT5_CH4_P
Text HLabel 5750 6800 2    60   Output ~ 0
CAT5_CH4_N
$Comp
L C C172
U 1 1 54A9DA3B
P 2450 4600
F 0 "C172" H 2500 4700 50  0000 L CNN
F 1 "4.7 uF" H 2500 4500 50  0000 L CNN
F 2 "azonenberg:EIA_0603_CAP_NOSILK" H 2450 4600 60  0001 C CNN
F 3 "" H 2450 4600 60  0000 C CNN
	1    2450 4600
	1    0    0    -1  
$EndComp
$Comp
L C C171
U 1 1 54A9DAA0
P 2100 4600
F 0 "C171" H 2150 4700 50  0000 L CNN
F 1 "4.7 uF" H 2150 4500 50  0000 L CNN
F 2 "azonenberg:EIA_0603_CAP_NOSILK" H 2100 4600 60  0001 C CNN
F 3 "" H 2100 4600 60  0000 C CNN
	1    2100 4600
	1    0    0    -1  
$EndComp
Text Label 2100 4400 2    60   ~ 0
2V5
Text Label 2100 4800 2    60   ~ 0
GND
Wire Wire Line
	2100 4800 2450 4800
Wire Wire Line
	2450 4400 2100 4400
Wire Wire Line
	4150 4700 4350 4700
Wire Wire Line
	4150 6400 4350 6400
Wire Wire Line
	3200 6500 4350 6500
Wire Wire Line
	4150 6500 4150 6400
Wire Wire Line
	3200 4800 4350 4800
Wire Wire Line
	4150 4800 4150 4700
Wire Wire Line
	3200 3100 4350 3100
Wire Wire Line
	4150 3100 4150 3000
Wire Wire Line
	3200 1400 4350 1400
Wire Wire Line
	4150 1400 4150 1300
Wire Wire Line
	3200 1400 3200 6500
Connection ~ 4150 3100
Connection ~ 4150 1400
Connection ~ 4150 4800
Connection ~ 3200 3100
Connection ~ 4150 6500
Connection ~ 3200 4800
$Comp
L C C178
U 1 1 54B52261
P 7750 2050
F 0 "C178" H 7800 2150 50  0000 L CNN
F 1 "0.1 uF" H 7800 1950 50  0000 L CNN
F 2 "azonenberg:EIA_0402_CAP_NOSILK" H 7750 2050 60  0001 C CNN
F 3 "" H 7750 2050 60  0000 C CNN
	1    7750 2050
	1    0    0    -1  
$EndComp
$Comp
L C C179
U 1 1 54B52301
P 8100 2050
F 0 "C179" H 8150 2150 50  0000 L CNN
F 1 "0.1 uF" H 8150 1950 50  0000 L CNN
F 2 "azonenberg:EIA_0402_CAP_NOSILK" H 8100 2050 60  0001 C CNN
F 3 "" H 8100 2050 60  0000 C CNN
	1    8100 2050
	1    0    0    -1  
$EndComp
$Comp
L C C180
U 1 1 54B52349
P 8450 2050
F 0 "C180" H 8500 2150 50  0000 L CNN
F 1 "0.1 uF" H 8500 1950 50  0000 L CNN
F 2 "azonenberg:EIA_0402_CAP_NOSILK" H 8450 2050 60  0001 C CNN
F 3 "" H 8450 2050 60  0000 C CNN
	1    8450 2050
	1    0    0    -1  
$EndComp
$Comp
L C C181
U 1 1 54B52384
P 8800 2050
F 0 "C181" H 8850 2150 50  0000 L CNN
F 1 "0.1 uF" H 8850 1950 50  0000 L CNN
F 2 "azonenberg:EIA_0402_CAP_NOSILK" H 8800 2050 60  0001 C CNN
F 3 "" H 8800 2050 60  0000 C CNN
	1    8800 2050
	1    0    0    -1  
$EndComp
$Comp
L C C182
U 1 1 54B523B8
P 9150 2050
F 0 "C182" H 9200 2150 50  0000 L CNN
F 1 "0.1 uF" H 9200 1950 50  0000 L CNN
F 2 "azonenberg:EIA_0402_CAP_NOSILK" H 9150 2050 60  0001 C CNN
F 3 "" H 9150 2050 60  0000 C CNN
	1    9150 2050
	1    0    0    -1  
$EndComp
Text HLabel 7750 1850 0    60   Input ~ 0
1V8
Text Label 7750 2250 2    60   ~ 0
GND
Wire Wire Line
	7750 1850 9150 1850
Connection ~ 8100 1850
Connection ~ 8450 1850
Connection ~ 8800 1850
Wire Wire Line
	7750 2250 9150 2250
Connection ~ 8800 2250
Connection ~ 8450 2250
Connection ~ 8100 2250
Text Notes 7750 2350 0    60   ~ 0
Layer-change capacitors
$EndSCHEMATC
