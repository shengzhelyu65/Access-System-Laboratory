   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.8 - 08 Nov 2022
   3                     ; Generator (Limited) V4.5.5 - 08 Nov 2022
   4                     ; Optimizer V4.5.5 - 08 Nov 2022
  49                     ; 52 void ADC1_DeInit(void)
  49                     ; 53 {
  51                     .text:	section	.text,new
  52  0000               _ADC1_DeInit:
  56                     ; 54   ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  58  0000 725f5400      	clr	21504
  59                     ; 55   ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  61  0004 725f5401      	clr	21505
  62                     ; 56   ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  64  0008 725f5402      	clr	21506
  65                     ; 57   ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  67  000c 725f5403      	clr	21507
  68                     ; 58   ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  70  0010 725f5406      	clr	21510
  71                     ; 59   ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  73  0014 725f5407      	clr	21511
  74                     ; 60   ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  76  0018 35ff5408      	mov	21512,#255
  77                     ; 61   ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  79  001c 35035409      	mov	21513,#3
  80                     ; 62   ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  82  0020 725f540a      	clr	21514
  83                     ; 63   ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  85  0024 725f540b      	clr	21515
  86                     ; 64   ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  88  0028 725f540e      	clr	21518
  89                     ; 65   ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  91  002c 725f540f      	clr	21519
  92                     ; 66 }
  95  0030 81            	ret	
 546                     ; 88 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 546                     ; 89 {
 547                     .text:	section	.text,new
 548  0000               _ADC1_Init:
 550  0000 89            	pushw	x
 551       00000000      OFST:	set	0
 554                     ; 91   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 556                     ; 92   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 558                     ; 93   assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 560                     ; 94   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 562                     ; 95   assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 564                     ; 96   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 566                     ; 97   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 568                     ; 98   assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 570                     ; 103   ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 572  0001 7b08          	ld	a,(OFST+8,sp)
 573  0003 88            	push	a
 574  0004 7b02          	ld	a,(OFST+2,sp)
 575  0006 95            	ld	xh,a
 576  0007 cd0000        	call	_ADC1_ConversionConfig
 578  000a 84            	pop	a
 579                     ; 105   ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 581  000b 7b05          	ld	a,(OFST+5,sp)
 582  000d cd0000        	call	_ADC1_PrescalerConfig
 584                     ; 110   ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 586  0010 7b07          	ld	a,(OFST+7,sp)
 587  0012 97            	ld	xl,a
 588  0013 7b06          	ld	a,(OFST+6,sp)
 589  0015 95            	ld	xh,a
 590  0016 cd0000        	call	_ADC1_ExternalTriggerConfig
 592                     ; 115   ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 594  0019 7b0a          	ld	a,(OFST+10,sp)
 595  001b 97            	ld	xl,a
 596  001c 7b09          	ld	a,(OFST+9,sp)
 597  001e 95            	ld	xh,a
 598  001f cd0000        	call	_ADC1_SchmittTriggerConfig
 600                     ; 118   ADC1->CR1 |= ADC1_CR1_ADON;
 602  0022 72105401      	bset	21505,#0
 603                     ; 119 }
 606  0026 85            	popw	x
 607  0027 81            	ret	
 642                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 642                     ; 127 {
 643                     .text:	section	.text,new
 644  0000               _ADC1_Cmd:
 648                     ; 129   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 650                     ; 131   if (NewState != DISABLE)
 652  0000 4d            	tnz	a
 653  0001 2705          	jreq	L362
 654                     ; 133     ADC1->CR1 |= ADC1_CR1_ADON;
 656  0003 72105401      	bset	21505,#0
 659  0007 81            	ret	
 660  0008               L362:
 661                     ; 137     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 663  0008 72115401      	bres	21505,#0
 664                     ; 139 }
 667  000c 81            	ret	
 702                     ; 146 void ADC1_ScanModeCmd(FunctionalState NewState)
 702                     ; 147 {
 703                     .text:	section	.text,new
 704  0000               _ADC1_ScanModeCmd:
 708                     ; 149   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 710                     ; 151   if (NewState != DISABLE)
 712  0000 4d            	tnz	a
 713  0001 2705          	jreq	L503
 714                     ; 153     ADC1->CR2 |= ADC1_CR2_SCAN;
 716  0003 72125402      	bset	21506,#1
 719  0007 81            	ret	
 720  0008               L503:
 721                     ; 157     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 723  0008 72135402      	bres	21506,#1
 724                     ; 159 }
 727  000c 81            	ret	
 762                     ; 166 void ADC1_DataBufferCmd(FunctionalState NewState)
 762                     ; 167 {
 763                     .text:	section	.text,new
 764  0000               _ADC1_DataBufferCmd:
 768                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 770                     ; 171   if (NewState != DISABLE)
 772  0000 4d            	tnz	a
 773  0001 2705          	jreq	L723
 774                     ; 173     ADC1->CR3 |= ADC1_CR3_DBUF;
 776  0003 721e5403      	bset	21507,#7
 779  0007 81            	ret	
 780  0008               L723:
 781                     ; 177     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
 783  0008 721f5403      	bres	21507,#7
 784                     ; 179 }
 787  000c 81            	ret	
 943                     ; 190 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
 943                     ; 191 {
 944                     .text:	section	.text,new
 945  0000               _ADC1_ITConfig:
 947  0000 89            	pushw	x
 948       00000000      OFST:	set	0
 951                     ; 193   assert_param(IS_ADC1_IT_OK(ADC1_IT));
 953                     ; 194   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 955                     ; 196   if (NewState != DISABLE)
 957  0001 7b05          	ld	a,(OFST+5,sp)
 958  0003 2706          	jreq	L714
 959                     ; 199     ADC1->CSR |= (uint8_t)ADC1_IT;
 961  0005 9f            	ld	a,xl
 962  0006 ca5400        	or	a,21504
 964  0009 2006          	jra	L124
 965  000b               L714:
 966                     ; 204     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
 968  000b 7b02          	ld	a,(OFST+2,sp)
 969  000d 43            	cpl	a
 970  000e c45400        	and	a,21504
 971  0011               L124:
 972  0011 c75400        	ld	21504,a
 973                     ; 206 }
 976  0014 85            	popw	x
 977  0015 81            	ret	
