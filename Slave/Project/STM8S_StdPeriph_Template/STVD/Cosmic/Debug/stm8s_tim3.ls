   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.8 - 08 Nov 2022
   3                     ; Generator (Limited) V4.5.5 - 08 Nov 2022
   4                     ; Optimizer V4.5.5 - 08 Nov 2022
  49                     ; 51 void TIM3_DeInit(void)
  49                     ; 52 {
  51                     .text:	section	.text,new
  52  0000               _TIM3_DeInit:
  56                     ; 53   TIM3->CR1 = (uint8_t)TIM3_CR1_RESET_VALUE;
  58  0000 725f5320      	clr	21280
  59                     ; 54   TIM3->IER = (uint8_t)TIM3_IER_RESET_VALUE;
  61  0004 725f5321      	clr	21281
  62                     ; 55   TIM3->SR2 = (uint8_t)TIM3_SR2_RESET_VALUE;
  64  0008 725f5323      	clr	21283
  65                     ; 58   TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  67  000c 725f5327      	clr	21287
  68                     ; 61   TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  70  0010 725f5327      	clr	21287
  71                     ; 62   TIM3->CCMR1 = (uint8_t)TIM3_CCMR1_RESET_VALUE;
  73  0014 725f5325      	clr	21285
  74                     ; 63   TIM3->CCMR2 = (uint8_t)TIM3_CCMR2_RESET_VALUE;
  76  0018 725f5326      	clr	21286
  77                     ; 64   TIM3->CNTRH = (uint8_t)TIM3_CNTRH_RESET_VALUE;
  79  001c 725f5328      	clr	21288
  80                     ; 65   TIM3->CNTRL = (uint8_t)TIM3_CNTRL_RESET_VALUE;
  82  0020 725f5329      	clr	21289
  83                     ; 66   TIM3->PSCR = (uint8_t)TIM3_PSCR_RESET_VALUE;
  85  0024 725f532a      	clr	21290
  86                     ; 67   TIM3->ARRH  = (uint8_t)TIM3_ARRH_RESET_VALUE;
  88  0028 35ff532b      	mov	21291,#255
  89                     ; 68   TIM3->ARRL  = (uint8_t)TIM3_ARRL_RESET_VALUE;
  91  002c 35ff532c      	mov	21292,#255
  92                     ; 69   TIM3->CCR1H = (uint8_t)TIM3_CCR1H_RESET_VALUE;
  94  0030 725f532d      	clr	21293
  95                     ; 70   TIM3->CCR1L = (uint8_t)TIM3_CCR1L_RESET_VALUE;
  97  0034 725f532e      	clr	21294
  98                     ; 71   TIM3->CCR2H = (uint8_t)TIM3_CCR2H_RESET_VALUE;
 100  0038 725f532f      	clr	21295
 101                     ; 72   TIM3->CCR2L = (uint8_t)TIM3_CCR2L_RESET_VALUE;
 103  003c 725f5330      	clr	21296
 104                     ; 73   TIM3->SR1 = (uint8_t)TIM3_SR1_RESET_VALUE;
 106  0040 725f5322      	clr	21282
 107                     ; 74 }
 110  0044 81            	ret	
 276                     ; 82 void TIM3_TimeBaseInit( TIM3_Prescaler_TypeDef TIM3_Prescaler,
 276                     ; 83                         uint16_t TIM3_Period)
 276                     ; 84 {
 277                     .text:	section	.text,new
 278  0000               _TIM3_TimeBaseInit:
 280       ffffffff      OFST: set -1
 283                     ; 86   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 285  0000 c7532a        	ld	21290,a
 286                     ; 88   TIM3->ARRH = (uint8_t)(TIM3_Period >> 8);
 288  0003 7b03          	ld	a,(OFST+4,sp)
 289  0005 c7532b        	ld	21291,a
 290                     ; 89   TIM3->ARRL = (uint8_t)(TIM3_Period);
 292  0008 7b04          	ld	a,(OFST+5,sp)
 293  000a c7532c        	ld	21292,a
 294                     ; 90 }
 297  000d 81            	ret	
 452                     ; 100 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 452                     ; 101                   TIM3_OutputState_TypeDef TIM3_OutputState,
 452                     ; 102                   uint16_t TIM3_Pulse,
 452                     ; 103                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 452                     ; 104 {
 453                     .text:	section	.text,new
 454  0000               _TIM3_OC1Init:
 456  0000 89            	pushw	x
 457  0001 88            	push	a
 458       00000001      OFST:	set	1
 461                     ; 106   assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 463                     ; 107   assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 465                     ; 108   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 467                     ; 111   TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC1E | TIM3_CCER1_CC1P));
 469  0002 c65327        	ld	a,21287
 470  0005 a4fc          	and	a,#252
 471  0007 c75327        	ld	21287,a
 472                     ; 113   TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC1E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC1P   ));
 474  000a 7b08          	ld	a,(OFST+7,sp)
 475  000c a402          	and	a,#2
 476  000e 6b01          	ld	(OFST+0,sp),a
 478  0010 9f            	ld	a,xl
 479  0011 a401          	and	a,#1
 480  0013 1a01          	or	a,(OFST+0,sp)
 481  0015 ca5327        	or	a,21287
 482  0018 c75327        	ld	21287,a
 483                     ; 116   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 485  001b c65325        	ld	a,21285
 486  001e a48f          	and	a,#143
 487  0020 1a02          	or	a,(OFST+1,sp)
 488  0022 c75325        	ld	21285,a
 489                     ; 119   TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
 491  0025 7b06          	ld	a,(OFST+5,sp)
 492  0027 c7532d        	ld	21293,a
 493                     ; 120   TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
 495  002a 7b07          	ld	a,(OFST+6,sp)
 496  002c c7532e        	ld	21294,a
 497                     ; 121 }
 500  002f 5b03          	addw	sp,#3
 501  0031 81            	ret	
 563                     ; 131 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 563                     ; 132                   TIM3_OutputState_TypeDef TIM3_OutputState,
 563                     ; 133                   uint16_t TIM3_Pulse,
 563                     ; 134                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 563                     ; 135 {
 564                     .text:	section	.text,new
 565  0000               _TIM3_OC2Init:
 567  0000 89            	pushw	x
 568  0001 88            	push	a
 569       00000001      OFST:	set	1
 572                     ; 137   assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 574                     ; 138   assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 576                     ; 139   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 578                     ; 143   TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC2E |  TIM3_CCER1_CC2P ));
 580  0002 c65327        	ld	a,21287
 581  0005 a4cf          	and	a,#207
 582  0007 c75327        	ld	21287,a
 583                     ; 145   TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC2E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC2P ));
 585  000a 7b08          	ld	a,(OFST+7,sp)
 586  000c a420          	and	a,#32
 587  000e 6b01          	ld	(OFST+0,sp),a
 589  0010 9f            	ld	a,xl
 590  0011 a410          	and	a,#16
 591  0013 1a01          	or	a,(OFST+0,sp)
 592  0015 ca5327        	or	a,21287
 593  0018 c75327        	ld	21287,a
 594                     ; 149   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 596  001b c65326        	ld	a,21286
 597  001e a48f          	and	a,#143
 598  0020 1a02          	or	a,(OFST+1,sp)
 599  0022 c75326        	ld	21286,a
 600                     ; 153   TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
 602  0025 7b06          	ld	a,(OFST+5,sp)
 603  0027 c7532f        	ld	21295,a
 604                     ; 154   TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
 606  002a 7b07          	ld	a,(OFST+6,sp)
 607  002c c75330        	ld	21296,a
 608                     ; 155 }
 611  002f 5b03          	addw	sp,#3
 612  0031 81            	ret	
 794                     ; 166 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
 794                     ; 167                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 794                     ; 168                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
 794                     ; 169                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 794                     ; 170                  uint8_t TIM3_ICFilter)
 794                     ; 171 {
 795                     .text:	section	.text,new
 796  0000               _TIM3_ICInit:
 798  0000 89            	pushw	x
 799       00000000      OFST:	set	0
 802                     ; 173   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
 804                     ; 174   assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 806                     ; 175   assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 808                     ; 176   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 810                     ; 177   assert_param(IS_TIM3_IC_FILTER_OK(TIM3_ICFilter));
 812                     ; 179   if (TIM3_Channel != TIM3_CHANNEL_2)
 814  0001 9e            	ld	a,xh
 815  0002 4a            	dec	a
 816  0003 2714          	jreq	L333
 817                     ; 182     TI1_Config((uint8_t)TIM3_ICPolarity,
 817                     ; 183                (uint8_t)TIM3_ICSelection,
 817                     ; 184                (uint8_t)TIM3_ICFilter);
 819  0005 7b07          	ld	a,(OFST+7,sp)
 820  0007 88            	push	a
 821  0008 7b06          	ld	a,(OFST+6,sp)
 822  000a 97            	ld	xl,a
 823  000b 7b03          	ld	a,(OFST+3,sp)
 824  000d 95            	ld	xh,a
 825  000e cd0000        	call	L3_TI1_Config
 827  0011 84            	pop	a
 828                     ; 187     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
 830  0012 7b06          	ld	a,(OFST+6,sp)
 831  0014 cd0000        	call	_TIM3_SetIC1Prescaler
 834  0017 2012          	jra	L533
 835  0019               L333:
 836                     ; 192     TI2_Config((uint8_t)TIM3_ICPolarity,
 836                     ; 193                (uint8_t)TIM3_ICSelection,
 836                     ; 194                (uint8_t)TIM3_ICFilter);
 838  0019 7b07          	ld	a,(OFST+7,sp)
 839  001b 88            	push	a
 840  001c 7b06          	ld	a,(OFST+6,sp)
 841  001e 97            	ld	xl,a
 842  001f 7b03          	ld	a,(OFST+3,sp)
 843  0021 95            	ld	xh,a
 844  0022 cd0000        	call	L5_TI2_Config
 846  0025 84            	pop	a
 847                     ; 197     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
 849  0026 7b06          	ld	a,(OFST+6,sp)
 850  0028 cd0000        	call	_TIM3_SetIC2Prescaler
 852  002b               L533:
 853                     ; 199 }
 856  002b 85            	popw	x
 857  002c 81            	ret	
 947                     ; 210 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
 947                     ; 211                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 947                     ; 212                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
 947                     ; 213                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 947                     ; 214                      uint8_t TIM3_ICFilter)
 947                     ; 215 {
 948                     .text:	section	.text,new
 949  0000               _TIM3_PWMIConfig:
 951  0000 89            	pushw	x
 952  0001 89            	pushw	x
 953       00000002      OFST:	set	2
 956                     ; 216   uint8_t icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
 958                     ; 217   uint8_t icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
 960                     ; 220   assert_param(IS_TIM3_PWMI_CHANNEL_OK(TIM3_Channel));
 962                     ; 221   assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 964                     ; 222   assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 966                     ; 223   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 968                     ; 226   if (TIM3_ICPolarity != TIM3_ICPOLARITY_FALLING)
 970  0002 9f            	ld	a,xl
 971  0003 a144          	cp	a,#68
 972  0005 2706          	jreq	L773
 973                     ; 228     icpolarity = (uint8_t)TIM3_ICPOLARITY_FALLING;
 975  0007 a644          	ld	a,#68
 976  0009 6b01          	ld	(OFST-1,sp),a
 979  000b 2002          	jra	L104
 980  000d               L773:
 981                     ; 232     icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
 983  000d 0f01          	clr	(OFST-1,sp)
 985  000f               L104:
 986                     ; 236   if (TIM3_ICSelection == TIM3_ICSELECTION_DIRECTTI)
 988  000f 7b07          	ld	a,(OFST+5,sp)
 989  0011 4a            	dec	a
 990  0012 2604          	jrne	L304
 991                     ; 238     icselection = (uint8_t)TIM3_ICSELECTION_INDIRECTTI;
 993  0014 a602          	ld	a,#2
 995  0016 2002          	jra	L504
 996  0018               L304:
 997                     ; 242     icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
 999  0018 a601          	ld	a,#1
1000  001a               L504:
1001  001a 6b02          	ld	(OFST+0,sp),a
1003                     ; 245   if (TIM3_Channel != TIM3_CHANNEL_2)
1005  001c 7b03          	ld	a,(OFST+1,sp)
1006  001e 4a            	dec	a
1007  001f 2726          	jreq	L704
1008                     ; 248     TI1_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1008                     ; 249                (uint8_t)TIM3_ICFilter);
1010  0021 7b09          	ld	a,(OFST+7,sp)
1011  0023 88            	push	a
1012  0024 7b08          	ld	a,(OFST+6,sp)
1013  0026 97            	ld	xl,a
1014  0027 7b05          	ld	a,(OFST+3,sp)
1015  0029 95            	ld	xh,a
1016  002a cd0000        	call	L3_TI1_Config
1018  002d 84            	pop	a
1019                     ; 252     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1021  002e 7b08          	ld	a,(OFST+6,sp)
1022  0030 cd0000        	call	_TIM3_SetIC1Prescaler
1024                     ; 255     TI2_Config(icpolarity, icselection, TIM3_ICFilter);
1026  0033 7b09          	ld	a,(OFST+7,sp)
1027  0035 88            	push	a
1028  0036 7b03          	ld	a,(OFST+1,sp)
1029  0038 97            	ld	xl,a
1030  0039 7b02          	ld	a,(OFST+0,sp)
1031  003b 95            	ld	xh,a
1032  003c cd0000        	call	L5_TI2_Config
1034  003f 84            	pop	a
1035                     ; 258     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1037  0040 7b08          	ld	a,(OFST+6,sp)
1038  0042 cd0000        	call	_TIM3_SetIC2Prescaler
1041  0045 2024          	jra	L114
1042  0047               L704:
1043                     ; 263     TI2_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1043                     ; 264                (uint8_t)TIM3_ICFilter);
1045  0047 7b09          	ld	a,(OFST+7,sp)
1046  0049 88            	push	a
1047  004a 7b08          	ld	a,(OFST+6,sp)
1048  004c 97            	ld	xl,a
1049  004d 7b05          	ld	a,(OFST+3,sp)
1050  004f 95            	ld	xh,a
1051  0050 cd0000        	call	L5_TI2_Config
1053  0053 84            	pop	a
1054                     ; 267     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1056  0054 7b08          	ld	a,(OFST+6,sp)
1057  0056 cd0000        	call	_TIM3_SetIC2Prescaler
1059                     ; 270     TI1_Config(icpolarity, icselection, TIM3_ICFilter);
1061  0059 7b09          	ld	a,(OFST+7,sp)
1062  005b 88            	push	a
1063  005c 7b03          	ld	a,(OFST+1,sp)
1064  005e 97            	ld	xl,a
1065  005f 7b02          	ld	a,(OFST+0,sp)
1066  0061 95            	ld	xh,a
1067  0062 cd0000        	call	L3_TI1_Config
1069  0065 84            	pop	a
1070                     ; 273     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1072  0066 7b08          	ld	a,(OFST+6,sp)
1073  0068 cd0000        	call	_TIM3_SetIC1Prescaler
1075  006b               L114:
1076                     ; 275 }
1079  006b 5b04          	addw	sp,#4
1080  006d 81            	ret	
1135                     ; 283 void TIM3_Cmd(FunctionalState NewState)
1135                     ; 284 {
1136                     .text:	section	.text,new
1137  0000               _TIM3_Cmd:
1141                     ; 286   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1143                     ; 289   if (NewState != DISABLE)
1145  0000 4d            	tnz	a
1146  0001 2705          	jreq	L144
1147                     ; 291     TIM3->CR1 |= (uint8_t)TIM3_CR1_CEN;
1149  0003 72105320      	bset	21280,#0
1152  0007 81            	ret	
1153  0008               L144:
1154                     ; 295     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_CEN);
1156  0008 72115320      	bres	21280,#0
1157                     ; 297 }
1160  000c 81            	ret	
1232                     ; 311 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1232                     ; 312 {
1233                     .text:	section	.text,new
1234  0000               _TIM3_ITConfig:
1236  0000 89            	pushw	x
1237       00000000      OFST:	set	0
1240                     ; 314   assert_param(IS_TIM3_IT_OK(TIM3_IT));
1242                     ; 315   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1244                     ; 317   if (NewState != DISABLE)
1246  0001 9f            	ld	a,xl
1247  0002 4d            	tnz	a
1248  0003 2706          	jreq	L105
1249                     ; 320     TIM3->IER |= (uint8_t)TIM3_IT;
1251  0005 9e            	ld	a,xh
1252  0006 ca5321        	or	a,21281
1254  0009 2006          	jra	L305
1255  000b               L105:
1256                     ; 325     TIM3->IER &= (uint8_t)(~TIM3_IT);
1258  000b 7b01          	ld	a,(OFST+1,sp)
1259  000d 43            	cpl	a
1260  000e c45321        	and	a,21281
1261  0011               L305:
1262  0011 c75321        	ld	21281,a
1263                     ; 327 }
1266  0014 85            	popw	x
1267  0015 81            	ret	
1303                     ; 335 void TIM3_UpdateDisableConfig(FunctionalState NewState)
1303                     ; 336 {
1304                     .text:	section	.text,new
1305  0000               _TIM3_UpdateDisableConfig:
1309                     ; 338   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1311                     ; 341   if (NewState != DISABLE)
1313  0000 4d            	tnz	a
1314  0001 2705          	jreq	L325
1315                     ; 343     TIM3->CR1 |= TIM3_CR1_UDIS;
1317  0003 72125320      	bset	21280,#1
1320  0007 81            	ret	
1321  0008               L325:
1322                     ; 347     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_UDIS);
1324  0008 72135320      	bres	21280,#1
1325                     ; 349 }
1328  000c 81            	ret	
1386                     ; 359 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
1386                     ; 360 {
1387                     .text:	section	.text,new
1388  0000               _TIM3_UpdateRequestConfig:
1392                     ; 362   assert_param(IS_TIM3_UPDATE_SOURCE_OK(TIM3_UpdateSource));
1394                     ; 365   if (TIM3_UpdateSource != TIM3_UPDATESOURCE_GLOBAL)
1396  0000 4d            	tnz	a
1397  0001 2705          	jreq	L555
1398                     ; 367     TIM3->CR1 |= TIM3_CR1_URS;
1400  0003 72145320      	bset	21280,#2
1403  0007 81            	ret	
1404  0008               L555:
1405                     ; 371     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_URS);
1407  0008 72155320      	bres	21280,#2
1408                     ; 373 }
1411  000c 81            	ret	
1468                     ; 383 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
1468                     ; 384 {
1469                     .text:	section	.text,new
1470  0000               _TIM3_SelectOnePulseMode:
1474                     ; 386   assert_param(IS_TIM3_OPM_MODE_OK(TIM3_OPMode));
1476                     ; 389   if (TIM3_OPMode != TIM3_OPMODE_REPETITIVE)
1478  0000 4d            	tnz	a
1479  0001 2705          	jreq	L706
1480                     ; 391     TIM3->CR1 |= TIM3_CR1_OPM;
1482  0003 72165320      	bset	21280,#3
1485  0007 81            	ret	
1486  0008               L706:
1487                     ; 395     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_OPM);
1489  0008 72175320      	bres	21280,#3
1490                     ; 397 }
1493  000c 81            	ret	
1561                     ; 427 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
1561                     ; 428                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
1561                     ; 429 {
1562                     .text:	section	.text,new
1563  0000               _TIM3_PrescalerConfig:
1567                     ; 431   assert_param(IS_TIM3_PRESCALER_RELOAD_OK(TIM3_PSCReloadMode));
1569                     ; 432   assert_param(IS_TIM3_PRESCALER_OK(Prescaler));
1571                     ; 435   TIM3->PSCR = (uint8_t)Prescaler;
1573  0000 9e            	ld	a,xh
1574  0001 c7532a        	ld	21290,a
1575                     ; 438   TIM3->EGR = (uint8_t)TIM3_PSCReloadMode;
1577  0004 9f            	ld	a,xl
1578  0005 c75324        	ld	21284,a
1579                     ; 439 }
1582  0008 81            	ret	
1640                     ; 450 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1640                     ; 451 {
1641                     .text:	section	.text,new
1642  0000               _TIM3_ForcedOC1Config:
1644  0000 88            	push	a
1645       00000000      OFST:	set	0
1648                     ; 453   assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1650                     ; 456   TIM3->CCMR1 =  (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM))  | (uint8_t)TIM3_ForcedAction);
1652  0001 c65325        	ld	a,21285
1653  0004 a48f          	and	a,#143
1654  0006 1a01          	or	a,(OFST+1,sp)
1655  0008 c75325        	ld	21285,a
1656                     ; 457 }
1659  000b 84            	pop	a
1660  000c 81            	ret	
1696                     ; 468 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1696                     ; 469 {
1697                     .text:	section	.text,new
1698  0000               _TIM3_ForcedOC2Config:
1700  0000 88            	push	a
1701       00000000      OFST:	set	0
1704                     ; 471   assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1706                     ; 474   TIM3->CCMR2 =  (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_ForcedAction);
1708  0001 c65326        	ld	a,21286
1709  0004 a48f          	and	a,#143
1710  0006 1a01          	or	a,(OFST+1,sp)
1711  0008 c75326        	ld	21286,a
1712                     ; 475 }
1715  000b 84            	pop	a
1716  000c 81            	ret	
1752                     ; 483 void TIM3_ARRPreloadConfig(FunctionalState NewState)
1752                     ; 484 {
1753                     .text:	section	.text,new
1754  0000               _TIM3_ARRPreloadConfig:
1758                     ; 486   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1760                     ; 489   if (NewState != DISABLE)
1762  0000 4d            	tnz	a
1763  0001 2705          	jreq	L727
1764                     ; 491     TIM3->CR1 |= TIM3_CR1_ARPE;
1766  0003 721e5320      	bset	21280,#7
1769  0007 81            	ret	
1770  0008               L727:
1771                     ; 495     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_ARPE);
1773  0008 721f5320      	bres	21280,#7
1774                     ; 497 }
1777  000c 81            	ret	
1813                     ; 505 void TIM3_OC1PreloadConfig(FunctionalState NewState)
1813                     ; 506 {
1814                     .text:	section	.text,new
1815  0000               _TIM3_OC1PreloadConfig:
1819                     ; 508   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1821                     ; 511   if (NewState != DISABLE)
1823  0000 4d            	tnz	a
1824  0001 2705          	jreq	L157
1825                     ; 513     TIM3->CCMR1 |= TIM3_CCMR_OCxPE;
1827  0003 72165325      	bset	21285,#3
1830  0007 81            	ret	
1831  0008               L157:
1832                     ; 517     TIM3->CCMR1 &= (uint8_t)(~TIM3_CCMR_OCxPE);
1834  0008 72175325      	bres	21285,#3
1835                     ; 519 }
1838  000c 81            	ret	
1874                     ; 527 void TIM3_OC2PreloadConfig(FunctionalState NewState)
1874                     ; 528 {
1875                     .text:	section	.text,new
1876  0000               _TIM3_OC2PreloadConfig:
1880                     ; 530   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1882                     ; 533   if (NewState != DISABLE)
1884  0000 4d            	tnz	a
1885  0001 2705          	jreq	L377
1886                     ; 535     TIM3->CCMR2 |= TIM3_CCMR_OCxPE;
1888  0003 72165326      	bset	21286,#3
1891  0007 81            	ret	
1892  0008               L377:
1893                     ; 539     TIM3->CCMR2 &= (uint8_t)(~TIM3_CCMR_OCxPE);
1895  0008 72175326      	bres	21286,#3
1896                     ; 541 }
1899  000c 81            	ret	
1964                     ; 552 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
1964                     ; 553 {
1965                     .text:	section	.text,new
1966  0000               _TIM3_GenerateEvent:
1970                     ; 555   assert_param(IS_TIM3_EVENT_SOURCE_OK(TIM3_EventSource));
1972                     ; 558   TIM3->EGR = (uint8_t)TIM3_EventSource;
1974  0000 c75324        	ld	21284,a
1975                     ; 559 }
1978  0003 81            	ret	
2014                     ; 569 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2014                     ; 570 {
2015                     .text:	section	.text,new
2016  0000               _TIM3_OC1PolarityConfig:
2020                     ; 572   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2022                     ; 575   if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2024  0000 4d            	tnz	a
2025  0001 2705          	jreq	L5401
2026                     ; 577     TIM3->CCER1 |= TIM3_CCER1_CC1P;
2028  0003 72125327      	bset	21287,#1
2031  0007 81            	ret	
2032  0008               L5401:
2033                     ; 581     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
2035  0008 72135327      	bres	21287,#1
2036                     ; 583 }
2039  000c 81            	ret	
2075                     ; 593 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2075                     ; 594 {
2076                     .text:	section	.text,new
2077  0000               _TIM3_OC2PolarityConfig:
2081                     ; 596   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2083                     ; 599   if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2085  0000 4d            	tnz	a
2086  0001 2705          	jreq	L7601
2087                     ; 601     TIM3->CCER1 |= TIM3_CCER1_CC2P;
2089  0003 721a5327      	bset	21287,#5
2092  0007 81            	ret	
2093  0008               L7601:
2094                     ; 605     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
2096  0008 721b5327      	bres	21287,#5
2097                     ; 607 }
2100  000c 81            	ret	
2145                     ; 619 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
2145                     ; 620 {
2146                     .text:	section	.text,new
2147  0000               _TIM3_CCxCmd:
2149  0000 89            	pushw	x
2150       00000000      OFST:	set	0
2153                     ; 622   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2155                     ; 623   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2157                     ; 625   if (TIM3_Channel == TIM3_CHANNEL_1)
2159  0001 9e            	ld	a,xh
2160  0002 4d            	tnz	a
2161  0003 2610          	jrne	L5111
2162                     ; 628     if (NewState != DISABLE)
2164  0005 9f            	ld	a,xl
2165  0006 4d            	tnz	a
2166  0007 2706          	jreq	L7111
2167                     ; 630       TIM3->CCER1 |= TIM3_CCER1_CC1E;
2169  0009 72105327      	bset	21287,#0
2171  000d 2014          	jra	L3211
2172  000f               L7111:
2173                     ; 634       TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2175  000f 72115327      	bres	21287,#0
2176  0013 200e          	jra	L3211
2177  0015               L5111:
2178                     ; 641     if (NewState != DISABLE)
2180  0015 7b02          	ld	a,(OFST+2,sp)
2181  0017 2706          	jreq	L5211
2182                     ; 643       TIM3->CCER1 |= TIM3_CCER1_CC2E;
2184  0019 72185327      	bset	21287,#4
2186  001d 2004          	jra	L3211
2187  001f               L5211:
2188                     ; 647       TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2190  001f 72195327      	bres	21287,#4
2191  0023               L3211:
2192                     ; 650 }
2195  0023 85            	popw	x
2196  0024 81            	ret	
2241                     ; 671 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel, TIM3_OCMode_TypeDef TIM3_OCMode)
2241                     ; 672 {
2242                     .text:	section	.text,new
2243  0000               _TIM3_SelectOCxM:
2245  0000 89            	pushw	x
2246       00000000      OFST:	set	0
2249                     ; 674   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2251                     ; 675   assert_param(IS_TIM3_OCM_OK(TIM3_OCMode));
2253                     ; 677   if (TIM3_Channel == TIM3_CHANNEL_1)
2255  0001 9e            	ld	a,xh
2256  0002 4d            	tnz	a
2257  0003 2610          	jrne	L3511
2258                     ; 680     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2260  0005 72115327      	bres	21287,#0
2261                     ; 683     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
2263  0009 c65325        	ld	a,21285
2264  000c a48f          	and	a,#143
2265  000e 1a02          	or	a,(OFST+2,sp)
2266  0010 c75325        	ld	21285,a
2268  0013 200e          	jra	L5511
2269  0015               L3511:
2270                     ; 688     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2272  0015 72195327      	bres	21287,#4
2273                     ; 691     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
2275  0019 c65326        	ld	a,21286
2276  001c a48f          	and	a,#143
2277  001e 1a02          	or	a,(OFST+2,sp)
2278  0020 c75326        	ld	21286,a
2279  0023               L5511:
2280                     ; 693 }
2283  0023 85            	popw	x
2284  0024 81            	ret	
2316                     ; 701 void TIM3_SetCounter(uint16_t Counter)
2316                     ; 702 {
2317                     .text:	section	.text,new
2318  0000               _TIM3_SetCounter:
2322                     ; 704   TIM3->CNTRH = (uint8_t)(Counter >> 8);
2324  0000 9e            	ld	a,xh
2325  0001 c75328        	ld	21288,a
2326                     ; 705   TIM3->CNTRL = (uint8_t)(Counter);
2328  0004 9f            	ld	a,xl
2329  0005 c75329        	ld	21289,a
2330                     ; 706 }
2333  0008 81            	ret	
2365                     ; 714 void TIM3_SetAutoreload(uint16_t Autoreload)
2365                     ; 715 {
2366                     .text:	section	.text,new
2367  0000               _TIM3_SetAutoreload:
2371                     ; 717   TIM3->ARRH = (uint8_t)(Autoreload >> 8);
2373  0000 9e            	ld	a,xh
2374  0001 c7532b        	ld	21291,a
2375                     ; 718   TIM3->ARRL = (uint8_t)(Autoreload);
2377  0004 9f            	ld	a,xl
2378  0005 c7532c        	ld	21292,a
2379                     ; 719 }
2382  0008 81            	ret	
2414                     ; 727 void TIM3_SetCompare1(uint16_t Compare1)
2414                     ; 728 {
2415                     .text:	section	.text,new
2416  0000               _TIM3_SetCompare1:
2420                     ; 730   TIM3->CCR1H = (uint8_t)(Compare1 >> 8);
2422  0000 9e            	ld	a,xh
2423  0001 c7532d        	ld	21293,a
2424                     ; 731   TIM3->CCR1L = (uint8_t)(Compare1);
2426  0004 9f            	ld	a,xl
2427  0005 c7532e        	ld	21294,a
2428                     ; 732 }
2431  0008 81            	ret	
2463                     ; 740 void TIM3_SetCompare2(uint16_t Compare2)
2463                     ; 741 {
2464                     .text:	section	.text,new
2465  0000               _TIM3_SetCompare2:
2469                     ; 743   TIM3->CCR2H = (uint8_t)(Compare2 >> 8);
2471  0000 9e            	ld	a,xh
2472  0001 c7532f        	ld	21295,a
2473                     ; 744   TIM3->CCR2L = (uint8_t)(Compare2);
2475  0004 9f            	ld	a,xl
2476  0005 c75330        	ld	21296,a
2477                     ; 745 }
2480  0008 81            	ret	
2516                     ; 757 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
2516                     ; 758 {
2517                     .text:	section	.text,new
2518  0000               _TIM3_SetIC1Prescaler:
2520  0000 88            	push	a
2521       00000000      OFST:	set	0
2524                     ; 760   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC1Prescaler));
2526                     ; 763   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC1Prescaler);
2528  0001 c65325        	ld	a,21285
2529  0004 a4f3          	and	a,#243
2530  0006 1a01          	or	a,(OFST+1,sp)
2531  0008 c75325        	ld	21285,a
2532                     ; 764 }
2535  000b 84            	pop	a
2536  000c 81            	ret	
2572                     ; 776 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
2572                     ; 777 {
2573                     .text:	section	.text,new
2574  0000               _TIM3_SetIC2Prescaler:
2576  0000 88            	push	a
2577       00000000      OFST:	set	0
2580                     ; 779   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC2Prescaler));
2582                     ; 782   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC2Prescaler);
2584  0001 c65326        	ld	a,21286
2585  0004 a4f3          	and	a,#243
2586  0006 1a01          	or	a,(OFST+1,sp)
2587  0008 c75326        	ld	21286,a
2588                     ; 783 }
2591  000b 84            	pop	a
2592  000c 81            	ret	
2638                     ; 790 uint16_t TIM3_GetCapture1(void)
2638                     ; 791 {
2639                     .text:	section	.text,new
2640  0000               _TIM3_GetCapture1:
2642  0000 5204          	subw	sp,#4
2643       00000004      OFST:	set	4
2646                     ; 793   uint16_t tmpccr1 = 0;
2648                     ; 794   uint8_t tmpccr1l=0, tmpccr1h=0;
2652                     ; 796   tmpccr1h = TIM3->CCR1H;
2654  0002 c6532d        	ld	a,21293
2655  0005 6b02          	ld	(OFST-2,sp),a
2657                     ; 797   tmpccr1l = TIM3->CCR1L;
2659  0007 c6532e        	ld	a,21294
2660  000a 6b01          	ld	(OFST-3,sp),a
2662                     ; 799   tmpccr1 = (uint16_t)(tmpccr1l);
2664  000c 5f            	clrw	x
2665  000d 97            	ld	xl,a
2666  000e 1f03          	ldw	(OFST-1,sp),x
2668                     ; 800   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
2670  0010 5f            	clrw	x
2671  0011 7b02          	ld	a,(OFST-2,sp)
2672  0013 97            	ld	xl,a
2673  0014 7b04          	ld	a,(OFST+0,sp)
2674  0016 01            	rrwa	x,a
2675  0017 1a03          	or	a,(OFST-1,sp)
2676  0019 01            	rrwa	x,a
2678                     ; 802   return (uint16_t)tmpccr1;
2682  001a 5b04          	addw	sp,#4
2683  001c 81            	ret	
2729                     ; 810 uint16_t TIM3_GetCapture2(void)
2729                     ; 811 {
2730                     .text:	section	.text,new
2731  0000               _TIM3_GetCapture2:
2733  0000 5204          	subw	sp,#4
2734       00000004      OFST:	set	4
2737                     ; 813   uint16_t tmpccr2 = 0;
2739                     ; 814   uint8_t tmpccr2l=0, tmpccr2h=0;
2743                     ; 816   tmpccr2h = TIM3->CCR2H;
2745  0002 c6532f        	ld	a,21295
2746  0005 6b02          	ld	(OFST-2,sp),a
2748                     ; 817   tmpccr2l = TIM3->CCR2L;
2750  0007 c65330        	ld	a,21296
2751  000a 6b01          	ld	(OFST-3,sp),a
2753                     ; 819   tmpccr2 = (uint16_t)(tmpccr2l);
2755  000c 5f            	clrw	x
2756  000d 97            	ld	xl,a
2757  000e 1f03          	ldw	(OFST-1,sp),x
2759                     ; 820   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
2761  0010 5f            	clrw	x
2762  0011 7b02          	ld	a,(OFST-2,sp)
2763  0013 97            	ld	xl,a
2764  0014 7b04          	ld	a,(OFST+0,sp)
2765  0016 01            	rrwa	x,a
2766  0017 1a03          	or	a,(OFST-1,sp)
2767  0019 01            	rrwa	x,a
2769                     ; 822   return (uint16_t)tmpccr2;
2773  001a 5b04          	addw	sp,#4
2774  001c 81            	ret	
2806                     ; 830 uint16_t TIM3_GetCounter(void)
2806                     ; 831 {
2807                     .text:	section	.text,new
2808  0000               _TIM3_GetCounter:
2810  0000 89            	pushw	x
2811       00000002      OFST:	set	2
2814                     ; 832   uint16_t tmpcntr = 0;
2816                     ; 834   tmpcntr = ((uint16_t)TIM3->CNTRH << 8);
2818  0001 c65328        	ld	a,21288
2819  0004 97            	ld	xl,a
2820  0005 4f            	clr	a
2821  0006 02            	rlwa	x,a
2822  0007 1f01          	ldw	(OFST-1,sp),x
2824                     ; 836   return (uint16_t)( tmpcntr| (uint16_t)(TIM3->CNTRL));
2826  0009 c65329        	ld	a,21289
2827  000c 5f            	clrw	x
2828  000d 97            	ld	xl,a
2829  000e 01            	rrwa	x,a
2830  000f 1a02          	or	a,(OFST+0,sp)
2831  0011 01            	rrwa	x,a
2832  0012 1a01          	or	a,(OFST-1,sp)
2833  0014 01            	rrwa	x,a
2836  0015 5b02          	addw	sp,#2
2837  0017 81            	ret	
2861                     ; 844 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
2861                     ; 845 {
2862                     .text:	section	.text,new
2863  0000               _TIM3_GetPrescaler:
2867                     ; 847   return (TIM3_Prescaler_TypeDef)(TIM3->PSCR);
2869  0000 c6532a        	ld	a,21290
2872  0003 81            	ret	
2993                     ; 861 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
2993                     ; 862 {
2994                     .text:	section	.text,new
2995  0000               _TIM3_GetFlagStatus:
2997  0000 89            	pushw	x
2998  0001 89            	pushw	x
2999       00000002      OFST:	set	2
3002                     ; 863   FlagStatus bitstatus = RESET;
3004                     ; 864   uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
3008                     ; 867   assert_param(IS_TIM3_GET_FLAG_OK(TIM3_FLAG));
3010                     ; 869   tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_FLAG);
3012  0002 9f            	ld	a,xl
3013  0003 c45322        	and	a,21282
3014  0006 6b01          	ld	(OFST-1,sp),a
3016                     ; 870   tim3_flag_h = (uint8_t)((uint16_t)TIM3_FLAG >> 8);
3018  0008 7b03          	ld	a,(OFST+1,sp)
3019  000a 6b02          	ld	(OFST+0,sp),a
3021                     ; 872   if (((tim3_flag_l) | (uint8_t)(TIM3->SR2 & tim3_flag_h)) != (uint8_t)RESET )
3023  000c c45323        	and	a,21283
3024  000f 1a01          	or	a,(OFST-1,sp)
3025  0011 2702          	jreq	L3341
3026                     ; 874     bitstatus = SET;
3028  0013 a601          	ld	a,#1
3031  0015               L3341:
3032                     ; 878     bitstatus = RESET;
3035                     ; 880   return (FlagStatus)bitstatus;
3039  0015 5b04          	addw	sp,#4
3040  0017 81            	ret	
3075                     ; 894 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
3075                     ; 895 {
3076                     .text:	section	.text,new
3077  0000               _TIM3_ClearFlag:
3079  0000 89            	pushw	x
3080       00000000      OFST:	set	0
3083                     ; 897   assert_param(IS_TIM3_CLEAR_FLAG_OK(TIM3_FLAG));
3085                     ; 900   TIM3->SR1 = (uint8_t)(~((uint8_t)(TIM3_FLAG)));
3087  0001 9f            	ld	a,xl
3088  0002 43            	cpl	a
3089  0003 c75322        	ld	21282,a
3090                     ; 901   TIM3->SR2 = (uint8_t)(~((uint8_t)((uint16_t)TIM3_FLAG >> 8)));
3092  0006 7b01          	ld	a,(OFST+1,sp)
3093  0008 43            	cpl	a
3094  0009 c75323        	ld	21283,a
3095                     ; 902 }
3098  000c 85            	popw	x
3099  000d 81            	ret	
3159                     ; 913 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
3159                     ; 914 {
3160                     .text:	section	.text,new
3161  0000               _TIM3_GetITStatus:
3163  0000 88            	push	a
3164  0001 89            	pushw	x
3165       00000002      OFST:	set	2
3168                     ; 915   ITStatus bitstatus = RESET;
3170                     ; 916   uint8_t TIM3_itStatus = 0, TIM3_itEnable = 0;
3174                     ; 919   assert_param(IS_TIM3_GET_IT_OK(TIM3_IT));
3176                     ; 921   TIM3_itStatus = (uint8_t)(TIM3->SR1 & TIM3_IT);
3178  0002 c45322        	and	a,21282
3179  0005 6b01          	ld	(OFST-1,sp),a
3181                     ; 923   TIM3_itEnable = (uint8_t)(TIM3->IER & TIM3_IT);
3183  0007 c65321        	ld	a,21281
3184  000a 1403          	and	a,(OFST+1,sp)
3185  000c 6b02          	ld	(OFST+0,sp),a
3187                     ; 925   if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET ))
3189  000e 7b01          	ld	a,(OFST-1,sp)
3190  0010 2708          	jreq	L3051
3192  0012 7b02          	ld	a,(OFST+0,sp)
3193  0014 2704          	jreq	L3051
3194                     ; 927     bitstatus = SET;
3196  0016 a601          	ld	a,#1
3199  0018 2001          	jra	L5051
3200  001a               L3051:
3201                     ; 931     bitstatus = RESET;
3203  001a 4f            	clr	a
3205  001b               L5051:
3206                     ; 933   return (ITStatus)(bitstatus);
3210  001b 5b03          	addw	sp,#3
3211  001d 81            	ret	
3247                     ; 945 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
3247                     ; 946 {
3248                     .text:	section	.text,new
3249  0000               _TIM3_ClearITPendingBit:
3253                     ; 948   assert_param(IS_TIM3_IT_OK(TIM3_IT));
3255                     ; 951   TIM3->SR1 = (uint8_t)(~TIM3_IT);
3257  0000 43            	cpl	a
3258  0001 c75322        	ld	21282,a
3259                     ; 952 }
3262  0004 81            	ret	
3308                     ; 970 static void TI1_Config(uint8_t TIM3_ICPolarity,
3308                     ; 971                        uint8_t TIM3_ICSelection,
3308                     ; 972                        uint8_t TIM3_ICFilter)
3308                     ; 973 {
3309                     .text:	section	.text,new
3310  0000               L3_TI1_Config:
3312  0000 89            	pushw	x
3313  0001 88            	push	a
3314       00000001      OFST:	set	1
3317                     ; 975   TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
3319  0002 72115327      	bres	21287,#0
3320                     ; 978   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~( TIM3_CCMR_CCxS | TIM3_CCMR_ICxF))) | (uint8_t)(( (TIM3_ICSelection)) | ((uint8_t)( TIM3_ICFilter << 4))));
3322  0006 7b06          	ld	a,(OFST+5,sp)
3323  0008 97            	ld	xl,a
3324  0009 a610          	ld	a,#16
3325  000b 42            	mul	x,a
3326  000c 9f            	ld	a,xl
3327  000d 1a03          	or	a,(OFST+2,sp)
3328  000f 6b01          	ld	(OFST+0,sp),a
3330  0011 c65325        	ld	a,21285
3331  0014 a40c          	and	a,#12
3332  0016 1a01          	or	a,(OFST+0,sp)
3333  0018 c75325        	ld	21285,a
3334                     ; 981   if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3336  001b 7b02          	ld	a,(OFST+1,sp)
3337  001d 2706          	jreq	L5451
3338                     ; 983     TIM3->CCER1 |= TIM3_CCER1_CC1P;
3340  001f 72125327      	bset	21287,#1
3342  0023 2004          	jra	L7451
3343  0025               L5451:
3344                     ; 987     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
3346  0025 72135327      	bres	21287,#1
3347  0029               L7451:
3348                     ; 990   TIM3->CCER1 |= TIM3_CCER1_CC1E;
3350  0029 72105327      	bset	21287,#0
3351                     ; 991 }
3354  002d 5b03          	addw	sp,#3
3355  002f 81            	ret	
3401                     ; 1009 static void TI2_Config(uint8_t TIM3_ICPolarity,
3401                     ; 1010                        uint8_t TIM3_ICSelection,
3401                     ; 1011                        uint8_t TIM3_ICFilter)
3401                     ; 1012 {
3402                     .text:	section	.text,new
3403  0000               L5_TI2_Config:
3405  0000 89            	pushw	x
3406  0001 88            	push	a
3407       00000001      OFST:	set	1
3410                     ; 1014   TIM3->CCER1 &=  (uint8_t)(~TIM3_CCER1_CC2E);
3412  0002 72195327      	bres	21287,#4
3413                     ; 1017   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~( TIM3_CCMR_CCxS |
3413                     ; 1018                                                               TIM3_CCMR_ICxF    ))) | (uint8_t)(( (TIM3_ICSelection)) | 
3413                     ; 1019                                                                                                 ((uint8_t)( TIM3_ICFilter << 4))));
3415  0006 7b06          	ld	a,(OFST+5,sp)
3416  0008 97            	ld	xl,a
3417  0009 a610          	ld	a,#16
3418  000b 42            	mul	x,a
3419  000c 9f            	ld	a,xl
3420  000d 1a03          	or	a,(OFST+2,sp)
3421  000f 6b01          	ld	(OFST+0,sp),a
3423  0011 c65326        	ld	a,21286
3424  0014 a40c          	and	a,#12
3425  0016 1a01          	or	a,(OFST+0,sp)
3426  0018 c75326        	ld	21286,a
3427                     ; 1022   if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3429  001b 7b02          	ld	a,(OFST+1,sp)
3430  001d 2706          	jreq	L1751
3431                     ; 1024     TIM3->CCER1 |= TIM3_CCER1_CC2P;
3433  001f 721a5327      	bset	21287,#5
3435  0023 2004          	jra	L3751
3436  0025               L1751:
3437                     ; 1028     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
3439  0025 721b5327      	bres	21287,#5
3440  0029               L3751:
3441                     ; 1032   TIM3->CCER1 |= TIM3_CCER1_CC2E;
3443  0029 72185327      	bset	21287,#4
3444                     ; 1033 }
3447  002d 5b03          	addw	sp,#3
3448  002f 81            	ret	
3461                     	xdef	_TIM3_ClearITPendingBit
3462                     	xdef	_TIM3_GetITStatus
3463                     	xdef	_TIM3_ClearFlag
3464                     	xdef	_TIM3_GetFlagStatus
3465                     	xdef	_TIM3_GetPrescaler
3466                     	xdef	_TIM3_GetCounter
3467                     	xdef	_TIM3_GetCapture2
3468                     	xdef	_TIM3_GetCapture1
3469                     	xdef	_TIM3_SetIC2Prescaler
3470                     	xdef	_TIM3_SetIC1Prescaler
3471                     	xdef	_TIM3_SetCompare2
3472                     	xdef	_TIM3_SetCompare1
3473                     	xdef	_TIM3_SetAutoreload
3474                     	xdef	_TIM3_SetCounter
3475                     	xdef	_TIM3_SelectOCxM
3476                     	xdef	_TIM3_CCxCmd
3477                     	xdef	_TIM3_OC2PolarityConfig
3478                     	xdef	_TIM3_OC1PolarityConfig
3479                     	xdef	_TIM3_GenerateEvent
3480                     	xdef	_TIM3_OC2PreloadConfig
3481                     	xdef	_TIM3_OC1PreloadConfig
3482                     	xdef	_TIM3_ARRPreloadConfig
3483                     	xdef	_TIM3_ForcedOC2Config
3484                     	xdef	_TIM3_ForcedOC1Config
3485                     	xdef	_TIM3_PrescalerConfig
3486                     	xdef	_TIM3_SelectOnePulseMode
3487                     	xdef	_TIM3_UpdateRequestConfig
3488                     	xdef	_TIM3_UpdateDisableConfig
3489                     	xdef	_TIM3_ITConfig
3490                     	xdef	_TIM3_Cmd
3491                     	xdef	_TIM3_PWMIConfig
3492                     	xdef	_TIM3_ICInit
3493                     	xdef	_TIM3_OC2Init
3494                     	xdef	_TIM3_OC1Init
3495                     	xdef	_TIM3_TimeBaseInit
3496                     	xdef	_TIM3_DeInit
3515                     	end
