   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.8 - 08 Nov 2022
   3                     ; Generator (Limited) V4.5.5 - 08 Nov 2022
   4                     ; Optimizer V4.5.5 - 08 Nov 2022
  49                     ; 52 void TIM2_DeInit(void)
  49                     ; 53 {
  51                     .text:	section	.text,new
  52  0000               _TIM2_DeInit:
  56                     ; 54   TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  58  0000 725f5300      	clr	21248
  59                     ; 55   TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  61  0004 725f5301      	clr	21249
  62                     ; 56   TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  64  0008 725f5303      	clr	21251
  65                     ; 59   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  67  000c 725f5308      	clr	21256
  68                     ; 60   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  70  0010 725f5309      	clr	21257
  71                     ; 64   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  73  0014 725f5308      	clr	21256
  74                     ; 65   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  76  0018 725f5309      	clr	21257
  77                     ; 66   TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  79  001c 725f5305      	clr	21253
  80                     ; 67   TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  82  0020 725f5306      	clr	21254
  83                     ; 68   TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  85  0024 725f5307      	clr	21255
  86                     ; 69   TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  88  0028 725f530a      	clr	21258
  89                     ; 70   TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  91  002c 725f530b      	clr	21259
  92                     ; 71   TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  94  0030 725f530c      	clr	21260
  95                     ; 72   TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  97  0034 35ff530d      	mov	21261,#255
  98                     ; 73   TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
 100  0038 35ff530e      	mov	21262,#255
 101                     ; 74   TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
 103  003c 725f530f      	clr	21263
 104                     ; 75   TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 106  0040 725f5310      	clr	21264
 107                     ; 76   TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 109  0044 725f5311      	clr	21265
 110                     ; 77   TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 112  0048 725f5312      	clr	21266
 113                     ; 78   TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 115  004c 725f5313      	clr	21267
 116                     ; 79   TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 118  0050 725f5314      	clr	21268
 119                     ; 80   TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 121  0054 725f5302      	clr	21250
 122                     ; 81 }
 125  0058 81            	ret	
 291                     ; 89 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 291                     ; 90                         uint16_t TIM2_Period)
 291                     ; 91 {
 292                     .text:	section	.text,new
 293  0000               _TIM2_TimeBaseInit:
 295       ffffffff      OFST: set -1
 298                     ; 93   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 300  0000 c7530c        	ld	21260,a
 301                     ; 95   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 303  0003 7b03          	ld	a,(OFST+4,sp)
 304  0005 c7530d        	ld	21261,a
 305                     ; 96   TIM2->ARRL = (uint8_t)(TIM2_Period);
 307  0008 7b04          	ld	a,(OFST+5,sp)
 308  000a c7530e        	ld	21262,a
 309                     ; 97 }
 312  000d 81            	ret	
 467                     ; 108 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 467                     ; 109                   TIM2_OutputState_TypeDef TIM2_OutputState,
 467                     ; 110                   uint16_t TIM2_Pulse,
 467                     ; 111                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 467                     ; 112 {
 468                     .text:	section	.text,new
 469  0000               _TIM2_OC1Init:
 471  0000 89            	pushw	x
 472  0001 88            	push	a
 473       00000001      OFST:	set	1
 476                     ; 114   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 478                     ; 115   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 480                     ; 116   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 482                     ; 119   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 484  0002 c65308        	ld	a,21256
 485  0005 a4fc          	and	a,#252
 486  0007 c75308        	ld	21256,a
 487                     ; 121   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 487                     ; 122                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 489  000a 7b08          	ld	a,(OFST+7,sp)
 490  000c a402          	and	a,#2
 491  000e 6b01          	ld	(OFST+0,sp),a
 493  0010 9f            	ld	a,xl
 494  0011 a401          	and	a,#1
 495  0013 1a01          	or	a,(OFST+0,sp)
 496  0015 ca5308        	or	a,21256
 497  0018 c75308        	ld	21256,a
 498                     ; 125   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 498                     ; 126                           (uint8_t)TIM2_OCMode);
 500  001b c65305        	ld	a,21253
 501  001e a48f          	and	a,#143
 502  0020 1a02          	or	a,(OFST+1,sp)
 503  0022 c75305        	ld	21253,a
 504                     ; 129   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 506  0025 7b06          	ld	a,(OFST+5,sp)
 507  0027 c7530f        	ld	21263,a
 508                     ; 130   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 510  002a 7b07          	ld	a,(OFST+6,sp)
 511  002c c75310        	ld	21264,a
 512                     ; 131 }
 515  002f 5b03          	addw	sp,#3
 516  0031 81            	ret	
 578                     ; 142 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 578                     ; 143                   TIM2_OutputState_TypeDef TIM2_OutputState,
 578                     ; 144                   uint16_t TIM2_Pulse,
 578                     ; 145                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 578                     ; 146 {
 579                     .text:	section	.text,new
 580  0000               _TIM2_OC2Init:
 582  0000 89            	pushw	x
 583  0001 88            	push	a
 584       00000001      OFST:	set	1
 587                     ; 148   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 589                     ; 149   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 591                     ; 150   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 593                     ; 154   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 595  0002 c65308        	ld	a,21256
 596  0005 a4cf          	and	a,#207
 597  0007 c75308        	ld	21256,a
 598                     ; 156   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 598                     ; 157                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 600  000a 7b08          	ld	a,(OFST+7,sp)
 601  000c a420          	and	a,#32
 602  000e 6b01          	ld	(OFST+0,sp),a
 604  0010 9f            	ld	a,xl
 605  0011 a410          	and	a,#16
 606  0013 1a01          	or	a,(OFST+0,sp)
 607  0015 ca5308        	or	a,21256
 608  0018 c75308        	ld	21256,a
 609                     ; 161   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 609                     ; 162                           (uint8_t)TIM2_OCMode);
 611  001b c65306        	ld	a,21254
 612  001e a48f          	and	a,#143
 613  0020 1a02          	or	a,(OFST+1,sp)
 614  0022 c75306        	ld	21254,a
 615                     ; 166   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 617  0025 7b06          	ld	a,(OFST+5,sp)
 618  0027 c75311        	ld	21265,a
 619                     ; 167   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 621  002a 7b07          	ld	a,(OFST+6,sp)
 622  002c c75312        	ld	21266,a
 623                     ; 168 }
 626  002f 5b03          	addw	sp,#3
 627  0031 81            	ret	
 689                     ; 179 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 689                     ; 180                   TIM2_OutputState_TypeDef TIM2_OutputState,
 689                     ; 181                   uint16_t TIM2_Pulse,
 689                     ; 182                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 689                     ; 183 {
 690                     .text:	section	.text,new
 691  0000               _TIM2_OC3Init:
 693  0000 89            	pushw	x
 694  0001 88            	push	a
 695       00000001      OFST:	set	1
 698                     ; 185   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 700                     ; 186   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 702                     ; 187   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 704                     ; 189   TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 706  0002 c65309        	ld	a,21257
 707  0005 a4fc          	and	a,#252
 708  0007 c75309        	ld	21257,a
 709                     ; 191   TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 709                     ; 192                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 711  000a 7b08          	ld	a,(OFST+7,sp)
 712  000c a402          	and	a,#2
 713  000e 6b01          	ld	(OFST+0,sp),a
 715  0010 9f            	ld	a,xl
 716  0011 a401          	and	a,#1
 717  0013 1a01          	or	a,(OFST+0,sp)
 718  0015 ca5309        	or	a,21257
 719  0018 c75309        	ld	21257,a
 720                     ; 195   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 720                     ; 196                           (uint8_t)TIM2_OCMode);
 722  001b c65307        	ld	a,21255
 723  001e a48f          	and	a,#143
 724  0020 1a02          	or	a,(OFST+1,sp)
 725  0022 c75307        	ld	21255,a
 726                     ; 199   TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 728  0025 7b06          	ld	a,(OFST+5,sp)
 729  0027 c75313        	ld	21267,a
 730                     ; 200   TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 732  002a 7b07          	ld	a,(OFST+6,sp)
 733  002c c75314        	ld	21268,a
 734                     ; 201 }
 737  002f 5b03          	addw	sp,#3
 738  0031 81            	ret	
 929                     ; 212 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
 929                     ; 213                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 929                     ; 214                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
 929                     ; 215                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 929                     ; 216                  uint8_t TIM2_ICFilter)
 929                     ; 217 {
 930                     .text:	section	.text,new
 931  0000               _TIM2_ICInit:
 933  0000 89            	pushw	x
 934       00000000      OFST:	set	0
 937                     ; 219   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
 939                     ; 220   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 941                     ; 221   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 943                     ; 222   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 945                     ; 223   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
 947                     ; 225   if (TIM2_Channel == TIM2_CHANNEL_1)
 949  0001 9e            	ld	a,xh
 950  0002 4d            	tnz	a
 951  0003 2614          	jrne	L763
 952                     ; 228     TI1_Config((uint8_t)TIM2_ICPolarity,
 952                     ; 229                (uint8_t)TIM2_ICSelection,
 952                     ; 230                (uint8_t)TIM2_ICFilter);
 954  0005 7b07          	ld	a,(OFST+7,sp)
 955  0007 88            	push	a
 956  0008 7b06          	ld	a,(OFST+6,sp)
 957  000a 97            	ld	xl,a
 958  000b 7b03          	ld	a,(OFST+3,sp)
 959  000d 95            	ld	xh,a
 960  000e cd0000        	call	L3_TI1_Config
 962  0011 84            	pop	a
 963                     ; 233     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 965  0012 7b06          	ld	a,(OFST+6,sp)
 966  0014 cd0000        	call	_TIM2_SetIC1Prescaler
 969  0017 202b          	jra	L173
 970  0019               L763:
 971                     ; 235   else if (TIM2_Channel == TIM2_CHANNEL_2)
 973  0019 7b01          	ld	a,(OFST+1,sp)
 974  001b 4a            	dec	a
 975  001c 2614          	jrne	L373
 976                     ; 238     TI2_Config((uint8_t)TIM2_ICPolarity,
 976                     ; 239                (uint8_t)TIM2_ICSelection,
 976                     ; 240                (uint8_t)TIM2_ICFilter);
 978  001e 7b07          	ld	a,(OFST+7,sp)
 979  0020 88            	push	a
 980  0021 7b06          	ld	a,(OFST+6,sp)
 981  0023 97            	ld	xl,a
 982  0024 7b03          	ld	a,(OFST+3,sp)
 983  0026 95            	ld	xh,a
 984  0027 cd0000        	call	L5_TI2_Config
 986  002a 84            	pop	a
 987                     ; 243     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
 989  002b 7b06          	ld	a,(OFST+6,sp)
 990  002d cd0000        	call	_TIM2_SetIC2Prescaler
 993  0030 2012          	jra	L173
 994  0032               L373:
 995                     ; 248     TI3_Config((uint8_t)TIM2_ICPolarity,
 995                     ; 249                (uint8_t)TIM2_ICSelection,
 995                     ; 250                (uint8_t)TIM2_ICFilter);
 997  0032 7b07          	ld	a,(OFST+7,sp)
 998  0034 88            	push	a
 999  0035 7b06          	ld	a,(OFST+6,sp)
1000  0037 97            	ld	xl,a
1001  0038 7b03          	ld	a,(OFST+3,sp)
1002  003a 95            	ld	xh,a
1003  003b cd0000        	call	L7_TI3_Config
1005  003e 84            	pop	a
1006                     ; 253     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1008  003f 7b06          	ld	a,(OFST+6,sp)
1009  0041 cd0000        	call	_TIM2_SetIC3Prescaler
1011  0044               L173:
1012                     ; 255 }
1015  0044 85            	popw	x
1016  0045 81            	ret	
1106                     ; 266 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1106                     ; 267                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1106                     ; 268                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1106                     ; 269                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1106                     ; 270                      uint8_t TIM2_ICFilter)
1106                     ; 271 {
1107                     .text:	section	.text,new
1108  0000               _TIM2_PWMIConfig:
1110  0000 89            	pushw	x
1111  0001 89            	pushw	x
1112       00000002      OFST:	set	2
1115                     ; 272   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1117                     ; 273   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1119                     ; 276   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1121                     ; 277   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1123                     ; 278   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1125                     ; 279   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1127                     ; 282   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1129  0002 9f            	ld	a,xl
1130  0003 a144          	cp	a,#68
1131  0005 2706          	jreq	L734
1132                     ; 284     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1134  0007 a644          	ld	a,#68
1135  0009 6b01          	ld	(OFST-1,sp),a
1138  000b 2002          	jra	L144
1139  000d               L734:
1140                     ; 288     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1142  000d 0f01          	clr	(OFST-1,sp)
1144  000f               L144:
1145                     ; 292   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1147  000f 7b07          	ld	a,(OFST+5,sp)
1148  0011 4a            	dec	a
1149  0012 2604          	jrne	L344
1150                     ; 294     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1152  0014 a602          	ld	a,#2
1154  0016 2002          	jra	L544
1155  0018               L344:
1156                     ; 298     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1158  0018 a601          	ld	a,#1
1159  001a               L544:
1160  001a 6b02          	ld	(OFST+0,sp),a
1162                     ; 301   if (TIM2_Channel == TIM2_CHANNEL_1)
1164  001c 7b03          	ld	a,(OFST+1,sp)
1165  001e 2626          	jrne	L744
1166                     ; 304     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1166                     ; 305                (uint8_t)TIM2_ICFilter);
1168  0020 7b09          	ld	a,(OFST+7,sp)
1169  0022 88            	push	a
1170  0023 7b08          	ld	a,(OFST+6,sp)
1171  0025 97            	ld	xl,a
1172  0026 7b05          	ld	a,(OFST+3,sp)
1173  0028 95            	ld	xh,a
1174  0029 cd0000        	call	L3_TI1_Config
1176  002c 84            	pop	a
1177                     ; 308     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1179  002d 7b08          	ld	a,(OFST+6,sp)
1180  002f cd0000        	call	_TIM2_SetIC1Prescaler
1182                     ; 311     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1184  0032 7b09          	ld	a,(OFST+7,sp)
1185  0034 88            	push	a
1186  0035 7b03          	ld	a,(OFST+1,sp)
1187  0037 97            	ld	xl,a
1188  0038 7b02          	ld	a,(OFST+0,sp)
1189  003a 95            	ld	xh,a
1190  003b cd0000        	call	L5_TI2_Config
1192  003e 84            	pop	a
1193                     ; 314     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1195  003f 7b08          	ld	a,(OFST+6,sp)
1196  0041 cd0000        	call	_TIM2_SetIC2Prescaler
1199  0044 2024          	jra	L154
1200  0046               L744:
1201                     ; 319     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1201                     ; 320                (uint8_t)TIM2_ICFilter);
1203  0046 7b09          	ld	a,(OFST+7,sp)
1204  0048 88            	push	a
1205  0049 7b08          	ld	a,(OFST+6,sp)
1206  004b 97            	ld	xl,a
1207  004c 7b05          	ld	a,(OFST+3,sp)
1208  004e 95            	ld	xh,a
1209  004f cd0000        	call	L5_TI2_Config
1211  0052 84            	pop	a
1212                     ; 323     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1214  0053 7b08          	ld	a,(OFST+6,sp)
1215  0055 cd0000        	call	_TIM2_SetIC2Prescaler
1217                     ; 326     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1219  0058 7b09          	ld	a,(OFST+7,sp)
1220  005a 88            	push	a
1221  005b 7b03          	ld	a,(OFST+1,sp)
1222  005d 97            	ld	xl,a
1223  005e 7b02          	ld	a,(OFST+0,sp)
1224  0060 95            	ld	xh,a
1225  0061 cd0000        	call	L3_TI1_Config
1227  0064 84            	pop	a
1228                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1230  0065 7b08          	ld	a,(OFST+6,sp)
1231  0067 cd0000        	call	_TIM2_SetIC1Prescaler
1233  006a               L154:
1234                     ; 331 }
1237  006a 5b04          	addw	sp,#4
1238  006c 81            	ret	
1293                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1293                     ; 340 {
1294                     .text:	section	.text,new
1295  0000               _TIM2_Cmd:
1299                     ; 342   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1301                     ; 345   if (NewState != DISABLE)
1303  0000 4d            	tnz	a
1304  0001 2705          	jreq	L105
1305                     ; 347     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1307  0003 72105300      	bset	21248,#0
1310  0007 81            	ret	
1311  0008               L105:
1312                     ; 351     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1314  0008 72115300      	bres	21248,#0
1315                     ; 353 }
1318  000c 81            	ret	
1397                     ; 368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1397                     ; 369 {
1398                     .text:	section	.text,new
1399  0000               _TIM2_ITConfig:
1401  0000 89            	pushw	x
1402       00000000      OFST:	set	0
1405                     ; 371   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1407                     ; 372   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1409                     ; 374   if (NewState != DISABLE)
1411  0001 9f            	ld	a,xl
1412  0002 4d            	tnz	a
1413  0003 2706          	jreq	L345
1414                     ; 377     TIM2->IER |= (uint8_t)TIM2_IT;
1416  0005 9e            	ld	a,xh
1417  0006 ca5301        	or	a,21249
1419  0009 2006          	jra	L545
1420  000b               L345:
1421                     ; 382     TIM2->IER &= (uint8_t)(~TIM2_IT);
1423  000b 7b01          	ld	a,(OFST+1,sp)
1424  000d 43            	cpl	a
1425  000e c45301        	and	a,21249
1426  0011               L545:
1427  0011 c75301        	ld	21249,a
1428                     ; 384 }
1431  0014 85            	popw	x
1432  0015 81            	ret	
1468                     ; 392 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1468                     ; 393 {
1469                     .text:	section	.text,new
1470  0000               _TIM2_UpdateDisableConfig:
1474                     ; 395   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1476                     ; 398   if (NewState != DISABLE)
1478  0000 4d            	tnz	a
1479  0001 2705          	jreq	L565
1480                     ; 400     TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1482  0003 72125300      	bset	21248,#1
1485  0007 81            	ret	
1486  0008               L565:
1487                     ; 404     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1489  0008 72135300      	bres	21248,#1
1490                     ; 406 }
1493  000c 81            	ret	
1551                     ; 416 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1551                     ; 417 {
1552                     .text:	section	.text,new
1553  0000               _TIM2_UpdateRequestConfig:
1557                     ; 419   assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1559                     ; 422   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1561  0000 4d            	tnz	a
1562  0001 2705          	jreq	L716
1563                     ; 424     TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
1565  0003 72145300      	bset	21248,#2
1568  0007 81            	ret	
1569  0008               L716:
1570                     ; 428     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
1572  0008 72155300      	bres	21248,#2
1573                     ; 430 }
1576  000c 81            	ret	
1633                     ; 440 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1633                     ; 441 {
1634                     .text:	section	.text,new
1635  0000               _TIM2_SelectOnePulseMode:
1639                     ; 443   assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
1641                     ; 446   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1643  0000 4d            	tnz	a
1644  0001 2705          	jreq	L156
1645                     ; 448     TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
1647  0003 72165300      	bset	21248,#3
1650  0007 81            	ret	
1651  0008               L156:
1652                     ; 452     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
1654  0008 72175300      	bres	21248,#3
1655                     ; 454 }
1658  000c 81            	ret	
1726                     ; 484 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
1726                     ; 485                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
1726                     ; 486 {
1727                     .text:	section	.text,new
1728  0000               _TIM2_PrescalerConfig:
1732                     ; 488   assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
1734                     ; 489   assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
1736                     ; 492   TIM2->PSCR = (uint8_t)Prescaler;
1738  0000 9e            	ld	a,xh
1739  0001 c7530c        	ld	21260,a
1740                     ; 495   TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
1742  0004 9f            	ld	a,xl
1743  0005 c75304        	ld	21252,a
1744                     ; 496 }
1747  0008 81            	ret	
1805                     ; 507 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1805                     ; 508 {
1806                     .text:	section	.text,new
1807  0000               _TIM2_ForcedOC1Config:
1809  0000 88            	push	a
1810       00000000      OFST:	set	0
1813                     ; 510   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1815                     ; 513   TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
1815                     ; 514                             | (uint8_t)TIM2_ForcedAction);
1817  0001 c65305        	ld	a,21253
1818  0004 a48f          	and	a,#143
1819  0006 1a01          	or	a,(OFST+1,sp)
1820  0008 c75305        	ld	21253,a
1821                     ; 515 }
1824  000b 84            	pop	a
1825  000c 81            	ret	
1861                     ; 526 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1861                     ; 527 {
1862                     .text:	section	.text,new
1863  0000               _TIM2_ForcedOC2Config:
1865  0000 88            	push	a
1866       00000000      OFST:	set	0
1869                     ; 529   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1871                     ; 532   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
1871                     ; 533                           | (uint8_t)TIM2_ForcedAction);
1873  0001 c65306        	ld	a,21254
1874  0004 a48f          	and	a,#143
1875  0006 1a01          	or	a,(OFST+1,sp)
1876  0008 c75306        	ld	21254,a
1877                     ; 534 }
1880  000b 84            	pop	a
1881  000c 81            	ret	
1917                     ; 545 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1917                     ; 546 {
1918                     .text:	section	.text,new
1919  0000               _TIM2_ForcedOC3Config:
1921  0000 88            	push	a
1922       00000000      OFST:	set	0
1925                     ; 548   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1927                     ; 551   TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
1927                     ; 552                             | (uint8_t)TIM2_ForcedAction);
1929  0001 c65307        	ld	a,21255
1930  0004 a48f          	and	a,#143
1931  0006 1a01          	or	a,(OFST+1,sp)
1932  0008 c75307        	ld	21255,a
1933                     ; 553 }
1936  000b 84            	pop	a
1937  000c 81            	ret	
1973                     ; 561 void TIM2_ARRPreloadConfig(FunctionalState NewState)
1973                     ; 562 {
1974                     .text:	section	.text,new
1975  0000               _TIM2_ARRPreloadConfig:
1979                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1981                     ; 567   if (NewState != DISABLE)
1983  0000 4d            	tnz	a
1984  0001 2705          	jreq	L7001
1985                     ; 569     TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
1987  0003 721e5300      	bset	21248,#7
1990  0007 81            	ret	
1991  0008               L7001:
1992                     ; 573     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
1994  0008 721f5300      	bres	21248,#7
1995                     ; 575 }
1998  000c 81            	ret	
2034                     ; 583 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2034                     ; 584 {
2035                     .text:	section	.text,new
2036  0000               _TIM2_OC1PreloadConfig:
2040                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2042                     ; 589   if (NewState != DISABLE)
2044  0000 4d            	tnz	a
2045  0001 2705          	jreq	L1301
2046                     ; 591     TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2048  0003 72165305      	bset	21253,#3
2051  0007 81            	ret	
2052  0008               L1301:
2053                     ; 595     TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2055  0008 72175305      	bres	21253,#3
2056                     ; 597 }
2059  000c 81            	ret	
2095                     ; 605 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2095                     ; 606 {
2096                     .text:	section	.text,new
2097  0000               _TIM2_OC2PreloadConfig:
2101                     ; 608   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2103                     ; 611   if (NewState != DISABLE)
2105  0000 4d            	tnz	a
2106  0001 2705          	jreq	L3501
2107                     ; 613     TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2109  0003 72165306      	bset	21254,#3
2112  0007 81            	ret	
2113  0008               L3501:
2114                     ; 617     TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2116  0008 72175306      	bres	21254,#3
2117                     ; 619 }
2120  000c 81            	ret	
2156                     ; 627 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2156                     ; 628 {
2157                     .text:	section	.text,new
2158  0000               _TIM2_OC3PreloadConfig:
2162                     ; 630   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2164                     ; 633   if (NewState != DISABLE)
2166  0000 4d            	tnz	a
2167  0001 2705          	jreq	L5701
2168                     ; 635     TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2170  0003 72165307      	bset	21255,#3
2173  0007 81            	ret	
2174  0008               L5701:
2175                     ; 639     TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2177  0008 72175307      	bres	21255,#3
2178                     ; 641 }
2181  000c 81            	ret	
2254                     ; 653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2254                     ; 654 {
2255                     .text:	section	.text,new
2256  0000               _TIM2_GenerateEvent:
2260                     ; 656   assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2262                     ; 659   TIM2->EGR = (uint8_t)TIM2_EventSource;
2264  0000 c75304        	ld	21252,a
2265                     ; 660 }
2268  0003 81            	ret	
2304                     ; 670 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2304                     ; 671 {
2305                     .text:	section	.text,new
2306  0000               _TIM2_OC1PolarityConfig:
2310                     ; 673   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2312                     ; 676   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2314  0000 4d            	tnz	a
2315  0001 2705          	jreq	L1511
2316                     ; 678     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2318  0003 72125308      	bset	21256,#1
2321  0007 81            	ret	
2322  0008               L1511:
2323                     ; 682     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2325  0008 72135308      	bres	21256,#1
2326                     ; 684 }
2329  000c 81            	ret	
2365                     ; 694 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2365                     ; 695 {
2366                     .text:	section	.text,new
2367  0000               _TIM2_OC2PolarityConfig:
2371                     ; 697   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2373                     ; 700   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2375  0000 4d            	tnz	a
2376  0001 2705          	jreq	L3711
2377                     ; 702     TIM2->CCER1 |= TIM2_CCER1_CC2P;
2379  0003 721a5308      	bset	21256,#5
2382  0007 81            	ret	
2383  0008               L3711:
2384                     ; 706     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2386  0008 721b5308      	bres	21256,#5
2387                     ; 708 }
2390  000c 81            	ret	
2426                     ; 718 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2426                     ; 719 {
2427                     .text:	section	.text,new
2428  0000               _TIM2_OC3PolarityConfig:
2432                     ; 721   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2434                     ; 724   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2436  0000 4d            	tnz	a
2437  0001 2705          	jreq	L5121
2438                     ; 726     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
2440  0003 72125309      	bset	21257,#1
2443  0007 81            	ret	
2444  0008               L5121:
2445                     ; 730     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
2447  0008 72135309      	bres	21257,#1
2448                     ; 732 }
2451  000c 81            	ret	
2496                     ; 745 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
2496                     ; 746 {
2497                     .text:	section	.text,new
2498  0000               _TIM2_CCxCmd:
2500  0000 89            	pushw	x
2501       00000000      OFST:	set	0
2504                     ; 748   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2506                     ; 749   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2508                     ; 751   if (TIM2_Channel == TIM2_CHANNEL_1)
2510  0001 9e            	ld	a,xh
2511  0002 4d            	tnz	a
2512  0003 2610          	jrne	L3421
2513                     ; 754     if (NewState != DISABLE)
2515  0005 9f            	ld	a,xl
2516  0006 4d            	tnz	a
2517  0007 2706          	jreq	L5421
2518                     ; 756       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
2520  0009 72105308      	bset	21256,#0
2522  000d 2029          	jra	L1521
2523  000f               L5421:
2524                     ; 760       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2526  000f 72115308      	bres	21256,#0
2527  0013 2023          	jra	L1521
2528  0015               L3421:
2529                     ; 764   else if (TIM2_Channel == TIM2_CHANNEL_2)
2531  0015 7b01          	ld	a,(OFST+1,sp)
2532  0017 4a            	dec	a
2533  0018 2610          	jrne	L3521
2534                     ; 767     if (NewState != DISABLE)
2536  001a 7b02          	ld	a,(OFST+2,sp)
2537  001c 2706          	jreq	L5521
2538                     ; 769       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
2540  001e 72185308      	bset	21256,#4
2542  0022 2014          	jra	L1521
2543  0024               L5521:
2544                     ; 773       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2546  0024 72195308      	bres	21256,#4
2547  0028 200e          	jra	L1521
2548  002a               L3521:
2549                     ; 779     if (NewState != DISABLE)
2551  002a 7b02          	ld	a,(OFST+2,sp)
2552  002c 2706          	jreq	L3621
2553                     ; 781       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
2555  002e 72105309      	bset	21257,#0
2557  0032 2004          	jra	L1521
2558  0034               L3621:
2559                     ; 785       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2561  0034 72115309      	bres	21257,#0
2562  0038               L1521:
2563                     ; 788 }
2566  0038 85            	popw	x
2567  0039 81            	ret	
2612                     ; 810 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
2612                     ; 811 {
2613                     .text:	section	.text,new
2614  0000               _TIM2_SelectOCxM:
2616  0000 89            	pushw	x
2617       00000000      OFST:	set	0
2620                     ; 813   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2622                     ; 814   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
2624                     ; 816   if (TIM2_Channel == TIM2_CHANNEL_1)
2626  0001 9e            	ld	a,xh
2627  0002 4d            	tnz	a
2628  0003 2610          	jrne	L1131
2629                     ; 819     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2631  0005 72115308      	bres	21256,#0
2632                     ; 822     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
2632                     ; 823                             | (uint8_t)TIM2_OCMode);
2634  0009 c65305        	ld	a,21253
2635  000c a48f          	and	a,#143
2636  000e 1a02          	or	a,(OFST+2,sp)
2637  0010 c75305        	ld	21253,a
2639  0013 2023          	jra	L3131
2640  0015               L1131:
2641                     ; 825   else if (TIM2_Channel == TIM2_CHANNEL_2)
2643  0015 7b01          	ld	a,(OFST+1,sp)
2644  0017 4a            	dec	a
2645  0018 2610          	jrne	L5131
2646                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2648  001a 72195308      	bres	21256,#4
2649                     ; 831     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
2649                     ; 832                             | (uint8_t)TIM2_OCMode);
2651  001e c65306        	ld	a,21254
2652  0021 a48f          	and	a,#143
2653  0023 1a02          	or	a,(OFST+2,sp)
2654  0025 c75306        	ld	21254,a
2656  0028 200e          	jra	L3131
2657  002a               L5131:
2658                     ; 837     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2660  002a 72115309      	bres	21257,#0
2661                     ; 840     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2661                     ; 841                             | (uint8_t)TIM2_OCMode);
2663  002e c65307        	ld	a,21255
2664  0031 a48f          	and	a,#143
2665  0033 1a02          	or	a,(OFST+2,sp)
2666  0035 c75307        	ld	21255,a
2667  0038               L3131:
2668                     ; 843 }
2671  0038 85            	popw	x
2672  0039 81            	ret	
2704                     ; 851 void TIM2_SetCounter(uint16_t Counter)
2704                     ; 852 {
2705                     .text:	section	.text,new
2706  0000               _TIM2_SetCounter:
2710                     ; 854   TIM2->CNTRH = (uint8_t)(Counter >> 8);
2712  0000 9e            	ld	a,xh
2713  0001 c7530a        	ld	21258,a
2714                     ; 855   TIM2->CNTRL = (uint8_t)(Counter);
2716  0004 9f            	ld	a,xl
2717  0005 c7530b        	ld	21259,a
2718                     ; 856 }
2721  0008 81            	ret	
2753                     ; 864 void TIM2_SetAutoreload(uint16_t Autoreload)
2753                     ; 865 {
2754                     .text:	section	.text,new
2755  0000               _TIM2_SetAutoreload:
2759                     ; 867   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
2761  0000 9e            	ld	a,xh
2762  0001 c7530d        	ld	21261,a
2763                     ; 868   TIM2->ARRL = (uint8_t)(Autoreload);
2765  0004 9f            	ld	a,xl
2766  0005 c7530e        	ld	21262,a
2767                     ; 869 }
2770  0008 81            	ret	
2802                     ; 877 void TIM2_SetCompare1(uint16_t Compare1)
2802                     ; 878 {
2803                     .text:	section	.text,new
2804  0000               _TIM2_SetCompare1:
2808                     ; 880   TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
2810  0000 9e            	ld	a,xh
2811  0001 c7530f        	ld	21263,a
2812                     ; 881   TIM2->CCR1L = (uint8_t)(Compare1);
2814  0004 9f            	ld	a,xl
2815  0005 c75310        	ld	21264,a
2816                     ; 882 }
2819  0008 81            	ret	
2851                     ; 890 void TIM2_SetCompare2(uint16_t Compare2)
2851                     ; 891 {
2852                     .text:	section	.text,new
2853  0000               _TIM2_SetCompare2:
2857                     ; 893   TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
2859  0000 9e            	ld	a,xh
2860  0001 c75311        	ld	21265,a
2861                     ; 894   TIM2->CCR2L = (uint8_t)(Compare2);
2863  0004 9f            	ld	a,xl
2864  0005 c75312        	ld	21266,a
2865                     ; 895 }
2868  0008 81            	ret	
2900                     ; 903 void TIM2_SetCompare3(uint16_t Compare3)
2900                     ; 904 {
2901                     .text:	section	.text,new
2902  0000               _TIM2_SetCompare3:
2906                     ; 906   TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
2908  0000 9e            	ld	a,xh
2909  0001 c75313        	ld	21267,a
2910                     ; 907   TIM2->CCR3L = (uint8_t)(Compare3);
2912  0004 9f            	ld	a,xl
2913  0005 c75314        	ld	21268,a
2914                     ; 908 }
2917  0008 81            	ret	
2953                     ; 920 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
2953                     ; 921 {
2954                     .text:	section	.text,new
2955  0000               _TIM2_SetIC1Prescaler:
2957  0000 88            	push	a
2958       00000000      OFST:	set	0
2961                     ; 923   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
2963                     ; 926   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
2963                     ; 927                           | (uint8_t)TIM2_IC1Prescaler);
2965  0001 c65305        	ld	a,21253
2966  0004 a4f3          	and	a,#243
2967  0006 1a01          	or	a,(OFST+1,sp)
2968  0008 c75305        	ld	21253,a
2969                     ; 928 }
2972  000b 84            	pop	a
2973  000c 81            	ret	
3009                     ; 940 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3009                     ; 941 {
3010                     .text:	section	.text,new
3011  0000               _TIM2_SetIC2Prescaler:
3013  0000 88            	push	a
3014       00000000      OFST:	set	0
3017                     ; 943   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3019                     ; 946   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3019                     ; 947                           | (uint8_t)TIM2_IC2Prescaler);
3021  0001 c65306        	ld	a,21254
3022  0004 a4f3          	and	a,#243
3023  0006 1a01          	or	a,(OFST+1,sp)
3024  0008 c75306        	ld	21254,a
3025                     ; 948 }
3028  000b 84            	pop	a
3029  000c 81            	ret	
3065                     ; 960 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3065                     ; 961 {
3066                     .text:	section	.text,new
3067  0000               _TIM2_SetIC3Prescaler:
3069  0000 88            	push	a
3070       00000000      OFST:	set	0
3073                     ; 964   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3075                     ; 966   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3075                     ; 967                           | (uint8_t)TIM2_IC3Prescaler);
3077  0001 c65307        	ld	a,21255
3078  0004 a4f3          	and	a,#243
3079  0006 1a01          	or	a,(OFST+1,sp)
3080  0008 c75307        	ld	21255,a
3081                     ; 968 }
3084  000b 84            	pop	a
3085  000c 81            	ret	
3131                     ; 975 uint16_t TIM2_GetCapture1(void)
3131                     ; 976 {
3132                     .text:	section	.text,new
3133  0000               _TIM2_GetCapture1:
3135  0000 5204          	subw	sp,#4
3136       00000004      OFST:	set	4
3139                     ; 978   uint16_t tmpccr1 = 0;
3141                     ; 979   uint8_t tmpccr1l=0, tmpccr1h=0;
3145                     ; 981   tmpccr1h = TIM2->CCR1H;
3147  0002 c6530f        	ld	a,21263
3148  0005 6b02          	ld	(OFST-2,sp),a
3150                     ; 982   tmpccr1l = TIM2->CCR1L;
3152  0007 c65310        	ld	a,21264
3153  000a 6b01          	ld	(OFST-3,sp),a
3155                     ; 984   tmpccr1 = (uint16_t)(tmpccr1l);
3157  000c 5f            	clrw	x
3158  000d 97            	ld	xl,a
3159  000e 1f03          	ldw	(OFST-1,sp),x
3161                     ; 985   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3163  0010 5f            	clrw	x
3164  0011 7b02          	ld	a,(OFST-2,sp)
3165  0013 97            	ld	xl,a
3166  0014 7b04          	ld	a,(OFST+0,sp)
3167  0016 01            	rrwa	x,a
3168  0017 1a03          	or	a,(OFST-1,sp)
3169  0019 01            	rrwa	x,a
3171                     ; 987   return (uint16_t)tmpccr1;
3175  001a 5b04          	addw	sp,#4
3176  001c 81            	ret	
3222                     ; 995 uint16_t TIM2_GetCapture2(void)
3222                     ; 996 {
3223                     .text:	section	.text,new
3224  0000               _TIM2_GetCapture2:
3226  0000 5204          	subw	sp,#4
3227       00000004      OFST:	set	4
3230                     ; 998   uint16_t tmpccr2 = 0;
3232                     ; 999   uint8_t tmpccr2l=0, tmpccr2h=0;
3236                     ; 1001   tmpccr2h = TIM2->CCR2H;
3238  0002 c65311        	ld	a,21265
3239  0005 6b02          	ld	(OFST-2,sp),a
3241                     ; 1002   tmpccr2l = TIM2->CCR2L;
3243  0007 c65312        	ld	a,21266
3244  000a 6b01          	ld	(OFST-3,sp),a
3246                     ; 1004   tmpccr2 = (uint16_t)(tmpccr2l);
3248  000c 5f            	clrw	x
3249  000d 97            	ld	xl,a
3250  000e 1f03          	ldw	(OFST-1,sp),x
3252                     ; 1005   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3254  0010 5f            	clrw	x
3255  0011 7b02          	ld	a,(OFST-2,sp)
3256  0013 97            	ld	xl,a
3257  0014 7b04          	ld	a,(OFST+0,sp)
3258  0016 01            	rrwa	x,a
3259  0017 1a03          	or	a,(OFST-1,sp)
3260  0019 01            	rrwa	x,a
3262                     ; 1007   return (uint16_t)tmpccr2;
3266  001a 5b04          	addw	sp,#4
3267  001c 81            	ret	
3313                     ; 1015 uint16_t TIM2_GetCapture3(void)
3313                     ; 1016 {
3314                     .text:	section	.text,new
3315  0000               _TIM2_GetCapture3:
3317  0000 5204          	subw	sp,#4
3318       00000004      OFST:	set	4
3321                     ; 1018   uint16_t tmpccr3 = 0;
3323                     ; 1019   uint8_t tmpccr3l=0, tmpccr3h=0;
3327                     ; 1021   tmpccr3h = TIM2->CCR3H;
3329  0002 c65313        	ld	a,21267
3330  0005 6b02          	ld	(OFST-2,sp),a
3332                     ; 1022   tmpccr3l = TIM2->CCR3L;
3334  0007 c65314        	ld	a,21268
3335  000a 6b01          	ld	(OFST-3,sp),a
3337                     ; 1024   tmpccr3 = (uint16_t)(tmpccr3l);
3339  000c 5f            	clrw	x
3340  000d 97            	ld	xl,a
3341  000e 1f03          	ldw	(OFST-1,sp),x
3343                     ; 1025   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
3345  0010 5f            	clrw	x
3346  0011 7b02          	ld	a,(OFST-2,sp)
3347  0013 97            	ld	xl,a
3348  0014 7b04          	ld	a,(OFST+0,sp)
3349  0016 01            	rrwa	x,a
3350  0017 1a03          	or	a,(OFST-1,sp)
3351  0019 01            	rrwa	x,a
3353                     ; 1027   return (uint16_t)tmpccr3;
3357  001a 5b04          	addw	sp,#4
3358  001c 81            	ret	
3390                     ; 1035 uint16_t TIM2_GetCounter(void)
3390                     ; 1036 {
3391                     .text:	section	.text,new
3392  0000               _TIM2_GetCounter:
3394  0000 89            	pushw	x
3395       00000002      OFST:	set	2
3398                     ; 1037   uint16_t tmpcntr = 0;
3400                     ; 1039   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
3402  0001 c6530a        	ld	a,21258
3403  0004 97            	ld	xl,a
3404  0005 4f            	clr	a
3405  0006 02            	rlwa	x,a
3406  0007 1f01          	ldw	(OFST-1,sp),x
3408                     ; 1041   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
3410  0009 c6530b        	ld	a,21259
3411  000c 5f            	clrw	x
3412  000d 97            	ld	xl,a
3413  000e 01            	rrwa	x,a
3414  000f 1a02          	or	a,(OFST+0,sp)
3415  0011 01            	rrwa	x,a
3416  0012 1a01          	or	a,(OFST-1,sp)
3417  0014 01            	rrwa	x,a
3420  0015 5b02          	addw	sp,#2
3421  0017 81            	ret	
3445                     ; 1049 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
3445                     ; 1050 {
3446                     .text:	section	.text,new
3447  0000               _TIM2_GetPrescaler:
3451                     ; 1052   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
3453  0000 c6530c        	ld	a,21260
3456  0003 81            	ret	
3591                     ; 1068 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3591                     ; 1069 {
3592                     .text:	section	.text,new
3593  0000               _TIM2_GetFlagStatus:
3595  0000 89            	pushw	x
3596  0001 89            	pushw	x
3597       00000002      OFST:	set	2
3600                     ; 1070   FlagStatus bitstatus = RESET;
3602                     ; 1071   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3606                     ; 1074   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
3608                     ; 1076   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
3610  0002 9f            	ld	a,xl
3611  0003 c45302        	and	a,21250
3612  0006 6b01          	ld	(OFST-1,sp),a
3614                     ; 1077   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
3616  0008 7b03          	ld	a,(OFST+1,sp)
3617  000a 6b02          	ld	(OFST+0,sp),a
3619                     ; 1079   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
3621  000c c45303        	and	a,21251
3622  000f 1a01          	or	a,(OFST-1,sp)
3623  0011 2702          	jreq	L3561
3624                     ; 1081     bitstatus = SET;
3626  0013 a601          	ld	a,#1
3629  0015               L3561:
3630                     ; 1085     bitstatus = RESET;
3633                     ; 1087   return (FlagStatus)bitstatus;
3637  0015 5b04          	addw	sp,#4
3638  0017 81            	ret	
3673                     ; 1103 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3673                     ; 1104 {
3674                     .text:	section	.text,new
3675  0000               _TIM2_ClearFlag:
3679                     ; 1106   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
3681                     ; 1109   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
3683  0000 9f            	ld	a,xl
3684  0001 43            	cpl	a
3685  0002 c75302        	ld	21250,a
3686                     ; 1110   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
3688  0005 35ff5303      	mov	21251,#255
3689                     ; 1111 }
3692  0009 81            	ret	
3752                     ; 1123 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3752                     ; 1124 {
3753                     .text:	section	.text,new
3754  0000               _TIM2_GetITStatus:
3756  0000 88            	push	a
3757  0001 89            	pushw	x
3758       00000002      OFST:	set	2
3761                     ; 1125   ITStatus bitstatus = RESET;
3763                     ; 1126   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
3767                     ; 1129   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
3769                     ; 1131   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
3771  0002 c45302        	and	a,21250
3772  0005 6b01          	ld	(OFST-1,sp),a
3774                     ; 1133   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
3776  0007 c65301        	ld	a,21249
3777  000a 1403          	and	a,(OFST+1,sp)
3778  000c 6b02          	ld	(OFST+0,sp),a
3780                     ; 1135   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
3782  000e 7b01          	ld	a,(OFST-1,sp)
3783  0010 2708          	jreq	L3271
3785  0012 7b02          	ld	a,(OFST+0,sp)
3786  0014 2704          	jreq	L3271
3787                     ; 1137     bitstatus = SET;
3789  0016 a601          	ld	a,#1
3792  0018 2001          	jra	L5271
3793  001a               L3271:
3794                     ; 1141     bitstatus = RESET;
3796  001a 4f            	clr	a
3798  001b               L5271:
3799                     ; 1143   return (ITStatus)(bitstatus);
3803  001b 5b03          	addw	sp,#3
3804  001d 81            	ret	
3840                     ; 1156 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3840                     ; 1157 {
3841                     .text:	section	.text,new
3842  0000               _TIM2_ClearITPendingBit:
3846                     ; 1159   assert_param(IS_TIM2_IT_OK(TIM2_IT));
3848                     ; 1162   TIM2->SR1 = (uint8_t)(~TIM2_IT);
3850  0000 43            	cpl	a
3851  0001 c75302        	ld	21250,a
3852                     ; 1163 }
3855  0004 81            	ret	
3901                     ; 1181 static void TI1_Config(uint8_t TIM2_ICPolarity,
3901                     ; 1182                        uint8_t TIM2_ICSelection,
3901                     ; 1183                        uint8_t TIM2_ICFilter)
3901                     ; 1184 {
3902                     .text:	section	.text,new
3903  0000               L3_TI1_Config:
3905  0000 89            	pushw	x
3906  0001 88            	push	a
3907       00000001      OFST:	set	1
3910                     ; 1186   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3912  0002 72115308      	bres	21256,#0
3913                     ; 1189   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
3913                     ; 1190                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
3915  0006 7b06          	ld	a,(OFST+5,sp)
3916  0008 97            	ld	xl,a
3917  0009 a610          	ld	a,#16
3918  000b 42            	mul	x,a
3919  000c 9f            	ld	a,xl
3920  000d 1a03          	or	a,(OFST+2,sp)
3921  000f 6b01          	ld	(OFST+0,sp),a
3923  0011 c65305        	ld	a,21253
3924  0014 a40c          	and	a,#12
3925  0016 1a01          	or	a,(OFST+0,sp)
3926  0018 c75305        	ld	21253,a
3927                     ; 1193   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
3929  001b 7b02          	ld	a,(OFST+1,sp)
3930  001d 2706          	jreq	L5671
3931                     ; 1195     TIM2->CCER1 |= TIM2_CCER1_CC1P;
3933  001f 72125308      	bset	21256,#1
3935  0023 2004          	jra	L7671
3936  0025               L5671:
3937                     ; 1199     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
3939  0025 72135308      	bres	21256,#1
3940  0029               L7671:
3941                     ; 1202   TIM2->CCER1 |= TIM2_CCER1_CC1E;
3943  0029 72105308      	bset	21256,#0
3944                     ; 1203 }
3947  002d 5b03          	addw	sp,#3
3948  002f 81            	ret	
3994                     ; 1221 static void TI2_Config(uint8_t TIM2_ICPolarity,
3994                     ; 1222                        uint8_t TIM2_ICSelection,
3994                     ; 1223                        uint8_t TIM2_ICFilter)
3994                     ; 1224 {
3995                     .text:	section	.text,new
3996  0000               L5_TI2_Config:
3998  0000 89            	pushw	x
3999  0001 88            	push	a
4000       00000001      OFST:	set	1
4003                     ; 1226   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
4005  0002 72195308      	bres	21256,#4
4006                     ; 1229   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
4006                     ; 1230                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4008  0006 7b06          	ld	a,(OFST+5,sp)
4009  0008 97            	ld	xl,a
4010  0009 a610          	ld	a,#16
4011  000b 42            	mul	x,a
4012  000c 9f            	ld	a,xl
4013  000d 1a03          	or	a,(OFST+2,sp)
4014  000f 6b01          	ld	(OFST+0,sp),a
4016  0011 c65306        	ld	a,21254
4017  0014 a40c          	and	a,#12
4018  0016 1a01          	or	a,(OFST+0,sp)
4019  0018 c75306        	ld	21254,a
4020                     ; 1234   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4022  001b 7b02          	ld	a,(OFST+1,sp)
4023  001d 2706          	jreq	L1102
4024                     ; 1236     TIM2->CCER1 |= TIM2_CCER1_CC2P;
4026  001f 721a5308      	bset	21256,#5
4028  0023 2004          	jra	L3102
4029  0025               L1102:
4030                     ; 1240     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
4032  0025 721b5308      	bres	21256,#5
4033  0029               L3102:
4034                     ; 1244   TIM2->CCER1 |= TIM2_CCER1_CC2E;
4036  0029 72185308      	bset	21256,#4
4037                     ; 1245 }
4040  002d 5b03          	addw	sp,#3
4041  002f 81            	ret	
4087                     ; 1261 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
4087                     ; 1262                        uint8_t TIM2_ICFilter)
4087                     ; 1263 {
4088                     .text:	section	.text,new
4089  0000               L7_TI3_Config:
4091  0000 89            	pushw	x
4092  0001 88            	push	a
4093       00000001      OFST:	set	1
4096                     ; 1265   TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
4098  0002 72115309      	bres	21257,#0
4099                     ; 1268   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
4099                     ; 1269                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4101  0006 7b06          	ld	a,(OFST+5,sp)
4102  0008 97            	ld	xl,a
4103  0009 a610          	ld	a,#16
4104  000b 42            	mul	x,a
4105  000c 9f            	ld	a,xl
4106  000d 1a03          	or	a,(OFST+2,sp)
4107  000f 6b01          	ld	(OFST+0,sp),a
4109  0011 c65307        	ld	a,21255
4110  0014 a40c          	and	a,#12
4111  0016 1a01          	or	a,(OFST+0,sp)
4112  0018 c75307        	ld	21255,a
4113                     ; 1273   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4115  001b 7b02          	ld	a,(OFST+1,sp)
4116  001d 2706          	jreq	L5302
4117                     ; 1275     TIM2->CCER2 |= TIM2_CCER2_CC3P;
4119  001f 72125309      	bset	21257,#1
4121  0023 2004          	jra	L7302
4122  0025               L5302:
4123                     ; 1279     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
4125  0025 72135309      	bres	21257,#1
4126  0029               L7302:
4127                     ; 1282   TIM2->CCER2 |= TIM2_CCER2_CC3E;
4129  0029 72105309      	bset	21257,#0
4130                     ; 1283 }
4133  002d 5b03          	addw	sp,#3
4134  002f 81            	ret	
4147                     	xdef	_TIM2_ClearITPendingBit
4148                     	xdef	_TIM2_GetITStatus
4149                     	xdef	_TIM2_ClearFlag
4150                     	xdef	_TIM2_GetFlagStatus
4151                     	xdef	_TIM2_GetPrescaler
4152                     	xdef	_TIM2_GetCounter
4153                     	xdef	_TIM2_GetCapture3
4154                     	xdef	_TIM2_GetCapture2
4155                     	xdef	_TIM2_GetCapture1
4156                     	xdef	_TIM2_SetIC3Prescaler
4157                     	xdef	_TIM2_SetIC2Prescaler
4158                     	xdef	_TIM2_SetIC1Prescaler
4159                     	xdef	_TIM2_SetCompare3
4160                     	xdef	_TIM2_SetCompare2
4161                     	xdef	_TIM2_SetCompare1
4162                     	xdef	_TIM2_SetAutoreload
4163                     	xdef	_TIM2_SetCounter
4164                     	xdef	_TIM2_SelectOCxM
4165                     	xdef	_TIM2_CCxCmd
4166                     	xdef	_TIM2_OC3PolarityConfig
4167                     	xdef	_TIM2_OC2PolarityConfig
4168                     	xdef	_TIM2_OC1PolarityConfig
4169                     	xdef	_TIM2_GenerateEvent
4170                     	xdef	_TIM2_OC3PreloadConfig
4171                     	xdef	_TIM2_OC2PreloadConfig
4172                     	xdef	_TIM2_OC1PreloadConfig
4173                     	xdef	_TIM2_ARRPreloadConfig
4174                     	xdef	_TIM2_ForcedOC3Config
4175                     	xdef	_TIM2_ForcedOC2Config
4176                     	xdef	_TIM2_ForcedOC1Config
4177                     	xdef	_TIM2_PrescalerConfig
4178                     	xdef	_TIM2_SelectOnePulseMode
4179                     	xdef	_TIM2_UpdateRequestConfig
4180                     	xdef	_TIM2_UpdateDisableConfig
4181                     	xdef	_TIM2_ITConfig
4182                     	xdef	_TIM2_Cmd
4183                     	xdef	_TIM2_PWMIConfig
4184                     	xdef	_TIM2_ICInit
4185                     	xdef	_TIM2_OC3Init
4186                     	xdef	_TIM2_OC2Init
4187                     	xdef	_TIM2_OC1Init
4188                     	xdef	_TIM2_TimeBaseInit
4189                     	xdef	_TIM2_DeInit
4208                     	end
