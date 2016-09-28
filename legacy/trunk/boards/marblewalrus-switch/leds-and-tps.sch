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
LIBS:conn
LIBS:device
LIBS:marblewalrus-switch-cache
EELAYER 25 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 13 13
Title "MARBLEWALRUS Ethernet Switch"
Date "2016-02-14"
Rev "$Rev: 2303 $"
Comp "Andrew Zonenberg"
Comment1 "LEDs and test points"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 5250 3800 0    60   Input ~ 0
GND
$Comp
L CONN_01X01 P1
U 1 1 56CB061C
P 5800 3800
F 0 "P1" H 5800 3900 50  0000 C CNN
F 1 "CLIP" V 5900 3800 50  0000 C CNN
F 2 "azonenberg_pcb:TESTPOINT_SMT_KEYSTONE_5016" H 5800 3800 60  0001 C CNN
F 3 "" H 5800 3800 60  0000 C CNN
	1    5800 3800
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X01 P2
U 1 1 56CB067B
P 5800 4050
F 0 "P2" H 5800 4150 50  0000 C CNN
F 1 "CLIP" V 5900 4050 50  0000 C CNN
F 2 "azonenberg_pcb:TESTPOINT_SMT_KEYSTONE_5016" H 5800 4050 60  0001 C CNN
F 3 "" H 5800 4050 60  0000 C CNN
	1    5800 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 3800 5600 3800
Connection ~ 5500 3800
$Comp
L CONN_01X01 P3
U 1 1 56CB06B0
P 5800 4300
F 0 "P3" H 5800 4400 50  0000 C CNN
F 1 "CLIP" V 5900 4300 50  0000 C CNN
F 2 "azonenberg_pcb:TESTPOINT_SMT_KEYSTONE_5016" H 5800 4300 60  0001 C CNN
F 3 "" H 5800 4300 60  0000 C CNN
	1    5800 4300
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X01 P4
U 1 1 56CB0725
P 5800 4550
F 0 "P4" H 5800 4650 50  0000 C CNN
F 1 "CLIP" V 5900 4550 50  0000 C CNN
F 2 "azonenberg_pcb:TESTPOINT_SMT_KEYSTONE_5016" H 5800 4550 60  0001 C CNN
F 3 "" H 5800 4550 60  0000 C CNN
	1    5800 4550
	1    0    0    -1  
$EndComp
Text HLabel 5600 4900 0    60   Input ~ 0
1V0
$Comp
L CONN_01X01 P5
U 1 1 56CB10A1
P 5800 4900
F 0 "P5" H 5800 5000 50  0000 C CNN
F 1 "PAD" V 5900 4900 50  0000 C CNN
F 2 "azonenberg_pcb:TESTPOINT_SMT_0.5MM" H 5800 4900 60  0001 C CNN
F 3 "" H 5800 4900 60  0000 C CNN
	1    5800 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 3800 5500 4550
Wire Wire Line
	5500 4050 5600 4050
Wire Wire Line
	5500 4300 5600 4300
Connection ~ 5500 4050
Wire Wire Line
	5500 4550 5600 4550
Connection ~ 5500 4300
Text HLabel 5600 5150 0    60   Input ~ 0
1V2
$Comp
L CONN_01X01 P6
U 1 1 56CB1252
P 5800 5150
F 0 "P6" H 5800 5250 50  0000 C CNN
F 1 "PAD" V 5900 5150 50  0000 C CNN
F 2 "azonenberg_pcb:TESTPOINT_SMT_0.5MM" H 5800 5150 60  0001 C CNN
F 3 "" H 5800 5150 60  0000 C CNN
	1    5800 5150
	1    0    0    -1  
$EndComp
Text HLabel 5600 5400 0    60   Input ~ 0
1V5
$Comp
L CONN_01X01 P7
U 1 1 56CB12C2
P 5800 5400
F 0 "P7" H 5800 5500 50  0000 C CNN
F 1 "PAD" V 5900 5400 50  0000 C CNN
F 2 "azonenberg_pcb:TESTPOINT_SMT_0.5MM" H 5800 5400 60  0001 C CNN
F 3 "" H 5800 5400 60  0000 C CNN
	1    5800 5400
	1    0    0    -1  
