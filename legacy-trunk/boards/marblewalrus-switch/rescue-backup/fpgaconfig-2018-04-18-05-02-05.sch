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
Sheet 12 13
Title "MARBLEWALRUS Ethernet Switch"
Date "2016-02-14"
Rev "$Rev: 2303 $"
Comp "Andrew Zonenberg"
Comment1 "FPGA Configuration"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L XC7A200T-xFFG1156x U5
U 1 1 5697E369
P 3850 3850
F 0 "U5" H 3850 3800 60  0000 L CNN
F 1 "XC7A200T-1FFG1156C" H 3850 3700 60  0000 L CNN
F 2 "azonenberg_pcb:BGA_1156_35x35_FULLARRAY_1MM" H 3850 3900 60  0001 C CNN
F 3 "" H 3850 3900 60  0000 C CNN
	1    3850 3850
	1    0    0    -1  
$EndComp
Text HLabel 3400 2900 0    60   Input ~ 0
GND
Text HLabel 3400 3800 0    60   Input ~ 0
JTAG_TDI
Text HLabel 2500 3700 0    60   Output ~ 0
JTAG_TDO
Text HLabel 3400 3600 0    60   Input ~ 0
JTAG_TMS
Text HLabel 3400 3500 0    60   Input ~ 0
JTAG_TCK
Text HLabel 3400 2100 0    60   Input ~ 0
PROG_B
$Comp
L R R43
U 1 1 56AC2F14
P 2750 3700
F 0 "R43" V 2700 3550 50  0000 C CNN
F 1 "33" V 2750 3700 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2680 3700 30  0001 C CNN
F 3 "" H 2750 3700 30  0000 C CNN
	1    2750 3700
	0    1    1    0   
$EndComp
Text Label 2950 1900 2    60   ~ 0
BOOT_SPI_SCK
$Comp
L R R44
U 1 1 56AC2FF7
P 3250 1900
F 0 "R44" V 3150 1900 50  0000 C CNN
F 1 "33" V 3250 1900 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3180 1900 30  0001 C CNN
F 3 "" H 3250 1900 30  0000 C CNN
	1    3250 1900
	0    1    1    0   
$EndComp
$Comp
L XC7A200T-xFFG1156x U5
U 6 1 56AC6039
P 9350 6850
F 0 "U5" H 9350 6800 60  0000 L CNN
F 1 "XC7A200T-1FFG1156C" H 9350 6700 60  0000 L CNN
F 2 "azonenberg_pcb:BGA_1156_35x35_FULLARRAY_1MM" H 9350 6900 60  0001 C CNN
F 3 "" H 9350 6900 60  0000 C CNN
	6    9350 6850
	1    0    0    -1  
$EndComp
Text HLabel 3400 2300 0    60   Input ~ 0
FPGA_DONE
Text Label 3400 3200 2    60   ~ 0
GND
$Comp
L XILINX_JTAG_MONITOR J3
U 1 1 56C4CD20
P 3550 5900
F 0 "J3" H 4050 7450 60  0000 C CNN
F 1 "XILINX_JTAG_MONITOR" H 4050 7350 60  0000 C CNN
F 2 "azonenberg_pcb:XILINX_JTAG_PTH_MOLEX_0878311420" H 3550 5900 60  0001 C CNN
F 3 "" H 3550 5900 60  0000 C CNN
	1    3550 5900
	1    0    0    -1  
$EndComp
Text Label 3350 4900 2    60   ~ 0
GND
NoConn ~ 3550 5400
Text Label 3350 5500 2    60   ~ 0
JTAG_TMS
Text Label 3350 5600 2    60   ~ 0
JTAG_TCK
Text Label 3350 5700 2    60   ~ 0
JTAG_TDO
Text Label 3350 5800 2    60   ~ 0
JTAG_TDI
NoConn ~ 3550 5900
Text HLabel 3400 2000 0    60   BiDi ~ 0
INIT_B
Text Label 5550 1600 2    60   ~ 0
INIT_B
$Comp
L R R165
U 1 1 56C5769B
P 5800 1600
F 0 "R165" V 5900 1700 50  0000 C CNN
F 1 "4.7K" V 5800 1600 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 5730 1600 30  0001 C CNN
F 3 "" H 5800 1600 30  0000 C CNN
	1    5800 1600
	0    1    1    0   
