;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Jul  5 2014) (Linux)
; This file was generated Thu May 18 19:18:44 2017
;--------------------------------------------------------
	.module se8r01_send_current
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _SE8R01_Init
	.globl _SE8R01_Analog_Init
	.globl _SE8R01_Calibration
	.globl _rf_switch_bank
	.globl _init_io
	.globl _InitializeUART
	.globl _print_UCHAR_hex
	.globl _UARTPrintF
	.globl _delay
	.globl _InitializeSystemClock
	.globl _InitializeSPI
	.globl _read_spi_buf
	.globl _write_spi_buf
	.globl _read_spi_reg
	.globl _write_spi_reg
	.globl _write_spi
	.globl _delayTenMicro
	.globl _memset
	.globl _tx_buf
	.globl _rx_buf
	.globl _ADDRESS0
	.globl _ADDRESS1
	.globl _ADDRESS5
	.globl _ADDRESS4
	.globl _ADDRESS3
	.globl _ADDRESS2
	.globl _TX_ADDRESS
	.globl _status
	.globl _pip
	.globl _signal_lv
	.globl _newdata
	.globl _pload_width_now
	.globl _SE8R01_DR_500K
	.globl _SE8R01_DR_1M
	.globl _SE8R01_DR_2M
	.globl _myData_pip4
	.globl _myData_pip5
	.globl _gtemp
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_gtemp::
	.ds 5
_myData_pip5::
	.ds 5
_myData_pip4::
	.ds 5
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_SE8R01_DR_2M::
	.ds 2
_SE8R01_DR_1M::
	.ds 2
_SE8R01_DR_500K::
	.ds 2
_pload_width_now::
	.ds 2
_newdata::
	.ds 2
_signal_lv::
	.ds 1
_pip::
	.ds 2
_status::
	.ds 1
_TX_ADDRESS::
	.ds 4
_ADDRESS2::
	.ds 1
_ADDRESS3::
	.ds 1
_ADDRESS4::
	.ds 1
_ADDRESS5::
	.ds 1
_ADDRESS1::
	.ds 4
_ADDRESS0::
	.ds 4
_rx_buf::
	.ds 32