$EndComp
Text HLabel 5600 5650 0    60   Input ~ 0
1V8
$Comp
L CONN_01X01 P8
U 1 1 56CB12F1
P 5800 5650
F 0 "P8" H 5800 5750 50  0000 C CNN
F 1 "PAD" V 5900 5650 50  0000 C CNN
F 2 "azonenberg_pcb:TESTPOINT_SMT_0.5MM" H 5800 5650 60  0001 C CNN
F 3 "" H 5800 5650 60  0000 C CNN
	1    5800 5650
	1    0    0    -1  
$EndComp
Text HLabel 5600 5900 0    60   Input ~ 0
2V5
$Comp
L CONN_01X01 P9
U 1 1 56CB1327
P 5800 5900
F 0 "P9" H 5800 6000 50  0000 C CNN
F 1 "PAD" V 5900 5900 50  0000 C CNN
F 2 "azonenberg_pcb:TESTPOINT_SMT_0.5MM" H 5800 5900 60  0001 C CNN
F 3 "" H 5800 5900 60  0000 C CNN
	1    5800 5900
	1    0    0    -1  
$EndComp
Text HLabel 5600 6150 0    60   Input ~ 0
3V3
$Comp
L CONN_01X01 P10
U 1 1 56CB1356
P 5800 6150
F 0 "P10" H 5800 6250 50  0000 C CNN
F 1 "PAD" V 5900 6150 50  0000 C CNN
F 2 "azonenberg_pcb:TESTPOINT_SMT_0.5MM" H 5800 6150 60  0001 C CNN
F 3 "" H 5800 6150 60  0000 C CNN
	1    5800 6150
	1    0    0    -1  
$EndComp
Text HLabel 5600 6400 0    60   Input ~ 0
RAM_VREF
$Comp
L CONN_01X01 P11
U 1 1 56CB13AC
P 5800 6400
F 0 "P11" H 5800 6500 50  0000 C CNN
F 1 "PAD" V 5900 6400 50  0000 C CNN
F 2 "azonenberg_pcb:TESTPOINT_SMT_0.5MM" H 5800 6400 60  0001 C CNN
F 3 "" H 5800 6400 60  0000 C CNN
	1    5800 6400
	1    0    0    -1  
$EndComp
Text HLabel 5600 6650 0    60   Input ~ 0
RAM_VTT
$Comp
L CONN_01X01 P12
U 1 1 56CB141C
P 5800 6650
F 0 "P12" H 5800 6750 50  0000 C CNN
F 1 "PAD" V 5900 6650 50  0000 C CNN
F 2 "azonenberg_pcb:TESTPOINT_SMT_0.5MM" H 5800 6650 60  0001 C CNN
F 3 "" H 5800 6650 60  0000 C CNN
	1    5800 6650
	1    0    0    -1  
$EndComp
Text HLabel 5600 6900 0    60   Input ~ 0
1V8_SB
$Comp
L CONN_01X01 P13
U 1 1 56CB1466
P 5800 6900
F 0 "P13" H 5800 7000 50  0000 C CNN
F 1 "PAD" V 5900 6900 50  0000 C CNN
F 2 "azonenberg_pcb:TESTPOINT_SMT_0.5MM" H 5800 6900 60  0001 C CNN
F 3 "" H 5800 6900 60  0000 C CNN
	1    5800 6900
	1    0    0    -1  
$EndComp
Text HLabel 5600 7150 0    60   Input ~ 0
2V5_SB
$Comp
L CONN_01X01 P14
U 1 1 56CB14BC
P 5800 7150
F 0 "P14" H 5800 7250 50  0000 C CNN
F 1 "PAD" V 5900 7150 50  0000 C CNN
F 2 "azonenberg_pcb:TESTPOINT_SMT_0.5MM" H 5800 7150 60  0001 C CNN
F 3 "" H 5800 7150 60  0000 C CNN
	1    5800 7150
	1    0    0    -1  
$EndComp
Text HLabel 5600 7400 0    60   Input ~ 0
5V0_SB
$Comp
L CONN_01X01 P15
U 1 1 56CB150E
P 5800 7400
F 0 "P15" H 5800 7500 50  0000 C CNN
F 1 "PAD" V 5900 7400 50  0000 C CNN
F 2 "azonenberg_pcb:TESTPOINT_SMT_0.5MM" H 5800 7400 60  0001 C CNN
F 3 "" H 5800 7400 60  0000 C CNN
	1    5800 7400
	1    0    0    -1  
