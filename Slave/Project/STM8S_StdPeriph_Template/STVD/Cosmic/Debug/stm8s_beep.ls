   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.8 - 08 Nov 2022
   3                     ; Generator (Limited) V4.5.5 - 08 Nov 2022
   4                     ; Optimizer V4.5.5 - 08 Nov 2022
  49                     ; 54 void BEEP_DeInit(void)
  49                     ; 55 {
  51                     .text:	section	.text,new
  52  0000               _BEEP_DeInit:
  56                     ; 56   BEEP->CSR = BEEP_CSR_RESET_VALUE;
  58  0000 351f50f3      	mov	20723,#31
  59                     ; 57 }
  62  0004 81            	ret	
 127                     ; 67 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 127                     ; 68 {
 128                     .text:	section	.text,new
 129  0000               _BEEP_Init:
 131  0000 88            	push	a
 132       00000000      OFST:	set	0
 135                     ; 70   assert_param(IS_BEEP_FREQUENCY_OK(BEEP_Frequency));
 137                     ; 73   if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
 139  0001 c650f3        	ld	a,20723
 140  0004 a41f          	and	a,#31
 141  0006 a11f          	cp	a,#31
 142  0008 2610          	jrne	L15
 143                     ; 75     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 145  000a c650f3        	ld	a,20723
 146  000d a4e0          	and	a,#224
 147  000f c750f3        	ld	20723,a
 148                     ; 76     BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
 150  0012 c650f3        	ld	a,20723
 151  0015 aa0b          	or	a,#11
 152  0017 c750f3        	ld	20723,a
 153  001a               L15:
 154                     ; 80   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
 156  001a c650f3        	ld	a,20723
 157  001d a43f          	and	a,#63
 158  001f c750f3        	ld	20723,a
 159                     ; 81   BEEP->CSR |= (uint8_t)(BEEP_Frequency);
 161  0022 c650f3        	ld	a,20723
 162  0025 1a01          	or	a,(OFST+1,sp)
 163  0027 c750f3        	ld	20723,a
 164                     ; 82 }
 167  002a 84            	pop	a
 168  002b 81            	ret	
 223                     ; 91 void BEEP_Cmd(FunctionalState NewState)
 223                     ; 92 {
 224                     .text:	section	.text,new
 225  0000               _BEEP_Cmd:
 229                     ; 93   if (NewState != DISABLE)
 231  0000 4d            	tnz	a
 232  0001 2705          	jreq	L101
 233                     ; 96     BEEP->CSR |= BEEP_CSR_BEEPEN;
 235  0003 721a50f3      	bset	20723,#5
 238  0007 81            	ret	
 239  0008               L101:
 240                     ; 101     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
 242  0008 721b50f3      	bres	20723,#5
 243                     ; 103 }
 246  000c 81            	ret	
 293                     .const:	section	.text
 294  0000               L41:
 295  0000 000003e8      	dc.l	1000
 296                     ; 118 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 296                     ; 119 {
 297                     .text:	section	.text,new
 298  0000               _BEEP_LSICalibrationConfig:
 300  0000 5206          	subw	sp,#6
 301       00000006      OFST:	set	6
 304                     ; 124   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 306                     ; 126   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 308  0002 96            	ldw	x,sp
 309  0003 1c0009        	addw	x,#OFST+3
 310  0006 cd0000        	call	c_ltor
 312  0009 ae0000        	ldw	x,#L41
 313  000c cd0000        	call	c_ludv
 315  000f be02          	ldw	x,c_lreg+2
 316  0011 1f03          	ldw	(OFST-3,sp),x
 318                     ; 130   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 320  0013 c650f3        	ld	a,20723
 321  0016 a4e0          	and	a,#224
 322  0018 c750f3        	ld	20723,a
 323                     ; 132   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 325  001b 54            	srlw	x
 326  001c 54            	srlw	x
 327  001d 54            	srlw	x
 328  001e 1f05          	ldw	(OFST-1,sp),x
 330                     ; 134   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 332  0020 58            	sllw	x
 333  0021 58            	sllw	x
 334  0022 58            	sllw	x
 335  0023 1f01          	ldw	(OFST-5,sp),x
 337  0025 1e03          	ldw	x,(OFST-3,sp)
 338  0027 72f001        	subw	x,(OFST-5,sp)
 339  002a 1605          	ldw	y,(OFST-1,sp)
 340  002c 9058          	sllw	y
 341  002e 905c          	incw	y
 342  0030 cd0000        	call	c_imul
 344  0033 1605          	ldw	y,(OFST-1,sp)
 345  0035 9058          	sllw	y
 346  0037 9058          	sllw	y
 347  0039 bf00          	ldw	c_x,x
 348  003b 9058          	sllw	y
 349  003d 90b300        	cpw	y,c_x
 350  0040 7b06          	ld	a,(OFST+0,sp)
 351  0042 2504          	jrult	L521
 352                     ; 136     BEEP->CSR |= (uint8_t)(A - 2U);
 354  0044 a002          	sub	a,#2
 356  0046 2001          	jra	L721
 357  0048               L521:
 358                     ; 140     BEEP->CSR |= (uint8_t)(A - 1U);
 360  0048 4a            	dec	a
 361  0049               L721:
 362  0049 ca50f3        	or	a,20723
 363  004c c750f3        	ld	20723,a
 364                     ; 142 }
 367  004f 5b06          	addw	sp,#6
 368  0051 81            	ret	
 381                     	xdef	_BEEP_LSICalibrationConfig
 382                     	xdef	_BEEP_Cmd
 383                     	xdef	_BEEP_Init
 384                     	xdef	_BEEP_DeInit
 385                     	xref.b	c_lreg
 386                     	xref.b	c_x
 405                     	xref	c_imul
 406                     	xref	c_ludv
 407                     	xref	c_ltor
 408                     	end