_tx_buf::
	.ds 32
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ;reset
	int 0x0000 ;trap
	int 0x0000 ;int0
	int 0x0000 ;int1
	int 0x0000 ;int2
	int 0x0000 ;int3
	int 0x0000 ;int4
	int 0x0000 ;int5
	int 0x0000 ;int6
	int 0x0000 ;int7
	int 0x0000 ;int8
	int 0x0000 ;int9
	int 0x0000 ;int10
	int 0x0000 ;int11
	int 0x0000 ;int12
	int 0x0000 ;int13
	int 0x0000 ;int14
	int 0x0000 ;int15
	int 0x0000 ;int16
	int 0x0000 ;int17
	int 0x0000 ;int18
	int 0x0000 ;int19
	int 0x0000 ;int20
	int 0x0000 ;int21
	int 0x0000 ;int22
	int 0x0000 ;int23
	int 0x0000 ;int24
	int 0x0000 ;int25
	int 0x0000 ;int26
	int 0x0000 ;int27
	int 0x0000 ;int28
	int 0x0000 ;int29
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_gs_init_startup:
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	se8r01-send-current.c: 37: void delayTenMicro (void) {
;	-----------------------------------------
;	 function delayTenMicro
;	-----------------------------------------
_delayTenMicro:
;	se8r01-send-current.c: 39: for (a = 0; a < 50; ++a)
	ld	a, #0x32
00104$:
;	se8r01-send-current.c: 40: __asm__("nop");
	nop
	dec	a
;	se8r01-send-current.c: 39: for (a = 0; a < 50; ++a)
	tnz	a
	jrne	00104$
	ret
;	se8r01-send-current.c: 42: UCHAR write_spi (UCHAR value) {
;	-----------------------------------------
;	 function write_spi
;	-----------------------------------------
_write_spi:
;	se8r01-send-current.c: 44: delayTenMicro ();
	call	_delayTenMicro
;	se8r01-send-current.c: 45: SPI_DR = value;
	ldw	x, #0x5204
	ld	a, (0x03, sp)
	ld	(x), a
;	se8r01-send-current.c: 46: delayTenMicro ();
	call	_delayTenMicro
;	se8r01-send-current.c: 47: while ((SPI_SR & TXE) == 0);
00101$:
	ldw	x, #0x5203
	ld	a, (x)
	bcp	a, #0x02
	jreq	00101$
;	se8r01-send-current.c: 48: delayTenMicro ();
	call	_delayTenMicro
;	se8r01-send-current.c: 49: while ((SPI_SR & RXNE) == 0);
00104$:
	ldw	x, #0x5203
	ld	a, (x)
	srl	a
	jrnc	00104$
;	se8r01-send-current.c: 50: delayTenMicro ();
	call	_delayTenMicro
;	se8r01-send-current.c: 51: ret = SPI_DR;
	ldw	x, #0x5204
	ld	a, (x)
;	se8r01-send-current.c: 52: return (ret);
	ret
;	se8r01-send-current.c: 54: UCHAR write_spi_reg (UCHAR reg, UCHAR value) {
;	-----------------------------------------
;	 function write_spi_reg
;	-----------------------------------------
_write_spi_reg:
	push	a
;	se8r01-send-current.c: 56: PC_ODR &= ~(1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	se8r01-send-current.c: 57: ret = write_spi (reg);
	ld	a, (0x04, sp)
	push	a
	call	_write_spi
	addw	sp, #1
	ld	(0x01, sp), a
;	se8r01-send-current.c: 58: if (reg != NOP && reg != FLUSH_RX && reg != FLUSH_TX)
	ld	a, (0x04, sp)
	cp	a, #0xff
	jreq	00102$
	ld	a, (0x04, sp)
	cp	a, #0xe2
	jreq	00102$
	ld	a, (0x04, sp)
	cp	a, #0xe1
	jreq	00102$
;	se8r01-send-current.c: 59: write_spi (value);
	ld	a, (0x05, sp)
	push	a
	call	_write_spi
	pop	a
	jra	00103$
00102$:
;	se8r01-send-current.c: 61: delayTenMicro ();
	call	_delayTenMicro
00103$:
;	se8r01-send-current.c: 62: PC_ODR |= (1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	se8r01-send-current.c: 63: return (ret);
	ld	a, (0x01, sp)
	addw	sp, #1
	ret
;	se8r01-send-current.c: 65: UCHAR read_spi_reg (UCHAR reg) {
;	-----------------------------------------
;	 function read_spi_reg
;	-----------------------------------------
_read_spi_reg:
	push	a
;	se8r01-send-current.c: 67: PC_ODR &= ~(1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	se8r01-send-current.c: 68: ret = write_spi (reg);
	ld	a, (0x04, sp)
	push	a
	call	_write_spi
	addw	sp, #1
	ld	(0x01, sp), a
;	se8r01-send-current.c: 69: if (reg != NOP && reg != FLUSH_RX && reg != FLUSH_TX)
	ld	a, (0x04, sp)
	cp	a, #0xff
	jreq	00102$
	ld	a, (0x04, sp)
	cp	a, #0xe2
	jreq	00102$
	ld	a, (0x04, sp)
	cp	a, #0xe1
	jreq	00102$
;	se8r01-send-current.c: 70: ret = write_spi (NOP);
	push	#0xff
	call	_write_spi
	addw	sp, #1
	ld	(0x01, sp), a
	jra	00103$
00102$:
;	se8r01-send-current.c: 72: delayTenMicro ();
	call	_delayTenMicro
00103$:
;	se8r01-send-current.c: 73: PC_ODR |= (1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	se8r01-send-current.c: 74: return (ret);
	ld	a, (0x01, sp)
	addw	sp, #1
	ret
;	se8r01-send-current.c: 76: UCHAR write_spi_buf (UCHAR reg, UCHAR *array, UCHAR len) {
;	-----------------------------------------
;	 function write_spi_buf
;	-----------------------------------------
_write_spi_buf:
	sub	sp, #2
;	se8r01-send-current.c: 78: PC_ODR &= ~(1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	se8r01-send-current.c: 79: ret = write_spi (reg);
	ld	a, (0x05, sp)
	push	a
	call	_write_spi
	addw	sp, #1
	ld	(0x02, sp), a
;	se8r01-send-current.c: 80: for (n = 0; n < len; ++n)
	clr	(0x01, sp)
00103$:
	ld	a, (0x01, sp)
	cp	a, (0x08, sp)
	jrnc	00101$
;	se8r01-send-current.c: 81: write_spi (array[n]);
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	addw	x, (0x06, sp)
	ld	a, (x)
	push	a
	call	_write_spi
	pop	a
;	se8r01-send-current.c: 80: for (n = 0; n < len; ++n)
	inc	(0x01, sp)
	jra	00103$
00101$:
;	se8r01-send-current.c: 82: PC_ODR |= (1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	se8r01-send-current.c: 83: return (ret);
	ld	a, (0x02, sp)
	addw	sp, #2
	ret
;	se8r01-send-current.c: 85: UCHAR read_spi_buf (UCHAR reg, UCHAR *array, UCHAR len) {
;	-----------------------------------------
;	 function read_spi_buf
;	-----------------------------------------
_read_spi_buf:
	sub	sp, #2
;	se8r01-send-current.c: 87: PC_ODR &= ~(1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	se8r01-send-current.c: 88: ret = write_spi (reg);
	ld	a, (0x05, sp)
	push	a
	call	_write_spi
	addw	sp, #1
	ld	(0x01, sp), a
;	se8r01-send-current.c: 89: for (n = 0; n < len; ++n)
	clr	(0x02, sp)
00103$:
	ld	a, (0x02, sp)
	cp	a, (0x08, sp)
	jrnc	00101$
;	se8r01-send-current.c: 90: array[n] = write_spi (NOP);
	clrw	x
	ld	a, (0x02, sp)
	ld	xl, a
	addw	x, (0x06, sp)
	pushw	x
	push	#0xff
	call	_write_spi
	addw	sp, #1
	popw	x
	ld	(x), a
;	se8r01-send-current.c: 89: for (n = 0; n < len; ++n)
	inc	(0x02, sp)
	jra	00103$
00101$:
;	se8r01-send-current.c: 91: PC_ODR |= (1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	se8r01-send-current.c: 92: return (ret);
	ld	a, (0x01, sp)
	addw	sp, #2
	ret
;	se8r01-send-current.c: 94: void InitializeSPI () {
;	-----------------------------------------
;	 function InitializeSPI
;	-----------------------------------------
_InitializeSPI:
;	se8r01-send-current.c: 95: SPI_CR1 = MSBFIRST | SPI_ENABLE | BR_DIV256 | MASTER | CPOL0 | CPHA0;
	ldw	x, #0x5200
	ld	a, #0x7c
	ld	(x), a
;	se8r01-send-current.c: 96: SPI_CR2 = BDM_2LINE | CRCEN_OFF | CRCNEXT_TXBUF | FULL_DUPLEX | SSM_DISABLE;
	ldw	x, #0x5201
	clr	(x)
;	se8r01-send-current.c: 97: SPI_ICR = TXIE_MASKED | RXIE_MASKED | ERRIE_MASKED | WKIE_MASKED;
	ldw	x, #0x5202
	clr	(x)
;	se8r01-send-current.c: 98: PC_DDR = (1 << PC3) | (1 << PC4); // output mode
	ldw	x, #0x500c
	ld	a, #0x18
	ld	(x), a
;	se8r01-send-current.c: 99: PC_CR1 = (1 << PC3) | (1 << PC4); // push-pull
	ldw	x, #0x500d
	ld	a, #0x18
	ld	(x), a
;	se8r01-send-current.c: 100: PC_CR2 = (1 << PC3) | (1 << PC4); // up to 10MHz speed
	ldw	x, #0x500e
	ld	a, #0x18
	ld	(x), a
;	se8r01-send-current.c: 102: PC_ODR &= ~(1 << CE);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
	ret
;	se8r01-send-current.c: 104: void InitializeSystemClock() {
;	-----------------------------------------
;	 function InitializeSystemClock
;	-----------------------------------------
_InitializeSystemClock:
;	se8r01-send-current.c: 105: CLK_ICKR = 0;                       //  Reset the Internal Clock Register.
	ldw	x, #0x50c0
	clr	(x)
;	se8r01-send-current.c: 106: CLK_ICKR = CLK_HSIEN;               //  Enable the HSI.
	ldw	x, #0x50c0
	ld	a, #0x01
	ld	(x), a
;	se8r01-send-current.c: 107: CLK_ECKR = 0;                       //  Disable the external clock.
	ldw	x, #0x50c1
	clr	(x)
;	se8r01-send-current.c: 108: while ((CLK_ICKR & CLK_HSIRDY) == 0);       //  Wait for the HSI to be ready for use.
00101$:
	ldw	x, #0x50c0
	ld	a, (x)
	bcp	a, #0x02
	jreq	00101$
;	se8r01-send-current.c: 109: CLK_CKDIVR = 0;                     //  Ensure the clocks are running at full speed.
	ldw	x, #0x50c6
	clr	(x)
;	se8r01-send-current.c: 110: CLK_PCKENR1 = 0xff;                 //  Enable all peripheral clocks.
	ldw	x, #0x50c7
	ld	a, #0xff
	ld	(x), a
;	se8r01-send-current.c: 111: CLK_PCKENR2 = 0xff;                 //  Ditto.
	ldw	x, #0x50ca
	ld	a, #0xff
	ld	(x), a
;	se8r01-send-current.c: 112: CLK_CCOR = 0;                       //  Turn off CCO.
	ldw	x, #0x50c9
	clr	(x)
;	se8r01-send-current.c: 113: CLK_HSITRIMR = 0;                   //  Turn off any HSIU trimming.
	ldw	x, #0x50cc
	clr	(x)
;	se8r01-send-current.c: 114: CLK_SWIMCCR = 0;                    //  Set SWIM to run at clock / 2.
	ldw	x, #0x50cd
	clr	(x)
;	se8r01-send-current.c: 115: CLK_SWR = 0xe1;                     //  Use HSI as the clock source.
	ldw	x, #0x50c4
	ld	a, #0xe1
	ld	(x), a
;	se8r01-send-current.c: 116: CLK_SWCR = 0;                       //  Reset the clock switch control register.
	ldw	x, #0x50c5
	clr	(x)
;	se8r01-send-current.c: 117: CLK_SWCR = CLK_SWEN;                //  Enable switching.
	ldw	x, #0x50c5
	ld	a, #0x02
	ld	(x), a
;	se8r01-send-current.c: 118: while ((CLK_SWCR & CLK_SWBSY) != 0);        //  Pause while the clock switch is busy.
00104$:
	ldw	x, #0x50c5
	ld	a, (x)
	srl	a
	jrc	00104$
	ret
;	se8r01-send-current.c: 120: void delay (int time_ms) {
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	sub	sp, #10
;	se8r01-send-current.c: 122: for (x = 0; x < 1036*time_ms; ++x)
	clrw	x
	ldw	(0x03, sp), x
	ldw	(0x01, sp), x
	ldw	x, (0x0d, sp)
	pushw	x
	push	#0x0c
	push	#0x04
	call	__mulint
	addw	sp, #4
	ldw	(0x09, sp), x
00103$:
	ldw	y, (0x09, sp)
	ldw	(0x07, sp), y
	ld	a, (0x07, sp)
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x06, sp), a
	ld	(0x05, sp), a
	ldw	x, (0x03, sp)
	cpw	x, (0x07, sp)
	ld	a, (0x02, sp)
	sbc	a, (0x06, sp)
	ld	a, (0x01, sp)
	sbc	a, (0x05, sp)
	jrsge	00105$
;	se8r01-send-current.c: 123: __asm__("nop");
	nop
;	se8r01-send-current.c: 122: for (x = 0; x < 1036*time_ms; ++x)
	ldw	y, (0x03, sp)
	addw	y, #0x0001
	ld	a, (0x02, sp)
	adc	a, #0x00
	ld	xl, a
	ld	a, (0x01, sp)
	adc	a, #0x00
	ld	xh, a
	ldw	(0x03, sp), y
	ldw	(0x01, sp), x
	jra	00103$
00105$:
	addw	sp, #10
	ret
;	se8r01-send-current.c: 128: void UARTPrintF (char *message) {
;	-----------------------------------------
;	 function UARTPrintF
;	-----------------------------------------
_UARTPrintF:
;	se8r01-send-current.c: 129: char *ch = message;
	ldw	y, (0x03, sp)
;	se8r01-send-current.c: 130: while (*ch) {
00104$:
	ld	a, (y)
	tnz	a
	jreq	00107$
;	se8r01-send-current.c: 131: UART1_DR = (unsigned char) *ch;     //  Put the next character into the data transmission register.
	ldw	x, #0x5231
	ld	(x), a
;	se8r01-send-current.c: 132: while ((UART1_SR & SR_TXE) == 0);   //  Wait for transmission to complete.
00101$:
	ldw	x, #0x5230
	ld	a, (x)
	sll	a
	jrnc	00101$
;	se8r01-send-current.c: 133: ch++;                               //  Grab the next character.
	incw	y
	jra	00104$
00107$:
	ret
;	se8r01-send-current.c: 136: void print_UCHAR_hex (unsigned char buffer) {
;	-----------------------------------------
;	 function print_UCHAR_hex
;	-----------------------------------------
_print_UCHAR_hex:
	sub	sp, #12
;	se8r01-send-current.c: 139: a = (buffer >> 4);
	ld	a, (0x0f, sp)
	swap	a
	and	a, #0x0f
	clrw	x
	ld	xl, a
;	se8r01-send-current.c: 140: if (a > 9)
	cpw	x, #0x0009
	jrsle	00102$
;	se8r01-send-current.c: 141: a = a + 'a' - 10;
	addw	x, #0x0057
	ldw	(0x0b, sp), x
	jra	00103$
00102$:
;	se8r01-send-current.c: 143: a += '0'; 
	addw	x, #0x0030
	ldw	(0x0b, sp), x
00103$:
;	se8r01-send-current.c: 144: b = buffer & 0x0f;
	ld	a, (0x0f, sp)
	and	a, #0x0f
	clrw	x
	ld	xl, a
;	se8r01-send-current.c: 145: if (b > 9)
	cpw	x, #0x0009
	jrsle	00105$
;	se8r01-send-current.c: 146: b = b + 'a' - 10;
	addw	x, #0x0057
	ldw	(0x09, sp), x
	jra	00106$
00105$:
;	se8r01-send-current.c: 148: b += '0'; 
	addw	x, #0x0030
	ldw	(0x09, sp), x
00106$:
;	se8r01-send-current.c: 149: message[0] = a;
	ldw	y, sp
	incw	y
	ld	a, (0x0c, sp)
	ld	(y), a
;	se8r01-send-current.c: 150: message[1] = b;
	ldw	x, y
	incw	x
	ld	a, (0x0a, sp)
	ld	(x), a
;	se8r01-send-current.c: 151: message[2] = 0;
	ldw	x, y
	incw	x
	incw	x
	clr	(x)
;	se8r01-send-current.c: 152: UARTPrintF (message);
	pushw	y
	call	_UARTPrintF
	addw	sp, #2
	addw	sp, #12
	ret
;	se8r01-send-current.c: 155: void InitializeUART() {
;	-----------------------------------------
;	 function InitializeUART
;	-----------------------------------------
_InitializeUART:
;	se8r01-send-current.c: 165: UART1_CR1 = 0;
	ldw	x, #0x5234
	clr	(x)
;	se8r01-send-current.c: 166: UART1_CR2 = 0;
	ldw	x, #0x5235
	clr	(x)
;	se8r01-send-current.c: 167: UART1_CR4 = 0;
	ldw	x, #0x5237
	clr	(x)
;	se8r01-send-current.c: 168: UART1_CR3 = 0;
	ldw	x, #0x5236
	clr	(x)
;	se8r01-send-current.c: 169: UART1_CR5 = 0;
	ldw	x, #0x5238
	clr	(x)
;	se8r01-send-current.c: 170: UART1_GTR = 0;
	ldw	x, #0x5239
	clr	(x)
;	se8r01-send-current.c: 171: UART1_PSCR = 0;
	ldw	x, #0x523a
	clr	(x)
;	se8r01-send-current.c: 175: UNSET (UART1_CR1, CR1_M);        //  8 Data bits.
	ldw	x, #0x5234
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	se8r01-send-current.c: 176: UNSET (UART1_CR1, CR1_PCEN);     //  Disable parity.
	ldw	x, #0x5234
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
;	se8r01-send-current.c: 177: UNSET (UART1_CR3, CR3_STOPH);    //  1 stop bit.
	ldw	x, #0x5236
	ld	a, (x)
	and	a, #0xdf
	ld	(x), a
;	se8r01-send-current.c: 178: UNSET (UART1_CR3, CR3_STOPL);    //  1 stop bit.
	ldw	x, #0x5236
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	se8r01-send-current.c: 179: UART1_BRR2 = 0x0a;      //  Set the baud rate registers to 115200 baud
	ldw	x, #0x5233
	ld	a, #0x0a
	ld	(x), a
;	se8r01-send-current.c: 180: UART1_BRR1 = 0x08;      //  based upon a 16 MHz system clock.
	ldw	x, #0x5232
	ld	a, #0x08
	ld	(x), a
;	se8r01-send-current.c: 184: UNSET (UART1_CR2, CR2_TEN);      //  Disable transmit.
	ldw	x, #0x5235
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	se8r01-send-current.c: 185: UNSET (UART1_CR2, CR2_REN);      //  Disable receive.
	ldw	x, #0x5235
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
;	se8r01-send-current.c: 189: SET (UART1_CR3, CR3_CPOL);
	ldw	x, #0x5236
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	se8r01-send-current.c: 190: SET (UART1_CR3, CR3_CPHA);
	ldw	x, #0x5236
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
;	se8r01-send-current.c: 191: SET (UART1_CR3, CR3_LBCL);
	bset	0x5236, #0
;	se8r01-send-current.c: 195: SET (UART1_CR2, CR2_TEN);
	ldw	x, #0x5235
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	se8r01-send-current.c: 196: SET (UART1_CR2, CR2_REN);
	ldw	x, #0x5235
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	se8r01-send-current.c: 197: UART1_CR3 = CR3_CLKEN;
	ldw	x, #0x5236
	ld	a, #0x08
	ld	(x), a
	ret
;	se8r01-send-current.c: 270: void init_io(void)
;	-----------------------------------------
;	 function init_io
;	-----------------------------------------
_init_io:
;	se8r01-send-current.c: 279: PC_ODR &= ~(1 << CE);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	se8r01-send-current.c: 281: PC_ODR |= (1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
	ret
;	se8r01-send-current.c: 287: void rf_switch_bank(unsigned char bankindex)
;	-----------------------------------------
;	 function rf_switch_bank
;	-----------------------------------------
_rf_switch_bank:
	push	a
;	se8r01-send-current.c: 290: temp1 = bankindex;
	ld	a, (0x04, sp)
	ld	(0x01, sp), a
;	se8r01-send-current.c: 292: temp0 = write_spi(iRF_BANK0_STATUS);
	push	#0x07
	call	_write_spi
	addw	sp, #1
;	se8r01-send-current.c: 294: if((temp0&0x80)!=temp1)
	and	a, #0x80
	cp	a, (0x01, sp)
	jreq	00103$
;	se8r01-send-current.c: 296: write_spi_reg(iRF_CMD_ACTIVATE,0x53);
	push	#0x53
	push	#0x50
	call	_write_spi_reg
	addw	sp, #2
00103$:
	pop	a
	ret
;	se8r01-send-current.c: 303: void SE8R01_Calibration()
;	-----------------------------------------
;	 function SE8R01_Calibration
;	-----------------------------------------
_SE8R01_Calibration:
	sub	sp, #13
;	se8r01-send-current.c: 306: rf_switch_bank(iBANK0);
	push	#0x00
	call	_rf_switch_bank
	pop	a
;	se8r01-send-current.c: 307: temp[0]=0x03;
	ldw	x, sp
	incw	x
	ldw	(0x06, sp), x
	ldw	x, (0x06, sp)
	ld	a, #0x03
	ld	(x), a
;	se8r01-send-current.c: 308: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_CONFIG,temp, 1);
	ldw	x, (0x06, sp)
	push	#0x01
	pushw	x
	push	#0x20
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-send-current.c: 310: temp[0]=0x32;
	ldw	x, (0x06, sp)
	ld	a, #0x32
	ld	(x), a
;	se8r01-send-current.c: 312: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_RF_CH, temp,1);
	ldw	x, (0x06, sp)
	push	#0x01
	pushw	x
	push	#0x25
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-send-current.c: 316: if (SE8R01_DR_2M==1)
	ldw	x, _SE8R01_DR_2M+0
	cpw	x, #0x0001
	jrne	00105$
;	se8r01-send-current.c: 317: {temp[0]=0x48;}
	ldw	x, (0x06, sp)
	ld	a, #0x48
	ld	(x), a
	jra	00106$
00105$:
;	se8r01-send-current.c: 318: else if (SE8R01_DR_1M==1)
	ldw	x, _SE8R01_DR_1M+0
	cpw	x, #0x0001
	jrne	00102$
;	se8r01-send-current.c: 319: {temp[0]=0x40;}
	ldw	x, (0x06, sp)
	ld	a, #0x40
	ld	(x), a
	jra	00106$
00102$:
;	se8r01-send-current.c: 321: {temp[0]=0x68;}   
	ldw	x, (0x06, sp)
	ld	a, #0x68
	ld	(x), a
00106$:
;	se8r01-send-current.c: 323: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_RF_SETUP,temp,1);
	ldw	x, (0x06, sp)
	push	#0x01
	pushw	x
	push	#0x26
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-send-current.c: 324: temp[0]=0x77;
	ldw	x, (0x06, sp)
	ld	a, #0x77
	ld	(x), a
;	se8r01-send-current.c: 325: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_PRE_GURD, temp,1);
	ldw	x, (0x06, sp)
	push	#0x01
	pushw	x
	push	#0x3f
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-send-current.c: 327: rf_switch_bank(iBANK1);
	push	#0x80
	call	_rf_switch_bank
	pop	a
;	se8r01-send-current.c: 328: temp[0]=0x40;
	ldw	x, (0x06, sp)
	ld	a, #0x40
	ld	(x), a
;	se8r01-send-current.c: 329: temp[1]=0x00;
	ldw	x, (0x06, sp)
	incw	x
	ldw	(0x0c, sp), x
	ldw	x, (0x0c, sp)
	clr	(x)
;	se8r01-send-current.c: 330: temp[2]=0x10;
	ldw	x, (0x06, sp)
	incw	x
	incw	x
	ldw	(0x0a, sp), x
	ldw	x, (0x0a, sp)
	ld	a, #0x10
	ld	(x), a
;	se8r01-send-current.c: 332: {temp[3]=0xE6;}
	ldw	x, (0x06, sp)
	addw	x, #0x0003
	ldw	(0x08, sp), x
;	se8r01-send-current.c: 331: if (SE8R01_DR_2M==1)
	ldw	x, _SE8R01_DR_2M+0
	cpw	x, #0x0001
	jrne	00108$
;	se8r01-send-current.c: 332: {temp[3]=0xE6;}
	ldw	x, (0x08, sp)
	ld	a, #0xe6
	ld	(x), a
	jra	00109$
00108$:
;	se8r01-send-current.c: 334: {temp[3]=0xE4;}
	ldw	x, (0x08, sp)
	ld	a, #0xe4
	ld	(x), a
00109$:
;	se8r01-send-current.c: 336: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_PLL_CTL0, temp, 4);
	ldw	x, (0x06, sp)
	push	#0x04
	pushw	x
	push	#0x21
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-send-current.c: 338: temp[0]=0x20;
	ldw	x, (0x06, sp)
	ld	a, #0x20
	ld	(x), a
;	se8r01-send-current.c: 339: temp[1]=0x08;
	ldw	x, (0x0c, sp)
	ld	a, #0x08
	ld	(x), a
;	se8r01-send-current.c: 340: temp[2]=0x50;
	ldw	x, (0x0a, sp)
	ld	a, #0x50
	ld	(x), a
;	se8r01-send-current.c: 341: temp[3]=0x40;
	ldw	x, (0x08, sp)
	ld	a, #0x40
	ld	(x), a
;	se8r01-send-current.c: 342: temp[4]=0x50;
	ldw	x, (0x06, sp)
	ld	a, #0x50
	ld	(0x0004, x), a
;	se8r01-send-current.c: 343: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_CAL_CTL, temp, 5);
	ldw	x, (0x06, sp)
	push	#0x05
	pushw	x
	push	#0x23
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-send-current.c: 345: temp[0]=0x00;
	ldw	x, (0x06, sp)
	clr	(x)
;	se8r01-send-current.c: 346: temp[1]=0x00;
	ldw	x, (0x0c, sp)
	clr	(x)
;	se8r01-send-current.c: 347: if (SE8R01_DR_2M==1)
	ldw	x, _SE8R01_DR_2M+0
	cpw	x, #0x0001
	jrne	00111$
;	se8r01-send-current.c: 348: { temp[2]=0x1E;}
	ldw	x, (0x0a, sp)
	ld	a, #0x1e
	ld	(x), a
	jra	00112$
00111$:
;	se8r01-send-current.c: 350: { temp[2]=0x1F;}
	ldw	x, (0x0a, sp)
	ld	a, #0x1f
	ld	(x), a
00112$:
;	se8r01-send-current.c: 352: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_IF_FREQ, temp, 3);
	ldw	x, (0x06, sp)
	push	#0x03
	pushw	x
	push	#0x2a
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-send-current.c: 354: if (SE8R01_DR_2M==1)
	ldw	x, _SE8R01_DR_2M+0
	cpw	x, #0x0001
	jrne	00114$
;	se8r01-send-current.c: 355: { temp[0]=0x29;}
	ldw	x, (0x06, sp)
	ld	a, #0x29
	ld	(x), a
	jra	00115$
00114$:
;	se8r01-send-current.c: 357: { temp[0]=0x14;}
	ldw	x, (0x06, sp)
	ld	a, #0x14
	ld	(x), a
00115$:
;	se8r01-send-current.c: 359: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_FDEV, temp, 1);
	ldw	x, (0x06, sp)
	push	#0x01
	pushw	x
	push	#0x2c
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-send-current.c: 361: temp[0]=0x00;
	ldw	x, (0x06, sp)
	clr	(x)
;	se8r01-send-current.c: 362: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_DAC_CAL_LOW,temp,1);
	ldw	x, (0x06, sp)
	push	#0x01
	pushw	x
	push	#0x37
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-send-current.c: 364: temp[0]=0x7F;
	ldw	x, (0x06, sp)
	ld	a, #0x7f
	ld	(x), a
;	se8r01-send-current.c: 365: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_DAC_CAL_HI,temp,1);
	ldw	x, (0x06, sp)
	push	#0x01
	pushw	x
	push	#0x38
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-send-current.c: 367: temp[0]=0x02;
	ldw	x, (0x06, sp)
	ld	a, #0x02
	ld	(x), a
;	se8r01-send-current.c: 368: temp[1]=0xC1;
	ldw	x, (0x0c, sp)
	ld	a, #0xc1
	ld	(x), a
;	se8r01-send-current.c: 369: temp[2]=0xEB;            
	ldw	x, (0x0a, sp)
	ld	a, #0xeb
	ld	(x), a
;	se8r01-send-current.c: 370: temp[3]=0x1C;
	ldw	x, (0x08, sp)
	ld	a, #0x1c
	ld	(x), a
;	se8r01-send-current.c: 371: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_AGC_GAIN, temp,4);
	ldw	x, (0x06, sp)
	push	#0x04
	pushw	x
	push	#0x3d
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-send-current.c: 373: temp[0]=0x97;
	ldw	x, (0x06, sp)
	ld	a, #0x97
	ld	(x), a
;	se8r01-send-current.c: 374: temp[1]=0x64;
	ldw	x, (0x0c, sp)
	ld	a, #0x64
	ld	(x), a
;	se8r01-send-current.c: 375: temp[2]=0x00;
	ldw	x, (0x0a, sp)
	clr	(x)
;	se8r01-send-current.c: 376: temp[3]=0x81;
	ldw	x, (0x08, sp)
	ld	a, #0x81
	ld	(x), a
;	se8r01-send-current.c: 377: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_RF_IVGEN, temp, 4);
	ldw	x, (0x06, sp)
	push	#0x04
	pushw	x
	push	#0x3e
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-send-current.c: 378: rf_switch_bank(iBANK0);
	push	#0x00
	call	_rf_switch_bank
	pop	a
;	se8r01-send-current.c: 383: delayTenMicro();
	call	_delayTenMicro
;	se8r01-send-current.c: 384: PC_ODR |= (1 << CE);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	se8r01-send-current.c: 385: delayTenMicro();
	call	_delayTenMicro
;	se8r01-send-current.c: 386: delayTenMicro();
	call	_delayTenMicro
;	se8r01-send-current.c: 387: delayTenMicro();
	call	_delayTenMicro
;	se8r01-send-current.c: 388: PC_ODR &= ~(1 << CE);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	se8r01-send-current.c: 389: delay(50);                            // delay 50ms waitting for calibaration.
	push	#0x32
	push	#0x00
	call	_delay
	addw	sp, #2
;	se8r01-send-current.c: 394: delayTenMicro();
	call	_delayTenMicro
;	se8r01-send-current.c: 395: PC_ODR |= (1 << CE);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	se8r01-send-current.c: 396: delayTenMicro();
	call	_delayTenMicro
;	se8r01-send-current.c: 397: delayTenMicro();
	call	_delayTenMicro
;	se8r01-send-current.c: 398: delayTenMicro();
	call	_delayTenMicro
;	se8r01-send-current.c: 399: PC_ODR &= ~(1 << CE);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	se8r01-send-current.c: 400: delay(50);                            // delay 50ms waitting for calibaration.
	push	#0x32
	push	#0x00
	call	_delay
	addw	sp, #2
	addw	sp, #13
	ret
;	se8r01-send-current.c: 404: void SE8R01_Analog_Init()           //SE8R01 初始化
;	-----------------------------------------
;	 function SE8R01_Analog_Init
;	-----------------------------------------
_SE8R01_Analog_Init:
	sub	sp, #21
;	se8r01-send-current.c: 409: gtemp[0]=0x28;
	ldw	x, #_gtemp+0
	ldw	(0x0e, sp), x
	ldw	x, (0x0e, sp)
	ld	a, #0x28
	ld	(x), a
;	se8r01-send-current.c: 410: gtemp[1]=0x32;
	ldw	x, (0x0e, sp)
	incw	x
	ldw	(0x0c, sp), x
	ldw	x, (0x0c, sp)
	ld	a, #0x32
	ld	(x), a
;	se8r01-send-current.c: 411: gtemp[2]=0x80;
	ldw	x, (0x0e, sp)
	incw	x
	incw	x
	ldw	(0x0a, sp), x
	ldw	x, (0x0a, sp)
	ld	a, #0x80
	ld	(x), a
;	se8r01-send-current.c: 412: gtemp[3]=0x90;
	ldw	x, (0x0e, sp)
	addw	x, #0x0003
	ldw	(0x08, sp), x
	ldw	x, (0x08, sp)
	ld	a, #0x90
	ld	(x), a
;	se8r01-send-current.c: 413: gtemp[4]=0x00;
	ldw	x, (0x0e, sp)
	addw	x, #0x0004
	clr	(x)
;	se8r01-send-current.c: 414: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_SETUP_VALUE, gtemp, 5);
	ldw	x, (0x0e, sp)
	push	#0x05
	pushw	x
	push	#0x3e
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-send-current.c: 415: delay(2);
	push	#0x02
	push	#0x00
	call	_delay
	addw	sp, #2
;	se8r01-send-current.c: 418: rf_switch_bank(iBANK1);
	push	#0x80
	call	_rf_switch_bank
	pop	a
;	se8r01-send-current.c: 420: temp[0]=0x40;
	ldw	x, sp
	incw	x
	ldw	(0x14, sp), x
	ldw	x, (0x14, sp)
	ld	a, #0x40
	ld	(x), a
;	se8r01-send-current.c: 421: temp[1]=0x01;               
	ldw	x, (0x14, sp)
	incw	x
	ldw	(0x12, sp), x
	ldw	x, (0x12, sp)
	ld	a, #0x01
	ld	(x), a
;	se8r01-send-current.c: 422: temp[2]=0x30;               
	ldw	x, (0x14, sp)
	incw	x
	incw	x
	ldw	(0x10, sp), x
	ldw	x, (0x10, sp)
	ld	a, #0x30
	ld	(x), a
;	se8r01-send-current.c: 424: { temp[3]=0xE2; }              
	ldw	x, (0x14, sp)
	addw	x, #0x0003
	ldw	(0x06, sp), x
;	se8r01-send-current.c: 423: if (SE8R01_DR_2M==1)
	ldw	x, _SE8R01_DR_2M+0
	cpw	x, #0x0001
	jrne	00102$
;	se8r01-send-current.c: 424: { temp[3]=0xE2; }              
	ldw	x, (0x06, sp)
	ld	a, #0xe2
	ld	(x), a
	jra	00103$
00102$:
;	se8r01-send-current.c: 426: { temp[3]=0xE0;}
	ldw	x, (0x06, sp)
	ld	a, #0xe0
	ld	(x), a
00103$:
;	se8r01-send-current.c: 428: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_PLL_CTL0, temp,4);
	ldw	x, (0x14, sp)
	push	#0x04
	pushw	x
	push	#0x21
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-send-current.c: 430: temp[0]=0x29;
	ldw	x, (0x14, sp)
	ld	a, #0x29
	ld	(x), a
;	se8r01-send-current.c: 431: temp[1]=0x89;
	ldw	x, (0x12, sp)
	ld	a, #0x89
	ld	(x), a
;	se8r01-send-current.c: 432: temp[2]=0x55;                     
	ldw	x, (0x10, sp)
	ld	a, #0x55
	ld	(x), a
;	se8r01-send-current.c: 433: temp[3]=0x40;
	ldw	x, (0x06, sp)
	ld	a, #0x40
	ld	(x), a
;	se8r01-send-current.c: 434: temp[4]=0x50;
	ldw	x, (0x14, sp)
	ld	a, #0x50
	ld	(0x0004, x), a
;	se8r01-send-current.c: 435: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_CAL_CTL, temp,5);
	ldw	x, (0x14, sp)
	push	#0x05
	pushw	x
	push	#0x23
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-send-current.c: 437: if (SE8R01_DR_2M==1)
	ldw	x, _SE8R01_DR_2M+0
	cpw	x, #0x0001
	jrne	00105$
;	se8r01-send-current.c: 438: { temp[0]=0x29;}
	ldw	x, (0x14, sp)
	ld	a, #0x29
	ld	(x), a
	jra	00106$
00105$:
;	se8r01-send-current.c: 440: { temp[0]=0x14;}
	ldw	x, (0x14, sp)
	ld	a, #0x14
	ld	(x), a
00106$:
;	se8r01-send-current.c: 442: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_FDEV, temp,1);
	ldw	x, (0x14, sp)
	push	#0x01
	pushw	x
	push	#0x2c
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-send-current.c: 444: temp[0]=0x55;
	ldw	x, (0x14, sp)
	ld	a, #0x55
	ld	(x), a
;	se8r01-send-current.c: 445: temp[1]=0xC2;
	ldw	x, (0x12, sp)
	ld	a, #0xc2
	ld	(x), a
;	se8r01-send-current.c: 446: temp[2]=0x09;
	ldw	x, (0x10, sp)
	ld	a, #0x09
	ld	(x), a
;	se8r01-send-current.c: 447: temp[3]=0xAC;  
	ldw	x, (0x06, sp)
	ld	a, #0xac
	ld	(x), a
;	se8r01-send-current.c: 448: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_RX_CTRL,temp,4);
	ldw	x, (0x14, sp)
	push	#0x04
	pushw	x
	push	#0x31
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-send-current.c: 450: temp[0]=0x00;
	ldw	x, (0x14, sp)
	clr	(x)
;	se8r01-send-current.c: 451: temp[1]=0x14;
	ldw	x, (0x12, sp)
	ld	a, #0x14
	ld	(x), a
;	se8r01-send-current.c: 452: temp[2]=0x08;   
	ldw	x, (0x10, sp)
	ld	a, #0x08
	ld	(x), a
;	se8r01-send-current.c: 453: temp[3]=0x29;
	ldw	x, (0x06, sp)
	ld	a, #0x29
	ld	(x), a
;	se8r01-send-current.c: 454: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_FAGC_CTRL_1, temp,4);
	ldw	x, (0x14, sp)
	push	#0x04
	pushw	x
	push	#0x33
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-send-current.c: 456: temp[0]=0x02;
	ldw	x, (0x14, sp)
	ld	a, #0x02
	ld	(x), a
;	se8r01-send-current.c: 457: temp[1]=0xC1;
	ldw	x, (0x12, sp)
	ld	a, #0xc1
	ld	(x), a
;	se8r01-send-current.c: 458: temp[2]=0xCB;  
	ldw	x, (0x10, sp)
	ld	a, #0xcb
	ld	(x), a
;	se8r01-send-current.c: 459: temp[3]=0x1C;
	ldw	x, (0x06, sp)
	ld	a, #0x1c
	ld	(x), a
;	se8r01-send-current.c: 460: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_AGC_GAIN, temp,4);
	ldw	x, (0x14, sp)
	push	#0x04
	pushw	x
	push	#0x3d
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-send-current.c: 462: temp[0]=0x97;
	ldw	x, (0x14, sp)
	ld	a, #0x97
	ld	(x), a
;	se8r01-send-current.c: 463: temp[1]=0x64;
	ldw	x, (0x12, sp)
	ld	a, #0x64
	ld	(x), a
;	se8r01-send-current.c: 464: temp[2]=0x00;
	ldw	x, (0x10, sp)
	clr	(x)
;	se8r01-send-current.c: 465: temp[3]=0x01;
	ldw	x, (0x06, sp)
	ld	a, #0x01
	ld	(x), a
;	se8r01-send-current.c: 466: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_RF_IVGEN, temp,4);
	ldw	x, (0x14, sp)
	push	#0x04
	pushw	x
	push	#0x3e
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-send-current.c: 468: gtemp[0]=0x2A;
	ldw	x, (0x0e, sp)
	ld	a, #0x2a
	ld	(x), a
;	se8r01-send-current.c: 469: gtemp[1]=0x04;
	ldw	x, (0x0c, sp)
	ld	a, #0x04
	ld	(x), a
;	se8r01-send-current.c: 470: gtemp[2]=0x00;
	ldw	x, (0x0a, sp)
	clr	(x)
;	se8r01-send-current.c: 471: gtemp[3]=0x7D;
	ldw	x, (0x08, sp)
	ld	a, #0x7d
	ld	(x), a
;	se8r01-send-current.c: 472: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_TEST_PKDET, gtemp, 4);
	ldw	x, (0x0e, sp)
	push	#0x04
	pushw	x
	push	#0x3f
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-send-current.c: 474: rf_switch_bank(iBANK0);
	push	#0x00
	call	_rf_switch_bank
	pop	a
	addw	sp, #21
	ret