$EndComp
Text HLabel 5600 7650 0    60   Input ~ 0
12V0
$Comp
L CONN_01X01 P16
U 1 1 56CB15F6
P 5800 7650
F 0 "P16" H 5800 7750 50  0000 C CNN
F 1 "PAD" V 5900 7650 50  0000 C CNN
F 2 "azonenberg_pcb:TESTPOINT_SMT_0.5MM" H 5800 7650 60  0001 C CNN
F 3 "" H 5800 7650 60  0000 C CNN
	1    5800 7650
	1    0    0    -1  
$EndComp
Text HLabel 8950 3500 0    60   Input ~ 0
1V0_LED
$Comp
L CONN_01X01 P17
U 1 1 56CCF171
P 5800 7900
F 0 "P17" H 5800 8000 50  0000 C CNN
F 1 "PAD" V 5900 7900 50  0000 C CNN
F 2 "azonenberg_pcb:TESTPOINT_SMT_0.5MM" H 5800 7900 60  0001 C CNN
F 3 "" H 5800 7900 60  0000 C CNN
	1    5800 7900
	1    0    0    -1  
$EndComp
Text HLabel 5600 7900 0    60   Input ~ 0
1V25_REF
Text HLabel 8950 4100 0    60   Input ~ 0
1V2_LED
Text HLabel 8950 4700 0    60   Input ~ 0
1V5_LED
Text HLabel 8950 5300 0    60   Input ~ 0
1V8_LED
Text HLabel 8950 5900 0    60   Input ~ 0
2V5_LED
Text HLabel 8950 6500 0    60   Input ~ 0
3V3_LED
Text HLabel 8950 7700 0    60   Input ~ 0
FAULT_LED
Text HLabel 8950 7100 0    60   Input ~ 0
FPGA_DONE
Text HLabel 8950 2900 0    60   Input ~ 0
12V0_LED
$Comp
L R R186
U 1 1 56CEA533
P 10150 2700
F 0 "R186" V 10100 2900 50  0000 C CNN
F 1 "560" V 10150 2700 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 10080 2700 30  0001 C CNN
F 3 "" H 10150 2700 30  0000 C CNN
	1    10150 2700
	0    1    1    0   
$EndComp
$Comp
L D D9
U 1 1 56CEA74B
P 9600 2700
F 0 "D9" H 9600 2800 50  0000 C CNN
F 1 "GREEN" H 9600 2600 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0603_LED" H 9600 2700 60  0001 C CNN
F 3 "" H 9600 2700 60  0000 C CNN
	1    9600 2700
	1    0    0    -1  
$EndComp
$Comp
L SSM6N58NU_DUAL_NMOS Q5
U 1 1 56CEA7F1
P 9150 2900
F 0 "Q5" H 9160 3070 60  0000 R CNN
F 1 "SSM6N58NU" H 9100 2750 60  0000 R CNN
F 2 "azonenberg_pcb:DFN_6_0.65MM_2x2MM_GDS" H 9150 2900 60  0001 C CNN
F 3 "" H 9150 2900 60  0000 C CNN
	1    9150 2900
	1    0    0    -1  
$EndComp
$Comp
L SSM6N58NU_DUAL_NMOS Q5
U 2 1 56CEA9AF
P 9150 3500
F 0 "Q5" H 9160 3670 60  0000 R CNN
F 1 "SSM6N58NU" H 9100 3350 60  0000 R CNN
F 2 "azonenberg_pcb:DFN_6_0.65MM_2x2MM_GDS" H 9150 3500 60  0001 C CNN
F 3 "" H 9150 3500 60  0000 C CNN
	2    9150 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 3100 8200 3100
Wire Wire Line
	8200 1800 8200 8500
Wire Wire Line
	8200 3700 9250 3700
$Comp
L SSM6N58NU_DUAL_NMOS Q6
U 1 1 56CEAC87
P 9150 4100
F 0 "Q6" H 9160 4270 60  0000 R CNN
F 1 "SSM6N58NU" H 9100 3950 60  0000 R CNN
F 2 "azonenberg_pcb:DFN_6_0.65MM_2x2MM_GDS" H 9150 4100 60  0001 C CNN
F 3 "" H 9150 4100 60  0000 C CNN
	1    9150 4100
	1    0    0    -1  
