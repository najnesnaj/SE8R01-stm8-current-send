                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.4.0 #8981 (Jul  5 2014) (Linux)
                                      4 ; This file was generated Thu May 18 19:18:44 2017
                                      5 ;--------------------------------------------------------
                                      6 	.module se8r01_send_current
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _main
                                     13 	.globl _SE8R01_Init
                                     14 	.globl _SE8R01_Analog_Init
                                     15 	.globl _SE8R01_Calibration
                                     16 	.globl _rf_switch_bank
                                     17 	.globl _init_io
                                     18 	.globl _InitializeUART
                                     19 	.globl _print_UCHAR_hex
                                     20 	.globl _UARTPrintF
                                     21 	.globl _delay
                                     22 	.globl _InitializeSystemClock
                                     23 	.globl _InitializeSPI
                                     24 	.globl _read_spi_buf
                                     25 	.globl _write_spi_buf
                                     26 	.globl _read_spi_reg
                                     27 	.globl _write_spi_reg
                                     28 	.globl _write_spi
                                     29 	.globl _delayTenMicro
                                     30 	.globl _memset
                                     31 	.globl _tx_buf
                                     32 	.globl _rx_buf
                                     33 	.globl _ADDRESS0
                                     34 	.globl _ADDRESS1
                                     35 	.globl _ADDRESS5
                                     36 	.globl _ADDRESS4
                                     37 	.globl _ADDRESS3
                                     38 	.globl _ADDRESS2
                                     39 	.globl _TX_ADDRESS
                                     40 	.globl _status
                                     41 	.globl _pip
                                     42 	.globl _signal_lv
                                     43 	.globl _newdata
                                     44 	.globl _pload_width_now
                                     45 	.globl _SE8R01_DR_500K
                                     46 	.globl _SE8R01_DR_1M
                                     47 	.globl _SE8R01_DR_2M
                                     48 	.globl _myData_pip4
                                     49 	.globl _myData_pip5
                                     50 	.globl _gtemp
                                     51 ;--------------------------------------------------------
                                     52 ; ram data
                                     53 ;--------------------------------------------------------
                                     54 	.area DATA
      000001                         55 _gtemp::
      000001                         56 	.ds 5
      000006                         57 _myData_pip5::
      000006                         58 	.ds 5
      00000B                         59 _myData_pip4::
      00000B                         60 	.ds 5
                                     61 ;--------------------------------------------------------
                                     62 ; ram data
                                     63 ;--------------------------------------------------------
                                     64 	.area INITIALIZED
      000010                         65 _SE8R01_DR_2M::
      000010                         66 	.ds 2
      000012                         67 _SE8R01_DR_1M::
      000012                         68 	.ds 2
      000014                         69 _SE8R01_DR_500K::
      000014                         70 	.ds 2
      000016                         71 _pload_width_now::
      000016                         72 	.ds 2
      000018                         73 _newdata::
      000018                         74 	.ds 2
      00001A                         75 _signal_lv::
      00001A                         76 	.ds 1
      00001B                         77 _pip::
      00001B                         78 	.ds 2
      00001D                         79 _status::
      00001D                         80 	.ds 1
      00001E                         81 _TX_ADDRESS::
      00001E                         82 	.ds 4
      000022                         83 _ADDRESS2::
      000022                         84 	.ds 1
      000023                         85 _ADDRESS3::
      000023                         86 	.ds 1
      000024                         87 _ADDRESS4::
      000024                         88 	.ds 1
      000025                         89 _ADDRESS5::
      000025                         90 	.ds 1
      000026                         91 _ADDRESS1::
      000026                         92 	.ds 4
      00002A                         93 _ADDRESS0::
      00002A                         94 	.ds 4
      00002E                         95 _rx_buf::
      00002E                         96 	.ds 32
      00004E                         97 _tx_buf::
      00004E                         98 	.ds 32
                                     99 ;--------------------------------------------------------
                                    100 ; Stack segment in internal ram 
                                    101 ;--------------------------------------------------------
                                    102 	.area	SSEG
      000000                        103 __start__stack:
      000000                        104 	.ds	1
                                    105 
                                    106 ;--------------------------------------------------------
                                    107 ; absolute external ram data
                                    108 ;--------------------------------------------------------
                                    109 	.area DABS (ABS)
                                    110 ;--------------------------------------------------------
                                    111 ; interrupt vector 
                                    112 ;--------------------------------------------------------
                                    113 	.area HOME
      008000                        114 __interrupt_vect:
      008000 82 00 80 83            115 	int s_GSINIT ;reset
      008004 82 00 00 00            116 	int 0x0000 ;trap
      008008 82 00 00 00            117 	int 0x0000 ;int0
      00800C 82 00 00 00            118 	int 0x0000 ;int1
      008010 82 00 00 00            119 	int 0x0000 ;int2
      008014 82 00 00 00            120 	int 0x0000 ;int3
      008018 82 00 00 00            121 	int 0x0000 ;int4
      00801C 82 00 00 00            122 	int 0x0000 ;int5
      008020 82 00 00 00            123 	int 0x0000 ;int6
      008024 82 00 00 00            124 	int 0x0000 ;int7
      008028 82 00 00 00            125 	int 0x0000 ;int8
      00802C 82 00 00 00            126 	int 0x0000 ;int9
      008030 82 00 00 00            127 	int 0x0000 ;int10
      008034 82 00 00 00            128 	int 0x0000 ;int11
      008038 82 00 00 00            129 	int 0x0000 ;int12
      00803C 82 00 00 00            130 	int 0x0000 ;int13
      008040 82 00 00 00            131 	int 0x0000 ;int14
      008044 82 00 00 00            132 	int 0x0000 ;int15
      008048 82 00 00 00            133 	int 0x0000 ;int16
      00804C 82 00 00 00            134 	int 0x0000 ;int17
      008050 82 00 00 00            135 	int 0x0000 ;int18
      008054 82 00 00 00            136 	int 0x0000 ;int19
      008058 82 00 00 00            137 	int 0x0000 ;int20
      00805C 82 00 00 00            138 	int 0x0000 ;int21
      008060 82 00 00 00            139 	int 0x0000 ;int22
      008064 82 00 00 00            140 	int 0x0000 ;int23
      008068 82 00 00 00            141 	int 0x0000 ;int24
      00806C 82 00 00 00            142 	int 0x0000 ;int25
      008070 82 00 00 00            143 	int 0x0000 ;int26
      008074 82 00 00 00            144 	int 0x0000 ;int27
      008078 82 00 00 00            145 	int 0x0000 ;int28
      00807C 82 00 00 00            146 	int 0x0000 ;int29
                                    147 ;--------------------------------------------------------
                                    148 ; global & static initialisations
                                    149 ;--------------------------------------------------------
                                    150 	.area HOME
                                    151 	.area GSINIT
                                    152 	.area GSFINAL
                                    153 	.area GSINIT
      008083                        154 __sdcc_gs_init_startup:
      008083                        155 __sdcc_init_data:
                                    156 ; stm8_genXINIT() start
      008083 AE 00 0F         [ 2]  157 	ldw x, #l_DATA
      008086 27 07            [ 1]  158 	jreq	00002$
      008088                        159 00001$:
      008088 72 4F 00 00      [ 1]  160 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  161 	decw x
      00808D 26 F9            [ 1]  162 	jrne	00001$
      00808F                        163 00002$:
      00808F AE 00 5E         [ 2]  164 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  165 	jreq	00004$
      008094                        166 00003$:
      008094 D6 89 81         [ 1]  167 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 0F         [ 1]  168 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  169 	decw	x
      00809B 26 F7            [ 1]  170 	jrne	00003$
      00809D                        171 00004$:
                                    172 ; stm8_genXINIT() end
                                    173 	.area GSFINAL
      00809D CC 80 80         [ 2]  174 	jp	__sdcc_program_startup
                                    175 ;--------------------------------------------------------
                                    176 ; Home
                                    177 ;--------------------------------------------------------
                                    178 	.area HOME
                                    179 	.area HOME
      008080                        180 __sdcc_program_startup:
      008080 CC 87 6E         [ 2]  181 	jp	_main
                                    182 ;	return from main will return to caller
                                    183 ;--------------------------------------------------------
                                    184 ; code
                                    185 ;--------------------------------------------------------
                                    186 	.area CODE
                                    187 ;	se8r01-send-current.c: 37: void delayTenMicro (void) {
                                    188 ;	-----------------------------------------
                                    189 ;	 function delayTenMicro
                                    190 ;	-----------------------------------------
      0080A0                        191 _delayTenMicro:
                                    192 ;	se8r01-send-current.c: 39: for (a = 0; a < 50; ++a)
      0080A0 A6 32            [ 1]  193 	ld	a, #0x32
      0080A2                        194 00104$:
                                    195 ;	se8r01-send-current.c: 40: __asm__("nop");
      0080A2 9D               [ 1]  196 	nop
      0080A3 4A               [ 1]  197 	dec	a
                                    198 ;	se8r01-send-current.c: 39: for (a = 0; a < 50; ++a)
      0080A4 4D               [ 1]  199 	tnz	a
      0080A5 26 FB            [ 1]  200 	jrne	00104$
      0080A7 81               [ 4]  201 	ret
                                    202 ;	se8r01-send-current.c: 42: UCHAR write_spi (UCHAR value) {
                                    203 ;	-----------------------------------------
                                    204 ;	 function write_spi
                                    205 ;	-----------------------------------------
      0080A8                        206 _write_spi:
                                    207 ;	se8r01-send-current.c: 44: delayTenMicro ();
      0080A8 CD 80 A0         [ 4]  208 	call	_delayTenMicro
                                    209 ;	se8r01-send-current.c: 45: SPI_DR = value;
      0080AB AE 52 04         [ 2]  210 	ldw	x, #0x5204
      0080AE 7B 03            [ 1]  211 	ld	a, (0x03, sp)
      0080B0 F7               [ 1]  212 	ld	(x), a
                                    213 ;	se8r01-send-current.c: 46: delayTenMicro ();
      0080B1 CD 80 A0         [ 4]  214 	call	_delayTenMicro
                                    215 ;	se8r01-send-current.c: 47: while ((SPI_SR & TXE) == 0);
      0080B4                        216 00101$:
      0080B4 AE 52 03         [ 2]  217 	ldw	x, #0x5203
      0080B7 F6               [ 1]  218 	ld	a, (x)
      0080B8 A5 02            [ 1]  219 	bcp	a, #0x02
      0080BA 27 F8            [ 1]  220 	jreq	00101$
                                    221 ;	se8r01-send-current.c: 48: delayTenMicro ();
      0080BC CD 80 A0         [ 4]  222 	call	_delayTenMicro
                                    223 ;	se8r01-send-current.c: 49: while ((SPI_SR & RXNE) == 0);
      0080BF                        224 00104$:
      0080BF AE 52 03         [ 2]  225 	ldw	x, #0x5203
      0080C2 F6               [ 1]  226 	ld	a, (x)
      0080C3 44               [ 1]  227 	srl	a
      0080C4 24 F9            [ 1]  228 	jrnc	00104$
                                    229 ;	se8r01-send-current.c: 50: delayTenMicro ();
      0080C6 CD 80 A0         [ 4]  230 	call	_delayTenMicro
                                    231 ;	se8r01-send-current.c: 51: ret = SPI_DR;
      0080C9 AE 52 04         [ 2]  232 	ldw	x, #0x5204
      0080CC F6               [ 1]  233 	ld	a, (x)
                                    234 ;	se8r01-send-current.c: 52: return (ret);
      0080CD 81               [ 4]  235 	ret
                                    236 ;	se8r01-send-current.c: 54: UCHAR write_spi_reg (UCHAR reg, UCHAR value) {
                                    237 ;	-----------------------------------------
                                    238 ;	 function write_spi_reg
                                    239 ;	-----------------------------------------
      0080CE                        240 _write_spi_reg:
      0080CE 88               [ 1]  241 	push	a
                                    242 ;	se8r01-send-current.c: 56: PC_ODR &= ~(1 << CSN);
      0080CF AE 50 0A         [ 2]  243 	ldw	x, #0x500a
      0080D2 F6               [ 1]  244 	ld	a, (x)
      0080D3 A4 F7            [ 1]  245 	and	a, #0xf7
      0080D5 F7               [ 1]  246 	ld	(x), a
                                    247 ;	se8r01-send-current.c: 57: ret = write_spi (reg);
      0080D6 7B 04            [ 1]  248 	ld	a, (0x04, sp)
      0080D8 88               [ 1]  249 	push	a
      0080D9 CD 80 A8         [ 4]  250 	call	_write_spi
      0080DC 5B 01            [ 2]  251 	addw	sp, #1
      0080DE 6B 01            [ 1]  252 	ld	(0x01, sp), a
                                    253 ;	se8r01-send-current.c: 58: if (reg != NOP && reg != FLUSH_RX && reg != FLUSH_TX)
      0080E0 7B 04            [ 1]  254 	ld	a, (0x04, sp)
      0080E2 A1 FF            [ 1]  255 	cp	a, #0xff
      0080E4 27 15            [ 1]  256 	jreq	00102$
      0080E6 7B 04            [ 1]  257 	ld	a, (0x04, sp)
      0080E8 A1 E2            [ 1]  258 	cp	a, #0xe2
      0080EA 27 0F            [ 1]  259 	jreq	00102$
      0080EC 7B 04            [ 1]  260 	ld	a, (0x04, sp)
      0080EE A1 E1            [ 1]  261 	cp	a, #0xe1
      0080F0 27 09            [ 1]  262 	jreq	00102$
                                    263 ;	se8r01-send-current.c: 59: write_spi (value);
      0080F2 7B 05            [ 1]  264 	ld	a, (0x05, sp)
      0080F4 88               [ 1]  265 	push	a
      0080F5 CD 80 A8         [ 4]  266 	call	_write_spi
      0080F8 84               [ 1]  267 	pop	a
      0080F9 20 03            [ 2]  268 	jra	00103$
      0080FB                        269 00102$:
                                    270 ;	se8r01-send-current.c: 61: delayTenMicro ();
      0080FB CD 80 A0         [ 4]  271 	call	_delayTenMicro
      0080FE                        272 00103$:
                                    273 ;	se8r01-send-current.c: 62: PC_ODR |= (1 << CSN);
      0080FE AE 50 0A         [ 2]  274 	ldw	x, #0x500a
      008101 F6               [ 1]  275 	ld	a, (x)
      008102 AA 08            [ 1]  276 	or	a, #0x08
      008104 F7               [ 1]  277 	ld	(x), a
                                    278 ;	se8r01-send-current.c: 63: return (ret);
      008105 7B 01            [ 1]  279 	ld	a, (0x01, sp)
      008107 5B 01            [ 2]  280 	addw	sp, #1
      008109 81               [ 4]  281 	ret
                                    282 ;	se8r01-send-current.c: 65: UCHAR read_spi_reg (UCHAR reg) {
                                    283 ;	-----------------------------------------
                                    284 ;	 function read_spi_reg
                                    285 ;	-----------------------------------------
      00810A                        286 _read_spi_reg:
      00810A 88               [ 1]  287 	push	a
                                    288 ;	se8r01-send-current.c: 67: PC_ODR &= ~(1 << CSN);
      00810B AE 50 0A         [ 2]  289 	ldw	x, #0x500a
      00810E F6               [ 1]  290 	ld	a, (x)
      00810F A4 F7            [ 1]  291 	and	a, #0xf7
      008111 F7               [ 1]  292 	ld	(x), a
                                    293 ;	se8r01-send-current.c: 68: ret = write_spi (reg);
      008112 7B 04            [ 1]  294 	ld	a, (0x04, sp)
      008114 88               [ 1]  295 	push	a
      008115 CD 80 A8         [ 4]  296 	call	_write_spi
      008118 5B 01            [ 2]  297 	addw	sp, #1
      00811A 6B 01            [ 1]  298 	ld	(0x01, sp), a
                                    299 ;	se8r01-send-current.c: 69: if (reg != NOP && reg != FLUSH_RX && reg != FLUSH_TX)
      00811C 7B 04            [ 1]  300 	ld	a, (0x04, sp)
      00811E A1 FF            [ 1]  301 	cp	a, #0xff
      008120 27 17            [ 1]  302 	jreq	00102$
      008122 7B 04            [ 1]  303 	ld	a, (0x04, sp)
      008124 A1 E2            [ 1]  304 	cp	a, #0xe2
      008126 27 11            [ 1]  305 	jreq	00102$
      008128 7B 04            [ 1]  306 	ld	a, (0x04, sp)
      00812A A1 E1            [ 1]  307 	cp	a, #0xe1
      00812C 27 0B            [ 1]  308 	jreq	00102$
                                    309 ;	se8r01-send-current.c: 70: ret = write_spi (NOP);
      00812E 4B FF            [ 1]  310 	push	#0xff
      008130 CD 80 A8         [ 4]  311 	call	_write_spi
      008133 5B 01            [ 2]  312 	addw	sp, #1
      008135 6B 01            [ 1]  313 	ld	(0x01, sp), a
      008137 20 03            [ 2]  314 	jra	00103$
      008139                        315 00102$:
                                    316 ;	se8r01-send-current.c: 72: delayTenMicro ();
      008139 CD 80 A0         [ 4]  317 	call	_delayTenMicro
      00813C                        318 00103$:
                                    319 ;	se8r01-send-current.c: 73: PC_ODR |= (1 << CSN);
      00813C AE 50 0A         [ 2]  320 	ldw	x, #0x500a
      00813F F6               [ 1]  321 	ld	a, (x)
      008140 AA 08            [ 1]  322 	or	a, #0x08
      008142 F7               [ 1]  323 	ld	(x), a
                                    324 ;	se8r01-send-current.c: 74: return (ret);
      008143 7B 01            [ 1]  325 	ld	a, (0x01, sp)
      008145 5B 01            [ 2]  326 	addw	sp, #1
      008147 81               [ 4]  327 	ret
                                    328 ;	se8r01-send-current.c: 76: UCHAR write_spi_buf (UCHAR reg, UCHAR *array, UCHAR len) {
                                    329 ;	-----------------------------------------
                                    330 ;	 function write_spi_buf
                                    331 ;	-----------------------------------------
      008148                        332 _write_spi_buf:
      008148 52 02            [ 2]  333 	sub	sp, #2
                                    334 ;	se8r01-send-current.c: 78: PC_ODR &= ~(1 << CSN);
      00814A AE 50 0A         [ 2]  335 	ldw	x, #0x500a
      00814D F6               [ 1]  336 	ld	a, (x)
      00814E A4 F7            [ 1]  337 	and	a, #0xf7
      008150 F7               [ 1]  338 	ld	(x), a
                                    339 ;	se8r01-send-current.c: 79: ret = write_spi (reg);
      008151 7B 05            [ 1]  340 	ld	a, (0x05, sp)
      008153 88               [ 1]  341 	push	a
      008154 CD 80 A8         [ 4]  342 	call	_write_spi
      008157 5B 01            [ 2]  343 	addw	sp, #1
      008159 6B 02            [ 1]  344 	ld	(0x02, sp), a
                                    345 ;	se8r01-send-current.c: 80: for (n = 0; n < len; ++n)
      00815B 0F 01            [ 1]  346 	clr	(0x01, sp)
      00815D                        347 00103$:
      00815D 7B 01            [ 1]  348 	ld	a, (0x01, sp)
      00815F 11 08            [ 1]  349 	cp	a, (0x08, sp)
      008161 24 11            [ 1]  350 	jrnc	00101$
                                    351 ;	se8r01-send-current.c: 81: write_spi (array[n]);
      008163 5F               [ 1]  352 	clrw	x
      008164 7B 01            [ 1]  353 	ld	a, (0x01, sp)
      008166 97               [ 1]  354 	ld	xl, a
      008167 72 FB 06         [ 2]  355 	addw	x, (0x06, sp)
      00816A F6               [ 1]  356 	ld	a, (x)
      00816B 88               [ 1]  357 	push	a
      00816C CD 80 A8         [ 4]  358 	call	_write_spi
      00816F 84               [ 1]  359 	pop	a
                                    360 ;	se8r01-send-current.c: 80: for (n = 0; n < len; ++n)
      008170 0C 01            [ 1]  361 	inc	(0x01, sp)
      008172 20 E9            [ 2]  362 	jra	00103$
      008174                        363 00101$:
                                    364 ;	se8r01-send-current.c: 82: PC_ODR |= (1 << CSN);
      008174 AE 50 0A         [ 2]  365 	ldw	x, #0x500a
      008177 F6               [ 1]  366 	ld	a, (x)
      008178 AA 08            [ 1]  367 	or	a, #0x08
      00817A F7               [ 1]  368 	ld	(x), a
                                    369 ;	se8r01-send-current.c: 83: return (ret);
      00817B 7B 02            [ 1]  370 	ld	a, (0x02, sp)
      00817D 5B 02            [ 2]  371 	addw	sp, #2
      00817F 81               [ 4]  372 	ret
                                    373 ;	se8r01-send-current.c: 85: UCHAR read_spi_buf (UCHAR reg, UCHAR *array, UCHAR len) {
                                    374 ;	-----------------------------------------
                                    375 ;	 function read_spi_buf
                                    376 ;	-----------------------------------------
      008180                        377 _read_spi_buf:
      008180 52 02            [ 2]  378 	sub	sp, #2
                                    379 ;	se8r01-send-current.c: 87: PC_ODR &= ~(1 << CSN);
      008182 AE 50 0A         [ 2]  380 	ldw	x, #0x500a
      008185 F6               [ 1]  381 	ld	a, (x)
      008186 A4 F7            [ 1]  382 	and	a, #0xf7
      008188 F7               [ 1]  383 	ld	(x), a
                                    384 ;	se8r01-send-current.c: 88: ret = write_spi (reg);
      008189 7B 05            [ 1]  385 	ld	a, (0x05, sp)
      00818B 88               [ 1]  386 	push	a
      00818C CD 80 A8         [ 4]  387 	call	_write_spi
      00818F 5B 01            [ 2]  388 	addw	sp, #1
      008191 6B 01            [ 1]  389 	ld	(0x01, sp), a
                                    390 ;	se8r01-send-current.c: 89: for (n = 0; n < len; ++n)
      008193 0F 02            [ 1]  391 	clr	(0x02, sp)
      008195                        392 00103$:
      008195 7B 02            [ 1]  393 	ld	a, (0x02, sp)
      008197 11 08            [ 1]  394 	cp	a, (0x08, sp)
      008199 24 15            [ 1]  395 	jrnc	00101$
                                    396 ;	se8r01-send-current.c: 90: array[n] = write_spi (NOP);
      00819B 5F               [ 1]  397 	clrw	x
      00819C 7B 02            [ 1]  398 	ld	a, (0x02, sp)
      00819E 97               [ 1]  399 	ld	xl, a
      00819F 72 FB 06         [ 2]  400 	addw	x, (0x06, sp)
      0081A2 89               [ 2]  401 	pushw	x
      0081A3 4B FF            [ 1]  402 	push	#0xff
      0081A5 CD 80 A8         [ 4]  403 	call	_write_spi
      0081A8 5B 01            [ 2]  404 	addw	sp, #1
      0081AA 85               [ 2]  405 	popw	x
      0081AB F7               [ 1]  406 	ld	(x), a
                                    407 ;	se8r01-send-current.c: 89: for (n = 0; n < len; ++n)
      0081AC 0C 02            [ 1]  408 	inc	(0x02, sp)
      0081AE 20 E5            [ 2]  409 	jra	00103$
      0081B0                        410 00101$:
                                    411 ;	se8r01-send-current.c: 91: PC_ODR |= (1 << CSN);
      0081B0 AE 50 0A         [ 2]  412 	ldw	x, #0x500a
      0081B3 F6               [ 1]  413 	ld	a, (x)
      0081B4 AA 08            [ 1]  414 	or	a, #0x08
      0081B6 F7               [ 1]  415 	ld	(x), a
                                    416 ;	se8r01-send-current.c: 92: return (ret);
      0081B7 7B 01            [ 1]  417 	ld	a, (0x01, sp)
      0081B9 5B 02            [ 2]  418 	addw	sp, #2
      0081BB 81               [ 4]  419 	ret
                                    420 ;	se8r01-send-current.c: 94: void InitializeSPI () {
                                    421 ;	-----------------------------------------
                                    422 ;	 function InitializeSPI
                                    423 ;	-----------------------------------------
      0081BC                        424 _InitializeSPI:
                                    425 ;	se8r01-send-current.c: 95: SPI_CR1 = MSBFIRST | SPI_ENABLE | BR_DIV256 | MASTER | CPOL0 | CPHA0;
      0081BC AE 52 00         [ 2]  426 	ldw	x, #0x5200
      0081BF A6 7C            [ 1]  427 	ld	a, #0x7c
      0081C1 F7               [ 1]  428 	ld	(x), a
                                    429 ;	se8r01-send-current.c: 96: SPI_CR2 = BDM_2LINE | CRCEN_OFF | CRCNEXT_TXBUF | FULL_DUPLEX | SSM_DISABLE;
      0081C2 AE 52 01         [ 2]  430 	ldw	x, #0x5201
      0081C5 7F               [ 1]  431 	clr	(x)
                                    432 ;	se8r01-send-current.c: 97: SPI_ICR = TXIE_MASKED | RXIE_MASKED | ERRIE_MASKED | WKIE_MASKED;
      0081C6 AE 52 02         [ 2]  433 	ldw	x, #0x5202
      0081C9 7F               [ 1]  434 	clr	(x)
                                    435 ;	se8r01-send-current.c: 98: PC_DDR = (1 << PC3) | (1 << PC4); // output mode
      0081CA AE 50 0C         [ 2]  436 	ldw	x, #0x500c
      0081CD A6 18            [ 1]  437 	ld	a, #0x18
      0081CF F7               [ 1]  438 	ld	(x), a
                                    439 ;	se8r01-send-current.c: 99: PC_CR1 = (1 << PC3) | (1 << PC4); // push-pull
      0081D0 AE 50 0D         [ 2]  440 	ldw	x, #0x500d
      0081D3 A6 18            [ 1]  441 	ld	a, #0x18
      0081D5 F7               [ 1]  442 	ld	(x), a
                                    443 ;	se8r01-send-current.c: 100: PC_CR2 = (1 << PC3) | (1 << PC4); // up to 10MHz speed
      0081D6 AE 50 0E         [ 2]  444 	ldw	x, #0x500e
      0081D9 A6 18            [ 1]  445 	ld	a, #0x18
      0081DB F7               [ 1]  446 	ld	(x), a
                                    447 ;	se8r01-send-current.c: 102: PC_ODR &= ~(1 << CE);
      0081DC AE 50 0A         [ 2]  448 	ldw	x, #0x500a
      0081DF F6               [ 1]  449 	ld	a, (x)
      0081E0 A4 EF            [ 1]  450 	and	a, #0xef
      0081E2 F7               [ 1]  451 	ld	(x), a
      0081E3 81               [ 4]  452 	ret
                                    453 ;	se8r01-send-current.c: 104: void InitializeSystemClock() {
                                    454 ;	-----------------------------------------
                                    455 ;	 function InitializeSystemClock
                                    456 ;	-----------------------------------------
      0081E4                        457 _InitializeSystemClock:
                                    458 ;	se8r01-send-current.c: 105: CLK_ICKR = 0;                       //  Reset the Internal Clock Register.
      0081E4 AE 50 C0         [ 2]  459 	ldw	x, #0x50c0
      0081E7 7F               [ 1]  460 	clr	(x)
                                    461 ;	se8r01-send-current.c: 106: CLK_ICKR = CLK_HSIEN;               //  Enable the HSI.
      0081E8 AE 50 C0         [ 2]  462 	ldw	x, #0x50c0
      0081EB A6 01            [ 1]  463 	ld	a, #0x01
      0081ED F7               [ 1]  464 	ld	(x), a
                                    465 ;	se8r01-send-current.c: 107: CLK_ECKR = 0;                       //  Disable the external clock.
      0081EE AE 50 C1         [ 2]  466 	ldw	x, #0x50c1
      0081F1 7F               [ 1]  467 	clr	(x)
                                    468 ;	se8r01-send-current.c: 108: while ((CLK_ICKR & CLK_HSIRDY) == 0);       //  Wait for the HSI to be ready for use.
      0081F2                        469 00101$:
      0081F2 AE 50 C0         [ 2]  470 	ldw	x, #0x50c0
      0081F5 F6               [ 1]  471 	ld	a, (x)
      0081F6 A5 02            [ 1]  472 	bcp	a, #0x02
      0081F8 27 F8            [ 1]  473 	jreq	00101$
                                    474 ;	se8r01-send-current.c: 109: CLK_CKDIVR = 0;                     //  Ensure the clocks are running at full speed.
      0081FA AE 50 C6         [ 2]  475 	ldw	x, #0x50c6
      0081FD 7F               [ 1]  476 	clr	(x)
                                    477 ;	se8r01-send-current.c: 110: CLK_PCKENR1 = 0xff;                 //  Enable all peripheral clocks.
      0081FE AE 50 C7         [ 2]  478 	ldw	x, #0x50c7
      008201 A6 FF            [ 1]  479 	ld	a, #0xff
      008203 F7               [ 1]  480 	ld	(x), a
                                    481 ;	se8r01-send-current.c: 111: CLK_PCKENR2 = 0xff;                 //  Ditto.
      008204 AE 50 CA         [ 2]  482 	ldw	x, #0x50ca
      008207 A6 FF            [ 1]  483 	ld	a, #0xff
      008209 F7               [ 1]  484 	ld	(x), a
                                    485 ;	se8r01-send-current.c: 112: CLK_CCOR = 0;                       //  Turn off CCO.
      00820A AE 50 C9         [ 2]  486 	ldw	x, #0x50c9
      00820D 7F               [ 1]  487 	clr	(x)
                                    488 ;	se8r01-send-current.c: 113: CLK_HSITRIMR = 0;                   //  Turn off any HSIU trimming.
      00820E AE 50 CC         [ 2]  489 	ldw	x, #0x50cc
      008211 7F               [ 1]  490 	clr	(x)
                                    491 ;	se8r01-send-current.c: 114: CLK_SWIMCCR = 0;                    //  Set SWIM to run at clock / 2.
      008212 AE 50 CD         [ 2]  492 	ldw	x, #0x50cd
      008215 7F               [ 1]  493 	clr	(x)
                                    494 ;	se8r01-send-current.c: 115: CLK_SWR = 0xe1;                     //  Use HSI as the clock source.
      008216 AE 50 C4         [ 2]  495 	ldw	x, #0x50c4
      008219 A6 E1            [ 1]  496 	ld	a, #0xe1
      00821B F7               [ 1]  497 	ld	(x), a
                                    498 ;	se8r01-send-current.c: 116: CLK_SWCR = 0;                       //  Reset the clock switch control register.
      00821C AE 50 C5         [ 2]  499 	ldw	x, #0x50c5
      00821F 7F               [ 1]  500 	clr	(x)
                                    501 ;	se8r01-send-current.c: 117: CLK_SWCR = CLK_SWEN;                //  Enable switching.
      008220 AE 50 C5         [ 2]  502 	ldw	x, #0x50c5
      008223 A6 02            [ 1]  503 	ld	a, #0x02
      008225 F7               [ 1]  504 	ld	(x), a
                                    505 ;	se8r01-send-current.c: 118: while ((CLK_SWCR & CLK_SWBSY) != 0);        //  Pause while the clock switch is busy.
      008226                        506 00104$:
      008226 AE 50 C5         [ 2]  507 	ldw	x, #0x50c5
      008229 F6               [ 1]  508 	ld	a, (x)
      00822A 44               [ 1]  509 	srl	a
      00822B 25 F9            [ 1]  510 	jrc	00104$
      00822D 81               [ 4]  511 	ret
                                    512 ;	se8r01-send-current.c: 120: void delay (int time_ms) {
                                    513 ;	-----------------------------------------
                                    514 ;	 function delay
                                    515 ;	-----------------------------------------
      00822E                        516 _delay:
      00822E 52 0A            [ 2]  517 	sub	sp, #10
                                    518 ;	se8r01-send-current.c: 122: for (x = 0; x < 1036*time_ms; ++x)
      008230 5F               [ 1]  519 	clrw	x
      008231 1F 03            [ 2]  520 	ldw	(0x03, sp), x
      008233 1F 01            [ 2]  521 	ldw	(0x01, sp), x
      008235 1E 0D            [ 2]  522 	ldw	x, (0x0d, sp)
      008237 89               [ 2]  523 	pushw	x
      008238 4B 0C            [ 1]  524 	push	#0x0c
      00823A 4B 04            [ 1]  525 	push	#0x04
      00823C CD 89 0D         [ 4]  526 	call	__mulint
      00823F 5B 04            [ 2]  527 	addw	sp, #4
      008241 1F 09            [ 2]  528 	ldw	(0x09, sp), x
      008243                        529 00103$:
      008243 16 09            [ 2]  530 	ldw	y, (0x09, sp)
      008245 17 07            [ 2]  531 	ldw	(0x07, sp), y
      008247 7B 07            [ 1]  532 	ld	a, (0x07, sp)
      008249 49               [ 1]  533 	rlc	a
      00824A 4F               [ 1]  534 	clr	a
      00824B A2 00            [ 1]  535 	sbc	a, #0x00
      00824D 6B 06            [ 1]  536 	ld	(0x06, sp), a
      00824F 6B 05            [ 1]  537 	ld	(0x05, sp), a
      008251 1E 03            [ 2]  538 	ldw	x, (0x03, sp)
      008253 13 07            [ 2]  539 	cpw	x, (0x07, sp)
      008255 7B 02            [ 1]  540 	ld	a, (0x02, sp)
      008257 12 06            [ 1]  541 	sbc	a, (0x06, sp)
      008259 7B 01            [ 1]  542 	ld	a, (0x01, sp)
      00825B 12 05            [ 1]  543 	sbc	a, (0x05, sp)
      00825D 2E 17            [ 1]  544 	jrsge	00105$
                                    545 ;	se8r01-send-current.c: 123: __asm__("nop");
      00825F 9D               [ 1]  546 	nop
                                    547 ;	se8r01-send-current.c: 122: for (x = 0; x < 1036*time_ms; ++x)
      008260 16 03            [ 2]  548 	ldw	y, (0x03, sp)
      008262 72 A9 00 01      [ 2]  549 	addw	y, #0x0001
      008266 7B 02            [ 1]  550 	ld	a, (0x02, sp)
      008268 A9 00            [ 1]  551 	adc	a, #0x00
      00826A 97               [ 1]  552 	ld	xl, a
      00826B 7B 01            [ 1]  553 	ld	a, (0x01, sp)
      00826D A9 00            [ 1]  554 	adc	a, #0x00
      00826F 95               [ 1]  555 	ld	xh, a
      008270 17 03            [ 2]  556 	ldw	(0x03, sp), y
      008272 1F 01            [ 2]  557 	ldw	(0x01, sp), x
      008274 20 CD            [ 2]  558 	jra	00103$
      008276                        559 00105$:
      008276 5B 0A            [ 2]  560 	addw	sp, #10
      008278 81               [ 4]  561 	ret
                                    562 ;	se8r01-send-current.c: 128: void UARTPrintF (char *message) {
                                    563 ;	-----------------------------------------
                                    564 ;	 function UARTPrintF
                                    565 ;	-----------------------------------------
      008279                        566 _UARTPrintF:
                                    567 ;	se8r01-send-current.c: 129: char *ch = message;
      008279 16 03            [ 2]  568 	ldw	y, (0x03, sp)
                                    569 ;	se8r01-send-current.c: 130: while (*ch) {
      00827B                        570 00104$:
      00827B 90 F6            [ 1]  571 	ld	a, (y)
      00827D 4D               [ 1]  572 	tnz	a
      00827E 27 0F            [ 1]  573 	jreq	00107$
                                    574 ;	se8r01-send-current.c: 131: UART1_DR = (unsigned char) *ch;     //  Put the next character into the data transmission register.
      008280 AE 52 31         [ 2]  575 	ldw	x, #0x5231
      008283 F7               [ 1]  576 	ld	(x), a
                                    577 ;	se8r01-send-current.c: 132: while ((UART1_SR & SR_TXE) == 0);   //  Wait for transmission to complete.
      008284                        578 00101$:
      008284 AE 52 30         [ 2]  579 	ldw	x, #0x5230
      008287 F6               [ 1]  580 	ld	a, (x)
      008288 48               [ 1]  581 	sll	a
      008289 24 F9            [ 1]  582 	jrnc	00101$
                                    583 ;	se8r01-send-current.c: 133: ch++;                               //  Grab the next character.
      00828B 90 5C            [ 2]  584 	incw	y
      00828D 20 EC            [ 2]  585 	jra	00104$
      00828F                        586 00107$:
      00828F 81               [ 4]  587 	ret
                                    588 ;	se8r01-send-current.c: 136: void print_UCHAR_hex (unsigned char buffer) {
                                    589 ;	-----------------------------------------
                                    590 ;	 function print_UCHAR_hex
                                    591 ;	-----------------------------------------
      008290                        592 _print_UCHAR_hex:
      008290 52 0C            [ 2]  593 	sub	sp, #12
                                    594 ;	se8r01-send-current.c: 139: a = (buffer >> 4);
      008292 7B 0F            [ 1]  595 	ld	a, (0x0f, sp)
      008294 4E               [ 1]  596 	swap	a
      008295 A4 0F            [ 1]  597 	and	a, #0x0f
      008297 5F               [ 1]  598 	clrw	x
      008298 97               [ 1]  599 	ld	xl, a
                                    600 ;	se8r01-send-current.c: 140: if (a > 9)
      008299 A3 00 09         [ 2]  601 	cpw	x, #0x0009
      00829C 2D 07            [ 1]  602 	jrsle	00102$
                                    603 ;	se8r01-send-current.c: 141: a = a + 'a' - 10;
      00829E 1C 00 57         [ 2]  604 	addw	x, #0x0057
      0082A1 1F 0B            [ 2]  605 	ldw	(0x0b, sp), x
      0082A3 20 05            [ 2]  606 	jra	00103$
      0082A5                        607 00102$:
                                    608 ;	se8r01-send-current.c: 143: a += '0'; 
      0082A5 1C 00 30         [ 2]  609 	addw	x, #0x0030
      0082A8 1F 0B            [ 2]  610 	ldw	(0x0b, sp), x
      0082AA                        611 00103$:
                                    612 ;	se8r01-send-current.c: 144: b = buffer & 0x0f;
      0082AA 7B 0F            [ 1]  613 	ld	a, (0x0f, sp)
      0082AC A4 0F            [ 1]  614 	and	a, #0x0f
      0082AE 5F               [ 1]  615 	clrw	x
      0082AF 97               [ 1]  616 	ld	xl, a
                                    617 ;	se8r01-send-current.c: 145: if (b > 9)
      0082B0 A3 00 09         [ 2]  618 	cpw	x, #0x0009
      0082B3 2D 07            [ 1]  619 	jrsle	00105$
                                    620 ;	se8r01-send-current.c: 146: b = b + 'a' - 10;
      0082B5 1C 00 57         [ 2]  621 	addw	x, #0x0057
      0082B8 1F 09            [ 2]  622 	ldw	(0x09, sp), x
      0082BA 20 05            [ 2]  623 	jra	00106$
      0082BC                        624 00105$:
                                    625 ;	se8r01-send-current.c: 148: b += '0'; 
      0082BC 1C 00 30         [ 2]  626 	addw	x, #0x0030
      0082BF 1F 09            [ 2]  627 	ldw	(0x09, sp), x
      0082C1                        628 00106$:
                                    629 ;	se8r01-send-current.c: 149: message[0] = a;
      0082C1 90 96            [ 1]  630 	ldw	y, sp
      0082C3 90 5C            [ 2]  631 	incw	y
      0082C5 7B 0C            [ 1]  632 	ld	a, (0x0c, sp)
      0082C7 90 F7            [ 1]  633 	ld	(y), a
                                    634 ;	se8r01-send-current.c: 150: message[1] = b;
      0082C9 93               [ 1]  635 	ldw	x, y
      0082CA 5C               [ 2]  636 	incw	x
      0082CB 7B 0A            [ 1]  637 	ld	a, (0x0a, sp)
      0082CD F7               [ 1]  638 	ld	(x), a
                                    639 ;	se8r01-send-current.c: 151: message[2] = 0;
      0082CE 93               [ 1]  640 	ldw	x, y
      0082CF 5C               [ 2]  641 	incw	x
      0082D0 5C               [ 2]  642 	incw	x
      0082D1 7F               [ 1]  643 	clr	(x)
                                    644 ;	se8r01-send-current.c: 152: UARTPrintF (message);
      0082D2 90 89            [ 2]  645 	pushw	y
      0082D4 CD 82 79         [ 4]  646 	call	_UARTPrintF
      0082D7 5B 02            [ 2]  647 	addw	sp, #2
      0082D9 5B 0C            [ 2]  648 	addw	sp, #12
      0082DB 81               [ 4]  649 	ret
                                    650 ;	se8r01-send-current.c: 155: void InitializeUART() {
                                    651 ;	-----------------------------------------
                                    652 ;	 function InitializeUART
                                    653 ;	-----------------------------------------
      0082DC                        654 _InitializeUART:
                                    655 ;	se8r01-send-current.c: 165: UART1_CR1 = 0;
      0082DC AE 52 34         [ 2]  656 	ldw	x, #0x5234
      0082DF 7F               [ 1]  657 	clr	(x)
                                    658 ;	se8r01-send-current.c: 166: UART1_CR2 = 0;
      0082E0 AE 52 35         [ 2]  659 	ldw	x, #0x5235
      0082E3 7F               [ 1]  660 	clr	(x)
                                    661 ;	se8r01-send-current.c: 167: UART1_CR4 = 0;
      0082E4 AE 52 37         [ 2]  662 	ldw	x, #0x5237
      0082E7 7F               [ 1]  663 	clr	(x)
                                    664 ;	se8r01-send-current.c: 168: UART1_CR3 = 0;
      0082E8 AE 52 36         [ 2]  665 	ldw	x, #0x5236
      0082EB 7F               [ 1]  666 	clr	(x)
                                    667 ;	se8r01-send-current.c: 169: UART1_CR5 = 0;
      0082EC AE 52 38         [ 2]  668 	ldw	x, #0x5238
      0082EF 7F               [ 1]  669 	clr	(x)
                                    670 ;	se8r01-send-current.c: 170: UART1_GTR = 0;
      0082F0 AE 52 39         [ 2]  671 	ldw	x, #0x5239
      0082F3 7F               [ 1]  672 	clr	(x)
                                    673 ;	se8r01-send-current.c: 171: UART1_PSCR = 0;
      0082F4 AE 52 3A         [ 2]  674 	ldw	x, #0x523a
      0082F7 7F               [ 1]  675 	clr	(x)
                                    676 ;	se8r01-send-current.c: 175: UNSET (UART1_CR1, CR1_M);        //  8 Data bits.
      0082F8 AE 52 34         [ 2]  677 	ldw	x, #0x5234
      0082FB F6               [ 1]  678 	ld	a, (x)
      0082FC A4 EF            [ 1]  679 	and	a, #0xef
      0082FE F7               [ 1]  680 	ld	(x), a
                                    681 ;	se8r01-send-current.c: 176: UNSET (UART1_CR1, CR1_PCEN);     //  Disable parity.
      0082FF AE 52 34         [ 2]  682 	ldw	x, #0x5234
      008302 F6               [ 1]  683 	ld	a, (x)
      008303 A4 FB            [ 1]  684 	and	a, #0xfb
      008305 F7               [ 1]  685 	ld	(x), a
                                    686 ;	se8r01-send-current.c: 177: UNSET (UART1_CR3, CR3_STOPH);    //  1 stop bit.
      008306 AE 52 36         [ 2]  687 	ldw	x, #0x5236
      008309 F6               [ 1]  688 	ld	a, (x)
      00830A A4 DF            [ 1]  689 	and	a, #0xdf
      00830C F7               [ 1]  690 	ld	(x), a
                                    691 ;	se8r01-send-current.c: 178: UNSET (UART1_CR3, CR3_STOPL);    //  1 stop bit.
      00830D AE 52 36         [ 2]  692 	ldw	x, #0x5236
      008310 F6               [ 1]  693 	ld	a, (x)
      008311 A4 EF            [ 1]  694 	and	a, #0xef
      008313 F7               [ 1]  695 	ld	(x), a
                                    696 ;	se8r01-send-current.c: 179: UART1_BRR2 = 0x0a;      //  Set the baud rate registers to 115200 baud
      008314 AE 52 33         [ 2]  697 	ldw	x, #0x5233
      008317 A6 0A            [ 1]  698 	ld	a, #0x0a
      008319 F7               [ 1]  699 	ld	(x), a
                                    700 ;	se8r01-send-current.c: 180: UART1_BRR1 = 0x08;      //  based upon a 16 MHz system clock.
      00831A AE 52 32         [ 2]  701 	ldw	x, #0x5232
      00831D A6 08            [ 1]  702 	ld	a, #0x08
      00831F F7               [ 1]  703 	ld	(x), a
                                    704 ;	se8r01-send-current.c: 184: UNSET (UART1_CR2, CR2_TEN);      //  Disable transmit.
      008320 AE 52 35         [ 2]  705 	ldw	x, #0x5235
      008323 F6               [ 1]  706 	ld	a, (x)
      008324 A4 F7            [ 1]  707 	and	a, #0xf7
      008326 F7               [ 1]  708 	ld	(x), a
                                    709 ;	se8r01-send-current.c: 185: UNSET (UART1_CR2, CR2_REN);      //  Disable receive.
      008327 AE 52 35         [ 2]  710 	ldw	x, #0x5235
      00832A F6               [ 1]  711 	ld	a, (x)
      00832B A4 FB            [ 1]  712 	and	a, #0xfb
      00832D F7               [ 1]  713 	ld	(x), a
                                    714 ;	se8r01-send-current.c: 189: SET (UART1_CR3, CR3_CPOL);
      00832E AE 52 36         [ 2]  715 	ldw	x, #0x5236
      008331 F6               [ 1]  716 	ld	a, (x)
      008332 AA 04            [ 1]  717 	or	a, #0x04
      008334 F7               [ 1]  718 	ld	(x), a
                                    719 ;	se8r01-send-current.c: 190: SET (UART1_CR3, CR3_CPHA);
      008335 AE 52 36         [ 2]  720 	ldw	x, #0x5236
      008338 F6               [ 1]  721 	ld	a, (x)
      008339 AA 02            [ 1]  722 	or	a, #0x02
      00833B F7               [ 1]  723 	ld	(x), a
                                    724 ;	se8r01-send-current.c: 191: SET (UART1_CR3, CR3_LBCL);
      00833C 72 10 52 36      [ 1]  725 	bset	0x5236, #0
                                    726 ;	se8r01-send-current.c: 195: SET (UART1_CR2, CR2_TEN);
      008340 AE 52 35         [ 2]  727 	ldw	x, #0x5235
      008343 F6               [ 1]  728 	ld	a, (x)
      008344 AA 08            [ 1]  729 	or	a, #0x08
      008346 F7               [ 1]  730 	ld	(x), a
                                    731 ;	se8r01-send-current.c: 196: SET (UART1_CR2, CR2_REN);
      008347 AE 52 35         [ 2]  732 	ldw	x, #0x5235
      00834A F6               [ 1]  733 	ld	a, (x)
      00834B AA 04            [ 1]  734 	or	a, #0x04
      00834D F7               [ 1]  735 	ld	(x), a
                                    736 ;	se8r01-send-current.c: 197: UART1_CR3 = CR3_CLKEN;
      00834E AE 52 36         [ 2]  737 	ldw	x, #0x5236
      008351 A6 08            [ 1]  738 	ld	a, #0x08
      008353 F7               [ 1]  739 	ld	(x), a
      008354 81               [ 4]  740 	ret
                                    741 ;	se8r01-send-current.c: 270: void init_io(void)
                                    742 ;	-----------------------------------------
                                    743 ;	 function init_io
                                    744 ;	-----------------------------------------
      008355                        745 _init_io:
                                    746 ;	se8r01-send-current.c: 279: PC_ODR &= ~(1 << CE);
      008355 AE 50 0A         [ 2]  747 	ldw	x, #0x500a
      008358 F6               [ 1]  748 	ld	a, (x)
      008359 A4 EF            [ 1]  749 	and	a, #0xef
      00835B F7               [ 1]  750 	ld	(x), a
                                    751 ;	se8r01-send-current.c: 281: PC_ODR |= (1 << CSN);
      00835C AE 50 0A         [ 2]  752 	ldw	x, #0x500a
      00835F F6               [ 1]  753 	ld	a, (x)
      008360 AA 08            [ 1]  754 	or	a, #0x08
      008362 F7               [ 1]  755 	ld	(x), a
      008363 81               [ 4]  756 	ret
                                    757 ;	se8r01-send-current.c: 287: void rf_switch_bank(unsigned char bankindex)
                                    758 ;	-----------------------------------------
                                    759 ;	 function rf_switch_bank
                                    760 ;	-----------------------------------------
      008364                        761 _rf_switch_bank:
      008364 88               [ 1]  762 	push	a
                                    763 ;	se8r01-send-current.c: 290: temp1 = bankindex;
      008365 7B 04            [ 1]  764 	ld	a, (0x04, sp)
      008367 6B 01            [ 1]  765 	ld	(0x01, sp), a
                                    766 ;	se8r01-send-current.c: 292: temp0 = write_spi(iRF_BANK0_STATUS);
      008369 4B 07            [ 1]  767 	push	#0x07
      00836B CD 80 A8         [ 4]  768 	call	_write_spi
      00836E 5B 01            [ 2]  769 	addw	sp, #1
                                    770 ;	se8r01-send-current.c: 294: if((temp0&0x80)!=temp1)
      008370 A4 80            [ 1]  771 	and	a, #0x80
      008372 11 01            [ 1]  772 	cp	a, (0x01, sp)
      008374 27 09            [ 1]  773 	jreq	00103$
                                    774 ;	se8r01-send-current.c: 296: write_spi_reg(iRF_CMD_ACTIVATE,0x53);
      008376 4B 53            [ 1]  775 	push	#0x53
      008378 4B 50            [ 1]  776 	push	#0x50
      00837A CD 80 CE         [ 4]  777 	call	_write_spi_reg
      00837D 5B 02            [ 2]  778 	addw	sp, #2
      00837F                        779 00103$:
      00837F 84               [ 1]  780 	pop	a
      008380 81               [ 4]  781 	ret
                                    782 ;	se8r01-send-current.c: 303: void SE8R01_Calibration()
                                    783 ;	-----------------------------------------
                                    784 ;	 function SE8R01_Calibration
                                    785 ;	-----------------------------------------
      008381                        786 _SE8R01_Calibration:
      008381 52 0D            [ 2]  787 	sub	sp, #13
                                    788 ;	se8r01-send-current.c: 306: rf_switch_bank(iBANK0);
      008383 4B 00            [ 1]  789 	push	#0x00
      008385 CD 83 64         [ 4]  790 	call	_rf_switch_bank
      008388 84               [ 1]  791 	pop	a
                                    792 ;	se8r01-send-current.c: 307: temp[0]=0x03;
      008389 96               [ 1]  793 	ldw	x, sp
      00838A 5C               [ 2]  794 	incw	x
      00838B 1F 06            [ 2]  795 	ldw	(0x06, sp), x
      00838D 1E 06            [ 2]  796 	ldw	x, (0x06, sp)
      00838F A6 03            [ 1]  797 	ld	a, #0x03
      008391 F7               [ 1]  798 	ld	(x), a
                                    799 ;	se8r01-send-current.c: 308: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_CONFIG,temp, 1);
      008392 1E 06            [ 2]  800 	ldw	x, (0x06, sp)
      008394 4B 01            [ 1]  801 	push	#0x01
      008396 89               [ 2]  802 	pushw	x
      008397 4B 20            [ 1]  803 	push	#0x20
      008399 CD 81 48         [ 4]  804 	call	_write_spi_buf
      00839C 5B 04            [ 2]  805 	addw	sp, #4
                                    806 ;	se8r01-send-current.c: 310: temp[0]=0x32;
      00839E 1E 06            [ 2]  807 	ldw	x, (0x06, sp)
      0083A0 A6 32            [ 1]  808 	ld	a, #0x32
      0083A2 F7               [ 1]  809 	ld	(x), a
                                    810 ;	se8r01-send-current.c: 312: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_RF_CH, temp,1);
      0083A3 1E 06            [ 2]  811 	ldw	x, (0x06, sp)
      0083A5 4B 01            [ 1]  812 	push	#0x01
      0083A7 89               [ 2]  813 	pushw	x
      0083A8 4B 25            [ 1]  814 	push	#0x25
      0083AA CD 81 48         [ 4]  815 	call	_write_spi_buf
      0083AD 5B 04            [ 2]  816 	addw	sp, #4
                                    817 ;	se8r01-send-current.c: 316: if (SE8R01_DR_2M==1)
      0083AF CE 00 10         [ 2]  818 	ldw	x, _SE8R01_DR_2M+0
      0083B2 A3 00 01         [ 2]  819 	cpw	x, #0x0001
      0083B5 26 07            [ 1]  820 	jrne	00105$
                                    821 ;	se8r01-send-current.c: 317: {temp[0]=0x48;}
      0083B7 1E 06            [ 2]  822 	ldw	x, (0x06, sp)
      0083B9 A6 48            [ 1]  823 	ld	a, #0x48
      0083BB F7               [ 1]  824 	ld	(x), a
      0083BC 20 14            [ 2]  825 	jra	00106$
      0083BE                        826 00105$:
                                    827 ;	se8r01-send-current.c: 318: else if (SE8R01_DR_1M==1)
      0083BE CE 00 12         [ 2]  828 	ldw	x, _SE8R01_DR_1M+0
      0083C1 A3 00 01         [ 2]  829 	cpw	x, #0x0001
      0083C4 26 07            [ 1]  830 	jrne	00102$
                                    831 ;	se8r01-send-current.c: 319: {temp[0]=0x40;}
      0083C6 1E 06            [ 2]  832 	ldw	x, (0x06, sp)
      0083C8 A6 40            [ 1]  833 	ld	a, #0x40
      0083CA F7               [ 1]  834 	ld	(x), a
      0083CB 20 05            [ 2]  835 	jra	00106$
      0083CD                        836 00102$:
                                    837 ;	se8r01-send-current.c: 321: {temp[0]=0x68;}   
      0083CD 1E 06            [ 2]  838 	ldw	x, (0x06, sp)
      0083CF A6 68            [ 1]  839 	ld	a, #0x68
      0083D1 F7               [ 1]  840 	ld	(x), a
      0083D2                        841 00106$:
                                    842 ;	se8r01-send-current.c: 323: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_RF_SETUP,temp,1);
      0083D2 1E 06            [ 2]  843 	ldw	x, (0x06, sp)
      0083D4 4B 01            [ 1]  844 	push	#0x01
      0083D6 89               [ 2]  845 	pushw	x
      0083D7 4B 26            [ 1]  846 	push	#0x26
      0083D9 CD 81 48         [ 4]  847 	call	_write_spi_buf
      0083DC 5B 04            [ 2]  848 	addw	sp, #4
                                    849 ;	se8r01-send-current.c: 324: temp[0]=0x77;
      0083DE 1E 06            [ 2]  850 	ldw	x, (0x06, sp)
      0083E0 A6 77            [ 1]  851 	ld	a, #0x77
      0083E2 F7               [ 1]  852 	ld	(x), a
                                    853 ;	se8r01-send-current.c: 325: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_PRE_GURD, temp,1);
      0083E3 1E 06            [ 2]  854 	ldw	x, (0x06, sp)
      0083E5 4B 01            [ 1]  855 	push	#0x01
      0083E7 89               [ 2]  856 	pushw	x
      0083E8 4B 3F            [ 1]  857 	push	#0x3f
      0083EA CD 81 48         [ 4]  858 	call	_write_spi_buf
      0083ED 5B 04            [ 2]  859 	addw	sp, #4
                                    860 ;	se8r01-send-current.c: 327: rf_switch_bank(iBANK1);
      0083EF 4B 80            [ 1]  861 	push	#0x80
      0083F1 CD 83 64         [ 4]  862 	call	_rf_switch_bank
      0083F4 84               [ 1]  863 	pop	a
                                    864 ;	se8r01-send-current.c: 328: temp[0]=0x40;
      0083F5 1E 06            [ 2]  865 	ldw	x, (0x06, sp)
      0083F7 A6 40            [ 1]  866 	ld	a, #0x40
      0083F9 F7               [ 1]  867 	ld	(x), a
                                    868 ;	se8r01-send-current.c: 329: temp[1]=0x00;
      0083FA 1E 06            [ 2]  869 	ldw	x, (0x06, sp)
      0083FC 5C               [ 2]  870 	incw	x
      0083FD 1F 0C            [ 2]  871 	ldw	(0x0c, sp), x
      0083FF 1E 0C            [ 2]  872 	ldw	x, (0x0c, sp)
      008401 7F               [ 1]  873 	clr	(x)
                                    874 ;	se8r01-send-current.c: 330: temp[2]=0x10;
      008402 1E 06            [ 2]  875 	ldw	x, (0x06, sp)
      008404 5C               [ 2]  876 	incw	x
      008405 5C               [ 2]  877 	incw	x
      008406 1F 0A            [ 2]  878 	ldw	(0x0a, sp), x
      008408 1E 0A            [ 2]  879 	ldw	x, (0x0a, sp)
      00840A A6 10            [ 1]  880 	ld	a, #0x10
      00840C F7               [ 1]  881 	ld	(x), a
                                    882 ;	se8r01-send-current.c: 332: {temp[3]=0xE6;}
      00840D 1E 06            [ 2]  883 	ldw	x, (0x06, sp)
      00840F 1C 00 03         [ 2]  884 	addw	x, #0x0003
      008412 1F 08            [ 2]  885 	ldw	(0x08, sp), x
                                    886 ;	se8r01-send-current.c: 331: if (SE8R01_DR_2M==1)
      008414 CE 00 10         [ 2]  887 	ldw	x, _SE8R01_DR_2M+0
      008417 A3 00 01         [ 2]  888 	cpw	x, #0x0001
      00841A 26 07            [ 1]  889 	jrne	00108$
                                    890 ;	se8r01-send-current.c: 332: {temp[3]=0xE6;}
      00841C 1E 08            [ 2]  891 	ldw	x, (0x08, sp)
      00841E A6 E6            [ 1]  892 	ld	a, #0xe6
      008420 F7               [ 1]  893 	ld	(x), a
      008421 20 05            [ 2]  894 	jra	00109$
      008423                        895 00108$:
                                    896 ;	se8r01-send-current.c: 334: {temp[3]=0xE4;}
      008423 1E 08            [ 2]  897 	ldw	x, (0x08, sp)
      008425 A6 E4            [ 1]  898 	ld	a, #0xe4
      008427 F7               [ 1]  899 	ld	(x), a
      008428                        900 00109$:
                                    901 ;	se8r01-send-current.c: 336: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_PLL_CTL0, temp, 4);
      008428 1E 06            [ 2]  902 	ldw	x, (0x06, sp)
      00842A 4B 04            [ 1]  903 	push	#0x04
      00842C 89               [ 2]  904 	pushw	x
      00842D 4B 21            [ 1]  905 	push	#0x21
      00842F CD 81 48         [ 4]  906 	call	_write_spi_buf
      008432 5B 04            [ 2]  907 	addw	sp, #4
                                    908 ;	se8r01-send-current.c: 338: temp[0]=0x20;
      008434 1E 06            [ 2]  909 	ldw	x, (0x06, sp)
      008436 A6 20            [ 1]  910 	ld	a, #0x20
      008438 F7               [ 1]  911 	ld	(x), a
                                    912 ;	se8r01-send-current.c: 339: temp[1]=0x08;
      008439 1E 0C            [ 2]  913 	ldw	x, (0x0c, sp)
      00843B A6 08            [ 1]  914 	ld	a, #0x08
      00843D F7               [ 1]  915 	ld	(x), a
                                    916 ;	se8r01-send-current.c: 340: temp[2]=0x50;
      00843E 1E 0A            [ 2]  917 	ldw	x, (0x0a, sp)
      008440 A6 50            [ 1]  918 	ld	a, #0x50
      008442 F7               [ 1]  919 	ld	(x), a
                                    920 ;	se8r01-send-current.c: 341: temp[3]=0x40;
      008443 1E 08            [ 2]  921 	ldw	x, (0x08, sp)
      008445 A6 40            [ 1]  922 	ld	a, #0x40
      008447 F7               [ 1]  923 	ld	(x), a
                                    924 ;	se8r01-send-current.c: 342: temp[4]=0x50;
      008448 1E 06            [ 2]  925 	ldw	x, (0x06, sp)
      00844A A6 50            [ 1]  926 	ld	a, #0x50
      00844C E7 04            [ 1]  927 	ld	(0x0004, x), a
                                    928 ;	se8r01-send-current.c: 343: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_CAL_CTL, temp, 5);
      00844E 1E 06            [ 2]  929 	ldw	x, (0x06, sp)
      008450 4B 05            [ 1]  930 	push	#0x05
      008452 89               [ 2]  931 	pushw	x
      008453 4B 23            [ 1]  932 	push	#0x23
      008455 CD 81 48         [ 4]  933 	call	_write_spi_buf
      008458 5B 04            [ 2]  934 	addw	sp, #4
                                    935 ;	se8r01-send-current.c: 345: temp[0]=0x00;
      00845A 1E 06            [ 2]  936 	ldw	x, (0x06, sp)
      00845C 7F               [ 1]  937 	clr	(x)
                                    938 ;	se8r01-send-current.c: 346: temp[1]=0x00;
      00845D 1E 0C            [ 2]  939 	ldw	x, (0x0c, sp)
      00845F 7F               [ 1]  940 	clr	(x)
                                    941 ;	se8r01-send-current.c: 347: if (SE8R01_DR_2M==1)
      008460 CE 00 10         [ 2]  942 	ldw	x, _SE8R01_DR_2M+0
      008463 A3 00 01         [ 2]  943 	cpw	x, #0x0001
      008466 26 07            [ 1]  944 	jrne	00111$
                                    945 ;	se8r01-send-current.c: 348: { temp[2]=0x1E;}
      008468 1E 0A            [ 2]  946 	ldw	x, (0x0a, sp)
      00846A A6 1E            [ 1]  947 	ld	a, #0x1e
      00846C F7               [ 1]  948 	ld	(x), a
      00846D 20 05            [ 2]  949 	jra	00112$
      00846F                        950 00111$:
                                    951 ;	se8r01-send-current.c: 350: { temp[2]=0x1F;}
      00846F 1E 0A            [ 2]  952 	ldw	x, (0x0a, sp)
      008471 A6 1F            [ 1]  953 	ld	a, #0x1f
      008473 F7               [ 1]  954 	ld	(x), a
      008474                        955 00112$:
                                    956 ;	se8r01-send-current.c: 352: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_IF_FREQ, temp, 3);
      008474 1E 06            [ 2]  957 	ldw	x, (0x06, sp)
      008476 4B 03            [ 1]  958 	push	#0x03
      008478 89               [ 2]  959 	pushw	x
      008479 4B 2A            [ 1]  960 	push	#0x2a
      00847B CD 81 48         [ 4]  961 	call	_write_spi_buf
      00847E 5B 04            [ 2]  962 	addw	sp, #4
                                    963 ;	se8r01-send-current.c: 354: if (SE8R01_DR_2M==1)
      008480 CE 00 10         [ 2]  964 	ldw	x, _SE8R01_DR_2M+0
      008483 A3 00 01         [ 2]  965 	cpw	x, #0x0001
      008486 26 07            [ 1]  966 	jrne	00114$
                                    967 ;	se8r01-send-current.c: 355: { temp[0]=0x29;}
      008488 1E 06            [ 2]  968 	ldw	x, (0x06, sp)
      00848A A6 29            [ 1]  969 	ld	a, #0x29
      00848C F7               [ 1]  970 	ld	(x), a
      00848D 20 05            [ 2]  971 	jra	00115$
      00848F                        972 00114$:
                                    973 ;	se8r01-send-current.c: 357: { temp[0]=0x14;}
      00848F 1E 06            [ 2]  974 	ldw	x, (0x06, sp)
      008491 A6 14            [ 1]  975 	ld	a, #0x14
      008493 F7               [ 1]  976 	ld	(x), a
      008494                        977 00115$:
                                    978 ;	se8r01-send-current.c: 359: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_FDEV, temp, 1);
      008494 1E 06            [ 2]  979 	ldw	x, (0x06, sp)
      008496 4B 01            [ 1]  980 	push	#0x01
      008498 89               [ 2]  981 	pushw	x
      008499 4B 2C            [ 1]  982 	push	#0x2c
      00849B CD 81 48         [ 4]  983 	call	_write_spi_buf
      00849E 5B 04            [ 2]  984 	addw	sp, #4
                                    985 ;	se8r01-send-current.c: 361: temp[0]=0x00;
      0084A0 1E 06            [ 2]  986 	ldw	x, (0x06, sp)
      0084A2 7F               [ 1]  987 	clr	(x)
                                    988 ;	se8r01-send-current.c: 362: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_DAC_CAL_LOW,temp,1);
      0084A3 1E 06            [ 2]  989 	ldw	x, (0x06, sp)
      0084A5 4B 01            [ 1]  990 	push	#0x01
      0084A7 89               [ 2]  991 	pushw	x
      0084A8 4B 37            [ 1]  992 	push	#0x37
      0084AA CD 81 48         [ 4]  993 	call	_write_spi_buf
      0084AD 5B 04            [ 2]  994 	addw	sp, #4
                                    995 ;	se8r01-send-current.c: 364: temp[0]=0x7F;
      0084AF 1E 06            [ 2]  996 	ldw	x, (0x06, sp)
      0084B1 A6 7F            [ 1]  997 	ld	a, #0x7f
      0084B3 F7               [ 1]  998 	ld	(x), a
                                    999 ;	se8r01-send-current.c: 365: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_DAC_CAL_HI,temp,1);
      0084B4 1E 06            [ 2] 1000 	ldw	x, (0x06, sp)
      0084B6 4B 01            [ 1] 1001 	push	#0x01
      0084B8 89               [ 2] 1002 	pushw	x
      0084B9 4B 38            [ 1] 1003 	push	#0x38
      0084BB CD 81 48         [ 4] 1004 	call	_write_spi_buf
      0084BE 5B 04            [ 2] 1005 	addw	sp, #4
                                   1006 ;	se8r01-send-current.c: 367: temp[0]=0x02;
      0084C0 1E 06            [ 2] 1007 	ldw	x, (0x06, sp)
      0084C2 A6 02            [ 1] 1008 	ld	a, #0x02
      0084C4 F7               [ 1] 1009 	ld	(x), a
                                   1010 ;	se8r01-send-current.c: 368: temp[1]=0xC1;
      0084C5 1E 0C            [ 2] 1011 	ldw	x, (0x0c, sp)
      0084C7 A6 C1            [ 1] 1012 	ld	a, #0xc1
      0084C9 F7               [ 1] 1013 	ld	(x), a
                                   1014 ;	se8r01-send-current.c: 369: temp[2]=0xEB;            
      0084CA 1E 0A            [ 2] 1015 	ldw	x, (0x0a, sp)
      0084CC A6 EB            [ 1] 1016 	ld	a, #0xeb
      0084CE F7               [ 1] 1017 	ld	(x), a
                                   1018 ;	se8r01-send-current.c: 370: temp[3]=0x1C;
      0084CF 1E 08            [ 2] 1019 	ldw	x, (0x08, sp)
      0084D1 A6 1C            [ 1] 1020 	ld	a, #0x1c
      0084D3 F7               [ 1] 1021 	ld	(x), a
                                   1022 ;	se8r01-send-current.c: 371: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_AGC_GAIN, temp,4);
      0084D4 1E 06            [ 2] 1023 	ldw	x, (0x06, sp)
      0084D6 4B 04            [ 1] 1024 	push	#0x04
      0084D8 89               [ 2] 1025 	pushw	x
      0084D9 4B 3D            [ 1] 1026 	push	#0x3d
      0084DB CD 81 48         [ 4] 1027 	call	_write_spi_buf
      0084DE 5B 04            [ 2] 1028 	addw	sp, #4
                                   1029 ;	se8r01-send-current.c: 373: temp[0]=0x97;
      0084E0 1E 06            [ 2] 1030 	ldw	x, (0x06, sp)
      0084E2 A6 97            [ 1] 1031 	ld	a, #0x97
      0084E4 F7               [ 1] 1032 	ld	(x), a
                                   1033 ;	se8r01-send-current.c: 374: temp[1]=0x64;
      0084E5 1E 0C            [ 2] 1034 	ldw	x, (0x0c, sp)
      0084E7 A6 64            [ 1] 1035 	ld	a, #0x64
      0084E9 F7               [ 1] 1036 	ld	(x), a
                                   1037 ;	se8r01-send-current.c: 375: temp[2]=0x00;
      0084EA 1E 0A            [ 2] 1038 	ldw	x, (0x0a, sp)
      0084EC 7F               [ 1] 1039 	clr	(x)
                                   1040 ;	se8r01-send-current.c: 376: temp[3]=0x81;
      0084ED 1E 08            [ 2] 1041 	ldw	x, (0x08, sp)
      0084EF A6 81            [ 1] 1042 	ld	a, #0x81
      0084F1 F7               [ 1] 1043 	ld	(x), a
                                   1044 ;	se8r01-send-current.c: 377: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_RF_IVGEN, temp, 4);
      0084F2 1E 06            [ 2] 1045 	ldw	x, (0x06, sp)
      0084F4 4B 04            [ 1] 1046 	push	#0x04
      0084F6 89               [ 2] 1047 	pushw	x
      0084F7 4B 3E            [ 1] 1048 	push	#0x3e
      0084F9 CD 81 48         [ 4] 1049 	call	_write_spi_buf
      0084FC 5B 04            [ 2] 1050 	addw	sp, #4
                                   1051 ;	se8r01-send-current.c: 378: rf_switch_bank(iBANK0);
      0084FE 4B 00            [ 1] 1052 	push	#0x00
      008500 CD 83 64         [ 4] 1053 	call	_rf_switch_bank
      008503 84               [ 1] 1054 	pop	a
                                   1055 ;	se8r01-send-current.c: 383: delayTenMicro();
      008504 CD 80 A0         [ 4] 1056 	call	_delayTenMicro
                                   1057 ;	se8r01-send-current.c: 384: PC_ODR |= (1 << CE);
      008507 AE 50 0A         [ 2] 1058 	ldw	x, #0x500a
      00850A F6               [ 1] 1059 	ld	a, (x)
      00850B AA 10            [ 1] 1060 	or	a, #0x10
      00850D F7               [ 1] 1061 	ld	(x), a
                                   1062 ;	se8r01-send-current.c: 385: delayTenMicro();
      00850E CD 80 A0         [ 4] 1063 	call	_delayTenMicro
                                   1064 ;	se8r01-send-current.c: 386: delayTenMicro();
      008511 CD 80 A0         [ 4] 1065 	call	_delayTenMicro
                                   1066 ;	se8r01-send-current.c: 387: delayTenMicro();
      008514 CD 80 A0         [ 4] 1067 	call	_delayTenMicro
                                   1068 ;	se8r01-send-current.c: 388: PC_ODR &= ~(1 << CE);
      008517 AE 50 0A         [ 2] 1069 	ldw	x, #0x500a
      00851A F6               [ 1] 1070 	ld	a, (x)
      00851B A4 EF            [ 1] 1071 	and	a, #0xef
      00851D F7               [ 1] 1072 	ld	(x), a
                                   1073 ;	se8r01-send-current.c: 389: delay(50);                            // delay 50ms waitting for calibaration.
      00851E 4B 32            [ 1] 1074 	push	#0x32
      008520 4B 00            [ 1] 1075 	push	#0x00
      008522 CD 82 2E         [ 4] 1076 	call	_delay
      008525 5B 02            [ 2] 1077 	addw	sp, #2
                                   1078 ;	se8r01-send-current.c: 394: delayTenMicro();
      008527 CD 80 A0         [ 4] 1079 	call	_delayTenMicro
                                   1080 ;	se8r01-send-current.c: 395: PC_ODR |= (1 << CE);
      00852A AE 50 0A         [ 2] 1081 	ldw	x, #0x500a
      00852D F6               [ 1] 1082 	ld	a, (x)
      00852E AA 10            [ 1] 1083 	or	a, #0x10
      008530 F7               [ 1] 1084 	ld	(x), a
                                   1085 ;	se8r01-send-current.c: 396: delayTenMicro();
      008531 CD 80 A0         [ 4] 1086 	call	_delayTenMicro
                                   1087 ;	se8r01-send-current.c: 397: delayTenMicro();
      008534 CD 80 A0         [ 4] 1088 	call	_delayTenMicro
                                   1089 ;	se8r01-send-current.c: 398: delayTenMicro();
      008537 CD 80 A0         [ 4] 1090 	call	_delayTenMicro
                                   1091 ;	se8r01-send-current.c: 399: PC_ODR &= ~(1 << CE);
      00853A AE 50 0A         [ 2] 1092 	ldw	x, #0x500a
      00853D F6               [ 1] 1093 	ld	a, (x)
      00853E A4 EF            [ 1] 1094 	and	a, #0xef
      008540 F7               [ 1] 1095 	ld	(x), a
                                   1096 ;	se8r01-send-current.c: 400: delay(50);                            // delay 50ms waitting for calibaration.
      008541 4B 32            [ 1] 1097 	push	#0x32
      008543 4B 00            [ 1] 1098 	push	#0x00
      008545 CD 82 2E         [ 4] 1099 	call	_delay
      008548 5B 02            [ 2] 1100 	addw	sp, #2
      00854A 5B 0D            [ 2] 1101 	addw	sp, #13
      00854C 81               [ 4] 1102 	ret
                                   1103 ;	se8r01-send-current.c: 404: void SE8R01_Analog_Init()           //SE8R01 初始化
                                   1104 ;	-----------------------------------------
                                   1105 ;	 function SE8R01_Analog_Init
                                   1106 ;	-----------------------------------------
      00854D                       1107 _SE8R01_Analog_Init:
      00854D 52 15            [ 2] 1108 	sub	sp, #21
                                   1109 ;	se8r01-send-current.c: 409: gtemp[0]=0x28;
      00854F AE 00 01         [ 2] 1110 	ldw	x, #_gtemp+0
      008552 1F 0E            [ 2] 1111 	ldw	(0x0e, sp), x
      008554 1E 0E            [ 2] 1112 	ldw	x, (0x0e, sp)
      008556 A6 28            [ 1] 1113 	ld	a, #0x28
      008558 F7               [ 1] 1114 	ld	(x), a
                                   1115 ;	se8r01-send-current.c: 410: gtemp[1]=0x32;
      008559 1E 0E            [ 2] 1116 	ldw	x, (0x0e, sp)
      00855B 5C               [ 2] 1117 	incw	x
      00855C 1F 0C            [ 2] 1118 	ldw	(0x0c, sp), x
      00855E 1E 0C            [ 2] 1119 	ldw	x, (0x0c, sp)
      008560 A6 32            [ 1] 1120 	ld	a, #0x32
      008562 F7               [ 1] 1121 	ld	(x), a
                                   1122 ;	se8r01-send-current.c: 411: gtemp[2]=0x80;
      008563 1E 0E            [ 2] 1123 	ldw	x, (0x0e, sp)
      008565 5C               [ 2] 1124 	incw	x
      008566 5C               [ 2] 1125 	incw	x
      008567 1F 0A            [ 2] 1126 	ldw	(0x0a, sp), x
      008569 1E 0A            [ 2] 1127 	ldw	x, (0x0a, sp)
      00856B A6 80            [ 1] 1128 	ld	a, #0x80
      00856D F7               [ 1] 1129 	ld	(x), a
                                   1130 ;	se8r01-send-current.c: 412: gtemp[3]=0x90;
      00856E 1E 0E            [ 2] 1131 	ldw	x, (0x0e, sp)
      008570 1C 00 03         [ 2] 1132 	addw	x, #0x0003
      008573 1F 08            [ 2] 1133 	ldw	(0x08, sp), x
      008575 1E 08            [ 2] 1134 	ldw	x, (0x08, sp)
      008577 A6 90            [ 1] 1135 	ld	a, #0x90
      008579 F7               [ 1] 1136 	ld	(x), a
                                   1137 ;	se8r01-send-current.c: 413: gtemp[4]=0x00;
      00857A 1E 0E            [ 2] 1138 	ldw	x, (0x0e, sp)
      00857C 1C 00 04         [ 2] 1139 	addw	x, #0x0004
      00857F 7F               [ 1] 1140 	clr	(x)
                                   1141 ;	se8r01-send-current.c: 414: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_SETUP_VALUE, gtemp, 5);
      008580 1E 0E            [ 2] 1142 	ldw	x, (0x0e, sp)
      008582 4B 05            [ 1] 1143 	push	#0x05
      008584 89               [ 2] 1144 	pushw	x
      008585 4B 3E            [ 1] 1145 	push	#0x3e
      008587 CD 81 48         [ 4] 1146 	call	_write_spi_buf
      00858A 5B 04            [ 2] 1147 	addw	sp, #4
                                   1148 ;	se8r01-send-current.c: 415: delay(2);
      00858C 4B 02            [ 1] 1149 	push	#0x02
      00858E 4B 00            [ 1] 1150 	push	#0x00
      008590 CD 82 2E         [ 4] 1151 	call	_delay
      008593 5B 02            [ 2] 1152 	addw	sp, #2
                                   1153 ;	se8r01-send-current.c: 418: rf_switch_bank(iBANK1);
      008595 4B 80            [ 1] 1154 	push	#0x80
      008597 CD 83 64         [ 4] 1155 	call	_rf_switch_bank
      00859A 84               [ 1] 1156 	pop	a
                                   1157 ;	se8r01-send-current.c: 420: temp[0]=0x40;
      00859B 96               [ 1] 1158 	ldw	x, sp
      00859C 5C               [ 2] 1159 	incw	x
      00859D 1F 14            [ 2] 1160 	ldw	(0x14, sp), x
      00859F 1E 14            [ 2] 1161 	ldw	x, (0x14, sp)
      0085A1 A6 40            [ 1] 1162 	ld	a, #0x40
      0085A3 F7               [ 1] 1163 	ld	(x), a
                                   1164 ;	se8r01-send-current.c: 421: temp[1]=0x01;               
      0085A4 1E 14            [ 2] 1165 	ldw	x, (0x14, sp)
      0085A6 5C               [ 2] 1166 	incw	x
      0085A7 1F 12            [ 2] 1167 	ldw	(0x12, sp), x
      0085A9 1E 12            [ 2] 1168 	ldw	x, (0x12, sp)
      0085AB A6 01            [ 1] 1169 	ld	a, #0x01
      0085AD F7               [ 1] 1170 	ld	(x), a
                                   1171 ;	se8r01-send-current.c: 422: temp[2]=0x30;               
      0085AE 1E 14            [ 2] 1172 	ldw	x, (0x14, sp)
      0085B0 5C               [ 2] 1173 	incw	x
      0085B1 5C               [ 2] 1174 	incw	x
      0085B2 1F 10            [ 2] 1175 	ldw	(0x10, sp), x
      0085B4 1E 10            [ 2] 1176 	ldw	x, (0x10, sp)
      0085B6 A6 30            [ 1] 1177 	ld	a, #0x30
      0085B8 F7               [ 1] 1178 	ld	(x), a
                                   1179 ;	se8r01-send-current.c: 424: { temp[3]=0xE2; }              
      0085B9 1E 14            [ 2] 1180 	ldw	x, (0x14, sp)
      0085BB 1C 00 03         [ 2] 1181 	addw	x, #0x0003
      0085BE 1F 06            [ 2] 1182 	ldw	(0x06, sp), x
                                   1183 ;	se8r01-send-current.c: 423: if (SE8R01_DR_2M==1)
      0085C0 CE 00 10         [ 2] 1184 	ldw	x, _SE8R01_DR_2M+0
      0085C3 A3 00 01         [ 2] 1185 	cpw	x, #0x0001
      0085C6 26 07            [ 1] 1186 	jrne	00102$
                                   1187 ;	se8r01-send-current.c: 424: { temp[3]=0xE2; }              
      0085C8 1E 06            [ 2] 1188 	ldw	x, (0x06, sp)
      0085CA A6 E2            [ 1] 1189 	ld	a, #0xe2
      0085CC F7               [ 1] 1190 	ld	(x), a
      0085CD 20 05            [ 2] 1191 	jra	00103$
      0085CF                       1192 00102$:
                                   1193 ;	se8r01-send-current.c: 426: { temp[3]=0xE0;}
      0085CF 1E 06            [ 2] 1194 	ldw	x, (0x06, sp)
      0085D1 A6 E0            [ 1] 1195 	ld	a, #0xe0
      0085D3 F7               [ 1] 1196 	ld	(x), a
      0085D4                       1197 00103$:
                                   1198 ;	se8r01-send-current.c: 428: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_PLL_CTL0, temp,4);
      0085D4 1E 14            [ 2] 1199 	ldw	x, (0x14, sp)
      0085D6 4B 04            [ 1] 1200 	push	#0x04
      0085D8 89               [ 2] 1201 	pushw	x
      0085D9 4B 21            [ 1] 1202 	push	#0x21
      0085DB CD 81 48         [ 4] 1203 	call	_write_spi_buf
      0085DE 5B 04            [ 2] 1204 	addw	sp, #4
                                   1205 ;	se8r01-send-current.c: 430: temp[0]=0x29;
      0085E0 1E 14            [ 2] 1206 	ldw	x, (0x14, sp)
      0085E2 A6 29            [ 1] 1207 	ld	a, #0x29
      0085E4 F7               [ 1] 1208 	ld	(x), a
                                   1209 ;	se8r01-send-current.c: 431: temp[1]=0x89;
      0085E5 1E 12            [ 2] 1210 	ldw	x, (0x12, sp)
      0085E7 A6 89            [ 1] 1211 	ld	a, #0x89
      0085E9 F7               [ 1] 1212 	ld	(x), a
                                   1213 ;	se8r01-send-current.c: 432: temp[2]=0x55;                     
      0085EA 1E 10            [ 2] 1214 	ldw	x, (0x10, sp)
      0085EC A6 55            [ 1] 1215 	ld	a, #0x55
      0085EE F7               [ 1] 1216 	ld	(x), a
                                   1217 ;	se8r01-send-current.c: 433: temp[3]=0x40;
      0085EF 1E 06            [ 2] 1218 	ldw	x, (0x06, sp)
      0085F1 A6 40            [ 1] 1219 	ld	a, #0x40
      0085F3 F7               [ 1] 1220 	ld	(x), a
                                   1221 ;	se8r01-send-current.c: 434: temp[4]=0x50;
      0085F4 1E 14            [ 2] 1222 	ldw	x, (0x14, sp)
      0085F6 A6 50            [ 1] 1223 	ld	a, #0x50
      0085F8 E7 04            [ 1] 1224 	ld	(0x0004, x), a
                                   1225 ;	se8r01-send-current.c: 435: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_CAL_CTL, temp,5);
      0085FA 1E 14            [ 2] 1226 	ldw	x, (0x14, sp)
      0085FC 4B 05            [ 1] 1227 	push	#0x05
      0085FE 89               [ 2] 1228 	pushw	x
      0085FF 4B 23            [ 1] 1229 	push	#0x23
      008601 CD 81 48         [ 4] 1230 	call	_write_spi_buf
      008604 5B 04            [ 2] 1231 	addw	sp, #4
                                   1232 ;	se8r01-send-current.c: 437: if (SE8R01_DR_2M==1)
      008606 CE 00 10         [ 2] 1233 	ldw	x, _SE8R01_DR_2M+0
      008609 A3 00 01         [ 2] 1234 	cpw	x, #0x0001
      00860C 26 07            [ 1] 1235 	jrne	00105$
                                   1236 ;	se8r01-send-current.c: 438: { temp[0]=0x29;}
      00860E 1E 14            [ 2] 1237 	ldw	x, (0x14, sp)
      008610 A6 29            [ 1] 1238 	ld	a, #0x29
      008612 F7               [ 1] 1239 	ld	(x), a
      008613 20 05            [ 2] 1240 	jra	00106$
      008615                       1241 00105$:
                                   1242 ;	se8r01-send-current.c: 440: { temp[0]=0x14;}
      008615 1E 14            [ 2] 1243 	ldw	x, (0x14, sp)
      008617 A6 14            [ 1] 1244 	ld	a, #0x14
      008619 F7               [ 1] 1245 	ld	(x), a
      00861A                       1246 00106$:
                                   1247 ;	se8r01-send-current.c: 442: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_FDEV, temp,1);
      00861A 1E 14            [ 2] 1248 	ldw	x, (0x14, sp)
      00861C 4B 01            [ 1] 1249 	push	#0x01
      00861E 89               [ 2] 1250 	pushw	x
      00861F 4B 2C            [ 1] 1251 	push	#0x2c
      008621 CD 81 48         [ 4] 1252 	call	_write_spi_buf
      008624 5B 04            [ 2] 1253 	addw	sp, #4
                                   1254 ;	se8r01-send-current.c: 444: temp[0]=0x55;
      008626 1E 14            [ 2] 1255 	ldw	x, (0x14, sp)
      008628 A6 55            [ 1] 1256 	ld	a, #0x55
      00862A F7               [ 1] 1257 	ld	(x), a
                                   1258 ;	se8r01-send-current.c: 445: temp[1]=0xC2;
      00862B 1E 12            [ 2] 1259 	ldw	x, (0x12, sp)
      00862D A6 C2            [ 1] 1260 	ld	a, #0xc2
      00862F F7               [ 1] 1261 	ld	(x), a
                                   1262 ;	se8r01-send-current.c: 446: temp[2]=0x09;
      008630 1E 10            [ 2] 1263 	ldw	x, (0x10, sp)
      008632 A6 09            [ 1] 1264 	ld	a, #0x09
      008634 F7               [ 1] 1265 	ld	(x), a
                                   1266 ;	se8r01-send-current.c: 447: temp[3]=0xAC;  
      008635 1E 06            [ 2] 1267 	ldw	x, (0x06, sp)
      008637 A6 AC            [ 1] 1268 	ld	a, #0xac
      008639 F7               [ 1] 1269 	ld	(x), a
                                   1270 ;	se8r01-send-current.c: 448: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_RX_CTRL,temp,4);
      00863A 1E 14            [ 2] 1271 	ldw	x, (0x14, sp)
      00863C 4B 04            [ 1] 1272 	push	#0x04
      00863E 89               [ 2] 1273 	pushw	x
      00863F 4B 31            [ 1] 1274 	push	#0x31
      008641 CD 81 48         [ 4] 1275 	call	_write_spi_buf
      008644 5B 04            [ 2] 1276 	addw	sp, #4
                                   1277 ;	se8r01-send-current.c: 450: temp[0]=0x00;
      008646 1E 14            [ 2] 1278 	ldw	x, (0x14, sp)
      008648 7F               [ 1] 1279 	clr	(x)
                                   1280 ;	se8r01-send-current.c: 451: temp[1]=0x14;
      008649 1E 12            [ 2] 1281 	ldw	x, (0x12, sp)
      00864B A6 14            [ 1] 1282 	ld	a, #0x14
      00864D F7               [ 1] 1283 	ld	(x), a
                                   1284 ;	se8r01-send-current.c: 452: temp[2]=0x08;   
      00864E 1E 10            [ 2] 1285 	ldw	x, (0x10, sp)
      008650 A6 08            [ 1] 1286 	ld	a, #0x08
      008652 F7               [ 1] 1287 	ld	(x), a
                                   1288 ;	se8r01-send-current.c: 453: temp[3]=0x29;
      008653 1E 06            [ 2] 1289 	ldw	x, (0x06, sp)
      008655 A6 29            [ 1] 1290 	ld	a, #0x29
      008657 F7               [ 1] 1291 	ld	(x), a
                                   1292 ;	se8r01-send-current.c: 454: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_FAGC_CTRL_1, temp,4);
      008658 1E 14            [ 2] 1293 	ldw	x, (0x14, sp)
      00865A 4B 04            [ 1] 1294 	push	#0x04
      00865C 89               [ 2] 1295 	pushw	x
      00865D 4B 33            [ 1] 1296 	push	#0x33
      00865F CD 81 48         [ 4] 1297 	call	_write_spi_buf
      008662 5B 04            [ 2] 1298 	addw	sp, #4
                                   1299 ;	se8r01-send-current.c: 456: temp[0]=0x02;
      008664 1E 14            [ 2] 1300 	ldw	x, (0x14, sp)
      008666 A6 02            [ 1] 1301 	ld	a, #0x02
      008668 F7               [ 1] 1302 	ld	(x), a
                                   1303 ;	se8r01-send-current.c: 457: temp[1]=0xC1;
      008669 1E 12            [ 2] 1304 	ldw	x, (0x12, sp)
      00866B A6 C1            [ 1] 1305 	ld	a, #0xc1
      00866D F7               [ 1] 1306 	ld	(x), a
                                   1307 ;	se8r01-send-current.c: 458: temp[2]=0xCB;  
      00866E 1E 10            [ 2] 1308 	ldw	x, (0x10, sp)
      008670 A6 CB            [ 1] 1309 	ld	a, #0xcb
      008672 F7               [ 1] 1310 	ld	(x), a
                                   1311 ;	se8r01-send-current.c: 459: temp[3]=0x1C;
      008673 1E 06            [ 2] 1312 	ldw	x, (0x06, sp)
      008675 A6 1C            [ 1] 1313 	ld	a, #0x1c
      008677 F7               [ 1] 1314 	ld	(x), a
                                   1315 ;	se8r01-send-current.c: 460: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_AGC_GAIN, temp,4);
      008678 1E 14            [ 2] 1316 	ldw	x, (0x14, sp)
      00867A 4B 04            [ 1] 1317 	push	#0x04
      00867C 89               [ 2] 1318 	pushw	x
      00867D 4B 3D            [ 1] 1319 	push	#0x3d
      00867F CD 81 48         [ 4] 1320 	call	_write_spi_buf
      008682 5B 04            [ 2] 1321 	addw	sp, #4
                                   1322 ;	se8r01-send-current.c: 462: temp[0]=0x97;
      008684 1E 14            [ 2] 1323 	ldw	x, (0x14, sp)
      008686 A6 97            [ 1] 1324 	ld	a, #0x97
      008688 F7               [ 1] 1325 	ld	(x), a
                                   1326 ;	se8r01-send-current.c: 463: temp[1]=0x64;
      008689 1E 12            [ 2] 1327 	ldw	x, (0x12, sp)
      00868B A6 64            [ 1] 1328 	ld	a, #0x64
      00868D F7               [ 1] 1329 	ld	(x), a
                                   1330 ;	se8r01-send-current.c: 464: temp[2]=0x00;
      00868E 1E 10            [ 2] 1331 	ldw	x, (0x10, sp)
      008690 7F               [ 1] 1332 	clr	(x)
                                   1333 ;	se8r01-send-current.c: 465: temp[3]=0x01;
      008691 1E 06            [ 2] 1334 	ldw	x, (0x06, sp)
      008693 A6 01            [ 1] 1335 	ld	a, #0x01
      008695 F7               [ 1] 1336 	ld	(x), a
                                   1337 ;	se8r01-send-current.c: 466: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_RF_IVGEN, temp,4);
      008696 1E 14            [ 2] 1338 	ldw	x, (0x14, sp)
      008698 4B 04            [ 1] 1339 	push	#0x04
      00869A 89               [ 2] 1340 	pushw	x
      00869B 4B 3E            [ 1] 1341 	push	#0x3e
      00869D CD 81 48         [ 4] 1342 	call	_write_spi_buf
      0086A0 5B 04            [ 2] 1343 	addw	sp, #4
                                   1344 ;	se8r01-send-current.c: 468: gtemp[0]=0x2A;
      0086A2 1E 0E            [ 2] 1345 	ldw	x, (0x0e, sp)
      0086A4 A6 2A            [ 1] 1346 	ld	a, #0x2a
      0086A6 F7               [ 1] 1347 	ld	(x), a
                                   1348 ;	se8r01-send-current.c: 469: gtemp[1]=0x04;
      0086A7 1E 0C            [ 2] 1349 	ldw	x, (0x0c, sp)
      0086A9 A6 04            [ 1] 1350 	ld	a, #0x04
      0086AB F7               [ 1] 1351 	ld	(x), a
                                   1352 ;	se8r01-send-current.c: 470: gtemp[2]=0x00;
      0086AC 1E 0A            [ 2] 1353 	ldw	x, (0x0a, sp)
      0086AE 7F               [ 1] 1354 	clr	(x)
                                   1355 ;	se8r01-send-current.c: 471: gtemp[3]=0x7D;
      0086AF 1E 08            [ 2] 1356 	ldw	x, (0x08, sp)
      0086B1 A6 7D            [ 1] 1357 	ld	a, #0x7d
      0086B3 F7               [ 1] 1358 	ld	(x), a
                                   1359 ;	se8r01-send-current.c: 472: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_TEST_PKDET, gtemp, 4);
      0086B4 1E 0E            [ 2] 1360 	ldw	x, (0x0e, sp)
      0086B6 4B 04            [ 1] 1361 	push	#0x04
      0086B8 89               [ 2] 1362 	pushw	x
      0086B9 4B 3F            [ 1] 1363 	push	#0x3f
      0086BB CD 81 48         [ 4] 1364 	call	_write_spi_buf
      0086BE 5B 04            [ 2] 1365 	addw	sp, #4
                                   1366 ;	se8r01-send-current.c: 474: rf_switch_bank(iBANK0);
      0086C0 4B 00            [ 1] 1367 	push	#0x00
      0086C2 CD 83 64         [ 4] 1368 	call	_rf_switch_bank
      0086C5 84               [ 1] 1369 	pop	a
      0086C6 5B 15            [ 2] 1370 	addw	sp, #21
      0086C8 81               [ 4] 1371 	ret
                                   1372 ;	se8r01-send-current.c: 477: void SE8R01_Init()  
                                   1373 ;	-----------------------------------------
                                   1374 ;	 function SE8R01_Init
                                   1375 ;	-----------------------------------------
      0086C9                       1376 _SE8R01_Init:
      0086C9 52 05            [ 2] 1377 	sub	sp, #5
                                   1378 ;	se8r01-send-current.c: 480: SE8R01_Calibration();   
      0086CB CD 83 81         [ 4] 1379 	call	_SE8R01_Calibration
                                   1380 ;	se8r01-send-current.c: 481: SE8R01_Analog_Init();   
      0086CE CD 85 4D         [ 4] 1381 	call	_SE8R01_Analog_Init
                                   1382 ;	se8r01-send-current.c: 485: if (SE8R01_DR_2M==1)
      0086D1 CE 00 10         [ 2] 1383 	ldw	x, _SE8R01_DR_2M+0
      0086D4 A3 00 01         [ 2] 1384 	cpw	x, #0x0001
      0086D7 26 07            [ 1] 1385 	jrne	00105$
                                   1386 ;	se8r01-send-current.c: 486: {  temp[0]=0b01001111; }     //2MHz,+5dbm
      0086D9 96               [ 1] 1387 	ldw	x, sp
      0086DA 5C               [ 2] 1388 	incw	x
      0086DB A6 4F            [ 1] 1389 	ld	a, #0x4f
      0086DD F7               [ 1] 1390 	ld	(x), a
      0086DE 20 14            [ 2] 1391 	jra	00106$
      0086E0                       1392 00105$:
                                   1393 ;	se8r01-send-current.c: 487: else if  (SE8R01_DR_1M==1)
      0086E0 CE 00 12         [ 2] 1394 	ldw	x, _SE8R01_DR_1M+0
      0086E3 A3 00 01         [ 2] 1395 	cpw	x, #0x0001
      0086E6 26 07            [ 1] 1396 	jrne	00102$
                                   1397 ;	se8r01-send-current.c: 488: {  temp[0]=0b01000111;  }     //1MHz,+5dbm
      0086E8 96               [ 1] 1398 	ldw	x, sp
      0086E9 5C               [ 2] 1399 	incw	x
      0086EA A6 47            [ 1] 1400 	ld	a, #0x47
      0086EC F7               [ 1] 1401 	ld	(x), a
      0086ED 20 05            [ 2] 1402 	jra	00106$
      0086EF                       1403 00102$:
                                   1404 ;	se8r01-send-current.c: 490: {temp[0]=0b01101111;  }     //500K,+5dbm
      0086EF 96               [ 1] 1405 	ldw	x, sp
      0086F0 5C               [ 2] 1406 	incw	x
      0086F1 A6 6F            [ 1] 1407 	ld	a, #0x6f
      0086F3 F7               [ 1] 1408 	ld	(x), a
      0086F4                       1409 00106$:
                                   1410 ;	se8r01-send-current.c: 492: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_RF_SETUP,temp,1);
      0086F4 96               [ 1] 1411 	ldw	x, sp
      0086F5 5C               [ 2] 1412 	incw	x
      0086F6 4B 01            [ 1] 1413 	push	#0x01
      0086F8 89               [ 2] 1414 	pushw	x
      0086F9 4B 26            [ 1] 1415 	push	#0x26
      0086FB CD 81 48         [ 4] 1416 	call	_write_spi_buf
      0086FE 5B 04            [ 2] 1417 	addw	sp, #4
                                   1418 ;	se8r01-send-current.c: 494: write_spi_reg(WRITE_REG|iRF_BANK0_EN_AA, 0x01);          //enable auto acc on pip 1
      008700 4B 01            [ 1] 1419 	push	#0x01
      008702 4B 21            [ 1] 1420 	push	#0x21
      008704 CD 80 CE         [ 4] 1421 	call	_write_spi_reg
      008707 5B 02            [ 2] 1422 	addw	sp, #2
                                   1423 ;	se8r01-send-current.c: 495: write_spi_reg(WRITE_REG|iRF_BANK0_EN_RXADDR, 0x01);      //enable pip 1
      008709 4B 01            [ 1] 1424 	push	#0x01
      00870B 4B 22            [ 1] 1425 	push	#0x22
      00870D CD 80 CE         [ 4] 1426 	call	_write_spi_reg
      008710 5B 02            [ 2] 1427 	addw	sp, #2
                                   1428 ;	se8r01-send-current.c: 496: write_spi_reg(WRITE_REG|iRF_BANK0_SETUP_AW, 0x02);        //4 byte adress
      008712 4B 02            [ 1] 1429 	push	#0x02
      008714 4B 23            [ 1] 1430 	push	#0x23
      008716 CD 80 CE         [ 4] 1431 	call	_write_spi_reg
      008719 5B 02            [ 2] 1432 	addw	sp, #2
                                   1433 ;	se8r01-send-current.c: 497: write_spi_reg(WRITE_REG|iRF_BANK0_SETUP_RETR, 0x08);        //lowest 4 bits 0-15 rt transmisston higest 4 bits 256-4096us Auto Retransmit Delay
      00871B 4B 08            [ 1] 1434 	push	#0x08
      00871D 4B 24            [ 1] 1435 	push	#0x24
      00871F CD 80 CE         [ 4] 1436 	call	_write_spi_reg
      008722 5B 02            [ 2] 1437 	addw	sp, #2
                                   1438 ;	se8r01-send-current.c: 498: write_spi_reg(WRITE_REG|iRF_BANK0_RF_CH, 40);
      008724 4B 28            [ 1] 1439 	push	#0x28
      008726 4B 25            [ 1] 1440 	push	#0x25
      008728 CD 80 CE         [ 4] 1441 	call	_write_spi_reg
      00872B 5B 02            [ 2] 1442 	addw	sp, #2
                                   1443 ;	se8r01-send-current.c: 499: write_spi_reg(WRITE_REG|iRF_BANK0_DYNPD, 0x01);          //pipe0 pipe1 enable dynamic payload length data
      00872D 4B 01            [ 1] 1444 	push	#0x01
      00872F 4B 3C            [ 1] 1445 	push	#0x3c
      008731 CD 80 CE         [ 4] 1446 	call	_write_spi_reg
      008734 5B 02            [ 2] 1447 	addw	sp, #2
                                   1448 ;	se8r01-send-current.c: 500: write_spi_reg(WRITE_REG|iRF_BANK0_FEATURE, 0x07);        // enable dynamic paload lenght; enbale payload with ack enable w_tx_payload_noack
      008736 4B 07            [ 1] 1449 	push	#0x07
      008738 4B 3D            [ 1] 1450 	push	#0x3d
      00873A CD 80 CE         [ 4] 1451 	call	_write_spi_reg
      00873D 5B 02            [ 2] 1452 	addw	sp, #2
                                   1453 ;	se8r01-send-current.c: 501: write_spi_reg(WRITE_REG + CONFIG, 0x3E);
      00873F 4B 3E            [ 1] 1454 	push	#0x3e
      008741 4B 20            [ 1] 1455 	push	#0x20
      008743 CD 80 CE         [ 4] 1456 	call	_write_spi_reg
      008746 5B 02            [ 2] 1457 	addw	sp, #2
                                   1458 ;	se8r01-send-current.c: 502: write_spi_buf(WRITE_REG + TX_ADDR, TX_ADDRESS, ADR_WIDTH);  //from tx
      008748 AE 00 1E         [ 2] 1459 	ldw	x, #_TX_ADDRESS+0
      00874B 90 93            [ 1] 1460 	ldw	y, x
      00874D 89               [ 2] 1461 	pushw	x
      00874E 4B 04            [ 1] 1462 	push	#0x04
      008750 90 89            [ 2] 1463 	pushw	y
      008752 4B 30            [ 1] 1464 	push	#0x30
      008754 CD 81 48         [ 4] 1465 	call	_write_spi_buf
      008757 5B 04            [ 2] 1466 	addw	sp, #4
      008759 85               [ 2] 1467 	popw	x
                                   1468 ;	se8r01-send-current.c: 504: write_spi_buf(WRITE_REG + RX_ADDR_P0, TX_ADDRESS, ADR_WIDTH); // Use the same address on the RX device as the TX device write_spi_reg(WRITE_REG + RX_PW_P0, TX_PLOAD_WIDTH); // Select same RX payload width as TX Payload width
      00875A 4B 04            [ 1] 1469 	push	#0x04
      00875C 89               [ 2] 1470 	pushw	x
      00875D 4B 2A            [ 1] 1471 	push	#0x2a
      00875F CD 81 48         [ 4] 1472 	call	_write_spi_buf
      008762 5B 04            [ 2] 1473 	addw	sp, #4
                                   1474 ;	se8r01-send-current.c: 507: PC_ODR |= (1 << CE);
      008764 AE 50 0A         [ 2] 1475 	ldw	x, #0x500a
      008767 F6               [ 1] 1476 	ld	a, (x)
      008768 AA 10            [ 1] 1477 	or	a, #0x10
      00876A F7               [ 1] 1478 	ld	(x), a
      00876B 5B 05            [ 2] 1479 	addw	sp, #5
      00876D 81               [ 4] 1480 	ret
                                   1481 ;	se8r01-send-current.c: 513: int main () {
                                   1482 ;	-----------------------------------------
                                   1483 ;	 function main
                                   1484 ;	-----------------------------------------
      00876E                       1485 _main:
      00876E 52 3B            [ 2] 1486 	sub	sp, #59
                                   1487 ;	se8r01-send-current.c: 520: UCHAR rx_addr_p1[]  = { 0xd2, 0xf0, 0xf0, 0xf0, 0xf0 };
      008770 90 96            [ 1] 1488 	ldw	y, sp
      008772 72 A9 00 2B      [ 2] 1489 	addw	y, #43
      008776 A6 D2            [ 1] 1490 	ld	a, #0xd2
      008778 90 F7            [ 1] 1491 	ld	(y), a
      00877A 93               [ 1] 1492 	ldw	x, y
      00877B 5C               [ 2] 1493 	incw	x
      00877C A6 F0            [ 1] 1494 	ld	a, #0xf0
      00877E F7               [ 1] 1495 	ld	(x), a
      00877F 93               [ 1] 1496 	ldw	x, y
      008780 5C               [ 2] 1497 	incw	x
      008781 5C               [ 2] 1498 	incw	x
      008782 A6 F0            [ 1] 1499 	ld	a, #0xf0
      008784 F7               [ 1] 1500 	ld	(x), a
      008785 93               [ 1] 1501 	ldw	x, y
      008786 A6 F0            [ 1] 1502 	ld	a, #0xf0
      008788 E7 03            [ 1] 1503 	ld	(0x0003, x), a
      00878A 93               [ 1] 1504 	ldw	x, y
      00878B A6 F0            [ 1] 1505 	ld	a, #0xf0
      00878D E7 04            [ 1] 1506 	ld	(0x0004, x), a
                                   1507 ;	se8r01-send-current.c: 521: UCHAR tx_addr[]     = { 0xe1, 0xf0, 0xf0, 0xf0, 0xf0 };
      00878F 90 96            [ 1] 1508 	ldw	y, sp
      008791 72 A9 00 22      [ 2] 1509 	addw	y, #34
      008795 A6 E1            [ 1] 1510 	ld	a, #0xe1
      008797 90 F7            [ 1] 1511 	ld	(y), a
      008799 93               [ 1] 1512 	ldw	x, y
      00879A 5C               [ 2] 1513 	incw	x
      00879B A6 F0            [ 1] 1514 	ld	a, #0xf0
      00879D F7               [ 1] 1515 	ld	(x), a
      00879E 93               [ 1] 1516 	ldw	x, y
      00879F 5C               [ 2] 1517 	incw	x
      0087A0 5C               [ 2] 1518 	incw	x
      0087A1 A6 F0            [ 1] 1519 	ld	a, #0xf0
      0087A3 F7               [ 1] 1520 	ld	(x), a
      0087A4 93               [ 1] 1521 	ldw	x, y
      0087A5 A6 F0            [ 1] 1522 	ld	a, #0xf0
      0087A7 E7 03            [ 1] 1523 	ld	(0x0003, x), a
      0087A9 93               [ 1] 1524 	ldw	x, y
      0087AA 1C 00 04         [ 2] 1525 	addw	x, #0x0004
      0087AD A6 F0            [ 1] 1526 	ld	a, #0xf0
      0087AF F7               [ 1] 1527 	ld	(x), a
                                   1528 ;	se8r01-send-current.c: 524: InitializeSystemClock();
      0087B0 CD 81 E4         [ 4] 1529 	call	_InitializeSystemClock
                                   1530 ;	se8r01-send-current.c: 525: InitializeUART();
      0087B3 CD 82 DC         [ 4] 1531 	call	_InitializeUART
                                   1532 ;	se8r01-send-current.c: 527: InitializeSPI ();
      0087B6 CD 81 BC         [ 4] 1533 	call	_InitializeSPI
                                   1534 ;	se8r01-send-current.c: 530: memset (tx_payload, 0, sizeof(tx_payload));
      0087B9 96               [ 1] 1535 	ldw	x, sp
      0087BA 5C               [ 2] 1536 	incw	x
      0087BB 1F 32            [ 2] 1537 	ldw	(0x32, sp), x
      0087BD 16 32            [ 2] 1538 	ldw	y, (0x32, sp)
      0087BF 4B 21            [ 1] 1539 	push	#0x21
      0087C1 4B 00            [ 1] 1540 	push	#0x00
      0087C3 5F               [ 1] 1541 	clrw	x
      0087C4 89               [ 2] 1542 	pushw	x
      0087C5 90 89            [ 2] 1543 	pushw	y
      0087C7 CD 89 63         [ 4] 1544 	call	_memset
      0087CA 5B 06            [ 2] 1545 	addw	sp, #6
                                   1546 ;	se8r01-send-current.c: 533: init_io();                        // Initialize IO port
      0087CC CD 83 55         [ 4] 1547 	call	_init_io
                                   1548 ;	se8r01-send-current.c: 534: write_spi_reg(FLUSH_TX,0); // transmit -- send data 
      0087CF 4B 00            [ 1] 1549 	push	#0x00
      0087D1 4B E1            [ 1] 1550 	push	#0xe1
      0087D3 CD 80 CE         [ 4] 1551 	call	_write_spi_reg
      0087D6 5B 02            [ 2] 1552 	addw	sp, #2
                                   1553 ;	se8r01-send-current.c: 535: readstatus = read_spi_reg(CONFIG);
      0087D8 4B 00            [ 1] 1554 	push	#0x00
      0087DA CD 81 0A         [ 4] 1555 	call	_read_spi_reg
      0087DD 5B 01            [ 2] 1556 	addw	sp, #1
                                   1557 ;	se8r01-send-current.c: 536: UARTPrintF("config = \n\r");
      0087DF AE 88 F5         [ 2] 1558 	ldw	x, #___str_0+0
      0087E2 88               [ 1] 1559 	push	a
      0087E3 89               [ 2] 1560 	pushw	x
      0087E4 CD 82 79         [ 4] 1561 	call	_UARTPrintF
      0087E7 5B 02            [ 2] 1562 	addw	sp, #2
      0087E9 84               [ 1] 1563 	pop	a
                                   1564 ;	se8r01-send-current.c: 537: print_UCHAR_hex(readstatus);
      0087EA 88               [ 1] 1565 	push	a
      0087EB CD 82 90         [ 4] 1566 	call	_print_UCHAR_hex
      0087EE 84               [ 1] 1567 	pop	a
                                   1568 ;	se8r01-send-current.c: 538: readstatus = read_spi_reg(STATUS);
      0087EF 4B 07            [ 1] 1569 	push	#0x07
      0087F1 CD 81 0A         [ 4] 1570 	call	_read_spi_reg
      0087F4 5B 01            [ 2] 1571 	addw	sp, #1
                                   1572 ;	se8r01-send-current.c: 539: UARTPrintF("status = \n\r");
      0087F6 AE 89 01         [ 2] 1573 	ldw	x, #___str_1+0
      0087F9 88               [ 1] 1574 	push	a
      0087FA 89               [ 2] 1575 	pushw	x
      0087FB CD 82 79         [ 4] 1576 	call	_UARTPrintF
      0087FE 5B 02            [ 2] 1577 	addw	sp, #2
      008800 84               [ 1] 1578 	pop	a
                                   1579 ;	se8r01-send-current.c: 540: print_UCHAR_hex(readstatus);
      008801 88               [ 1] 1580 	push	a
      008802 CD 82 90         [ 4] 1581 	call	_print_UCHAR_hex
      008805 84               [ 1] 1582 	pop	a
                                   1583 ;	se8r01-send-current.c: 542: SE8R01_Init();
      008806 CD 86 C9         [ 4] 1584 	call	_SE8R01_Init
                                   1585 ;	se8r01-send-current.c: 546: while (1) {
      008809                       1586 00110$:
                                   1587 ;	se8r01-send-current.c: 548: gemiddeld=0;
      008809 5F               [ 1] 1588 	clrw	x
      00880A 1F 30            [ 2] 1589 	ldw	(0x30, sp), x
                                   1590 ;	se8r01-send-current.c: 549: ampere=0;
      00880C 5F               [ 1] 1591 	clrw	x
      00880D 1F 3A            [ 2] 1592 	ldw	(0x3a, sp), x
                                   1593 ;	se8r01-send-current.c: 550: for(samples=0;samples<100000;samples++)
      00880F 5F               [ 1] 1594 	clrw	x
      008810 1F 29            [ 2] 1595 	ldw	(0x29, sp), x
      008812 1F 27            [ 2] 1596 	ldw	(0x27, sp), x
      008814                       1597 00112$:
                                   1598 ;	se8r01-send-current.c: 553: ADC_CSR |= ((0x0F)&4); // select channel = 4 = PD3
      008814 AE 54 00         [ 2] 1599 	ldw	x, #0x5400
      008817 F6               [ 1] 1600 	ld	a, (x)
      008818 AA 04            [ 1] 1601 	or	a, #0x04
      00881A F7               [ 1] 1602 	ld	(x), a
                                   1603 ;	se8r01-send-current.c: 554: ADC_CR2 |= ADC_ALIGN; // Right Aligned Data
      00881B AE 54 02         [ 2] 1604 	ldw	x, #0x5402
      00881E F6               [ 1] 1605 	ld	a, (x)
      00881F AA 08            [ 1] 1606 	or	a, #0x08
      008821 F7               [ 1] 1607 	ld	(x), a
                                   1608 ;	se8r01-send-current.c: 555: ADC_CR1 |= ADC_ADON; // ADC ON
      008822 72 10 54 01      [ 1] 1609 	bset	0x5401, #0
                                   1610 ;	se8r01-send-current.c: 556: ADC_CR1 |= ADC_ADON; // start conversion 
      008826 72 10 54 01      [ 1] 1611 	bset	0x5401, #0
                                   1612 ;	se8r01-send-current.c: 557: while(((ADC_CSR)&(1<<7))== 0); // Wait till EOC
      00882A                       1613 00101$:
      00882A AE 54 00         [ 2] 1614 	ldw	x, #0x5400
      00882D F6               [ 1] 1615 	ld	a, (x)
      00882E 48               [ 1] 1616 	sll	a
      00882F 24 F9            [ 1] 1617 	jrnc	00101$
                                   1618 ;	se8r01-send-current.c: 559: ampere |= (unsigned int)ADC_DRL;
      008831 AE 54 05         [ 2] 1619 	ldw	x, #0x5405
      008834 F6               [ 1] 1620 	ld	a, (x)
      008835 02               [ 1] 1621 	rlwa	x
      008836 4F               [ 1] 1622 	clr	a
      008837 01               [ 1] 1623 	rrwa	x
      008838 16 3A            [ 2] 1624 	ldw	y, (0x3a, sp)
      00883A 17 38            [ 2] 1625 	ldw	(0x38, sp), y
      00883C 1A 39            [ 1] 1626 	or	a, (0x39, sp)
      00883E 90 97            [ 1] 1627 	ld	yl, a
      008840 9E               [ 1] 1628 	ld	a, xh
      008841 1A 38            [ 1] 1629 	or	a, (0x38, sp)
      008843 90 95            [ 1] 1630 	ld	yh, a
                                   1631 ;	se8r01-send-current.c: 560: ampere |= (unsigned int)ADC_DRH<<8;
      008845 AE 54 04         [ 2] 1632 	ldw	x, #0x5404
      008848 F6               [ 1] 1633 	ld	a, (x)
      008849 5F               [ 1] 1634 	clrw	x
      00884A 97               [ 1] 1635 	ld	xl, a
      00884B 58               [ 2] 1636 	sllw	x
      00884C 58               [ 2] 1637 	sllw	x
      00884D 58               [ 2] 1638 	sllw	x
      00884E 58               [ 2] 1639 	sllw	x
      00884F 58               [ 2] 1640 	sllw	x
      008850 58               [ 2] 1641 	sllw	x
      008851 58               [ 2] 1642 	sllw	x
      008852 58               [ 2] 1643 	sllw	x
      008853 17 36            [ 2] 1644 	ldw	(0x36, sp), y
      008855 9F               [ 1] 1645 	ld	a, xl
      008856 1A 37            [ 1] 1646 	or	a, (0x37, sp)
      008858 90 97            [ 1] 1647 	ld	yl, a
      00885A 9E               [ 1] 1648 	ld	a, xh
      00885B 1A 36            [ 1] 1649 	or	a, (0x36, sp)
      00885D 90 95            [ 1] 1650 	ld	yh, a
                                   1651 ;	se8r01-send-current.c: 562: ADC_CR1 &= ~(1<<0); // ADC Stop Conversion
      00885F AE 54 01         [ 2] 1652 	ldw	x, #0x5401
      008862 F6               [ 1] 1653 	ld	a, (x)
      008863 A4 FE            [ 1] 1654 	and	a, #0xfe
      008865 F7               [ 1] 1655 	ld	(x), a
                                   1656 ;	se8r01-send-current.c: 563: ampere &= 0x03ff; // 0 bits resolution so above 0x0400 is nothing
      008866 90 9E            [ 1] 1657 	ld	a, yh
      008868 A4 03            [ 1] 1658 	and	a, #0x03
      00886A 90 95            [ 1] 1659 	ld	yh, a
      00886C 17 3A            [ 2] 1660 	ldw	(0x3a, sp), y
                                   1661 ;	se8r01-send-current.c: 564: if (ampere > gemiddeld) gemiddeld=ampere;
      00886E 1E 3A            [ 2] 1662 	ldw	x, (0x3a, sp)
      008870 13 30            [ 2] 1663 	cpw	x, (0x30, sp)
      008872 2D 04            [ 1] 1664 	jrsle	00113$
      008874 16 3A            [ 2] 1665 	ldw	y, (0x3a, sp)
      008876 17 30            [ 2] 1666 	ldw	(0x30, sp), y
      008878                       1667 00113$:
                                   1668 ;	se8r01-send-current.c: 550: for(samples=0;samples<100000;samples++)
      008878 1E 29            [ 2] 1669 	ldw	x, (0x29, sp)
      00887A 1C 00 01         [ 2] 1670 	addw	x, #0x0001
      00887D 1F 29            [ 2] 1671 	ldw	(0x29, sp), x
      00887F 7B 28            [ 1] 1672 	ld	a, (0x28, sp)
      008881 A9 00            [ 1] 1673 	adc	a, #0x00
      008883 6B 28            [ 1] 1674 	ld	(0x28, sp), a
      008885 7B 27            [ 1] 1675 	ld	a, (0x27, sp)
      008887 A9 00            [ 1] 1676 	adc	a, #0x00
      008889 6B 27            [ 1] 1677 	ld	(0x27, sp), a
      00888B 1E 29            [ 2] 1678 	ldw	x, (0x29, sp)
      00888D A3 86 A0         [ 2] 1679 	cpw	x, #0x86a0
      008890 7B 28            [ 1] 1680 	ld	a, (0x28, sp)
      008892 A2 01            [ 1] 1681 	sbc	a, #0x01
      008894 7B 27            [ 1] 1682 	ld	a, (0x27, sp)
      008896 A2 00            [ 1] 1683 	sbc	a, #0x00
      008898 2E 03            [ 1] 1684 	jrsge	00147$
      00889A CC 88 14         [ 2] 1685 	jp	00112$
      00889D                       1686 00147$:
                                   1687 ;	se8r01-send-current.c: 568: if (gemiddeld < 0x001f) gemiddeld=0; //remove unwanted mini measurements
      00889D 1E 30            [ 2] 1688 	ldw	x, (0x30, sp)
      00889F A3 00 1F         [ 2] 1689 	cpw	x, #0x001f
      0088A2 2E 03            [ 1] 1690 	jrsge	00108$
      0088A4 5F               [ 1] 1691 	clrw	x
      0088A5 1F 30            [ 2] 1692 	ldw	(0x30, sp), x
      0088A7                       1693 00108$:
                                   1694 ;	se8r01-send-current.c: 570: tx_payload[0] = 0xac; //first two is unique ID for this current sensor
      0088A7 1E 32            [ 2] 1695 	ldw	x, (0x32, sp)
      0088A9 A6 AC            [ 1] 1696 	ld	a, #0xac
      0088AB F7               [ 1] 1697 	ld	(x), a
                                   1698 ;	se8r01-send-current.c: 571: tx_payload[1] = 0xcc;
      0088AC 1E 32            [ 2] 1699 	ldw	x, (0x32, sp)
      0088AE 5C               [ 2] 1700 	incw	x
      0088AF A6 CC            [ 1] 1701 	ld	a, #0xcc
      0088B1 F7               [ 1] 1702 	ld	(x), a
                                   1703 ;	se8r01-send-current.c: 572: tx_payload[2] = gemiddeld>>8;
      0088B2 16 32            [ 2] 1704 	ldw	y, (0x32, sp)
      0088B4 72 A9 00 02      [ 2] 1705 	addw	y, #0x0002
      0088B8 1E 30            [ 2] 1706 	ldw	x, (0x30, sp)
      0088BA 57               [ 2] 1707 	sraw	x
      0088BB 57               [ 2] 1708 	sraw	x
      0088BC 57               [ 2] 1709 	sraw	x
      0088BD 57               [ 2] 1710 	sraw	x
      0088BE 57               [ 2] 1711 	sraw	x
      0088BF 57               [ 2] 1712 	sraw	x
      0088C0 57               [ 2] 1713 	sraw	x
      0088C1 57               [ 2] 1714 	sraw	x
      0088C2 9F               [ 1] 1715 	ld	a, xl
      0088C3 90 F7            [ 1] 1716 	ld	(y), a
                                   1717 ;	se8r01-send-current.c: 573: tx_payload[3] = gemiddeld & 0x00ff; 
      0088C5 1E 32            [ 2] 1718 	ldw	x, (0x32, sp)
      0088C7 1C 00 03         [ 2] 1719 	addw	x, #0x0003
      0088CA 7B 31            [ 1] 1720 	ld	a, (0x31, sp)
      0088CC 88               [ 1] 1721 	push	a
      0088CD 0F 35            [ 1] 1722 	clr	(0x35, sp)
      0088CF 84               [ 1] 1723 	pop	a
      0088D0 F7               [ 1] 1724 	ld	(x), a
                                   1725 ;	se8r01-send-current.c: 574: write_spi_buf(iRF_CMD_WR_TX_PLOAD, tx_payload, 4);
      0088D1 1E 32            [ 2] 1726 	ldw	x, (0x32, sp)
      0088D3 4B 04            [ 1] 1727 	push	#0x04
      0088D5 89               [ 2] 1728 	pushw	x
      0088D6 4B A0            [ 1] 1729 	push	#0xa0
      0088D8 CD 81 48         [ 4] 1730 	call	_write_spi_buf
      0088DB 5B 04            [ 2] 1731 	addw	sp, #4
                                   1732 ;	se8r01-send-current.c: 575: write_spi_reg(WRITE_REG+STATUS, 0xff);
      0088DD 4B FF            [ 1] 1733 	push	#0xff
      0088DF 4B 27            [ 1] 1734 	push	#0x27
      0088E1 CD 80 CE         [ 4] 1735 	call	_write_spi_reg
      0088E4 5B 02            [ 2] 1736 	addw	sp, #2
                                   1737 ;	se8r01-send-current.c: 582: delay(4);
      0088E6 4B 04            [ 1] 1738 	push	#0x04
      0088E8 4B 00            [ 1] 1739 	push	#0x00
      0088EA CD 82 2E         [ 4] 1740 	call	_delay
      0088ED 5B 02            [ 2] 1741 	addw	sp, #2
      0088EF CC 88 09         [ 2] 1742 	jp	00110$
      0088F2 5B 3B            [ 2] 1743 	addw	sp, #59
      0088F4 81               [ 4] 1744 	ret
                                   1745 	.area CODE
      0088F5                       1746 ___str_0:
      0088F5 63 6F 6E 66 69 67 20  1747 	.ascii "config = "
             3D 20
      0088FE 0A                    1748 	.db 0x0A
      0088FF 0D                    1749 	.db 0x0D
      008900 00                    1750 	.db 0x00
      008901                       1751 ___str_1:
      008901 73 74 61 74 75 73 20  1752 	.ascii "status = "
             3D 20
      00890A 0A                    1753 	.db 0x0A
      00890B 0D                    1754 	.db 0x0D
      00890C 00                    1755 	.db 0x00
                                   1756 	.area INITIALIZER
      008982                       1757 __xinit__SE8R01_DR_2M:
      008982 00 00                 1758 	.dw #0x0000
      008984                       1759 __xinit__SE8R01_DR_1M:
      008984 00 00                 1760 	.dw #0x0000
      008986                       1761 __xinit__SE8R01_DR_500K:
      008986 00 01                 1762 	.dw #0x0001
      008988                       1763 __xinit__pload_width_now:
      008988 00 00                 1764 	.dw #0x0000
      00898A                       1765 __xinit__newdata:
      00898A 00 00                 1766 	.dw #0x0000
      00898C                       1767 __xinit__signal_lv:
      00898C 00                    1768 	.db #0x00	;  0
      00898D                       1769 __xinit__pip:
      00898D 00 00                 1770 	.dw #0x0000
      00898F                       1771 __xinit__status:
      00898F 00                    1772 	.db #0x00	; 0
      008990                       1773 __xinit__TX_ADDRESS:
      008990 B3                    1774 	.db #0xB3	; 179
      008991 43                    1775 	.db #0x43	; 67	'C'
      008992 10                    1776 	.db #0x10	; 16
      008993 10                    1777 	.db #0x10	; 16
      008994                       1778 __xinit__ADDRESS2:
      008994 B1                    1779 	.db #0xB1	; 177
      008995                       1780 __xinit__ADDRESS3:
      008995 B2                    1781 	.db #0xB2	; 178
      008996                       1782 __xinit__ADDRESS4:
      008996 B3                    1783 	.db #0xB3	; 179
      008997                       1784 __xinit__ADDRESS5:
      008997 B4                    1785 	.db #0xB4	; 180
      008998                       1786 __xinit__ADDRESS1:
      008998 B0                    1787 	.db #0xB0	; 176
      008999 43                    1788 	.db #0x43	; 67	'C'
      00899A 10                    1789 	.db #0x10	; 16
      00899B 10                    1790 	.db #0x10	; 16
      00899C                       1791 __xinit__ADDRESS0:
      00899C 34                    1792 	.db #0x34	; 52	'4'
      00899D 43                    1793 	.db #0x43	; 67	'C'
      00899E 10                    1794 	.db #0x10	; 16
      00899F 10                    1795 	.db #0x10	; 16
      0089A0                       1796 __xinit__rx_buf:
      0089A0 00                    1797 	.db #0x00	; 0
      0089A1 00                    1798 	.db 0x00
      0089A2 00                    1799 	.db 0x00
      0089A3 00                    1800 	.db 0x00
      0089A4 00                    1801 	.db 0x00
      0089A5 00                    1802 	.db 0x00
      0089A6 00                    1803 	.db 0x00
      0089A7 00                    1804 	.db 0x00
      0089A8 00                    1805 	.db 0x00
      0089A9 00                    1806 	.db 0x00
      0089AA 00                    1807 	.db 0x00
      0089AB 00                    1808 	.db 0x00
      0089AC 00                    1809 	.db 0x00
      0089AD 00                    1810 	.db 0x00
      0089AE 00                    1811 	.db 0x00
      0089AF 00                    1812 	.db 0x00
      0089B0 00                    1813 	.db 0x00
      0089B1 00                    1814 	.db 0x00
      0089B2 00                    1815 	.db 0x00
      0089B3 00                    1816 	.db 0x00
      0089B4 00                    1817 	.db 0x00
      0089B5 00                    1818 	.db 0x00
      0089B6 00                    1819 	.db 0x00
      0089B7 00                    1820 	.db 0x00
      0089B8 00                    1821 	.db 0x00
      0089B9 00                    1822 	.db 0x00
      0089BA 00                    1823 	.db 0x00
      0089BB 00                    1824 	.db 0x00
      0089BC 00                    1825 	.db 0x00
      0089BD 00                    1826 	.db 0x00
      0089BE 00                    1827 	.db 0x00
      0089BF 00                    1828 	.db 0x00
      0089C0                       1829 __xinit__tx_buf:
      0089C0 00                    1830 	.db #0x00	; 0
      0089C1 00                    1831 	.db 0x00
      0089C2 00                    1832 	.db 0x00
      0089C3 00                    1833 	.db 0x00
      0089C4 00                    1834 	.db 0x00
      0089C5 00                    1835 	.db 0x00
      0089C6 00                    1836 	.db 0x00
      0089C7 00                    1837 	.db 0x00
      0089C8 00                    1838 	.db 0x00
      0089C9 00                    1839 	.db 0x00
      0089CA 00                    1840 	.db 0x00
      0089CB 00                    1841 	.db 0x00
      0089CC 00                    1842 	.db 0x00
      0089CD 00                    1843 	.db 0x00
      0089CE 00                    1844 	.db 0x00
      0089CF 00                    1845 	.db 0x00
      0089D0 00                    1846 	.db 0x00
      0089D1 00                    1847 	.db 0x00
      0089D2 00                    1848 	.db 0x00
      0089D3 00                    1849 	.db 0x00
      0089D4 00                    1850 	.db 0x00
      0089D5 00                    1851 	.db 0x00
      0089D6 00                    1852 	.db 0x00
      0089D7 00                    1853 	.db 0x00
      0089D8 00                    1854 	.db 0x00
      0089D9 00                    1855 	.db 0x00
      0089DA 00                    1856 	.db 0x00
      0089DB 00                    1857 	.db 0x00
      0089DC 00                    1858 	.db 0x00
      0089DD 00                    1859 	.db 0x00
      0089DE 00                    1860 	.db 0x00
      0089DF 00                    1861 	.db 0x00
                                   1862 	.area CABS (ABS)