;	se8r01-send-current.c: 477: void SE8R01_Init()  
;	-----------------------------------------
;	 function SE8R01_Init
;	-----------------------------------------
_SE8R01_Init:
	sub	sp, #5
;	se8r01-send-current.c: 480: SE8R01_Calibration();   
	call	_SE8R01_Calibration
;	se8r01-send-current.c: 481: SE8R01_Analog_Init();   
	call	_SE8R01_Analog_Init
;	se8r01-send-current.c: 485: if (SE8R01_DR_2M==1)
	ldw	x, _SE8R01_DR_2M+0
	cpw	x, #0x0001
	jrne	00105$
;	se8r01-send-current.c: 486: {  temp[0]=0b01001111; }     //2MHz,+5dbm
	ldw	x, sp
	incw	x
	ld	a, #0x4f
	ld	(x), a
	jra	00106$
00105$:
;	se8r01-send-current.c: 487: else if  (SE8R01_DR_1M==1)
	ldw	x, _SE8R01_DR_1M+0
	cpw	x, #0x0001
	jrne	00102$
;	se8r01-send-current.c: 488: {  temp[0]=0b01000111;  }     //1MHz,+5dbm
	ldw	x, sp
	incw	x
	ld	a, #0x47
	ld	(x), a
	jra	00106$