$EndComp
$Comp
L SSM6N58NU_DUAL_NMOS Q6
U 2 1 56CEAC8D
P 9150 4700
F 0 "Q6" H 9160 4870 60  0000 R CNN
F 1 "SSM6N58NU" H 9100 4550 60  0000 R CNN
F 2 "azonenberg_pcb:DFN_6_0.65MM_2x2MM_GDS" H 9150 4700 60  0001 C CNN
F 3 "" H 9150 4700 60  0000 C CNN
	2    9150 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 4300 9250 4300
Wire Wire Line
	8200 4900 9250 4900
$Comp
L SSM6N58NU_DUAL_NMOS Q7
U 1 1 56CEAE5C
P 9150 5300
F 0 "Q7" H 9160 5470 60  0000 R CNN
F 1 "SSM6N58NU" H 9100 5150 60  0000 R CNN
F 2 "azonenberg_pcb:DFN_6_0.65MM_2x2MM_GDS" H 9150 5300 60  0001 C CNN
F 3 "" H 9150 5300 60  0000 C CNN
	1    9150 5300
	1    0    0    -1  
$EndComp
$Comp
L SSM6N58NU_DUAL_NMOS Q7
U 2 1 56CEAE62
P 9150 5900
F 0 "Q7" H 9160 6070 60  0000 R CNN
F 1 "SSM6N58NU" H 9100 5750 60  0000 R CNN
F 2 "azonenberg_pcb:DFN_6_0.65MM_2x2MM_GDS" H 9150 5900 60  0001 C CNN
F 3 "" H 9150 5900 60  0000 C CNN
	2    9150 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 5500 9250 5500
Wire Wire Line
	8200 6100 9250 6100
$Comp
L SSM6N58NU_DUAL_NMOS Q8
U 1 1 56CEAE6D
P 9150 6500
F 0 "Q8" H 9160 6670 60  0000 R CNN
F 1 "SSM6N58NU" H 9100 6350 60  0000 R CNN
F 2 "azonenberg_pcb:DFN_6_0.65MM_2x2MM_GDS" H 9150 6500 60  0001 C CNN
F 3 "" H 9150 6500 60  0000 C CNN
	1    9150 6500
	1    0    0    -1  
$EndComp
$Comp
L SSM6N58NU_DUAL_NMOS Q8
U 2 1 56CEAE73
P 9150 7100
F 0 "Q8" H 9160 7270 60  0000 R CNN
F 1 "SSM6N58NU" H 9100 6950 60  0000 R CNN
F 2 "azonenberg_pcb:DFN_6_0.65MM_2x2MM_GDS" H 9150 7100 60  0001 C CNN
F 3 "" H 9150 7100 60  0000 C CNN
	2    9150 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 6700 9250 6700
Wire Wire Line
	8200 7300 9250 7300
Connection ~ 8200 4300
Connection ~ 8200 3700
Connection ~ 8200 5500
Connection ~ 8200 4900
Connection ~ 8200 6700
Connection ~ 8200 6100
$Comp
L SSM6N58NU_DUAL_NMOS Q9
U 1 1 56CEB315
P 9150 8300
F 0 "Q9" H 9160 8470 60  0000 R CNN
F 1 "SSM6N58NU" H 9100 8150 60  0000 R CNN
F 2 "azonenberg_pcb:DFN_6_0.65MM_2x2MM_GDS" H 9150 8300 60  0001 C CNN
F 3 "" H 9150 8300 60  0000 C CNN
	1    9150 8300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 7900 9250 7900
Connection ~ 8200 7300
Wire Wire Line
	9450 2700 9250 2700
$Comp
L D D10
U 1 1 56CEB833
P 9600 3300
F 0 "D10" H 9600 3400 50  0000 C CNN
F 1 "GREEN" H 9600 3200 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0603_LED" H 9600 3300 60  0001 C CNN
F 3 "" H 9600 3300 60  0000 C CNN
	1    9600 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 3300 9250 3300
$Comp
L D D11
U 1 1 56CEB929
P 9600 3900
F 0 "D11" H 9600 4000 50  0000 C CNN
F 1 "GREEN" H 9600 3800 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0603_LED" H 9600 3900 60  0001 C CNN
F 3 "" H 9600 3900 60  0000 C CNN
	1    9600 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 3900 9250 3900