$EndComp
$Comp
L R R164
U 1 1 56C576D2
P 5800 1450
F 0 "R164" V 5750 1650 50  0000 C CNN
F 1 "4.7K" V 5800 1450 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 5730 1450 30  0001 C CNN
F 3 "" H 5800 1450 30  0000 C CNN
	1    5800 1450
	0    1    1    0   
$EndComp
Text Label 5550 1450 2    60   ~ 0
PROG_B
Text Label 3550 2200 2    60   ~ 0
GND
Text Label 6150 1450 0    60   ~ 0
1V8
$Comp
L R R170
U 1 1 56C5FF9D
P 8700 2400
F 0 "R170" V 8650 2600 50  0000 C CNN
F 1 "1K" V 8700 2400 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 8630 2400 30  0001 C CNN
F 3 "" H 8700 2400 30  0000 C CNN
	1    8700 2400
	0    1    1    0   
$EndComp
Text HLabel 8400 2400 0    60   Input ~ 0
1V8
$Comp
L R R166
U 1 1 56C6056C
P 8700 2000
F 0 "R166" V 8650 2200 50  0000 C CNN
F 1 "33" V 8700 2000 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 8630 2000 30  0001 C CNN
F 3 "" H 8700 2000 30  0000 C CNN
	1    8700 2000
	0    1    1    0   
$EndComp
Text Label 8400 2000 2    60   ~ 0
BOOT_SPI_DQ0
$Comp
L R R167
U 1 1 56C60707
P 8700 2100
F 0 "R167" V 8650 2300 50  0000 C CNN
F 1 "33" V 8700 2100 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 8630 2100 30  0001 C CNN
F 3 "" H 8700 2100 30  0000 C CNN
	1    8700 2100
	0    1    1    0   
$EndComp
Text Label 8400 2100 2    60   ~ 0
BOOT_SPI_DQ1
$Comp
L R R168
U 1 1 56C60746
P 8700 2200
F 0 "R168" V 8650 2400 50  0000 C CNN
F 1 "33" V 8700 2200 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 8630 2200 30  0001 C CNN
F 3 "" H 8700 2200 30  0000 C CNN
	1    8700 2200
	0    1    1    0   
$EndComp
Text Label 8400 2200 2    60   ~ 0
BOOT_SPI_DQ2
$Comp
L R R169
U 1 1 56C6074F
P 8700 2300
F 0 "R169" V 8650 2500 50  0000 C CNN
F 1 "33" V 8700 2300 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 8630 2300 30  0001 C CNN
F 3 "" H 8700 2300 30  0000 C CNN
	1    8700 2300
	0    1    1    0   
$EndComp
Text Label 8400 2300 2    60   ~ 0
BOOT_SPI_DQ3
NoConn ~ 9150 1900
Text Label 8400 3000 2    60   ~ 0
BOOT_SPI_CS_N
$Comp
L R R171
U 1 1 56C61113
P 8700 3000
F 0 "R171" V 8650 3200 50  0000 C CNN
F 1 "33" V 8700 3000 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 8630 3000 30  0001 C CNN
F 3 "" H 8700 3000 30  0000 C CNN
	1    8700 3000
	0    1    1    0   
$EndComp
NoConn ~ 9150 2500
NoConn ~ 9150 2600
NoConn ~ 9150 2700
NoConn ~ 9150 2800
NoConn ~ 9150 2900
Text HLabel 8850 3300 0    60   Output ~ 0
FPGA_PANIC
NoConn ~ 9150 3200
NoConn ~ 9150 3100
NoConn ~ 9150 3400
NoConn ~ 9150 3500
NoConn ~ 9150 6500
NoConn ~ 9150 6400
NoConn ~ 9150 6300
NoConn ~ 9150 6200
NoConn ~ 9150 6100
NoConn ~ 9150 6000
NoConn ~ 9150 5900
NoConn ~ 9150 5800
NoConn ~ 9150 4200
NoConn ~ 9150 4700
NoConn ~ 9150 4800
NoConn ~ 9150 4900
NoConn ~ 9150 5000
NoConn ~ 9150 5100
NoConn ~ 9150 3600
NoConn ~ 9150 3700
NoConn ~ 9150 3800
NoConn ~ 9150 3900
NoConn ~ 9150 4000
NoConn ~ 9150 4100
$Comp
L R R161
U 1 1 56C68B41
P 3300 2500
F 0 "R161" V 3250 2700 50  0000 C CNN
F 1 "1K" V 3300 2500 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3230 2500 30  0001 C CNN
F 3 "" H 3300 2500 30  0000 C CNN
	1    3300 2500
	0    1    1    0   