00102$:
;	se8r01-send-current.c: 490: {temp[0]=0b01101111;  }     //500K,+5dbm
	ldw	x, sp
	incw	x
	ld	a, #0x6f
	ld	(x), a
00106$:
;	se8r01-send-current.c: 492: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_RF_SETUP,temp,1);
	ldw	x, sp
	incw	x
	push	#0x01
	pushw	x
	push	#0x26
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-send-current.c: 494: write_spi_reg(WRITE_REG|iRF_BANK0_EN_AA, 0x01);          //enable auto acc on pip 1
	push	#0x01
	push	#0x21
	call	_write_spi_reg
	addw	sp, #2
;	se8r01-send-current.c: 495: write_spi_reg(WRITE_REG|iRF_BANK0_EN_RXADDR, 0x01);      //enable pip 1
	push	#0x01
	push	#0x22
	call	_write_spi_reg
	addw	sp, #2
;	se8r01-send-current.c: 496: write_spi_reg(WRITE_REG|iRF_BANK0_SETUP_AW, 0x02);        //4 byte adress
	push	#0x02
	push	#0x23
	call	_write_spi_reg
	addw	sp, #2
;	se8r01-send-current.c: 497: write_spi_reg(WRITE_REG|iRF_BANK0_SETUP_RETR, 0x08);        //lowest 4 bits 0-15 rt transmisston higest 4 bits 256-4096us Auto Retransmit Delay
	push	#0x08
	push	#0x24
	call	_write_spi_reg
	addw	sp, #2