$Comp
L D D12
U 1 1 56CEB930
P 9600 4500
F 0 "D12" H 9600 4600 50  0000 C CNN
F 1 "GREEN" H 9600 4400 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0603_LED" H 9600 4500 60  0001 C CNN
F 3 "" H 9600 4500 60  0000 C CNN
	1    9600 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 4500 9250 4500
$Comp
L D D13
U 1 1 56CEBC0A
P 9600 5100
F 0 "D13" H 9600 5200 50  0000 C CNN
F 1 "GREEN" H 9600 5000 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0603_LED" H 9600 5100 60  0001 C CNN
F 3 "" H 9600 5100 60  0000 C CNN
	1    9600 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 5100 9250 5100
$Comp
L D D14
U 1 1 56CEBC11
P 9600 5700
F 0 "D14" H 9600 5800 50  0000 C CNN
F 1 "GREEN" H 9600 5600 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0603_LED" H 9600 5700 60  0001 C CNN
F 3 "" H 9600 5700 60  0000 C CNN
	1    9600 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 5700 9250 5700
$Comp
L D D15
U 1 1 56CEBC18
P 9600 6300
F 0 "D15" H 9600 6400 50  0000 C CNN
F 1 "GREEN" H 9600 6200 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0603_LED" H 9600 6300 60  0001 C CNN
F 3 "" H 9600 6300 60  0000 C CNN
	1    9600 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 6300 9250 6300
$Comp
L D D16
U 1 1 56CEBC1F
P 9600 6900
F 0 "D16" H 9600 7000 50  0000 C CNN
F 1 "GREEN" H 9600 6800 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0603_LED" H 9600 6900 60  0001 C CNN
F 3 "" H 9600 6900 60  0000 C CNN
	1    9600 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 6900 9250 6900
$Comp
L D D17
U 1 1 56CEBCD6
P 9600 7500
F 0 "D17" H 9600 7600 50  0000 C CNN
F 1 "RED" H 9600 7400 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0603_LED" H 9600 7500 60  0001 C CNN
F 3 "" H 9600 7500 60  0000 C CNN
	1    9600 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 7500 9250 7500
Wire Wire Line
	10000 2700 9750 2700
$Comp
L R R187
U 1 1 56CEC0D9
P 10150 3300
F 0 "R187" V 10100 3500 50  0000 C CNN
F 1 "560" V 10150 3300 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 10080 3300 30  0001 C CNN
F 3 "" H 10150 3300 30  0000 C CNN
	1    10150 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	10000 3300 9750 3300
$Comp
L R R188
U 1 1 56CEC18C
P 10150 3900
F 0 "R188" V 10100 4100 50  0000 C CNN
F 1 "560" V 10150 3900 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 10080 3900 30  0001 C CNN
F 3 "" H 10150 3900 30  0000 C CNN
	1    10150 3900
	0    1    1    0   
$EndComp
Wire Wire Line
	10000 3900 9750 3900
$Comp
L R R189
U 1 1 56CEC193
P 10150 4500
F 0 "R189" V 10100 4700 50  0000 C CNN
F 1 "560" V 10150 4500 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 10080 4500 30  0001 C CNN
F 3 "" H 10150 4500 30  0000 C CNN
	1    10150 4500
	0    1    1    0   
$EndComp
Wire Wire Line
	10000 4500 9750 4500
$Comp
L R R190
U 1 1 56CEC372
P 10150 5100
F 0 "R190" V 10100 5300 50  0000 C CNN
F 1 "560" V 10150 5100 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 10080 5100 30  0001 C CNN
F 3 "" H 10150 5100 30  0000 C CNN
	1    10150 5100
	0    1    1    0   
$EndComp
Wire Wire Line
	10000 5100 9750 5100
$Comp
L R R191
U 1 1 56CEC379
P 10150 5700
F 0 "R191" V 10100 5900 50  0000 C CNN
F 1 "560" V 10150 5700 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 10080 5700 30  0001 C CNN
F 3 "" H 10150 5700 30  0000 C CNN
	1    10150 5700
	0    1    1    0   
$EndComp
Wire Wire Line
	10000 5700 9750 5700
$Comp
L R R192
U 1 1 56CEC380
P 10150 6300
F 0 "R192" V 10100 6500 50  0000 C CNN
F 1 "560" V 10150 6300 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 10080 6300 30  0001 C CNN
F 3 "" H 10150 6300 30  0000 C CNN
	1    10150 6300
	0    1    1    0   
