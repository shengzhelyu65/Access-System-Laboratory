   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.8 - 08 Nov 2022
   3                     ; Generator (Limited) V4.5.5 - 08 Nov 2022
   4                     ; Optimizer V4.5.5 - 08 Nov 2022
  49                     ; 50 uint8_t ITC_GetCPUCC(void)
  49                     ; 51 {
  51                     .text:	section	.text,new
  52  0000               _ITC_GetCPUCC:
  56                     ; 53   _asm("push cc");
  59  0000 8a            	push	cc
  61                     ; 54   _asm("pop a");
  64  0001 84            	pop	a
  66                     ; 55   return; /* Ignore compiler warning, the returned value is in A register */
  69  0002 81            	ret	
  92                     ; 80 void ITC_DeInit(void)
  92                     ; 81 {
  93                     .text:	section	.text,new
  94  0000               _ITC_DeInit:
  98                     ; 82   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
 100  0000 35ff7f70      	mov	32624,#255
 101                     ; 83   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
 103  0004 35ff7f71      	mov	32625,#255
 104                     ; 84   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 106  0008 35ff7f72      	mov	32626,#255
 107                     ; 85   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 109  000c 35ff7f73      	mov	32627,#255
 110                     ; 86   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 112  0010 35ff7f74      	mov	32628,#255
 113                     ; 87   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 115  0014 35ff7f75      	mov	32629,#255
 116                     ; 88   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 118  0018 35ff7f76      	mov	32630,#255
 119                     ; 89   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 121  001c 35ff7f77      	mov	32631,#255
 122                     ; 90 }
 125  0020 81            	ret	
 150                     ; 97 uint8_t ITC_GetSoftIntStatus(void)
 150                     ; 98 {
 151                     .text:	section	.text,new
 152  0000               _ITC_GetSoftIntStatus:
 156                     ; 99   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 158  0000 cd0000        	call	_ITC_GetCPUCC
 160  0003 a428          	and	a,#40
 163  0005 81            	ret	
 408                     .const:	section	.text
 409  0000               L42:
 410  0000 0021          	dc.w	L14
 411  0002 0021          	dc.w	L14
 412  0004 0021          	dc.w	L14
 413  0006 0021          	dc.w	L14
 414  0008 0026          	dc.w	L34
 415  000a 0026          	dc.w	L34
 416  000c 0026          	dc.w	L34
 417  000e 0026          	dc.w	L34
 418  0010 0046          	dc.w	L771
 419  0012 0046          	dc.w	L771
 420  0014 002b          	dc.w	L54
 421  0016 002b          	dc.w	L54
 422  0018 0030          	dc.w	L74
 423  001a 0030          	dc.w	L74
 424  001c 0030          	dc.w	L74
 425  001e 0030          	dc.w	L74
 426  0020 0035          	dc.w	L15
 427  0022 0046          	dc.w	L771
 428  0024 0046          	dc.w	L771
 429  0026 0035          	dc.w	L15
 430  0028 003a          	dc.w	L35
 431  002a 003a          	dc.w	L35
 432  002c 003a          	dc.w	L35
 433  002e 003a          	dc.w	L35
 434  0030 003f          	dc.w	L55
 435                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 435                     ; 108 {
 436                     .text:	section	.text,new
 437  0000               _ITC_GetSoftwarePriority:
 439  0000 88            	push	a
 440  0001 89            	pushw	x
 441       00000002      OFST:	set	2
 444                     ; 109   uint8_t Value = 0;
 446  0002 0f02          	clr	(OFST+0,sp)
 448                     ; 110   uint8_t Mask = 0;
 450                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 452                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 454  0004 a403          	and	a,#3
 455  0006 48            	sll	a
 456  0007 5f            	clrw	x
 457  0008 97            	ld	xl,a
 458  0009 a603          	ld	a,#3
 459  000b 5d            	tnzw	x
 460  000c 2704          	jreq	L61
 461  000e               L02:
 462  000e 48            	sll	a
 463  000f 5a            	decw	x
 464  0010 26fc          	jrne	L02
 465  0012               L61:
 466  0012 6b01          	ld	(OFST-1,sp),a
 468                     ; 118   switch (IrqNum)
 470  0014 7b03          	ld	a,(OFST+1,sp)
 472                     ; 198   default:
 472                     ; 199     break;
 473  0016 a119          	cp	a,#25
 474  0018 242c          	jruge	L771
 475  001a 5f            	clrw	x
 476  001b 97            	ld	xl,a
 477  001c 58            	sllw	x
 478  001d de0000        	ldw	x,(L42,x)
 479  0020 fc            	jp	(x)
 480  0021               L14:
 481                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 481                     ; 121   case ITC_IRQ_AWU:
 481                     ; 122   case ITC_IRQ_CLK:
 481                     ; 123   case ITC_IRQ_PORTA:
 481                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 483  0021 c67f70        	ld	a,32624
 484                     ; 125     break;
 486  0024 201c          	jp	LC001
 487  0026               L34:
 488                     ; 127   case ITC_IRQ_PORTB:
 488                     ; 128   case ITC_IRQ_PORTC:
 488                     ; 129   case ITC_IRQ_PORTD:
 488                     ; 130   case ITC_IRQ_PORTE:
 488                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 490  0026 c67f71        	ld	a,32625
 491                     ; 132     break;
 493  0029 2017          	jp	LC001
 494  002b               L54:
 495                     ; 141   case ITC_IRQ_SPI:
 495                     ; 142   case ITC_IRQ_TIM1_OVF:
 495                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 497  002b c67f72        	ld	a,32626
 498                     ; 144     break;
 500  002e 2012          	jp	LC001
 501  0030               L74:
 502                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 502                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 502                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 502                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 502                     ; 150 #else
 502                     ; 151   case ITC_IRQ_TIM2_OVF:
 502                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 502                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 502                     ; 154   case ITC_IRQ_TIM3_OVF:
 502                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 504  0030 c67f73        	ld	a,32627
 505                     ; 156     break;
 507  0033 200d          	jp	LC001
 508  0035               L15:
 509                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 509                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 509                     ; 160     defined(STM8S003) ||defined(STM8S001) || defined (STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 509                     ; 161   case ITC_IRQ_UART1_TX:
 509                     ; 162   case ITC_IRQ_UART1_RX:
 509                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 509                     ; 164 #if defined(STM8AF622x)
 509                     ; 165   case ITC_IRQ_UART4_TX:
 509                     ; 166   case ITC_IRQ_UART4_RX:
 509                     ; 167 #endif /*STM8AF622x */
 509                     ; 168   case ITC_IRQ_I2C:
 509                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 511  0035 c67f74        	ld	a,32628
 512                     ; 170     break;
 514  0038 2008          	jp	LC001
 515  003a               L35:
 516                     ; 173   case ITC_IRQ_UART2_TX:
 516                     ; 174   case ITC_IRQ_UART2_RX:
 516                     ; 175 #endif /*STM8S105 or STM8AF626x*/
 516                     ; 176 #if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8AF52Ax) || \
 516                     ; 177     defined(STM8AF62Ax)
 516                     ; 178   case ITC_IRQ_UART3_TX:
 516                     ; 179   case ITC_IRQ_UART3_RX:
 516                     ; 180   case ITC_IRQ_ADC2:
 516                     ; 181 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 516                     ; 182 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 516                     ; 183     defined(STM8S001) || defined(STM8S903) || defined(STM8AF626x) || defined(STM8AF622x)
 516                     ; 184   case ITC_IRQ_ADC1:
 516                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 516                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 516                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 516                     ; 188 #else
 516                     ; 189   case ITC_IRQ_TIM4_OVF:
 516                     ; 190 #endif /*STM8S903 or STM8AF622x */
 516                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 518  003a c67f75        	ld	a,32629
 519                     ; 192     break;
 521  003d 2003          	jp	LC001
 522  003f               L55:
 523                     ; 194   case ITC_IRQ_EEPROM_EEC:
 523                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 525  003f c67f76        	ld	a,32630
 526  0042               LC001:
 527  0042 1401          	and	a,(OFST-1,sp)
 528  0044 6b02          	ld	(OFST+0,sp),a
 530                     ; 196     break;
 532                     ; 198   default:
 532                     ; 199     break;
 534  0046               L771:
 535                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 537  0046 7b03          	ld	a,(OFST+1,sp)
 538  0048 a403          	and	a,#3
 539  004a 48            	sll	a
 540  004b 5f            	clrw	x
 541  004c 97            	ld	xl,a
 542  004d 7b02          	ld	a,(OFST+0,sp)
 543  004f 5d            	tnzw	x
 544  0050 2704          	jreq	L62
 545  0052               L03:
 546  0052 44            	srl	a
 547  0053 5a            	decw	x
 548  0054 26fc          	jrne	L03
 549  0056               L62:
 551                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 555  0056 5b03          	addw	sp,#3
 556  0058 81            	ret	
 616                     	switch	.const
 617  0032               L64:
 618  0032 0036          	dc.w	L102
 619  0034 0036          	dc.w	L102
 620  0036 0036          	dc.w	L102
 621  0038 0036          	dc.w	L102
 622  003a 0048          	dc.w	L302
 623  003c 0048          	dc.w	L302
 624  003e 0048          	dc.w	L302
 625  0040 0048          	dc.w	L302
 626  0042 00b2          	dc.w	L152
 627  0044 00b2          	dc.w	L152
 628  0046 005a          	dc.w	L502
 629  0048 005a          	dc.w	L502
 630  004a 006c          	dc.w	L702
 631  004c 006c          	dc.w	L702
 632  004e 006c          	dc.w	L702
 633  0050 006c          	dc.w	L702
 634  0052 007e          	dc.w	L112
 635  0054 00b2          	dc.w	L152
 636  0056 00b2          	dc.w	L152
 637  0058 007e          	dc.w	L112
 638  005a 0090          	dc.w	L312
 639  005c 0090          	dc.w	L312
 640  005e 0090          	dc.w	L312
 641  0060 0090          	dc.w	L312
 642  0062 00a2          	dc.w	L512
 643                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 643                     ; 221 {
 644                     .text:	section	.text,new
 645  0000               _ITC_SetSoftwarePriority:
 647  0000 89            	pushw	x
 648  0001 89            	pushw	x
 649       00000002      OFST:	set	2
 652                     ; 222   uint8_t Mask = 0;
 654                     ; 223   uint8_t NewPriority = 0;
 656                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 658                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 660                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 662                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 664  0002 9e            	ld	a,xh
 665  0003 a403          	and	a,#3
 666  0005 48            	sll	a
 667  0006 5f            	clrw	x
 668  0007 97            	ld	xl,a
 669  0008 a603          	ld	a,#3
 670  000a 5d            	tnzw	x
 671  000b 2704          	jreq	L43
 672  000d               L63:
 673  000d 48            	sll	a
 674  000e 5a            	decw	x
 675  000f 26fc          	jrne	L63
 676  0011               L43:
 677  0011 43            	cpl	a
 678  0012 6b01          	ld	(OFST-1,sp),a
 680                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 682  0014 7b03          	ld	a,(OFST+1,sp)
 683  0016 a403          	and	a,#3
 684  0018 48            	sll	a
 685  0019 5f            	clrw	x
 686  001a 97            	ld	xl,a
 687  001b 7b04          	ld	a,(OFST+2,sp)
 688  001d 5d            	tnzw	x
 689  001e 2704          	jreq	L04
 690  0020               L24:
 691  0020 48            	sll	a
 692  0021 5a            	decw	x
 693  0022 26fc          	jrne	L24
 694  0024               L04:
 695  0024 6b02          	ld	(OFST+0,sp),a
 697                     ; 239   switch (IrqNum)
 699  0026 7b03          	ld	a,(OFST+1,sp)
 701                     ; 329   default:
 701                     ; 330     break;
 702  0028 a119          	cp	a,#25
 703  002a 2503cc00b2    	jruge	L152
 704  002f 5f            	clrw	x
 705  0030 97            	ld	xl,a
 706  0031 58            	sllw	x
 707  0032 de0032        	ldw	x,(L64,x)
 708  0035 fc            	jp	(x)
 709  0036               L102:
 710                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 710                     ; 242   case ITC_IRQ_AWU:
 710                     ; 243   case ITC_IRQ_CLK:
 710                     ; 244   case ITC_IRQ_PORTA:
 710                     ; 245     ITC->ISPR1 &= Mask;
 712  0036 c67f70        	ld	a,32624
 713  0039 1401          	and	a,(OFST-1,sp)
 714  003b c77f70        	ld	32624,a
 715                     ; 246     ITC->ISPR1 |= NewPriority;
 717  003e c67f70        	ld	a,32624
 718  0041 1a02          	or	a,(OFST+0,sp)
 719  0043 c77f70        	ld	32624,a
 720                     ; 247     break;
 722  0046 206a          	jra	L152
 723  0048               L302:
 724                     ; 249   case ITC_IRQ_PORTB:
 724                     ; 250   case ITC_IRQ_PORTC:
 724                     ; 251   case ITC_IRQ_PORTD:
 724                     ; 252   case ITC_IRQ_PORTE:
 724                     ; 253     ITC->ISPR2 &= Mask;
 726  0048 c67f71        	ld	a,32625
 727  004b 1401          	and	a,(OFST-1,sp)
 728  004d c77f71        	ld	32625,a
 729                     ; 254     ITC->ISPR2 |= NewPriority;
 731  0050 c67f71        	ld	a,32625
 732  0053 1a02          	or	a,(OFST+0,sp)
 733  0055 c77f71        	ld	32625,a
 734                     ; 255     break;
 736  0058 2058          	jra	L152
 737  005a               L502:
 738                     ; 264   case ITC_IRQ_SPI:
 738                     ; 265   case ITC_IRQ_TIM1_OVF:
 738                     ; 266     ITC->ISPR3 &= Mask;
 740  005a c67f72        	ld	a,32626
 741  005d 1401          	and	a,(OFST-1,sp)
 742  005f c77f72        	ld	32626,a
 743                     ; 267     ITC->ISPR3 |= NewPriority;
 745  0062 c67f72        	ld	a,32626
 746  0065 1a02          	or	a,(OFST+0,sp)
 747  0067 c77f72        	ld	32626,a
 748                     ; 268     break;
 750  006a 2046          	jra	L152
 751  006c               L702:
 752                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 752                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 752                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 752                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 752                     ; 274 #else
 752                     ; 275   case ITC_IRQ_TIM2_OVF:
 752                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 752                     ; 277 #endif /*STM8S903 or STM8AF622x */
 752                     ; 278   case ITC_IRQ_TIM3_OVF:
 752                     ; 279     ITC->ISPR4 &= Mask;
 754  006c c67f73        	ld	a,32627
 755  006f 1401          	and	a,(OFST-1,sp)
 756  0071 c77f73        	ld	32627,a
 757                     ; 280     ITC->ISPR4 |= NewPriority;
 759  0074 c67f73        	ld	a,32627
 760  0077 1a02          	or	a,(OFST+0,sp)
 761  0079 c77f73        	ld	32627,a
 762                     ; 281     break;
 764  007c 2034          	jra	L152
 765  007e               L112:
 766                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 766                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 766                     ; 285     defined(STM8S001) ||defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 766                     ; 286   case ITC_IRQ_UART1_TX:
 766                     ; 287   case ITC_IRQ_UART1_RX:
 766                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 766                     ; 289 #if defined(STM8AF622x)
 766                     ; 290   case ITC_IRQ_UART4_TX:
 766                     ; 291   case ITC_IRQ_UART4_RX:
 766                     ; 292 #endif /*STM8AF622x */
 766                     ; 293   case ITC_IRQ_I2C:
 766                     ; 294     ITC->ISPR5 &= Mask;
 768  007e c67f74        	ld	a,32628
 769  0081 1401          	and	a,(OFST-1,sp)
 770  0083 c77f74        	ld	32628,a
 771                     ; 295     ITC->ISPR5 |= NewPriority;
 773  0086 c67f74        	ld	a,32628
 774  0089 1a02          	or	a,(OFST+0,sp)
 775  008b c77f74        	ld	32628,a
 776                     ; 296     break;
 778  008e 2022          	jra	L152
 779  0090               L312:
 780                     ; 299   case ITC_IRQ_UART2_TX:
 780                     ; 300   case ITC_IRQ_UART2_RX:
 780                     ; 301 #endif /*STM8S105 or STM8AF626x */
 780                     ; 302     
 780                     ; 303 #if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8AF52Ax) || \
 780                     ; 304     defined(STM8AF62Ax)
 780                     ; 305   case ITC_IRQ_UART3_TX:
 780                     ; 306   case ITC_IRQ_UART3_RX:
 780                     ; 307   case ITC_IRQ_ADC2:
 780                     ; 308 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 780                     ; 309     
 780                     ; 310 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 780                     ; 311     defined(STM8S001) || defined(STM8S903) || defined(STM8AF626x) || defined (STM8AF622x)
 780                     ; 312   case ITC_IRQ_ADC1:
 780                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 780                     ; 314     
 780                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 780                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 780                     ; 317 #else
 780                     ; 318   case ITC_IRQ_TIM4_OVF:
 780                     ; 319 #endif /* STM8S903 or STM8AF622x */
 780                     ; 320     ITC->ISPR6 &= Mask;
 782  0090 c67f75        	ld	a,32629
 783  0093 1401          	and	a,(OFST-1,sp)
 784  0095 c77f75        	ld	32629,a
 785                     ; 321     ITC->ISPR6 |= NewPriority;
 787  0098 c67f75        	ld	a,32629
 788  009b 1a02          	or	a,(OFST+0,sp)
 789  009d c77f75        	ld	32629,a
 790                     ; 322     break;
 792  00a0 2010          	jra	L152
 793  00a2               L512:
 794                     ; 324   case ITC_IRQ_EEPROM_EEC:
 794                     ; 325     ITC->ISPR7 &= Mask;
 796  00a2 c67f76        	ld	a,32630
 797  00a5 1401          	and	a,(OFST-1,sp)
 798  00a7 c77f76        	ld	32630,a
 799                     ; 326     ITC->ISPR7 |= NewPriority;
 801  00aa c67f76        	ld	a,32630
 802  00ad 1a02          	or	a,(OFST+0,sp)
 803  00af c77f76        	ld	32630,a
 804                     ; 327     break;
 806                     ; 329   default:
 806                     ; 330     break;
 808  00b2               L152:
 809                     ; 332 }
 812  00b2 5b04          	addw	sp,#4
 813  00b4 81            	ret	
 826                     	xdef	_ITC_GetSoftwarePriority
 827                     	xdef	_ITC_SetSoftwarePriority
 828                     	xdef	_ITC_GetSoftIntStatus
 829                     	xdef	_ITC_DeInit
 830                     	xdef	_ITC_GetCPUCC
 849                     	end