;	se8r01-send-current.c: 498: write_spi_reg(WRITE_REG|iRF_BANK0_RF_CH, 40);
	push	#0x28
	push	#0x25
	call	_write_spi_reg
	addw	sp, #2
;	se8r01-send-current.c: 499: write_spi_reg(WRITE_REG|iRF_BANK0_DYNPD, 0x01);          //pipe0 pipe1 enable dynamic payload length data
	push	#0x01
	push	#0x3c
	call	_write_spi_reg
	addw	sp, #2
;	se8r01-send-current.c: 500: write_spi_reg(WRITE_REG|iRF_BANK0_FEATURE, 0x07);        // enable dynamic paload lenght; enbale payload with ack enable w_tx_payload_noack
	push	#0x07
	push	#0x3d
	call	_write_spi_reg
	addw	sp, #2
;	se8r01-send-current.c: 501: write_spi_reg(WRITE_REG + CONFIG, 0x3E);
	push	#0x3e
	push	#0x20
	call	_write_spi_reg
	addw	sp, #2
;	se8r01-send-current.c: 502: write_spi_buf(WRITE_REG + TX_ADDR, TX_ADDRESS, ADR_WIDTH);  //from tx
	ldw	x, #_TX_ADDRESS+0
	ldw	y, x
	pushw	x
	push	#0x04
	pushw	y
	push	#0x30
	call	_write_spi_buf
	addw	sp, #4
	popw	x