$EndComp
Wire Wire Line
	10000 6300 9750 6300
$Comp
L R R193
U 1 1 56CEC387
P 10150 6900
F 0 "R193" V 10100 7100 50  0000 C CNN
F 1 "560" V 10150 6900 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 10080 6900 30  0001 C CNN
F 3 "" H 10150 6900 30  0000 C CNN
	1    10150 6900
	0    1    1    0   
$EndComp
Wire Wire Line
	10000 6900 9750 6900
$Comp
L R R194
U 1 1 56CEC48B
P 10150 7500
F 0 "R194" V 10100 7700 50  0000 C CNN
F 1 "560" V 10150 7500 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 10080 7500 30  0001 C CNN
F 3 "" H 10150 7500 30  0000 C CNN
	1    10150 7500
	0    1    1    0   
$EndComp
Wire Wire Line
	10000 7500 9750 7500
Wire Wire Line
	10300 2700 10550 2700
Wire Wire Line
	10550 1550 10550 8100
Wire Wire Line
	10550 3300 10300 3300
Wire Wire Line
	10550 3900 10300 3900
Wire Wire Line
	10550 4500 10300 4500
Wire Wire Line
	10550 5100 10300 5100
Wire Wire Line
	10550 5700 10300 5700
Wire Wire Line
	10550 6300 10300 6300
Wire Wire Line
	10550 6900 10300 6900
Wire Wire Line
	10550 7500 10300 7500
Connection ~ 10550 6900
Connection ~ 10550 5700
Connection ~ 10550 6300
Connection ~ 10550 4500
Connection ~ 10550 5100
Connection ~ 10550 3300
Connection ~ 10550 3900
Text Label 10550 1550 2    60   ~ 0
5V0_SB
Connection ~ 10550 2700
$Comp
L SSM6N58NU_DUAL_NMOS Q9
U 2 1 56CF075E
P 9150 7700
F 0 "Q9" H 9160 7870 60  0000 R CNN
F 1 "SSM6N58NU" H 9100 7550 60  0000 R CNN
F 2 "azonenberg_pcb:DFN_6_0.65MM_2x2MM_GDS" H 9150 7700 60  0001 C CNN
F 3 "" H 9150 7700 60  0000 C CNN
	2    9150 7700
	1    0    0    -1  
$EndComp
Text HLabel 8950 8300 0    60   Input ~ 0
VTT_LED
Wire Wire Line
	8200 8500 9250 8500
Connection ~ 8200 7900
$Comp
L D D18
U 1 1 56D25AD0
P 9600 8100
F 0 "D18" H 9600 8200 50  0000 C CNN
F 1 "GREEN" H 9600 8000 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0603_LED" H 9600 8100 60  0001 C CNN
F 3 "" H 9600 8100 60  0000 C CNN
	1    9600 8100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 8100 9250 8100
$Comp
L R R213
U 1 1 56D25AD7
P 10150 8100
F 0 "R213" V 10100 8300 50  0000 C CNN
F 1 "560" V 10150 8100 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 10080 8100 30  0001 C CNN
F 3 "" H 10150 8100 30  0000 C CNN
	1    10150 8100
	0    1    1    0   
$EndComp
Wire Wire Line
	10000 8100 9750 8100
Wire Wire Line
	10550 8100 10300 8100
Connection ~ 10550 7500
$Comp
L D D19
U 1 1 56A618FC
P 9550 1800
F 0 "D19" H 9550 1900 50  0000 C CNN
F 1 "GREEN" H 9550 1700 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0603_LED" H 9550 1800 60  0001 C CNN
F 3 "" H 9550 1800 60  0000 C CNN
	1    9550 1800
	1    0    0    -1  
$EndComp
Text Label 8200 1800 2    60   ~ 0
GND
Wire Wire Line
	8200 1800 9400 1800
$Comp
L R R222
U 1 1 56A61B1E
P 10150 1800
F 0 "R222" V 10100 2000 50  0000 C CNN
F 1 "560" V 10150 1800 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 10080 1800 30  0001 C CNN
F 3 "" H 10150 1800 30  0000 C CNN
	1    10150 1800
	0    1    1    0   
$EndComp
Wire Wire Line
	10300 1800 10550 1800
Connection ~ 10550 1800
Wire Wire Line
	10000 1800 9700 1800
Connection ~ 8200 3100
$EndSCHEMATC
