   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.8 - 08 Nov 2022
   3                     ; Generator (Limited) V4.5.5 - 08 Nov 2022
   4                     ; Optimizer V4.5.5 - 08 Nov 2022
  21                     .const:	section	.text
  22  0000               _HSIDivFactor:
  23  0000 01            	dc.b	1
  24  0001 02            	dc.b	2
  25  0002 04            	dc.b	4
  26  0003 08            	dc.b	8
  27  0004               _CLKPrescTable:
  28  0004 01            	dc.b	1
  29  0005 02            	dc.b	2
  30  0006 04            	dc.b	4
  31  0007 08            	dc.b	8
  32  0008 0a            	dc.b	10
  33  0009 10            	dc.b	16
  34  000a 14            	dc.b	20
  35  000b 28            	dc.b	40
  64                     ; 72 void CLK_DeInit(void)
  64                     ; 73 {
  66                     .text:	section	.text,new
  67  0000               _CLK_DeInit:
  71                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  73  0000 350150c0      	mov	20672,#1
  74                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  76  0004 725f50c1      	clr	20673
  77                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  79  0008 35e150c4      	mov	20676,#225
  80                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  82  000c 725f50c5      	clr	20677
  83                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  85  0010 351850c6      	mov	20678,#24
  86                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  88  0014 35ff50c7      	mov	20679,#255
  89                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  91  0018 35ff50ca      	mov	20682,#255
  92                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  94  001c 725f50c8      	clr	20680
  95                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  97  0020 725f50c9      	clr	20681
  99  0024               L52:
 100                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
 102  0024 720050c9fb    	btjt	20681,#0,L52
 103                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 105  0029 725f50c9      	clr	20681
 106                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 108  002d 725f50cc      	clr	20684
 109                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 111  0031 725f50cd      	clr	20685
 112                     ; 88 }
 115  0035 81            	ret	
 171                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 171                     ; 100 {
 172                     .text:	section	.text,new
 173  0000               _CLK_FastHaltWakeUpCmd:
 177                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 179                     ; 104   if (NewState != DISABLE)
 181  0000 4d            	tnz	a
 182  0001 2705          	jreq	L75
 183                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 185  0003 721450c0      	bset	20672,#2
 188  0007 81            	ret	
 189  0008               L75:
 190                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 192  0008 721550c0      	bres	20672,#2
 193                     ; 114 }
 196  000c 81            	ret	
 231                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 231                     ; 122 {
 232                     .text:	section	.text,new
 233  0000               _CLK_HSECmd:
 237                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 239                     ; 126   if (NewState != DISABLE)
 241  0000 4d            	tnz	a
 242  0001 2705          	jreq	L101
 243                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 245  0003 721050c1      	bset	20673,#0
 248  0007 81            	ret	
 249  0008               L101:
 250                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 252  0008 721150c1      	bres	20673,#0
 253                     ; 136 }
 256  000c 81            	ret	
 291                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 291                     ; 144 {
 292                     .text:	section	.text,new
 293  0000               _CLK_HSICmd:
 297                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 299                     ; 148   if (NewState != DISABLE)
 301  0000 4d            	tnz	a
 302  0001 2705          	jreq	L321
 303                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 305  0003 721050c0      	bset	20672,#0
 308  0007 81            	ret	
 309  0008               L321:
 310                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 312  0008 721150c0      	bres	20672,#0
 313                     ; 158 }
 316  000c 81            	ret	
 351                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 351                     ; 167 {
 352                     .text:	section	.text,new
 353  0000               _CLK_LSICmd:
 357                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 359                     ; 171   if (NewState != DISABLE)
 361  0000 4d            	tnz	a
 362  0001 2705          	jreq	L541
 363                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 365  0003 721650c0      	bset	20672,#3
 368  0007 81            	ret	
 369  0008               L541:
 370                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 372  0008 721750c0      	bres	20672,#3
 373                     ; 181 }
 376  000c 81            	ret	
 411                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 411                     ; 190 {
 412                     .text:	section	.text,new
 413  0000               _CLK_CCOCmd:
 417                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 419                     ; 194   if (NewState != DISABLE)
 421  0000 4d            	tnz	a
 422  0001 2705          	jreq	L761
 423                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 425  0003 721050c9      	bset	20681,#0
 428  0007 81            	ret	
 429  0008               L761:
 430                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 432  0008 721150c9      	bres	20681,#0
 433                     ; 204 }
 436  000c 81            	ret	
 471                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 471                     ; 214 {
 472                     .text:	section	.text,new
 473  0000               _CLK_ClockSwitchCmd:
 477                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 479                     ; 218   if (NewState != DISABLE )
 481  0000 4d            	tnz	a
 482  0001 2705          	jreq	L112
 483                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 485  0003 721250c5      	bset	20677,#1
 488  0007 81            	ret	
 489  0008               L112:
 490                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 492  0008 721350c5      	bres	20677,#1
 493                     ; 228 }
 496  000c 81            	ret	
 532                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 532                     ; 239 {
 533                     .text:	section	.text,new
 534  0000               _CLK_SlowActiveHaltWakeUpCmd:
 538                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 540                     ; 243   if (NewState != DISABLE)
 542  0000 4d            	tnz	a
 543  0001 2705          	jreq	L332
 544                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 546  0003 721a50c0      	bset	20672,#5
 549  0007 81            	ret	
 550  0008               L332:
 551                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 553  0008 721b50c0      	bres	20672,#5
 554                     ; 253 }
 557  000c 81            	ret	
 716                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 716                     ; 264 {
 717                     .text:	section	.text,new
 718  0000               _CLK_PeripheralClockConfig:
 720  0000 89            	pushw	x
 721       00000000      OFST:	set	0
 724                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 726                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 728                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 730  0001 9e            	ld	a,xh
 731  0002 a510          	bcp	a,#16
 732  0004 2626          	jrne	L123
 733                     ; 271     if (NewState != DISABLE)
 735  0006 7b02          	ld	a,(OFST+2,sp)
 736  0008 270f          	jreq	L323
 737                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 739  000a 7b01          	ld	a,(OFST+1,sp)
 740  000c ad44          	call	LC003
 741  000e 2704          	jreq	L62
 742  0010               L03:
 743  0010 48            	sll	a
 744  0011 5a            	decw	x
 745  0012 26fc          	jrne	L03
 746  0014               L62:
 747  0014 ca50c7        	or	a,20679
 749  0017 200e          	jp	LC002
 750  0019               L323:
 751                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 753  0019 7b01          	ld	a,(OFST+1,sp)
 754  001b ad35          	call	LC003
 755  001d 2704          	jreq	L23
 756  001f               L43:
 757  001f 48            	sll	a
 758  0020 5a            	decw	x
 759  0021 26fc          	jrne	L43
 760  0023               L23:
 761  0023 43            	cpl	a
 762  0024 c450c7        	and	a,20679
 763  0027               LC002:
 764  0027 c750c7        	ld	20679,a
 765  002a 2024          	jra	L723
 766  002c               L123:
 767                     ; 284     if (NewState != DISABLE)
 769  002c 7b02          	ld	a,(OFST+2,sp)
 770  002e 270f          	jreq	L133
 771                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 773  0030 7b01          	ld	a,(OFST+1,sp)
 774  0032 ad1e          	call	LC003
 775  0034 2704          	jreq	L63
 776  0036               L04:
 777  0036 48            	sll	a
 778  0037 5a            	decw	x
 779  0038 26fc          	jrne	L04
 780  003a               L63:
 781  003a ca50ca        	or	a,20682
 783  003d 200e          	jp	LC001
 784  003f               L133:
 785                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 787  003f 7b01          	ld	a,(OFST+1,sp)
 788  0041 ad0f          	call	LC003
 789  0043 2704          	jreq	L24
 790  0045               L44:
 791  0045 48            	sll	a
 792  0046 5a            	decw	x
 793  0047 26fc          	jrne	L44
 794  0049               L24:
 795  0049 43            	cpl	a
 796  004a c450ca        	and	a,20682
 797  004d               LC001:
 798  004d c750ca        	ld	20682,a
 799  0050               L723:
 800                     ; 295 }
 803  0050 85            	popw	x
 804  0051 81            	ret	
 805  0052               LC003:
 806  0052 a40f          	and	a,#15
 807  0054 5f            	clrw	x
 808  0055 97            	ld	xl,a
 809  0056 a601          	ld	a,#1
 810  0058 5d            	tnzw	x
 811  0059 81            	ret	
 997                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
 997                     ; 310 {
 998                     .text:	section	.text,new
 999  0000               _CLK_ClockSwitchConfig:
1001  0000 89            	pushw	x
1002  0001 5204          	subw	sp,#4
1003       00000004      OFST:	set	4
1006                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1008  0003 aeffff        	ldw	x,#65535
1009  0006 1f03          	ldw	(OFST-1,sp),x
1011                     ; 313   ErrorStatus Swif = ERROR;
1013                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1015                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1017                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1019                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1021                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1023  0008 c650c3        	ld	a,20675
1024  000b 6b01          	ld	(OFST-3,sp),a
1026                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1028  000d 7b05          	ld	a,(OFST+1,sp)
1029  000f 4a            	dec	a
1030  0010 263d          	jrne	L344
1031                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1033  0012 721250c5      	bset	20677,#1
1034                     ; 331     if (ITState != DISABLE)
1036  0016 7b09          	ld	a,(OFST+5,sp)
1037  0018 2706          	jreq	L544
1038                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1040  001a 721450c5      	bset	20677,#2
1042  001e 2004          	jra	L744
1043  0020               L544:
1044                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1046  0020 721550c5      	bres	20677,#2
1047  0024               L744:
1048                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1050  0024 7b06          	ld	a,(OFST+2,sp)
1051  0026 c750c4        	ld	20676,a
1053  0029 2003          	jra	L554
1054  002b               L154:
1055                     ; 346       DownCounter--;
1057  002b 5a            	decw	x
1058  002c 1f03          	ldw	(OFST-1,sp),x
1060  002e               L554:
1061                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1063  002e 720150c504    	btjf	20677,#0,L164
1065  0033 1e03          	ldw	x,(OFST-1,sp)
1066  0035 26f4          	jrne	L154
1067  0037               L164:
1068                     ; 349     if(DownCounter != 0)
1070  0037 1e03          	ldw	x,(OFST-1,sp)
1071                     ; 351       Swif = SUCCESS;
1073  0039 263d          	jrne	LC005
1074  003b               L364:
1075                     ; 355       Swif = ERROR;
1078  003b 0f02          	clr	(OFST-2,sp)
1080  003d               L764:
1081                     ; 390   if(Swif != ERROR)
1083  003d 275d          	jreq	L315
1084                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1086  003f 7b0a          	ld	a,(OFST+6,sp)
1087  0041 263b          	jrne	L515
1089  0043 7b01          	ld	a,(OFST-3,sp)
1090  0045 a1e1          	cp	a,#225
1091  0047 2635          	jrne	L515
1092                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1094  0049 721150c0      	bres	20672,#0
1096  004d 204d          	jra	L315
1097  004f               L344:
1098                     ; 361     if (ITState != DISABLE)
1100  004f 7b09          	ld	a,(OFST+5,sp)
1101  0051 2706          	jreq	L174
1102                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1104  0053 721450c5      	bset	20677,#2
1106  0057 2004          	jra	L374
1107  0059               L174:
1108                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1110  0059 721550c5      	bres	20677,#2
1111  005d               L374:
1112                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1114  005d 7b06          	ld	a,(OFST+2,sp)
1115  005f c750c4        	ld	20676,a
1117  0062 2003          	jra	L105
1118  0064               L574:
1119                     ; 376       DownCounter--;
1121  0064 5a            	decw	x
1122  0065 1f03          	ldw	(OFST-1,sp),x
1124  0067               L105:
1125                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1127  0067 720750c504    	btjf	20677,#3,L505
1129  006c 1e03          	ldw	x,(OFST-1,sp)
1130  006e 26f4          	jrne	L574
1131  0070               L505:
1132                     ; 379     if(DownCounter != 0)
1134  0070 1e03          	ldw	x,(OFST-1,sp)
1135  0072 27c7          	jreq	L364
1136                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1138  0074 721250c5      	bset	20677,#1
1139                     ; 383       Swif = SUCCESS;
1141  0078               LC005:
1143  0078 a601          	ld	a,#1
1144  007a 6b02          	ld	(OFST-2,sp),a
1147  007c 20bf          	jra	L764
1148                     ; 387       Swif = ERROR;
1149  007e               L515:
1150                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1152  007e 7b0a          	ld	a,(OFST+6,sp)
1153  0080 260c          	jrne	L125
1155  0082 7b01          	ld	a,(OFST-3,sp)
1156  0084 a1d2          	cp	a,#210
1157  0086 2606          	jrne	L125
1158                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1160  0088 721750c0      	bres	20672,#3
1162  008c 200e          	jra	L315
1163  008e               L125:
1164                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1166  008e 7b0a          	ld	a,(OFST+6,sp)
1167  0090 260a          	jrne	L315
1169  0092 7b01          	ld	a,(OFST-3,sp)
1170  0094 a1b4          	cp	a,#180
1171  0096 2604          	jrne	L315
1172                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1174  0098 721150c1      	bres	20673,#0
1175  009c               L315:
1176                     ; 406   return(Swif);
1178  009c 7b02          	ld	a,(OFST-2,sp)
1181  009e 5b06          	addw	sp,#6
1182  00a0 81            	ret	
1320                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1320                     ; 416 {
1321                     .text:	section	.text,new
1322  0000               _CLK_HSIPrescalerConfig:
1324  0000 88            	push	a
1325       00000000      OFST:	set	0
1328                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1330                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1332  0001 c650c6        	ld	a,20678
1333  0004 a4e7          	and	a,#231
1334  0006 c750c6        	ld	20678,a
1335                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1337  0009 c650c6        	ld	a,20678
1338  000c 1a01          	or	a,(OFST+1,sp)
1339  000e c750c6        	ld	20678,a
1340                     ; 425 }
1343  0011 84            	pop	a
1344  0012 81            	ret	
1479                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1479                     ; 437 {
1480                     .text:	section	.text,new
1481  0000               _CLK_CCOConfig:
1483  0000 88            	push	a
1484       00000000      OFST:	set	0
1487                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1489                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1491  0001 c650c9        	ld	a,20681
1492  0004 a4e1          	and	a,#225
1493  0006 c750c9        	ld	20681,a
1494                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1496  0009 c650c9        	ld	a,20681
1497  000c 1a01          	or	a,(OFST+1,sp)
1498  000e c750c9        	ld	20681,a
1499                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1501  0011 721050c9      	bset	20681,#0
1502                     ; 449 }
1505  0015 84            	pop	a
1506  0016 81            	ret	
1571                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1571                     ; 460 {
1572                     .text:	section	.text,new
1573  0000               _CLK_ITConfig:
1575  0000 89            	pushw	x
1576       00000000      OFST:	set	0
1579                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1581                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1583                     ; 465   if (NewState != DISABLE)
1585  0001 9f            	ld	a,xl
1586  0002 4d            	tnz	a
1587  0003 2715          	jreq	L327
1588                     ; 467     switch (CLK_IT)
1590  0005 9e            	ld	a,xh
1592                     ; 475     default:
1592                     ; 476       break;
1593  0006 a00c          	sub	a,#12
1594  0008 270a          	jreq	L756
1595  000a a010          	sub	a,#16
1596  000c 2620          	jrne	L137
1597                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1597                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1599  000e 721450c5      	bset	20677,#2
1600                     ; 471       break;
1602  0012 201a          	jra	L137
1603  0014               L756:
1604                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1604                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1606  0014 721450c8      	bset	20680,#2
1607                     ; 474       break;
1609  0018 2014          	jra	L137
1610                     ; 475     default:
1610                     ; 476       break;
1613  001a               L327:
1614                     ; 481     switch (CLK_IT)
1616  001a 7b01          	ld	a,(OFST+1,sp)
1618                     ; 489     default:
1618                     ; 490       break;
1619  001c a00c          	sub	a,#12
1620  001e 270a          	jreq	L566
1621  0020 a010          	sub	a,#16
1622  0022 260a          	jrne	L137
1623                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1623                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1625  0024 721550c5      	bres	20677,#2
1626                     ; 485       break;
1628  0028 2004          	jra	L137
1629  002a               L566:
1630                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1630                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1632  002a 721550c8      	bres	20680,#2
1633                     ; 488       break;
1634  002e               L137:
1635                     ; 493 }
1638  002e 85            	popw	x
1639  002f 81            	ret	
1640                     ; 489     default:
1640                     ; 490       break;
1676                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1676                     ; 501 {
1677                     .text:	section	.text,new
1678  0000               _CLK_SYSCLKConfig:
1680  0000 88            	push	a
1681       00000000      OFST:	set	0
1684                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1686                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1688  0001 a580          	bcp	a,#128
1689  0003 260e          	jrne	L557
1690                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1692  0005 c650c6        	ld	a,20678
1693  0008 a4e7          	and	a,#231
1694  000a c750c6        	ld	20678,a
1695                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1697  000d 7b01          	ld	a,(OFST+1,sp)
1698  000f a418          	and	a,#24
1700  0011 200c          	jra	L757
1701  0013               L557:
1702                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1704  0013 c650c6        	ld	a,20678
1705  0016 a4f8          	and	a,#248
1706  0018 c750c6        	ld	20678,a
1707                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1709  001b 7b01          	ld	a,(OFST+1,sp)
1710  001d a407          	and	a,#7
1711  001f               L757:
1712  001f ca50c6        	or	a,20678
1713  0022 c750c6        	ld	20678,a
1714                     ; 515 }
1717  0025 84            	pop	a
1718  0026 81            	ret	
1774                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1774                     ; 524 {
1775                     .text:	section	.text,new
1776  0000               _CLK_SWIMConfig:
1780                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1782                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1784  0000 4d            	tnz	a
1785  0001 2705          	jreq	L7001
1786                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1788  0003 721050cd      	bset	20685,#0
1791  0007 81            	ret	
1792  0008               L7001:
1793                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1795  0008 721150cd      	bres	20685,#0
1796                     ; 538 }
1799  000c 81            	ret	
1823                     ; 547 void CLK_ClockSecuritySystemEnable(void)
1823                     ; 548 {
1824                     .text:	section	.text,new
1825  0000               _CLK_ClockSecuritySystemEnable:
1829                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
1831  0000 721050c8      	bset	20680,#0
1832                     ; 551 }
1835  0004 81            	ret	
1860                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1860                     ; 560 {
1861                     .text:	section	.text,new
1862  0000               _CLK_GetSYSCLKSource:
1866                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
1868  0000 c650c3        	ld	a,20675
1871  0003 81            	ret	
1928                     ; 569 uint32_t CLK_GetClockFreq(void)
1928                     ; 570 {
1929                     .text:	section	.text,new
1930  0000               _CLK_GetClockFreq:
1932  0000 5209          	subw	sp,#9
1933       00000009      OFST:	set	9
1936                     ; 571   uint32_t clockfrequency = 0;
1938                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1940                     ; 573   uint8_t tmp = 0, presc = 0;
1944                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1946  0002 c650c3        	ld	a,20675
1947  0005 6b09          	ld	(OFST+0,sp),a
1949                     ; 578   if (clocksource == CLK_SOURCE_HSI)
1951  0007 a1e1          	cp	a,#225
1952  0009 2634          	jrne	L7501
1953                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
1955  000b c650c6        	ld	a,20678
1956  000e a418          	and	a,#24
1957  0010 44            	srl	a
1958  0011 44            	srl	a
1959  0012 44            	srl	a
1961                     ; 581     tmp = (uint8_t)(tmp >> 3);
1964                     ; 582     presc = HSIDivFactor[tmp];
1966  0013 5f            	clrw	x
1967  0014 97            	ld	xl,a
1968  0015 d60000        	ld	a,(_HSIDivFactor,x)
1969  0018 6b09          	ld	(OFST+0,sp),a
1971                     ; 583     clockfrequency = HSI_VALUE / presc;
1973  001a b703          	ld	c_lreg+3,a
1974  001c 3f02          	clr	c_lreg+2
1975  001e 3f01          	clr	c_lreg+1
1976  0020 3f00          	clr	c_lreg
1977  0022 96            	ldw	x,sp
1978  0023 5c            	incw	x
1979  0024 cd0000        	call	c_rtol
1982  0027 ae2400        	ldw	x,#9216
1983  002a bf02          	ldw	c_lreg+2,x
1984  002c ae00f4        	ldw	x,#244
1985  002f bf00          	ldw	c_lreg,x
1986  0031 96            	ldw	x,sp
1987  0032 5c            	incw	x
1988  0033 cd0000        	call	c_ludv
1990  0036 96            	ldw	x,sp
1991  0037 1c0005        	addw	x,#OFST-4
1992  003a cd0000        	call	c_rtol
1996  003d 2018          	jra	L1601
1997  003f               L7501:
1998                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2000  003f a1d2          	cp	a,#210
2001  0041 260a          	jrne	L3601
2002                     ; 587     clockfrequency = LSI_VALUE;
2004  0043 aef400        	ldw	x,#62464
2005  0046 1f07          	ldw	(OFST-2,sp),x
2006  0048 ae0001        	ldw	x,#1
2008  004b 2008          	jp	LC006
2009  004d               L3601:
2010                     ; 591     clockfrequency = HSE_VALUE;
2012  004d ae2400        	ldw	x,#9216
2013  0050 1f07          	ldw	(OFST-2,sp),x
2014  0052 ae00f4        	ldw	x,#244
2015  0055               LC006:
2016  0055 1f05          	ldw	(OFST-4,sp),x
2018  0057               L1601:
2019                     ; 594   return((uint32_t)clockfrequency);
2021  0057 96            	ldw	x,sp
2022  0058 1c0005        	addw	x,#OFST-4
2023  005b cd0000        	call	c_ltor
2027  005e 5b09          	addw	sp,#9
2028  0060 81            	ret	
2127                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2127                     ; 605 {
2128                     .text:	section	.text,new
2129  0000               _CLK_AdjustHSICalibrationValue:
2131  0000 88            	push	a
2132       00000000      OFST:	set	0
2135                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2137                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2139  0001 c650cc        	ld	a,20684
2140  0004 a4f8          	and	a,#248
2141  0006 1a01          	or	a,(OFST+1,sp)
2142  0008 c750cc        	ld	20684,a
2143                     ; 611 }
2146  000b 84            	pop	a
2147  000c 81            	ret	
2171                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2171                     ; 623 {
2172                     .text:	section	.text,new
2173  0000               _CLK_SYSCLKEmergencyClear:
2177                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2179  0000 721150c5      	bres	20677,#0
2180                     ; 625 }
2183  0004 81            	ret	
2332                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2332                     ; 635 {
2333                     .text:	section	.text,new
2334  0000               _CLK_GetFlagStatus:
2336  0000 89            	pushw	x
2337  0001 5203          	subw	sp,#3
2338       00000003      OFST:	set	3
2341                     ; 636   uint16_t statusreg = 0;
2343                     ; 637   uint8_t tmpreg = 0;
2345                     ; 638   FlagStatus bitstatus = RESET;
2347                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2349                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2351  0003 01            	rrwa	x,a
2352  0004 4f            	clr	a
2353  0005 02            	rlwa	x,a
2354  0006 1f01          	ldw	(OFST-2,sp),x
2356                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2358  0008 a30100        	cpw	x,#256
2359  000b 2605          	jrne	L5221
2360                     ; 649     tmpreg = CLK->ICKR;
2362  000d c650c0        	ld	a,20672
2364  0010 2021          	jra	L7221
2365  0012               L5221:
2366                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2368  0012 a30200        	cpw	x,#512
2369  0015 2605          	jrne	L1321
2370                     ; 653     tmpreg = CLK->ECKR;
2372  0017 c650c1        	ld	a,20673
2374  001a 2017          	jra	L7221
2375  001c               L1321:
2376                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2378  001c a30300        	cpw	x,#768
2379  001f 2605          	jrne	L5321
2380                     ; 657     tmpreg = CLK->SWCR;
2382  0021 c650c5        	ld	a,20677
2384  0024 200d          	jra	L7221
2385  0026               L5321:
2386                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2388  0026 a30400        	cpw	x,#1024
2389  0029 2605          	jrne	L1421
2390                     ; 661     tmpreg = CLK->CSSR;
2392  002b c650c8        	ld	a,20680
2394  002e 2003          	jra	L7221
2395  0030               L1421:
2396                     ; 665     tmpreg = CLK->CCOR;
2398  0030 c650c9        	ld	a,20681
2399  0033               L7221:
2400  0033 6b03          	ld	(OFST+0,sp),a
2402                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2404  0035 7b05          	ld	a,(OFST+2,sp)
2405  0037 1503          	bcp	a,(OFST+0,sp)
2406  0039 2704          	jreq	L5421
2407                     ; 670     bitstatus = SET;
2409  003b a601          	ld	a,#1
2412  003d 2001          	jra	L7421
2413  003f               L5421:
2414                     ; 674     bitstatus = RESET;
2416  003f 4f            	clr	a
2418  0040               L7421:
2419                     ; 678   return((FlagStatus)bitstatus);
2423  0040 5b05          	addw	sp,#5
2424  0042 81            	ret	
2470                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2470                     ; 688 {
2471                     .text:	section	.text,new
2472  0000               _CLK_GetITStatus:
2474  0000 88            	push	a
2475  0001 88            	push	a
2476       00000001      OFST:	set	1
2479                     ; 689   ITStatus bitstatus = RESET;
2481                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
2483                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2485  0002 a11c          	cp	a,#28
2486  0004 2609          	jrne	L3721
2487                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2489  0006 c450c5        	and	a,20677
2490  0009 a10c          	cp	a,#12
2491  000b 260f          	jrne	L3031
2492                     ; 699       bitstatus = SET;
2494  000d 2009          	jp	LC008
2495                     ; 703       bitstatus = RESET;
2496  000f               L3721:
2497                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2499  000f c650c8        	ld	a,20680
2500  0012 1402          	and	a,(OFST+1,sp)
2501  0014 a10c          	cp	a,#12
2502  0016 2604          	jrne	L3031
2503                     ; 711       bitstatus = SET;
2505  0018               LC008:
2507  0018 a601          	ld	a,#1
2510  001a 2001          	jra	L1031
2511  001c               L3031:
2512                     ; 715       bitstatus = RESET;
2515  001c 4f            	clr	a
2517  001d               L1031:
2518                     ; 720   return bitstatus;
2522  001d 85            	popw	x
2523  001e 81            	ret	
2559                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2559                     ; 730 {
2560                     .text:	section	.text,new
2561  0000               _CLK_ClearITPendingBit:
2565                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
2567                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2569  0000 a10c          	cp	a,#12
2570  0002 2605          	jrne	L5231
2571                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2573  0004 721750c8      	bres	20680,#3
2576  0008 81            	ret	
2577  0009               L5231:
2578                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2580  0009 721750c5      	bres	20677,#3
2581                     ; 745 }
2584  000d 81            	ret	
2619                     	xdef	_CLKPrescTable
2620                     	xdef	_HSIDivFactor
2621                     	xdef	_CLK_ClearITPendingBit
2622                     	xdef	_CLK_GetITStatus
2623                     	xdef	_CLK_GetFlagStatus
2624                     	xdef	_CLK_GetSYSCLKSource
2625                     	xdef	_CLK_GetClockFreq
2626                     	xdef	_CLK_AdjustHSICalibrationValue
2627                     	xdef	_CLK_SYSCLKEmergencyClear
2628                     	xdef	_CLK_ClockSecuritySystemEnable
2629                     	xdef	_CLK_SWIMConfig
2630                     	xdef	_CLK_SYSCLKConfig
2631                     	xdef	_CLK_ITConfig
2632                     	xdef	_CLK_CCOConfig
2633                     	xdef	_CLK_HSIPrescalerConfig
2634                     	xdef	_CLK_ClockSwitchConfig
2635                     	xdef	_CLK_PeripheralClockConfig
2636                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2637                     	xdef	_CLK_FastHaltWakeUpCmd
2638                     	xdef	_CLK_ClockSwitchCmd
2639                     	xdef	_CLK_CCOCmd
2640                     	xdef	_CLK_LSICmd
2641                     	xdef	_CLK_HSICmd
2642                     	xdef	_CLK_HSECmd
2643                     	xdef	_CLK_DeInit
2644                     	xref.b	c_lreg
2645                     	xref.b	c_x
2664                     	xref	c_ltor
2665                     	xref	c_ludv
2666                     	xref	c_rtol
2667                     	end