1013                     ; 214 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1013                     ; 215 {
1014                     .text:	section	.text,new
1015  0000               _ADC1_PrescalerConfig:
1017  0000 88            	push	a
1018       00000000      OFST:	set	0
1021                     ; 217   assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1023                     ; 220   ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1025  0001 c65401        	ld	a,21505
1026  0004 a48f          	and	a,#143
1027  0006 c75401        	ld	21505,a
1028                     ; 222   ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1030  0009 c65401        	ld	a,21505
1031  000c 1a01          	or	a,(OFST+1,sp)
1032  000e c75401        	ld	21505,a
1033                     ; 223 }
1036  0011 84            	pop	a
1037  0012 81            	ret	
1084                     ; 233 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1084                     ; 234 {
1085                     .text:	section	.text,new
1086  0000               _ADC1_SchmittTriggerConfig:
1088  0000 89            	pushw	x
1089       00000000      OFST:	set	0
1092                     ; 236   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1094                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1096                     ; 239   if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1098  0001 9e            	ld	a,xh
1099  0002 4c            	inc	a
1100  0003 261d          	jrne	L364
1101                     ; 241     if (NewState != DISABLE)
1103  0005 9f            	ld	a,xl
1104  0006 4d            	tnz	a
1105  0007 270a          	jreq	L564
1106                     ; 243       ADC1->TDRL &= (uint8_t)0x0;
1108  0009 725f5407      	clr	21511
1109                     ; 244       ADC1->TDRH &= (uint8_t)0x0;
1111  000d 725f5406      	clr	21510
1113  0011 2059          	jra	L174
1114  0013               L564:
1115                     ; 248       ADC1->TDRL |= (uint8_t)0xFF;
1117  0013 c65407        	ld	a,21511
1118  0016 aaff          	or	a,#255
1119  0018 c75407        	ld	21511,a
1120                     ; 249       ADC1->TDRH |= (uint8_t)0xFF;
1122  001b c65406        	ld	a,21510
1123  001e aaff          	or	a,#255
1124  0020 2047          	jp	LC001
1125  0022               L364:
1126                     ; 252   else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1128  0022 7b01          	ld	a,(OFST+1,sp)
1129  0024 a108          	cp	a,#8
1130  0026 0d02          	tnz	(OFST+2,sp)
1131  0028 2420          	jruge	L374
1132                     ; 254     if (NewState != DISABLE)
1134  002a 2711          	jreq	L574
1135                     ; 256       ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1137  002c ad40          	call	LC003
1138  002e 2704          	jreq	L43
1139  0030               L63:
1140  0030 48            	sll	a
1141  0031 5a            	decw	x
1142  0032 26fc          	jrne	L63
1143  0034               L43:
1144  0034 43            	cpl	a
1145  0035 c45407        	and	a,21511
1146  0038               LC002:
1147  0038 c75407        	ld	21511,a
1149  003b 202f          	jra	L174
1150  003d               L574:
1151                     ; 260       ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1153  003d ad2f          	call	LC003
1154  003f 2704          	jreq	L04
1155  0041               L24:
1156  0041 48            	sll	a
1157  0042 5a            	decw	x
1158  0043 26fc          	jrne	L24
1159  0045               L04:
1160  0045 ca5407        	or	a,21511
1161  0048 20ee          	jp	LC002
1162  004a               L374:
1163                     ; 265     if (NewState != DISABLE)
1165  004a 2710          	jreq	L305
1166                     ; 267       ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1168  004c a008          	sub	a,#8
1169  004e ad1e          	call	LC003
1170  0050 2704          	jreq	L44
1171  0052               L64:
1172  0052 48            	sll	a
1173  0053 5a            	decw	x
1174  0054 26fc          	jrne	L64
1175  0056               L44:
1176  0056 43            	cpl	a
1177  0057 c45406        	and	a,21510
1179  005a 200d          	jp	LC001
1180  005c               L305:
1181                     ; 271       ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1183  005c a008          	sub	a,#8
1184  005e ad0e          	call	LC003
1185  0060 2704          	jreq	L05
1186  0062               L25:
1187  0062 48            	sll	a
1188  0063 5a            	decw	x
1189  0064 26fc          	jrne	L25
1190  0066               L05:
1191  0066 ca5406        	or	a,21510
1192  0069               LC001:
1193  0069 c75406        	ld	21510,a
1194  006c               L174:
1195                     ; 274 }
1198  006c 85            	popw	x
1199  006d 81            	ret	
1200  006e               LC003:
1201  006e 5f            	clrw	x
1202  006f 97            	ld	xl,a
1203  0070 a601          	ld	a,#1
1204  0072 5d            	tnzw	x
1205  0073 81            	ret	
1262                     ; 286 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1262                     ; 287 {
1263                     .text:	section	.text,new
1264  0000               _ADC1_ConversionConfig:
1266  0000 89            	pushw	x
1267       00000000      OFST:	set	0
1270                     ; 289   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1272                     ; 290   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1274                     ; 291   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1276                     ; 294   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1278  0001 72175402      	bres	21506,#3
1279                     ; 296   ADC1->CR2 |= (uint8_t)(ADC1_Align);
1281  0005 c65402        	ld	a,21506
1282  0008 1a05          	or	a,(OFST+5,sp)
1283  000a c75402        	ld	21506,a
1284                     ; 298   if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1286  000d 9e            	ld	a,xh
1287  000e 4a            	dec	a
1288  000f 2606          	jrne	L535
1289                     ; 301     ADC1->CR1 |= ADC1_CR1_CONT;
1291  0011 72125401      	bset	21505,#1
1293  0015 2004          	jra	L735
1294  0017               L535:
1295                     ; 306     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1297  0017 72135401      	bres	21505,#1
1298  001b               L735:
1299                     ; 310   ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1301  001b c65400        	ld	a,21504
1302  001e a4f0          	and	a,#240
1303  0020 c75400        	ld	21504,a
1304                     ; 312   ADC1->CSR |= (uint8_t)(ADC1_Channel);
1306  0023 c65400        	ld	a,21504
1307  0026 1a02          	or	a,(OFST+2,sp)
1308  0028 c75400        	ld	21504,a
1309                     ; 313 }
1312  002b 85            	popw	x
1313  002c 81            	ret	
1359                     ; 325 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1359                     ; 326 {
1360                     .text:	section	.text,new
1361  0000               _ADC1_ExternalTriggerConfig:
1363  0000 89            	pushw	x
1364       00000000      OFST:	set	0
1367                     ; 328   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1369                     ; 329   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1371                     ; 332   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1373  0001 c65402        	ld	a,21506
1374  0004 a4cf          	and	a,#207
1375  0006 c75402        	ld	21506,a
1376                     ; 334   if (NewState != DISABLE)
1378  0009 9f            	ld	a,xl
1379  000a 4d            	tnz	a
1380  000b 2706          	jreq	L365
1381                     ; 337     ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1383  000d 721c5402      	bset	21506,#6
1385  0011 2004          	jra	L565
1386  0013               L365:
1387                     ; 342     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1389  0013 721d5402      	bres	21506,#6
1390  0017               L565:
1391                     ; 346   ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1393  0017 c65402        	ld	a,21506
1394  001a 1a01          	or	a,(OFST+1,sp)
1395  001c c75402        	ld	21506,a
1396                     ; 347 }
1399  001f 85            	popw	x
1400  0020 81            	ret	
1424                     ; 358 void ADC1_StartConversion(void)
1424                     ; 359 {
1425                     .text:	section	.text,new
1426  0000               _ADC1_StartConversion:
1430                     ; 360   ADC1->CR1 |= ADC1_CR1_ADON;
1432  0000 72105401      	bset	21505,#0
1433                     ; 361 }
1436  0004 81            	ret	
1476                     ; 370 uint16_t ADC1_GetConversionValue(void)
1476                     ; 371 {
1477                     .text:	section	.text,new
1478  0000               _ADC1_GetConversionValue:
1480  0000 5205          	subw	sp,#5
1481       00000005      OFST:	set	5
1484                     ; 372   uint16_t temph = 0;
1486                     ; 373   uint8_t templ = 0;
1488                     ; 375   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1490  0002 720754020e    	btjf	21506,#3,L516
1491                     ; 378     templ = ADC1->DRL;
1493  0007 c65405        	ld	a,21509
1494  000a 6b03          	ld	(OFST-2,sp),a
1496                     ; 380     temph = ADC1->DRH;
1498  000c c65404        	ld	a,21508
1499  000f 97            	ld	xl,a
1501                     ; 382     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1503  0010 7b03          	ld	a,(OFST-2,sp)
1504  0012 02            	rlwa	x,a
1507  0013 201a          	jra	L716
1508  0015               L516:
1509                     ; 387     temph = ADC1->DRH;
1511  0015 c65404        	ld	a,21508
1512  0018 97            	ld	xl,a
1514                     ; 389     templ = ADC1->DRL;
1516  0019 c65405        	ld	a,21509
1517  001c 6b03          	ld	(OFST-2,sp),a
1519                     ; 391     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1521  001e 4f            	clr	a
1522  001f 02            	rlwa	x,a
1523  0020 1f01          	ldw	(OFST-4,sp),x
1525  0022 7b03          	ld	a,(OFST-2,sp)
1526  0024 97            	ld	xl,a
1527  0025 a640          	ld	a,#64
1528  0027 42            	mul	x,a
1529  0028 01            	rrwa	x,a
1530  0029 1a02          	or	a,(OFST-3,sp)
1531  002b 01            	rrwa	x,a
1532  002c 1a01          	or	a,(OFST-4,sp)
1533  002e 01            	rrwa	x,a
1535  002f               L716:
1536                     ; 394   return ((uint16_t)temph);
1540  002f 5b05          	addw	sp,#5
1541  0031 81            	ret	
1587                     ; 405 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1587                     ; 406 {
1588                     .text:	section	.text,new
1589  0000               _ADC1_AWDChannelConfig:
1591  0000 89            	pushw	x
1592       00000000      OFST:	set	0
1595                     ; 408   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1597                     ; 409   assert_param(IS_ADC1_CHANNEL_OK(Channel));
1599                     ; 411   if (Channel < (uint8_t)8)
1601  0001 9e            	ld	a,xh
1602  0002 a108          	cp	a,#8
1603  0004 2425          	jruge	L346
1604                     ; 413     if (NewState != DISABLE)
1606  0006 9f            	ld	a,xl
1607  0007 4d            	tnz	a
1608  0008 270e          	jreq	L546
1609                     ; 415       ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
1611  000a 9e            	ld	a,xh
1612  000b ad48          	call	LC006
1613  000d 2704          	jreq	L66
1614  000f               L07:
1615  000f 48            	sll	a
1616  0010 5a            	decw	x
1617  0011 26fc          	jrne	L07
1618  0013               L66:
1619  0013 ca540f        	or	a,21519
1621  0016 200e          	jp	LC005
1622  0018               L546:
1623                     ; 419       ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
1625  0018 7b01          	ld	a,(OFST+1,sp)
1626  001a ad39          	call	LC006
1627  001c 2704          	jreq	L27
1628  001e               L47:
1629  001e 48            	sll	a
1630  001f 5a            	decw	x
1631  0020 26fc          	jrne	L47
1632  0022               L27:
1633  0022 43            	cpl	a
1634  0023 c4540f        	and	a,21519
1635  0026               LC005:
1636  0026 c7540f        	ld	21519,a
1637  0029 2028          	jra	L156
1638  002b               L346:
1639                     ; 424     if (NewState != DISABLE)
1641  002b 7b02          	ld	a,(OFST+2,sp)
1642  002d 2711          	jreq	L356
1643                     ; 426       ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
1645  002f 7b01          	ld	a,(OFST+1,sp)
1646  0031 a008          	sub	a,#8
1647  0033 ad20          	call	LC006
1648  0035 2704          	jreq	L67
1649  0037               L001:
1650  0037 48            	sll	a
1651  0038 5a            	decw	x
1652  0039 26fc          	jrne	L001
1653  003b               L67:
1654  003b ca540e        	or	a,21518
1656  003e 2010          	jp	LC004
1657  0040               L356:
1658                     ; 430       ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
1660  0040 7b01          	ld	a,(OFST+1,sp)
1661  0042 a008          	sub	a,#8
1662  0044 ad0f          	call	LC006
1663  0046 2704          	jreq	L201
1664  0048               L401:
1665  0048 48            	sll	a
1666  0049 5a            	decw	x
1667  004a 26fc          	jrne	L401
1668  004c               L201:
1669  004c 43            	cpl	a
1670  004d c4540e        	and	a,21518
1671  0050               LC004:
1672  0050 c7540e        	ld	21518,a
1673  0053               L156:
1674                     ; 433 }
1677  0053 85            	popw	x
1678  0054 81            	ret	
1679  0055               LC006:
1680  0055 5f            	clrw	x
1681  0056 97            	ld	xl,a
1682  0057 a601          	ld	a,#1
1683  0059 5d            	tnzw	x
1684  005a 81            	ret	
1717                     ; 441 void ADC1_SetHighThreshold(uint16_t Threshold)
1717                     ; 442 {
1718                     .text:	section	.text,new
1719  0000               _ADC1_SetHighThreshold:
1721  0000 89            	pushw	x
1722       00000000      OFST:	set	0
1725                     ; 443   ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
1727  0001 54            	srlw	x
1728  0002 54            	srlw	x
1729  0003 9f            	ld	a,xl
1730  0004 c75408        	ld	21512,a
1731                     ; 444   ADC1->HTRL = (uint8_t)Threshold;
1733  0007 7b02          	ld	a,(OFST+2,sp)
1734  0009 c75409        	ld	21513,a
1735                     ; 445 }
1738  000c 85            	popw	x
1739  000d 81            	ret	
1772                     ; 453 void ADC1_SetLowThreshold(uint16_t Threshold)
1772                     ; 454 {
1773                     .text:	section	.text,new
1774  0000               _ADC1_SetLowThreshold:
1778                     ; 455   ADC1->LTRL = (uint8_t)Threshold;
1780  0000 9f            	ld	a,xl
1781  0001 c7540b        	ld	21515,a
1782                     ; 456   ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
1784  0004 54            	srlw	x
1785  0005 54            	srlw	x
1786  0006 9f            	ld	a,xl
1787  0007 c7540a        	ld	21514,a
1788                     ; 457 }
1791  000a 81            	ret	
1838                     ; 466 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
1838                     ; 467 {
1839                     .text:	section	.text,new
1840  0000               _ADC1_GetBufferValue:
1842  0000 88            	push	a
1843  0001 5205          	subw	sp,#5
1844       00000005      OFST:	set	5
1847                     ; 468   uint16_t temph = 0;
1849                     ; 469   uint8_t templ = 0;
1851                     ; 472   assert_param(IS_ADC1_BUFFER_OK(Buffer));
1853                     ; 474   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1855  0003 48            	sll	a
1856  0004 5f            	clrw	x
1857  0005 97            	ld	xl,a
1858  0006 7207540213    	btjf	21506,#3,L727
1859                     ; 477     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1861  000b d653e1        	ld	a,(21473,x)
1862  000e 6b03          	ld	(OFST-2,sp),a
1864                     ; 479     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1866  0010 7b06          	ld	a,(OFST+1,sp)
1867  0012 48            	sll	a
1868  0013 5f            	clrw	x
1869  0014 97            	ld	xl,a
1870  0015 d653e0        	ld	a,(21472,x)
1871  0018 97            	ld	xl,a
1873                     ; 481     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1875  0019 7b03          	ld	a,(OFST-2,sp)
1876  001b 02            	rlwa	x,a
1879  001c 2024          	jra	L137
1880  001e               L727:
1881                     ; 486     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1883  001e d653e0        	ld	a,(21472,x)
1884  0021 5f            	clrw	x
1885  0022 97            	ld	xl,a
1886  0023 1f04          	ldw	(OFST-1,sp),x
1888                     ; 488     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1890  0025 7b06          	ld	a,(OFST+1,sp)
1891  0027 48            	sll	a
1892  0028 5f            	clrw	x
1893  0029 97            	ld	xl,a
1894  002a d653e1        	ld	a,(21473,x)
1895  002d 6b03          	ld	(OFST-2,sp),a
1897                     ; 490     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
1899  002f 4f            	clr	a
1900  0030 1e04          	ldw	x,(OFST-1,sp)
1901  0032 02            	rlwa	x,a
1902  0033 1f01          	ldw	(OFST-4,sp),x
1904  0035 7b03          	ld	a,(OFST-2,sp)
1905  0037 97            	ld	xl,a
1906  0038 a640          	ld	a,#64
1907  003a 42            	mul	x,a
1908  003b 01            	rrwa	x,a
1909  003c 1a02          	or	a,(OFST-3,sp)
1910  003e 01            	rrwa	x,a
1911  003f 1a01          	or	a,(OFST-4,sp)
1912  0041 01            	rrwa	x,a
1914  0042               L137:
1915                     ; 493   return ((uint16_t)temph);
1919  0042 5b06          	addw	sp,#6
1920  0044 81            	ret	
1984                     ; 502 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
1984                     ; 503 {
1985                     .text:	section	.text,new
1986  0000               _ADC1_GetAWDChannelStatus:
1988       00000001      OFST:	set	1
1991                     ; 504   uint8_t status = 0;
1993                     ; 507   assert_param(IS_ADC1_CHANNEL_OK(Channel));
1995                     ; 509   if (Channel < (uint8_t)8)
1997  0000 a108          	cp	a,#8
1998  0002 240f          	jruge	L367
1999                     ; 511     status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2001  0004 5f            	clrw	x
2002  0005 97            	ld	xl,a
2003  0006 a601          	ld	a,#1
2004  0008 5d            	tnzw	x
2005  0009 2704          	jreq	L611
2006  000b               L021:
2007  000b 48            	sll	a
2008  000c 5a            	decw	x
2009  000d 26fc          	jrne	L021
2010  000f               L611:
2011  000f c4540d        	and	a,21517
2015  0012 81            	ret	
2016  0013               L367:
2017                     ; 515     status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2019  0013 a008          	sub	a,#8
2020  0015 5f            	clrw	x
2021  0016 97            	ld	xl,a
2022  0017 a601          	ld	a,#1
2023  0019 5d            	tnzw	x
2024  001a 2704          	jreq	L221
2025  001c               L421:
2026  001c 48            	sll	a
2027  001d 5a            	decw	x
2028  001e 26fc          	jrne	L421
2029  0020               L221:
2030  0020 c4540c        	and	a,21516
2032                     ; 518   return ((FlagStatus)status);
2036  0023 81            	ret	
2190                     ; 527 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2190                     ; 528 {
2191                     .text:	section	.text,new
2192  0000               _ADC1_GetFlagStatus:
2194  0000 88            	push	a
2195  0001 88            	push	a
2196       00000001      OFST:	set	1
2199                     ; 529   uint8_t flagstatus = 0;
2201                     ; 530   uint8_t temp = 0;
2203                     ; 533   assert_param(IS_ADC1_FLAG_OK(Flag));
2205                     ; 535   if ((Flag & 0x0F) == 0x01)
2207  0002 a40f          	and	a,#15
2208  0004 4a            	dec	a
2209  0005 2607          	jrne	L1501
2210                     ; 538     flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2212  0007 c65403        	ld	a,21507
2213  000a a440          	and	a,#64
2216  000c 2039          	jra	L3501
2217  000e               L1501:
2218                     ; 540   else if ((Flag & 0xF0) == 0x10)
2220  000e 7b02          	ld	a,(OFST+1,sp)
2221  0010 a4f0          	and	a,#240
2222  0012 a110          	cp	a,#16
2223  0014 262c          	jrne	L5501
2224                     ; 543     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2226  0016 7b02          	ld	a,(OFST+1,sp)
2227  0018 a40f          	and	a,#15
2228  001a 6b01          	ld	(OFST+0,sp),a
2230                     ; 544     if (temp < 8)
2232  001c a108          	cp	a,#8
2233  001e 2410          	jruge	L7501
2234                     ; 546       flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2236  0020 5f            	clrw	x
2237  0021 97            	ld	xl,a
2238  0022 a601          	ld	a,#1
2239  0024 5d            	tnzw	x
2240  0025 2704          	jreq	L031
2241  0027               L231:
2242  0027 48            	sll	a
2243  0028 5a            	decw	x
2244  0029 26fc          	jrne	L231
2245  002b               L031:
2246  002b c4540d        	and	a,21517
2249  002e 2017          	jra	L3501
2250  0030               L7501:
2251                     ; 550       flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2253  0030 a008          	sub	a,#8
2254  0032 5f            	clrw	x
2255  0033 97            	ld	xl,a
2256  0034 a601          	ld	a,#1
2257  0036 5d            	tnzw	x
2258  0037 2704          	jreq	L431
2259  0039               L631:
2260  0039 48            	sll	a
2261  003a 5a            	decw	x
2262  003b 26fc          	jrne	L631
2263  003d               L431:
2264  003d c4540c        	and	a,21516
2266  0040 2005          	jra	L3501
2267  0042               L5501:
2268                     ; 555     flagstatus = (uint8_t)(ADC1->CSR & Flag);
2270  0042 c65400        	ld	a,21504
2271  0045 1402          	and	a,(OFST+1,sp)
2273  0047               L3501:
2274                     ; 557   return ((FlagStatus)flagstatus);
2278  0047 85            	popw	x
2279  0048 81            	ret	
2321                     ; 567 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2321                     ; 568 {
2322                     .text:	section	.text,new
2323  0000               _ADC1_ClearFlag:
2325  0000 88            	push	a
2326  0001 88            	push	a
2327       00000001      OFST:	set	1
2330                     ; 569   uint8_t temp = 0;
2332                     ; 572   assert_param(IS_ADC1_FLAG_OK(Flag));
2334                     ; 574   if ((Flag & 0x0F) == 0x01)
2336  0002 a40f          	and	a,#15
2337  0004 4a            	dec	a
2338  0005 2606          	jrne	L5011
2339                     ; 577     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
2341  0007 721d5403      	bres	21507,#6
2343  000b 2045          	jra	L7011
2344  000d               L5011:
2345                     ; 579   else if ((Flag & 0xF0) == 0x10)
2347  000d 7b02          	ld	a,(OFST+1,sp)
2348  000f a4f0          	and	a,#240
2349  0011 a110          	cp	a,#16
2350  0013 2634          	jrne	L1111
2351                     ; 582     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2353  0015 7b02          	ld	a,(OFST+1,sp)
2354  0017 a40f          	and	a,#15
2355  0019 6b01          	ld	(OFST+0,sp),a
2357                     ; 583     if (temp < 8)
2359  001b a108          	cp	a,#8
2360  001d 2414          	jruge	L3111
2361                     ; 585       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2363  001f 5f            	clrw	x
2364  0020 97            	ld	xl,a
2365  0021 a601          	ld	a,#1
2366  0023 5d            	tnzw	x
2367  0024 2704          	jreq	L241
2368  0026               L441:
2369  0026 48            	sll	a
2370  0027 5a            	decw	x
2371  0028 26fc          	jrne	L441
2372  002a               L241:
2373  002a 43            	cpl	a
2374  002b c4540d        	and	a,21517
2375  002e c7540d        	ld	21517,a
2377  0031 201f          	jra	L7011
2378  0033               L3111:
2379                     ; 589       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2381  0033 a008          	sub	a,#8
2382  0035 5f            	clrw	x
2383  0036 97            	ld	xl,a
2384  0037 a601          	ld	a,#1
2385  0039 5d            	tnzw	x
2386  003a 2704          	jreq	L641
2387  003c               L051:
2388  003c 48            	sll	a
2389  003d 5a            	decw	x
2390  003e 26fc          	jrne	L051
2391  0040               L641:
2392  0040 43            	cpl	a
2393  0041 c4540c        	and	a,21516
2394  0044 c7540c        	ld	21516,a
2395  0047 2009          	jra	L7011
2396  0049               L1111:
2397                     ; 594     ADC1->CSR &= (uint8_t) (~Flag);
2399  0049 7b02          	ld	a,(OFST+1,sp)
2400  004b 43            	cpl	a
2401  004c c45400        	and	a,21504
2402  004f c75400        	ld	21504,a
2403  0052               L7011:
2404                     ; 596 }
2407  0052 85            	popw	x
2408  0053 81            	ret	
2461                     ; 616 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2461                     ; 617 {
2462                     .text:	section	.text,new
2463  0000               _ADC1_GetITStatus:
2465  0000 89            	pushw	x
2466  0001 88            	push	a
2467       00000001      OFST:	set	1
2470                     ; 618   ITStatus itstatus = RESET;
2472                     ; 619   uint8_t temp = 0;
2474                     ; 622   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2476                     ; 624   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2478  0002 01            	rrwa	x,a
2479  0003 a4f0          	and	a,#240
2480  0005 5f            	clrw	x
2481  0006 02            	rlwa	x,a
2482  0007 a30010        	cpw	x,#16
2483  000a 262c          	jrne	L5411
2484                     ; 627     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2486  000c 7b03          	ld	a,(OFST+2,sp)
2487  000e a40f          	and	a,#15
2488  0010 6b01          	ld	(OFST+0,sp),a
2490                     ; 628     if (temp < 8)
2492  0012 a108          	cp	a,#8
2493  0014 2410          	jruge	L7411
2494                     ; 630       itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2496  0016 5f            	clrw	x
2497  0017 97            	ld	xl,a
2498  0018 a601          	ld	a,#1
2499  001a 5d            	tnzw	x
2500  001b 2704          	jreq	L451
2501  001d               L651:
2502  001d 48            	sll	a
2503  001e 5a            	decw	x
2504  001f 26fc          	jrne	L651
2505  0021               L451:
2506  0021 c4540d        	and	a,21517
2509  0024 2017          	jra	L3511
2510  0026               L7411:
2511                     ; 634       itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2513  0026 a008          	sub	a,#8
2514  0028 5f            	clrw	x
2515  0029 97            	ld	xl,a
2516  002a a601          	ld	a,#1
2517  002c 5d            	tnzw	x
2518  002d 2704          	jreq	L061
2519  002f               L261:
2520  002f 48            	sll	a
2521  0030 5a            	decw	x
2522  0031 26fc          	jrne	L261
2523  0033               L061:
2524  0033 c4540c        	and	a,21516
2526  0036 2005          	jra	L3511
2527  0038               L5411:
2528                     ; 639     itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
2530  0038 c65400        	ld	a,21504
2531  003b 1403          	and	a,(OFST+2,sp)
2533  003d               L3511:
2534                     ; 641   return ((ITStatus)itstatus);
2538  003d 5b03          	addw	sp,#3
2539  003f 81            	ret	
2582                     ; 662 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
2582                     ; 663 {
2583                     .text:	section	.text,new
2584  0000               _ADC1_ClearITPendingBit:
2586  0000 89            	pushw	x
2587  0001 88            	push	a
2588       00000001      OFST:	set	1
2591                     ; 664   uint8_t temp = 0;
2593                     ; 667   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2595                     ; 669   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2597  0002 01            	rrwa	x,a
2598  0003 a4f0          	and	a,#240
2599  0005 5f            	clrw	x
2600  0006 02            	rlwa	x,a
2601  0007 a30010        	cpw	x,#16
2602  000a 2634          	jrne	L5711
2603                     ; 672     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2605  000c 7b03          	ld	a,(OFST+2,sp)
2606  000e a40f          	and	a,#15
2607  0010 6b01          	ld	(OFST+0,sp),a
2609                     ; 673     if (temp < 8)
2611  0012 a108          	cp	a,#8
2612  0014 2414          	jruge	L7711
2613                     ; 675       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2615  0016 5f            	clrw	x
2616  0017 97            	ld	xl,a
2617  0018 a601          	ld	a,#1
2618  001a 5d            	tnzw	x
2619  001b 2704          	jreq	L661
2620  001d               L071:
2621  001d 48            	sll	a
2622  001e 5a            	decw	x
2623  001f 26fc          	jrne	L071
2624  0021               L661:
2625  0021 43            	cpl	a
2626  0022 c4540d        	and	a,21517
2627  0025 c7540d        	ld	21517,a
2629  0028 201f          	jra	L3021
2630  002a               L7711:
2631                     ; 679       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2633  002a a008          	sub	a,#8
2634  002c 5f            	clrw	x
2635  002d 97            	ld	xl,a
2636  002e a601          	ld	a,#1
2637  0030 5d            	tnzw	x
2638  0031 2704          	jreq	L271
2639  0033               L471:
2640  0033 48            	sll	a
2641  0034 5a            	decw	x
2642  0035 26fc          	jrne	L471
2643  0037               L271:
2644  0037 43            	cpl	a
2645  0038 c4540c        	and	a,21516
2646  003b c7540c        	ld	21516,a
2647  003e 2009          	jra	L3021
2648  0040               L5711:
2649                     ; 684     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
2651  0040 7b03          	ld	a,(OFST+2,sp)
2652  0042 43            	cpl	a
2653  0043 c45400        	and	a,21504
2654  0046 c75400        	ld	21504,a
2655  0049               L3021:
2656                     ; 686 }
2659  0049 5b03          	addw	sp,#3
2660  004b 81            	ret	
2673                     	xdef	_ADC1_ClearITPendingBit
2674                     	xdef	_ADC1_GetITStatus
2675                     	xdef	_ADC1_ClearFlag
2676                     	xdef	_ADC1_GetFlagStatus
2677                     	xdef	_ADC1_GetAWDChannelStatus
2678                     	xdef	_ADC1_GetBufferValue
2679                     	xdef	_ADC1_SetLowThreshold
2680                     	xdef	_ADC1_SetHighThreshold
2681                     	xdef	_ADC1_GetConversionValue
2682                     	xdef	_ADC1_StartConversion
2683                     	xdef	_ADC1_AWDChannelConfig
2684                     	xdef	_ADC1_ExternalTriggerConfig
2685                     	xdef	_ADC1_ConversionConfig
2686                     	xdef	_ADC1_SchmittTriggerConfig
2687                     	xdef	_ADC1_PrescalerConfig
2688                     	xdef	_ADC1_ITConfig
2689                     	xdef	_ADC1_DataBufferCmd
2690                     	xdef	_ADC1_ScanModeCmd
2691                     	xdef	_ADC1_Cmd
2692                     	xdef	_ADC1_Init
2693                     	xdef	_ADC1_DeInit
2712                     	end
