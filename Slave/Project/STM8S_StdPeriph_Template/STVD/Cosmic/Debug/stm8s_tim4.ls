   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.8 - 08 Nov 2022
   3                     ; Generator (Limited) V4.5.5 - 08 Nov 2022
   4                     ; Optimizer V4.5.5 - 08 Nov 2022
  49                     ; 49 void TIM4_DeInit(void)
  49                     ; 50 {
  51                     .text:	section	.text,new
  52  0000               _TIM4_DeInit:
  56                     ; 51   TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  58  0000 725f5340      	clr	21312
  59                     ; 52   TIM4->IER = TIM4_IER_RESET_VALUE;
  61  0004 725f5341      	clr	21313
  62                     ; 53   TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  64  0008 725f5344      	clr	21316
  65                     ; 54   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  67  000c 725f5345      	clr	21317
  68                     ; 55   TIM4->ARR = TIM4_ARR_RESET_VALUE;
  70  0010 35ff5346      	mov	21318,#255
  71                     ; 56   TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  73  0014 725f5342      	clr	21314
  74                     ; 57 }
  77  0018 81            	ret	
 181                     ; 65 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 181                     ; 66 {
 182                     .text:	section	.text,new
 183  0000               _TIM4_TimeBaseInit:
 187                     ; 68   assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 189                     ; 70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 191  0000 9e            	ld	a,xh
 192  0001 c75345        	ld	21317,a
 193                     ; 72   TIM4->ARR = (uint8_t)(TIM4_Period);
 195  0004 9f            	ld	a,xl
 196  0005 c75346        	ld	21318,a
 197                     ; 73 }
 200  0008 81            	ret	
 255                     ; 81 void TIM4_Cmd(FunctionalState NewState)
 255                     ; 82 {
 256                     .text:	section	.text,new
 257  0000               _TIM4_Cmd:
 261                     ; 84   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 263                     ; 87   if (NewState != DISABLE)
 265  0000 4d            	tnz	a
 266  0001 2705          	jreq	L311
 267                     ; 89     TIM4->CR1 |= TIM4_CR1_CEN;
 269  0003 72105340      	bset	21312,#0
 272  0007 81            	ret	
 273  0008               L311:
 274                     ; 93     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 276  0008 72115340      	bres	21312,#0
 277                     ; 95 }
 280  000c 81            	ret	
 338                     ; 107 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 338                     ; 108 {
 339                     .text:	section	.text,new
 340  0000               _TIM4_ITConfig:
 342  0000 89            	pushw	x
 343       00000000      OFST:	set	0
 346                     ; 110   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 348                     ; 111   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 350                     ; 113   if (NewState != DISABLE)
 352  0001 9f            	ld	a,xl
 353  0002 4d            	tnz	a
 354  0003 2706          	jreq	L741
 355                     ; 116     TIM4->IER |= (uint8_t)TIM4_IT;
 357  0005 9e            	ld	a,xh
 358  0006 ca5341        	or	a,21313
 360  0009 2006          	jra	L151
 361  000b               L741:
 362                     ; 121     TIM4->IER &= (uint8_t)(~TIM4_IT);
 364  000b 7b01          	ld	a,(OFST+1,sp)
 365  000d 43            	cpl	a
 366  000e c45341        	and	a,21313
 367  0011               L151:
 368  0011 c75341        	ld	21313,a
 369                     ; 123 }
 372  0014 85            	popw	x
 373  0015 81            	ret	
 409                     ; 131 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 409                     ; 132 {
 410                     .text:	section	.text,new
 411  0000               _TIM4_UpdateDisableConfig:
 415                     ; 134   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 417                     ; 137   if (NewState != DISABLE)
 419  0000 4d            	tnz	a
 420  0001 2705          	jreq	L171
 421                     ; 139     TIM4->CR1 |= TIM4_CR1_UDIS;
 423  0003 72125340      	bset	21312,#1
 426  0007 81            	ret	
 427  0008               L171:
 428                     ; 143     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 430  0008 72135340      	bres	21312,#1
 431                     ; 145 }
 434  000c 81            	ret	
 492                     ; 155 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 492                     ; 156 {
 493                     .text:	section	.text,new
 494  0000               _TIM4_UpdateRequestConfig:
 498                     ; 158   assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 500                     ; 161   if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 502  0000 4d            	tnz	a
 503  0001 2705          	jreq	L322
 504                     ; 163     TIM4->CR1 |= TIM4_CR1_URS;
 506  0003 72145340      	bset	21312,#2
 509  0007 81            	ret	
 510  0008               L322:
 511                     ; 167     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 513  0008 72155340      	bres	21312,#2
 514                     ; 169 }
 517  000c 81            	ret	
 574                     ; 179 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 574                     ; 180 {
 575                     .text:	section	.text,new
 576  0000               _TIM4_SelectOnePulseMode:
 580                     ; 182   assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 582                     ; 185   if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 584  0000 4d            	tnz	a
 585  0001 2705          	jreq	L552
 586                     ; 187     TIM4->CR1 |= TIM4_CR1_OPM;
 588  0003 72165340      	bset	21312,#3
 591  0007 81            	ret	
 592  0008               L552:
 593                     ; 191     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 595  0008 72175340      	bres	21312,#3
 596                     ; 193 }
 599  000c 81            	ret	
 667                     ; 215 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 667                     ; 216 {
 668                     .text:	section	.text,new
 669  0000               _TIM4_PrescalerConfig:
 673                     ; 218   assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 675                     ; 219   assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 677                     ; 222   TIM4->PSCR = (uint8_t)Prescaler;
 679  0000 9e            	ld	a,xh
 680  0001 c75345        	ld	21317,a
 681                     ; 225   TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 683  0004 9f            	ld	a,xl
 684  0005 c75343        	ld	21315,a
 685                     ; 226 }
 688  0008 81            	ret	
 724                     ; 234 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 724                     ; 235 {
 725                     .text:	section	.text,new
 726  0000               _TIM4_ARRPreloadConfig:
 730                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 732                     ; 240   if (NewState != DISABLE)
 734  0000 4d            	tnz	a
 735  0001 2705          	jreq	L133
 736                     ; 242     TIM4->CR1 |= TIM4_CR1_ARPE;
 738  0003 721e5340      	bset	21312,#7
 741  0007 81            	ret	
 742  0008               L133:
 743                     ; 246     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 745  0008 721f5340      	bres	21312,#7
 746                     ; 248 }
 749  000c 81            	ret	
 798                     ; 257 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 798                     ; 258 {
 799                     .text:	section	.text,new
 800  0000               _TIM4_GenerateEvent:
 804                     ; 260   assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 806                     ; 263   TIM4->EGR = (uint8_t)(TIM4_EventSource);
 808  0000 c75343        	ld	21315,a
 809                     ; 264 }
 812  0003 81            	ret	
 844                     ; 272 void TIM4_SetCounter(uint8_t Counter)
 844                     ; 273 {
 845                     .text:	section	.text,new
 846  0000               _TIM4_SetCounter:
 850                     ; 275   TIM4->CNTR = (uint8_t)(Counter);
 852  0000 c75344        	ld	21316,a
 853                     ; 276 }
 856  0003 81            	ret	
 888                     ; 284 void TIM4_SetAutoreload(uint8_t Autoreload)
 888                     ; 285 {
 889                     .text:	section	.text,new
 890  0000               _TIM4_SetAutoreload:
 894                     ; 287   TIM4->ARR = (uint8_t)(Autoreload);
 896  0000 c75346        	ld	21318,a
 897                     ; 288 }
 900  0003 81            	ret	
 923                     ; 295 uint8_t TIM4_GetCounter(void)
 923                     ; 296 {
 924                     .text:	section	.text,new
 925  0000               _TIM4_GetCounter:
 929                     ; 298   return (uint8_t)(TIM4->CNTR);
 931  0000 c65344        	ld	a,21316
 934  0003 81            	ret	
 958                     ; 306 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 958                     ; 307 {
 959                     .text:	section	.text,new
 960  0000               _TIM4_GetPrescaler:
 964                     ; 309   return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
 966  0000 c65345        	ld	a,21317
 969  0003 81            	ret	
1048                     ; 319 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1048                     ; 320 {
1049                     .text:	section	.text,new
1050  0000               _TIM4_GetFlagStatus:
1052       00000001      OFST:	set	1
1055                     ; 321   FlagStatus bitstatus = RESET;
1057                     ; 324   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1059                     ; 326   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1061  0000 c45342        	and	a,21314
1062  0003 2702          	jreq	L174
1063                     ; 328     bitstatus = SET;
1065  0005 a601          	ld	a,#1
1068  0007               L174:
1069                     ; 332     bitstatus = RESET;
1072                     ; 334   return ((FlagStatus)bitstatus);
1076  0007 81            	ret	
1111                     ; 344 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1111                     ; 345 {
1112                     .text:	section	.text,new
1113  0000               _TIM4_ClearFlag:
1117                     ; 347   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1119                     ; 350   TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1121  0000 43            	cpl	a
1122  0001 c75342        	ld	21314,a
1123                     ; 351 }
1126  0004 81            	ret	
1186                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1186                     ; 361 {
1187                     .text:	section	.text,new
1188  0000               _TIM4_GetITStatus:
1190  0000 88            	push	a
1191  0001 89            	pushw	x
1192       00000002      OFST:	set	2
1195                     ; 362   ITStatus bitstatus = RESET;
1197                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1201                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1203                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1205  0002 c45342        	and	a,21314
1206  0005 6b01          	ld	(OFST-1,sp),a
1208                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1210  0007 c65341        	ld	a,21313
1211  000a 1403          	and	a,(OFST+1,sp)
1212  000c 6b02          	ld	(OFST+0,sp),a
1214                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1216  000e 7b01          	ld	a,(OFST-1,sp)
1217  0010 2708          	jreq	L145
1219  0012 7b02          	ld	a,(OFST+0,sp)
1220  0014 2704          	jreq	L145
1221                     ; 375     bitstatus = (ITStatus)SET;
1223  0016 a601          	ld	a,#1
1226  0018 2001          	jra	L345
1227  001a               L145:
1228                     ; 379     bitstatus = (ITStatus)RESET;
1230  001a 4f            	clr	a
1232  001b               L345:
1233                     ; 381   return ((ITStatus)bitstatus);
1237  001b 5b03          	addw	sp,#3
1238  001d 81            	ret	
1274                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1274                     ; 392 {
1275                     .text:	section	.text,new
1276  0000               _TIM4_ClearITPendingBit:
1280                     ; 394   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1282                     ; 397   TIM4->SR1 = (uint8_t)(~TIM4_IT);
1284  0000 43            	cpl	a
1285  0001 c75342        	ld	21314,a
1286                     ; 398 }
1289  0004 81            	ret	
1302                     	xdef	_TIM4_ClearITPendingBit
1303                     	xdef	_TIM4_GetITStatus
1304                     	xdef	_TIM4_ClearFlag
1305                     	xdef	_TIM4_GetFlagStatus
1306                     	xdef	_TIM4_GetPrescaler
1307                     	xdef	_TIM4_GetCounter
1308                     	xdef	_TIM4_SetAutoreload
1309                     	xdef	_TIM4_SetCounter
1310                     	xdef	_TIM4_GenerateEvent
1311                     	xdef	_TIM4_ARRPreloadConfig
1312                     	xdef	_TIM4_PrescalerConfig
1313                     	xdef	_TIM4_SelectOnePulseMode
1314                     	xdef	_TIM4_UpdateRequestConfig
1315                     	xdef	_TIM4_UpdateDisableConfig
1316                     	xdef	_TIM4_ITConfig
1317                     	xdef	_TIM4_Cmd
1318                     	xdef	_TIM4_TimeBaseInit
1319                     	xdef	_TIM4_DeInit
1338                     	end