$EndComp
$Comp
L R R162
U 1 1 56C68C8D
P 3300 2600
F 0 "R162" V 3250 2800 50  0000 C CNN
F 1 "1K" V 3300 2600 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3230 2600 30  0001 C CNN
F 3 "" H 3300 2600 30  0000 C CNN
	1    3300 2600
	0    1    1    0   
$EndComp
$Comp
L R R163
U 1 1 56C68CCA
P 3300 2700
F 0 "R163" V 3250 2900 50  0000 C CNN
F 1 "1K" V 3300 2700 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 3230 2700 30  0001 C CNN
F 3 "" H 3300 2700 30  0000 C CNN
	1    3300 2700
	0    1    1    0   
$EndComp
Text Label 2950 2500 2    60   ~ 0
GND
Text Label 2950 2700 2    60   ~ 0
1V8
Text Label 3350 4800 2    60   ~ 0
1V8
Text HLabel 8850 4300 0    60   Output ~ 0
RAM_TDI
Text HLabel 8850 4400 0    60   Input ~ 0
RAM_TDO
Text HLabel 8850 4500 0    60   Output ~ 0
RAM_TCK
Text HLabel 8850 4600 0    60   Output ~ 0
RAM_TMS
Text Label 8550 5200 2    60   ~ 0
DATA_SPI_CS_N
$Comp
L R R177
U 1 1 56C83C25
P 8700 5200
F 0 "R177" V 8650 5400 50  0000 C CNN
F 1 "33" V 8700 5200 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 8630 5200 30  0001 C CNN
F 3 "" H 8700 5200 30  0000 C CNN
	1    8700 5200
	0    1    1    0   
$EndComp
Text Label 8550 5300 2    60   ~ 0
DATA_SPI_SCK
$Comp
L R R178
U 1 1 56C83D76
P 8700 5300
F 0 "R178" V 8650 5500 50  0000 C CNN
F 1 "33" V 8700 5300 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 8630 5300 30  0001 C CNN
F 3 "" H 8700 5300 30  0000 C CNN
	1    8700 5300
	0    1    1    0   
$EndComp
Text Label 8550 5400 2    60   ~ 0
DATA_SPI_DQ0
$Comp
L R R179
U 1 1 56C83E3F
P 8700 5400
F 0 "R179" V 8650 5600 50  0000 C CNN
F 1 "33" V 8700 5400 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 8630 5400 30  0001 C CNN
F 3 "" H 8700 5400 30  0000 C CNN
	1    8700 5400
	0    1    1    0   
$EndComp
Text Label 8550 5500 2    60   ~ 0
DATA_SPI_DQ1
$Comp
L R R180
U 1 1 56C83E47
P 8700 5500
F 0 "R180" V 8650 5700 50  0000 C CNN
F 1 "33" V 8700 5500 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 8630 5500 30  0001 C CNN
F 3 "" H 8700 5500 30  0000 C CNN
	1    8700 5500
	0    1    1    0   
$EndComp
Text Label 8550 5600 2    60   ~ 0
DATA_SPI_DQ2
$Comp
L R R181
U 1 1 56C83E99
P 8700 5600
F 0 "R181" V 8650 5800 50  0000 C CNN
F 1 "33" V 8700 5600 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 8630 5600 30  0001 C CNN
F 3 "" H 8700 5600 30  0000 C CNN
	1    8700 5600
	0    1    1    0   
$EndComp
Text Label 8550 5700 2    60   ~ 0
DATA_SPI_DQ3
$Comp
L R R182
U 1 1 56C83EA1
P 8700 5700
F 0 "R182" V 8650 5900 50  0000 C CNN
F 1 "33" V 8700 5700 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 8630 5700 30  0001 C CNN
F 3 "" H 8700 5700 30  0000 C CNN
	1    8700 5700
	0    1    1    0   
