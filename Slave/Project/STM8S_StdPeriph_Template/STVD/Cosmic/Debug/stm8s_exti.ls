   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.8 - 08 Nov 2022
   3                     ; Generator (Limited) V4.5.5 - 08 Nov 2022
   4                     ; Optimizer V4.5.5 - 08 Nov 2022
  49                     ; 53 void EXTI_DeInit(void)
  49                     ; 54 {
  51                     .text:	section	.text,new
  52  0000               _EXTI_DeInit:
  56                     ; 55   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  58  0000 725f50a0      	clr	20640
  59                     ; 56   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  61  0004 725f50a1      	clr	20641
  62                     ; 57 }
  65  0008 81            	ret	
 190                     ; 70 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
 190                     ; 71 {
 191                     .text:	section	.text,new
 192  0000               _EXTI_SetExtIntSensitivity:
 194  0000 89            	pushw	x
 195       00000000      OFST:	set	0
 198                     ; 73   assert_param(IS_EXTI_PORT_OK(Port));
 200                     ; 74   assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
 202                     ; 77   switch (Port)
 204  0001 9e            	ld	a,xh
 206                     ; 99   default:
 206                     ; 100     break;
 207  0002 4d            	tnz	a
 208  0003 270e          	jreq	L12
 209  0005 4a            	dec	a
 210  0006 271a          	jreq	L32
 211  0008 4a            	dec	a
 212  0009 2725          	jreq	L52
 213  000b 4a            	dec	a
 214  000c 2731          	jreq	L72
 215  000e 4a            	dec	a
 216  000f 2745          	jreq	L13
 217  0011 2053          	jra	L311
 218  0013               L12:
 219                     ; 79   case EXTI_PORT_GPIOA:
 219                     ; 80     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
 221  0013 c650a0        	ld	a,20640
 222  0016 a4fc          	and	a,#252
 223  0018 c750a0        	ld	20640,a
 224                     ; 81     EXTI->CR1 |= (uint8_t)(SensitivityValue);
 226  001b c650a0        	ld	a,20640
 227  001e 1a02          	or	a,(OFST+2,sp)
 228                     ; 82     break;
 230  0020 202f          	jp	LC001
 231  0022               L32:
 232                     ; 83   case EXTI_PORT_GPIOB:
 232                     ; 84     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
 234  0022 c650a0        	ld	a,20640
 235  0025 a4f3          	and	a,#243
 236  0027 c750a0        	ld	20640,a
 237                     ; 85     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
 239  002a 7b02          	ld	a,(OFST+2,sp)
 240  002c 48            	sll	a
 241  002d 48            	sll	a
 242                     ; 86     break;
 244  002e 201e          	jp	LC002
 245  0030               L52:
 246                     ; 87   case EXTI_PORT_GPIOC:
 246                     ; 88     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
 248  0030 c650a0        	ld	a,20640
 249  0033 a4cf          	and	a,#207
 250  0035 c750a0        	ld	20640,a
 251                     ; 89     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
 253  0038 7b02          	ld	a,(OFST+2,sp)
 254  003a 97            	ld	xl,a
 255  003b a610          	ld	a,#16
 256                     ; 90     break;
 258  003d 200d          	jp	LC003
 259  003f               L72:
 260                     ; 91   case EXTI_PORT_GPIOD:
 260                     ; 92     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
 262  003f c650a0        	ld	a,20640
 263  0042 a43f          	and	a,#63
 264  0044 c750a0        	ld	20640,a
 265                     ; 93     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
 267  0047 7b02          	ld	a,(OFST+2,sp)
 268  0049 97            	ld	xl,a
 269  004a a640          	ld	a,#64
 270  004c               LC003:
 271  004c 42            	mul	x,a
 272  004d 9f            	ld	a,xl
 273  004e               LC002:
 274  004e ca50a0        	or	a,20640
 275  0051               LC001:
 276  0051 c750a0        	ld	20640,a
 277                     ; 94     break;
 279  0054 2010          	jra	L311
 280  0056               L13:
 281                     ; 95   case EXTI_PORT_GPIOE:
 281                     ; 96     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
 283  0056 c650a1        	ld	a,20641
 284  0059 a4fc          	and	a,#252
 285  005b c750a1        	ld	20641,a
 286                     ; 97     EXTI->CR2 |= (uint8_t)(SensitivityValue);
 288  005e c650a1        	ld	a,20641
 289  0061 1a02          	or	a,(OFST+2,sp)
 290  0063 c750a1        	ld	20641,a
 291                     ; 98     break;
 293                     ; 99   default:
 293                     ; 100     break;
 295  0066               L311:
 296                     ; 102 }
 299  0066 85            	popw	x
 300  0067 81            	ret	
 358                     ; 111 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 358                     ; 112 {
 359                     .text:	section	.text,new
 360  0000               _EXTI_SetTLISensitivity:
 364                     ; 114   assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
 366                     ; 117   EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
 368  0000 721550a1      	bres	20641,#2
 369                     ; 118   EXTI->CR2 |= (uint8_t)(SensitivityValue);
 371  0004 ca50a1        	or	a,20641
 372  0007 c750a1        	ld	20641,a
 373                     ; 119 }
 376  000a 81            	ret	
 420                     ; 126 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 420                     ; 127 {
 421                     .text:	section	.text,new
 422  0000               _EXTI_GetExtIntSensitivity:
 424  0000 88            	push	a
 425       00000001      OFST:	set	1
 428                     ; 128   uint8_t value = 0;
 430  0001 0f01          	clr	(OFST+0,sp)
 432                     ; 131   assert_param(IS_EXTI_PORT_OK(Port));
 434                     ; 133   switch (Port)
 437                     ; 150   default:
 437                     ; 151     break;
 438  0003 4d            	tnz	a
 439  0004 2710          	jreq	L341
 440  0006 4a            	dec	a
 441  0007 2712          	jreq	L541
 442  0009 4a            	dec	a
 443  000a 2718          	jreq	L741
 444  000c 4a            	dec	a
 445  000d 271b          	jreq	L151
 446  000f 4a            	dec	a
 447  0010 2722          	jreq	L351
 448  0012 7b01          	ld	a,(OFST+0,sp)
 449  0014 2023          	jra	LC004
 450  0016               L341:
 451                     ; 135   case EXTI_PORT_GPIOA:
 451                     ; 136     value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
 453  0016 c650a0        	ld	a,20640
 454                     ; 137     break;
 456  0019 201c          	jp	LC005
 457  001b               L541:
 458                     ; 138   case EXTI_PORT_GPIOB:
 458                     ; 139     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 460  001b c650a0        	ld	a,20640
 461  001e a40c          	and	a,#12
 462  0020 44            	srl	a
 463  0021 44            	srl	a
 464                     ; 140     break;
 466  0022 2015          	jp	LC004
 467  0024               L741:
 468                     ; 141   case EXTI_PORT_GPIOC:
 468                     ; 142     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 470  0024 c650a0        	ld	a,20640
 471  0027 4e            	swap	a
 472                     ; 143     break;
 474  0028 200d          	jp	LC005
 475  002a               L151:
 476                     ; 144   case EXTI_PORT_GPIOD:
 476                     ; 145     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 478  002a c650a0        	ld	a,20640
 479  002d 4e            	swap	a
 480  002e a40c          	and	a,#12
 481  0030 44            	srl	a
 482  0031 44            	srl	a
 483                     ; 146     break;
 485  0032 2003          	jp	LC005
 486  0034               L351:
 487                     ; 147   case EXTI_PORT_GPIOE:
 487                     ; 148     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
 489  0034 c650a1        	ld	a,20641
 490  0037               LC005:
 491  0037 a403          	and	a,#3
 492  0039               LC004:
 494                     ; 149     break;
 496                     ; 150   default:
 496                     ; 151     break;
 498                     ; 154   return((EXTI_Sensitivity_TypeDef)value);
 502  0039 5b01          	addw	sp,#1
 503  003b 81            	ret	
 537                     ; 162 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 537                     ; 163 {
 538                     .text:	section	.text,new
 539  0000               _EXTI_GetTLISensitivity:
 541       00000001      OFST:	set	1
 544                     ; 164   uint8_t value = 0;
 546                     ; 167   value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
 548  0000 c650a1        	ld	a,20641
 549  0003 a404          	and	a,#4
 551                     ; 169   return((EXTI_TLISensitivity_TypeDef)value);
 555  0005 81            	ret	
 568                     	xdef	_EXTI_GetTLISensitivity
 569                     	xdef	_EXTI_GetExtIntSensitivity
 570                     	xdef	_EXTI_SetTLISensitivity
 571                     	xdef	_EXTI_SetExtIntSensitivity
 572                     	xdef	_EXTI_DeInit
 591                     	end