;	se8r01-send-current.c: 504: write_spi_buf(WRITE_REG + RX_ADDR_P0, TX_ADDRESS, ADR_WIDTH); // Use the same address on the RX device as the TX device write_spi_reg(WRITE_REG + RX_PW_P0, TX_PLOAD_WIDTH); // Select same RX payload width as TX Payload width
	push	#0x04
	pushw	x
	push	#0x2a
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-send-current.c: 507: PC_ODR |= (1 << CE);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
	addw	sp, #5
	ret
;	se8r01-send-current.c: 513: int main () {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	sub	sp, #59
;	se8r01-send-current.c: 520: UCHAR rx_addr_p1[]  = { 0xd2, 0xf0, 0xf0, 0xf0, 0xf0 };
	ldw	y, sp
	addw	y, #43
	ld	a, #0xd2
	ld	(y), a
	ldw	x, y
	incw	x
	ld	a, #0xf0
	ld	(x), a
	ldw	x, y
	incw	x
	incw	x
	ld	a, #0xf0
	ld	(x), a
	ldw	x, y
	ld	a, #0xf0
	ld	(0x0003, x), a
	ldw	x, y
	ld	a, #0xf0
	ld	(0x0004, x), a
;	se8r01-send-current.c: 521: UCHAR tx_addr[]     = { 0xe1, 0xf0, 0xf0, 0xf0, 0xf0 };
	ldw	y, sp
	addw	y, #34
	ld	a, #0xe1
	ld	(y), a
	ldw	x, y
	incw	x
	ld	a, #0xf0
	ld	(x), a
	ldw	x, y
	incw	x
	incw	x
	ld	a, #0xf0
	ld	(x), a
	ldw	x, y
	ld	a, #0xf0
	ld	(0x0003, x), a
	ldw	x, y
	addw	x, #0x0004
	ld	a, #0xf0
	ld	(x), a
;	se8r01-send-current.c: 524: InitializeSystemClock();
	call	_InitializeSystemClock
;	se8r01-send-current.c: 525: InitializeUART();
	call	_InitializeUART
;	se8r01-send-current.c: 527: InitializeSPI ();
	call	_InitializeSPI
;	se8r01-send-current.c: 530: memset (tx_payload, 0, sizeof(tx_payload));
	ldw	x, sp
	incw	x
	ldw	(0x32, sp), x
	ldw	y, (0x32, sp)
	push	#0x21
	push	#0x00
	clrw	x
	pushw	x
	pushw	y
	call	_memset
	addw	sp, #6
;	se8r01-send-current.c: 533: init_io();                        // Initialize IO port
	call	_init_io
;	se8r01-send-current.c: 534: write_spi_reg(FLUSH_TX,0); // transmit -- send data 
	push	#0x00
	push	#0xe1
	call	_write_spi_reg
	addw	sp, #2
;	se8r01-send-current.c: 535: readstatus = read_spi_reg(CONFIG);
	push	#0x00
	call	_read_spi_reg
	addw	sp, #1
;	se8r01-send-current.c: 536: UARTPrintF("config = \n\r");
	ldw	x, #___str_0+0
	push	a
	pushw	x
	call	_UARTPrintF
	addw	sp, #2
	pop	a
;	se8r01-send-current.c: 537: print_UCHAR_hex(readstatus);
	push	a
	call	_print_UCHAR_hex
	pop	a
;	se8r01-send-current.c: 538: readstatus = read_spi_reg(STATUS);
	push	#0x07
	call	_read_spi_reg
	addw	sp, #1
;	se8r01-send-current.c: 539: UARTPrintF("status = \n\r");
	ldw	x, #___str_1+0
	push	a
	pushw	x
	call	_UARTPrintF
	addw	sp, #2
	pop	a
;	se8r01-send-current.c: 540: print_UCHAR_hex(readstatus);
	push	a
	call	_print_UCHAR_hex
	pop	a
;	se8r01-send-current.c: 542: SE8R01_Init();
	call	_SE8R01_Init
;	se8r01-send-current.c: 546: while (1) {
00110$:
;	se8r01-send-current.c: 548: gemiddeld=0;
	clrw	x
	ldw	(0x30, sp), x
;	se8r01-send-current.c: 549: ampere=0;
	clrw	x
	ldw	(0x3a, sp), x
;	se8r01-send-current.c: 550: for(samples=0;samples<100000;samples++)
	clrw	x
	ldw	(0x29, sp), x
	ldw	(0x27, sp), x
00112$:
;	se8r01-send-current.c: 553: ADC_CSR |= ((0x0F)&4); // select channel = 4 = PD3
	ldw	x, #0x5400
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	se8r01-send-current.c: 554: ADC_CR2 |= ADC_ALIGN; // Right Aligned Data
	ldw	x, #0x5402
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	se8r01-send-current.c: 555: ADC_CR1 |= ADC_ADON; // ADC ON
	bset	0x5401, #0
;	se8r01-send-current.c: 556: ADC_CR1 |= ADC_ADON; // start conversion 
	bset	0x5401, #0
;	se8r01-send-current.c: 557: while(((ADC_CSR)&(1<<7))== 0); // Wait till EOC
00101$:
	ldw	x, #0x5400
	ld	a, (x)
	sll	a
	jrnc	00101$
;	se8r01-send-current.c: 559: ampere |= (unsigned int)ADC_DRL;
	ldw	x, #0x5405
	ld	a, (x)
	rlwa	x
	clr	a
	rrwa	x
	ldw	y, (0x3a, sp)
	ldw	(0x38, sp), y
	or	a, (0x39, sp)
	ld	yl, a
	ld	a, xh
	or	a, (0x38, sp)
	ld	yh, a
;	se8r01-send-current.c: 560: ampere |= (unsigned int)ADC_DRH<<8;
	ldw	x, #0x5404
	ld	a, (x)
	clrw	x
	ld	xl, a
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	ldw	(0x36, sp), y
	ld	a, xl
	or	a, (0x37, sp)
	ld	yl, a
	ld	a, xh
	or	a, (0x36, sp)
	ld	yh, a
;	se8r01-send-current.c: 562: ADC_CR1 &= ~(1<<0); // ADC Stop Conversion
	ldw	x, #0x5401
	ld	a, (x)
	and	a, #0xfe
	ld	(x), a
;	se8r01-send-current.c: 563: ampere &= 0x03ff; // 0 bits resolution so above 0x0400 is nothing
	ld	a, yh
	and	a, #0x03
	ld	yh, a
	ldw	(0x3a, sp), y
;	se8r01-send-current.c: 564: if (ampere > gemiddeld) gemiddeld=ampere;
	ldw	x, (0x3a, sp)
	cpw	x, (0x30, sp)
	jrsle	00113$
	ldw	y, (0x3a, sp)
	ldw	(0x30, sp), y
00113$:
;	se8r01-send-current.c: 550: for(samples=0;samples<100000;samples++)
	ldw	x, (0x29, sp)
	addw	x, #0x0001
	ldw	(0x29, sp), x
	ld	a, (0x28, sp)
	adc	a, #0x00
	ld	(0x28, sp), a
	ld	a, (0x27, sp)
	adc	a, #0x00
	ld	(0x27, sp), a
	ldw	x, (0x29, sp)
	cpw	x, #0x86a0
	ld	a, (0x28, sp)
	sbc	a, #0x01
	ld	a, (0x27, sp)
	sbc	a, #0x00
	jrsge	00147$
	jp	00112$
00147$:
;	se8r01-send-current.c: 568: if (gemiddeld < 0x001f) gemiddeld=0; //remove unwanted mini measurements
	ldw	x, (0x30, sp)
	cpw	x, #0x001f
	jrsge	00108$
	clrw	x
	ldw	(0x30, sp), x
00108$:
;	se8r01-send-current.c: 570: tx_payload[0] = 0xac; //first two is unique ID for this current sensor
	ldw	x, (0x32, sp)
	ld	a, #0xac
	ld	(x), a
;	se8r01-send-current.c: 571: tx_payload[1] = 0xcc;
	ldw	x, (0x32, sp)
	incw	x
	ld	a, #0xcc
	ld	(x), a
;	se8r01-send-current.c: 572: tx_payload[2] = gemiddeld>>8;
	ldw	y, (0x32, sp)
	addw	y, #0x0002
	ldw	x, (0x30, sp)
	sraw	x
	sraw	x
	sraw	x
	sraw	x
	sraw	x
	sraw	x
	sraw	x
	sraw	x
	ld	a, xl
	ld	(y), a
;	se8r01-send-current.c: 573: tx_payload[3] = gemiddeld & 0x00ff; 
	ldw	x, (0x32, sp)
	addw	x, #0x0003
	ld	a, (0x31, sp)
	push	a
	clr	(0x35, sp)
	pop	a
	ld	(x), a
;	se8r01-send-current.c: 574: write_spi_buf(iRF_CMD_WR_TX_PLOAD, tx_payload, 4);
	ldw	x, (0x32, sp)
	push	#0x04
	pushw	x
	push	#0xa0
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-send-current.c: 575: write_spi_reg(WRITE_REG+STATUS, 0xff);
	push	#0xff
	push	#0x27
	call	_write_spi_reg
	addw	sp, #2
;	se8r01-send-current.c: 582: delay(4);
	push	#0x04
	push	#0x00
	call	_delay
	addw	sp, #2
	jp	00110$
	addw	sp, #59
	ret
	.area CODE
___str_0:
	.ascii "config = "
	.db 0x0A
	.db 0x0D
	.db 0x00
___str_1:
	.ascii "status = "
	.db 0x0A
	.db 0x0D
	.db 0x00
	.area INITIALIZER
__xinit__SE8R01_DR_2M:
	.dw #0x0000
__xinit__SE8R01_DR_1M:
	.dw #0x0000
__xinit__SE8R01_DR_500K:
	.dw #0x0001
__xinit__pload_width_now:
	.dw #0x0000
__xinit__newdata:
	.dw #0x0000
__xinit__signal_lv:
	.db #0x00	;  0
__xinit__pip:
	.dw #0x0000
__xinit__status:
	.db #0x00	; 0
__xinit__TX_ADDRESS:
	.db #0xB3	; 179
	.db #0x43	; 67	'C'
	.db #0x10	; 16
	.db #0x10	; 16
__xinit__ADDRESS2:
	.db #0xB1	; 177
__xinit__ADDRESS3:
	.db #0xB2	; 178
__xinit__ADDRESS4:
	.db #0xB3	; 179
__xinit__ADDRESS5:
	.db #0xB4	; 180
__xinit__ADDRESS1:
	.db #0xB0	; 176
	.db #0x43	; 67	'C'
	.db #0x10	; 16
	.db #0x10	; 16
__xinit__ADDRESS0:
	.db #0x34	; 52	'4'
	.db #0x43	; 67	'C'
	.db #0x10	; 16
	.db #0x10	; 16
__xinit__rx_buf:
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
__xinit__tx_buf:
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.area CABS (ABS)