$EndComp
$Comp
L W25Q80BV U19
U 1 1 56C83FFA
P 4000 8650
F 0 "U19" H 4000 8600 60  0000 C CNN
F 1 "N25Q128A11EF840E" H 4000 8500 60  0000 C CNN
F 2 "azonenberg_pcb:DFN_8_1.27MM_8x6MM" H 4000 8650 60  0001 C CNN
F 3 "" H 4000 8650 60  0000 C CNN
	1    4000 8650
	1    0    0    -1  
$EndComp
Text Label 4900 8250 0    60   ~ 0
1V8
$Comp
L R R173
U 1 1 56C8436E
P 5050 8350
F 0 "R173" V 5000 8550 50  0000 C CNN
F 1 "33" V 5050 8350 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 4980 8350 30  0001 C CNN
F 3 "" H 5050 8350 30  0000 C CNN
	1    5050 8350
	0    1    1    0   
$EndComp
$Comp
L R R174
U 1 1 56C84494
P 5050 8550
F 0 "R174" V 5000 8750 50  0000 C CNN
F 1 "33" V 5050 8550 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 4980 8550 30  0001 C CNN
F 3 "" H 5050 8550 30  0000 C CNN
	1    5050 8550
	0    1    1    0   
$EndComp
Text Label 5400 8450 0    60   ~ 0
BOOT_SPI_SCK
Text Label 5400 8350 0    60   ~ 0
BOOT_SPI_DQ3
Text Label 5400 8550 0    60   ~ 0
BOOT_SPI_DQ0
Text Label 2700 8350 2    60   ~ 0
BOOT_SPI_DQ1
Text Label 2700 8450 2    60   ~ 0
BOOT_SPI_DQ2
Text Label 3000 8250 2    60   ~ 0
BOOT_SPI_CS_N
Text Label 3150 8550 2    60   ~ 0
GND
$Comp
L W25Q80BV U20
U 1 1 56C85650
P 4000 9600
F 0 "U20" H 4000 9550 60  0000 C CNN
F 1 "N25Q128A11EF840E" H 4000 9450 60  0000 C CNN
F 2 "azonenberg_pcb:DFN_8_1.27MM_8x6MM" H 4000 9600 60  0001 C CNN
F 3 "" H 4000 9600 60  0000 C CNN
	1    4000 9600
	1    0    0    -1  
$EndComp
Text Label 4900 9200 0    60   ~ 0
1V8
$Comp
L R R175
U 1 1 56C85658
P 5050 9300
F 0 "R175" V 5000 9500 50  0000 C CNN
F 1 "33" V 5050 9300 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 4980 9300 30  0001 C CNN
F 3 "" H 5050 9300 30  0000 C CNN
	1    5050 9300
	0    1    1    0   
$EndComp
$Comp
L R R176
U 1 1 56C8565E
P 5050 9500
F 0 "R176" V 5000 9700 50  0000 C CNN
F 1 "33" V 5050 9500 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 4980 9500 30  0001 C CNN
F 3 "" H 5050 9500 30  0000 C CNN
	1    5050 9500
	0    1    1    0   
$EndComp
Text Label 5400 9400 0    60   ~ 0
DATA_SPI_SCK
Text Label 5400 9300 0    60   ~ 0
DATA_SPI_DQ3
Text Label 5400 9500 0    60   ~ 0
DATA_SPI_DQ0
Text Label 2700 9300 2    60   ~ 0
DATA_SPI_DQ1
Text Label 2700 9400 2    60   ~ 0
DATA_SPI_DQ2
Text Label 3000 9200 2    60   ~ 0
DATA_SPI_CS_N
Text Label 3150 9500 2    60   ~ 0
GND
$Comp
L C C385
U 1 1 56C85820
P 4100 7800
F 0 "C385" H 4125 7900 50  0000 L CNN
F 1 "0.1 uF" H 4125 7700 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0402_CAP_NOSILK" H 4138 7650 30  0001 C CNN
F 3 "" H 4100 7800 60  0000 C CNN
	1    4100 7800
	1    0    0    -1  
$EndComp
$Comp
L C C384
U 1 1 56C858DD
P 3750 7800
F 0 "C384" H 3775 7900 50  0000 L CNN
F 1 "4.7 uF" H 3775 7700 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0603_CAP_NOSILK" H 3788 7650 30  0001 C CNN
F 3 "" H 3750 7800 60  0000 C CNN
	1    3750 7800
	1    0    0    -1  
$EndComp
Text Label 3600 7650 2    60   ~ 0
1V8
$Comp
L C C386
U 1 1 56C85AE9
P 4400 7800
F 0 "C386" H 4425 7900 50  0000 L CNN
F 1 "0.1 uF" H 4425 7700 50  0000 L CNN
F 2 "azonenberg_pcb:EIA_0402_CAP_NOSILK" H 4438 7650 30  0001 C CNN
F 3 "" H 4400 7800 60  0000 C CNN
	1    4400 7800
	1    0    0    -1  
$EndComp
Text Label 3600 7950 2    60   ~ 0
GND
NoConn ~ 9150 6800
NoConn ~ 9150 6600
NoConn ~ 9150 6700
Text Notes 9350 1850 0    60   ~ 0
VCCO=1V8
$Comp
L R R217
U 1 1 56A07335
P 2850 8350
F 0 "R217" V 2800 8550 50  0000 C CNN
F 1 "33" V 2850 8350 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2780 8350 30  0001 C CNN
F 3 "" H 2850 8350 30  0000 C CNN
	1    2850 8350
	0    1    1    0   
$EndComp
$Comp
L R R218
U 1 1 56A07439
P 2850 8450
F 0 "R218" V 2800 8650 50  0000 C CNN
F 1 "33" V 2850 8450 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2780 8450 30  0001 C CNN
F 3 "" H 2850 8450 30  0000 C CNN
	1    2850 8450
	0    1    1    0   
$EndComp
$Comp
L R R219
U 1 1 56A07699
P 2850 9300
F 0 "R219" V 2800 9500 50  0000 C CNN
F 1 "33" V 2850 9300 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2780 9300 30  0001 C CNN
F 3 "" H 2850 9300 30  0000 C CNN
	1    2850 9300
	0    1    1    0   
$EndComp
$Comp
L R R220
U 1 1 56A0769F
P 2850 9400
F 0 "R220" V 2800 9600 50  0000 C CNN
F 1 "33" V 2850 9400 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 2780 9400 30  0001 C CNN
F 3 "" H 2850 9400 30  0000 C CNN
	1    2850 9400
	0    1    1    0   
$EndComp
Text Label 5550 1800 2    60   ~ 0
BOOT_SPI_CS_N
Wire Wire Line
	3400 3800 3650 3800
Wire Wire Line
	3400 3600 3650 3600
Wire Wire Line
	3650 3500 3400 3500
Wire Wire Line
	2500 3700 2600 3700
Wire Wire Line
	2900 3700 3650 3700
Wire Wire Line
	3400 1900 3650 1900
Wire Wire Line
	2950 1900 3100 1900
Wire Wire Line
	3400 2300 3650 2300
Wire Wire Line
	3400 2100 3650 2100
Wire Wire Line
	3400 3200 3650 3200
Wire Wire Line
	3550 3200 3550 3300
Wire Wire Line
	3550 3300 3650 3300
Connection ~ 3550 3200
Wire Wire Line
	3650 2900 3400 2900
Wire Wire Line
	3550 2900 3550 3000
Wire Wire Line
	3550 3000 3650 3000
Connection ~ 3550 2900
Wire Wire Line
	3350 4900 3550 4900
Wire Wire Line
	3450 4900 3450 5300
Wire Wire Line
	3450 5000 3550 5000
Connection ~ 3450 4900
Wire Wire Line
	3450 5100 3550 5100
Connection ~ 3450 5000
Wire Wire Line
	3450 5200 3550 5200
Connection ~ 3450 5100
Wire Wire Line
	3450 5300 3550 5300
Connection ~ 3450 5200
Wire Wire Line
	3350 5500 3550 5500
Wire Wire Line
	3350 5600 3550 5600
Wire Wire Line
	3350 5800 3550 5800
Wire Wire Line
	3550 5700 3350 5700
Wire Wire Line
	3400 2000 3650 2000
Wire Wire Line
	5550 1450 5650 1450
Wire Wire Line
	5650 1600 5550 1600
Wire Wire Line
	3550 2200 3650 2200
Wire Wire Line
	6150 1450 5950 1450
Wire Wire Line
	5950 1600 6050 1600
Wire Wire Line
	6050 1450 6050 2050
Connection ~ 6050 1450
Wire Wire Line
	8850 2400 9150 2400
Wire Wire Line
	8400 2400 8550 2400
Wire Wire Line
	8850 2000 9150 2000
Wire Wire Line
	8400 2000 8550 2000
Wire Wire Line
	8850 2100 9150 2100
Wire Wire Line
	8400 2100 8550 2100
Wire Wire Line
	8850 2200 9150 2200
Wire Wire Line
	8400 2200 8550 2200
Wire Wire Line
	8850 2300 9150 2300
Wire Wire Line
	8400 2300 8550 2300
Wire Wire Line
	8400 3000 8550 3000
Wire Wire Line
	8850 3000 9150 3000
Wire Wire Line
	8850 3300 9150 3300
Wire Wire Line
	3650 2500 3450 2500
Wire Wire Line
	3650 2600 3450 2600
Wire Wire Line
	3650 2700 3450 2700
Wire Wire Line
	2950 2500 3150 2500
Wire Wire Line
	3050 2500 3050 2600
Wire Wire Line
	3050 2600 3150 2600
Connection ~ 3050 2500
Wire Wire Line
	2950 2700 3150 2700
Wire Wire Line
	3350 4800 3550 4800
Wire Wire Line
	9150 4300 8850 4300
Wire Wire Line
	8850 4400 9150 4400
Wire Wire Line
	9150 4500 8850 4500
Wire Wire Line
	8850 4600 9150 4600
Wire Wire Line
	8850 5200 9150 5200
Wire Wire Line
	8850 5300 9150 5300
Wire Wire Line
	8850 5400 9150 5400
Wire Wire Line
	8850 5500 9150 5500
Wire Wire Line
	8850 5600 9150 5600
Wire Wire Line
	8850 5700 9150 5700
Wire Wire Line
	4750 8250 4900 8250
Wire Wire Line
	4900 8550 4750 8550
Wire Wire Line
	4900 8350 4750 8350
Wire Wire Line
	5400 8450 4750 8450
Wire Wire Line
	5400 8550 5200 8550
Wire Wire Line
	5400 8350 5200 8350
Wire Wire Line
	3000 8350 3250 8350
Wire Wire Line
	3000 8450 3250 8450
Wire Wire Line
	3000 8250 3250 8250
Wire Wire Line
	4750 9200 4900 9200
Wire Wire Line
	4900 9500 4750 9500
Wire Wire Line
	4900 9300 4750 9300
Wire Wire Line
	5400 9400 4750 9400
Wire Wire Line
	5400 9500 5200 9500
Wire Wire Line
	5400 9300 5200 9300
Wire Wire Line
	3000 9300 3250 9300
Wire Wire Line
	3000 9400 3250 9400
Wire Wire Line
	3000 9200 3250 9200
Wire Wire Line
	3600 7650 4400 7650
Connection ~ 3750 7650
Wire Wire Line
	3600 7950 4400 7950
Connection ~ 3750 7950
Connection ~ 4100 7950
Connection ~ 4100 7650
Wire Wire Line
	3150 8550 3250 8550
Wire Wire Line
	3150 9500 3250 9500
$Comp
L R R223
U 1 1 56AA5F05
P 5800 1800
F 0 "R223" V 5900 1850 50  0000 C CNN
F 1 "4.7K" V 5800 1800 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 5730 1800 30  0001 C CNN
F 3 "" H 5800 1800 30  0000 C CNN
	1    5800 1800
	0    1    1    0   
$EndComp
Wire Wire Line
	5650 1800 5550 1800
Wire Wire Line
	6050 1800 5950 1800
Connection ~ 6050 1600
Text Label 5550 2050 2    60   ~ 0
DATA_SPI_CS_N
$Comp
L R R224
U 1 1 56AA6F9D
P 5800 2050
F 0 "R224" V 5900 2100 50  0000 C CNN
F 1 "4.7K" V 5800 2050 50  0000 C CNN
F 2 "azonenberg_pcb:EIA_0402_RES_NOSILK" V 5730 2050 30  0001 C CNN
F 3 "" H 5800 2050 30  0000 C CNN
	1    5800 2050
	0    1    1    0   
$EndComp
Wire Wire Line
	5650 2050 5550 2050
Wire Wire Line
	6050 2050 5950 2050
Connection ~ 6050 1800
$EndSCHEMATC
