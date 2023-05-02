   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.8 - 08 Nov 2022
   3                     ; Generator (Limited) V4.5.5 - 08 Nov 2022
   4                     ; Optimizer V4.5.5 - 08 Nov 2022
  49                     ; 50 void SPI_DeInit(void)
  49                     ; 51 {
  51                     .text:	section	.text,new
  52  0000               _SPI_DeInit:
  56                     ; 52   SPI->CR1    = SPI_CR1_RESET_VALUE;
  58  0000 725f5200      	clr	20992
  59                     ; 53   SPI->CR2    = SPI_CR2_RESET_VALUE;
  61  0004 725f5201      	clr	20993
  62                     ; 54   SPI->ICR    = SPI_ICR_RESET_VALUE;
  64  0008 725f5202      	clr	20994
  65                     ; 55   SPI->SR     = SPI_SR_RESET_VALUE;
  67  000c 35025203      	mov	20995,#2
  68                     ; 56   SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  70  0010 35075205      	mov	20997,#7
  71                     ; 57 }
  74  0014 81            	ret	
 388                     ; 78 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
 388                     ; 79 {
 389                     .text:	section	.text,new
 390  0000               _SPI_Init:
 392  0000 89            	pushw	x
 393  0001 88            	push	a
 394       00000001      OFST:	set	1
 397                     ; 81   assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
 399                     ; 82   assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
 401                     ; 83   assert_param(IS_SPI_MODE_OK(Mode));
 403                     ; 84   assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
 405                     ; 85   assert_param(IS_SPI_PHASE_OK(ClockPhase));
 407                     ; 86   assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
 409                     ; 87   assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
 411                     ; 88   assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
 413                     ; 91   SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 413                     ; 92                        (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 415  0002 7b07          	ld	a,(OFST+6,sp)
 416  0004 1a08          	or	a,(OFST+7,sp)
 417  0006 6b01          	ld	(OFST+0,sp),a
 419  0008 9f            	ld	a,xl
 420  0009 1a02          	or	a,(OFST+1,sp)
 421  000b 1a01          	or	a,(OFST+0,sp)
 422  000d c75200        	ld	20992,a
 423                     ; 95   SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 425  0010 7b09          	ld	a,(OFST+8,sp)
 426  0012 1a0a          	or	a,(OFST+9,sp)
 427  0014 c75201        	ld	20993,a
 428                     ; 97   if (Mode == SPI_MODE_MASTER)
 430  0017 7b06          	ld	a,(OFST+5,sp)
 431  0019 a104          	cp	a,#4
 432  001b 2606          	jrne	L102
 433                     ; 99     SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 435  001d 72105201      	bset	20993,#0
 437  0021 2004          	jra	L302
 438  0023               L102:
 439                     ; 103     SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 441  0023 72115201      	bres	20993,#0
 442  0027               L302:
 443                     ; 107   SPI->CR1 |= (uint8_t)(Mode);
 445  0027 c65200        	ld	a,20992
 446  002a 1a06          	or	a,(OFST+5,sp)
 447  002c c75200        	ld	20992,a
 448                     ; 110   SPI->CRCPR = (uint8_t)CRCPolynomial;
 450  002f 7b0b          	ld	a,(OFST+10,sp)
 451  0031 c75205        	ld	20997,a
 452                     ; 111 }
 455  0034 5b03          	addw	sp,#3
 456  0036 81            	ret	
 511                     ; 119 void SPI_Cmd(FunctionalState NewState)
 511                     ; 120 {
 512                     .text:	section	.text,new
 513  0000               _SPI_Cmd:
 517                     ; 122   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 519                     ; 124   if (NewState != DISABLE)
 521  0000 4d            	tnz	a
 522  0001 2705          	jreq	L332
 523                     ; 126     SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 525  0003 721c5200      	bset	20992,#6
 528  0007 81            	ret	
 529  0008               L332:
 530                     ; 130     SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 532  0008 721d5200      	bres	20992,#6
 533                     ; 132 }
 536  000c 81            	ret	
 643                     ; 141 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 643                     ; 142 {
 644                     .text:	section	.text,new
 645  0000               _SPI_ITConfig:
 647  0000 89            	pushw	x
 648  0001 88            	push	a
 649       00000001      OFST:	set	1
 652                     ; 143   uint8_t itpos = 0;
 654                     ; 145   assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 656                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 658                     ; 149   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 660  0002 9e            	ld	a,xh
 661  0003 a40f          	and	a,#15
 662  0005 5f            	clrw	x
 663  0006 97            	ld	xl,a
 664  0007 a601          	ld	a,#1
 665  0009 5d            	tnzw	x
 666  000a 2704          	jreq	L41
 667  000c               L61:
 668  000c 48            	sll	a
 669  000d 5a            	decw	x
 670  000e 26fc          	jrne	L61
 671  0010               L41:
 672  0010 6b01          	ld	(OFST+0,sp),a
 674                     ; 151   if (NewState != DISABLE)
 676  0012 0d03          	tnz	(OFST+2,sp)
 677  0014 2707          	jreq	L503
 678                     ; 153     SPI->ICR |= itpos; /* Enable interrupt*/
 680  0016 c65202        	ld	a,20994
 681  0019 1a01          	or	a,(OFST+0,sp)
 683  001b 2004          	jra	L703
 684  001d               L503:
 685                     ; 157     SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 687  001d 43            	cpl	a
 688  001e c45202        	and	a,20994
 689  0021               L703:
 690  0021 c75202        	ld	20994,a
 691                     ; 159 }
 694  0024 5b03          	addw	sp,#3
 695  0026 81            	ret	
 727                     ; 166 void SPI_SendData(uint8_t Data)
 727                     ; 167 {
 728                     .text:	section	.text,new
 729  0000               _SPI_SendData:
 733                     ; 168   SPI->DR = Data; /* Write in the DR register the data to be sent*/
 735  0000 c75204        	ld	20996,a
 736                     ; 169 }
 739  0003 81            	ret	
 762                     ; 176 uint8_t SPI_ReceiveData(void)
 762                     ; 177 {
 763                     .text:	section	.text,new
 764  0000               _SPI_ReceiveData:
 768                     ; 178   return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
 770  0000 c65204        	ld	a,20996
 773  0003 81            	ret	
 809                     ; 187 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 809                     ; 188 {
 810                     .text:	section	.text,new
 811  0000               _SPI_NSSInternalSoftwareCmd:
 815                     ; 190   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 817                     ; 192   if (NewState != DISABLE)
 819  0000 4d            	tnz	a
 820  0001 2705          	jreq	L353
 821                     ; 194     SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 823  0003 72105201      	bset	20993,#0
 826  0007 81            	ret	
 827  0008               L353:
 828                     ; 198     SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 830  0008 72115201      	bres	20993,#0
 831                     ; 200 }
 834  000c 81            	ret	
 857                     ; 207 void SPI_TransmitCRC(void)
 857                     ; 208 {
 858                     .text:	section	.text,new
 859  0000               _SPI_TransmitCRC:
 863                     ; 209   SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 865  0000 72185201      	bset	20993,#4
 866                     ; 210 }
 869  0004 81            	ret	
 905                     ; 218 void SPI_CalculateCRCCmd(FunctionalState NewState)
 905                     ; 219 {
 906                     .text:	section	.text,new
 907  0000               _SPI_CalculateCRCCmd:
 911                     ; 221   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 913                     ; 223   if (NewState != DISABLE)
 915  0000 4d            	tnz	a
 916  0001 2705          	jreq	L504
 917                     ; 225     SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
 919  0003 721a5201      	bset	20993,#5
 922  0007 81            	ret	
 923  0008               L504:
 924                     ; 229     SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
 926  0008 721b5201      	bres	20993,#5
 927                     ; 231 }
 930  000c 81            	ret	
 992                     ; 238 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
 992                     ; 239 {
 993                     .text:	section	.text,new
 994  0000               _SPI_GetCRC:
 996       00000001      OFST:	set	1
 999                     ; 240   uint8_t crcreg = 0;
1001                     ; 243   assert_param(IS_SPI_CRC_OK(SPI_CRC));
1003                     ; 245   if (SPI_CRC != SPI_CRC_RX)
1005  0000 4d            	tnz	a
1006  0001 2704          	jreq	L144
1007                     ; 247     crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
1009  0003 c65207        	ld	a,20999
1013  0006 81            	ret	
1014  0007               L144:
1015                     ; 251     crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
1017  0007 c65206        	ld	a,20998
1019                     ; 255   return crcreg;
1023  000a 81            	ret	
1048                     ; 263 void SPI_ResetCRC(void)
1048                     ; 264 {
1049                     .text:	section	.text,new
1050  0000               _SPI_ResetCRC:
1054                     ; 267   SPI_CalculateCRCCmd(ENABLE);
1056  0000 a601          	ld	a,#1
1057  0002 cd0000        	call	_SPI_CalculateCRCCmd
1059                     ; 270   SPI_Cmd(ENABLE);
1061  0005 a601          	ld	a,#1
1063                     ; 271 }
1066  0007 cc0000        	jp	_SPI_Cmd
1090                     ; 278 uint8_t SPI_GetCRCPolynomial(void)
1090                     ; 279 {
1091                     .text:	section	.text,new
1092  0000               _SPI_GetCRCPolynomial:
1096                     ; 280   return SPI->CRCPR; /* Return the CRC polynomial register */
1098  0000 c65205        	ld	a,20997
1101  0003 81            	ret	
1157                     ; 288 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1157                     ; 289 {
1158                     .text:	section	.text,new
1159  0000               _SPI_BiDirectionalLineConfig:
1163                     ; 291   assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
1165                     ; 293   if (SPI_Direction != SPI_DIRECTION_RX)
1167  0000 4d            	tnz	a
1168  0001 2705          	jreq	L315
1169                     ; 295     SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1171  0003 721c5201      	bset	20993,#6
1174  0007 81            	ret	
1175  0008               L315:
1176                     ; 299     SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1178  0008 721d5201      	bres	20993,#6
1179                     ; 301 }
1182  000c 81            	ret	
1303                     ; 311 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1303                     ; 312 {
1304                     .text:	section	.text,new
1305  0000               _SPI_GetFlagStatus:
1307       00000001      OFST:	set	1
1310                     ; 313   FlagStatus status = RESET;
1312                     ; 315   assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
1314                     ; 318   if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1316  0000 c45203        	and	a,20995
1317  0003 2702          	jreq	L375
1318                     ; 320     status = SET; /* SPI_FLAG is set */
1320  0005 a601          	ld	a,#1
1323  0007               L375:
1324                     ; 324     status = RESET; /* SPI_FLAG is reset*/
1327                     ; 328   return status;
1331  0007 81            	ret	
1366                     ; 346 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1366                     ; 347 {
1367                     .text:	section	.text,new
1368  0000               _SPI_ClearFlag:
1372                     ; 348   assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
1374                     ; 350   SPI->SR = (uint8_t)(~SPI_FLAG);
1376  0000 43            	cpl	a
1377  0001 c75203        	ld	20995,a
1378                     ; 351 }
1381  0004 81            	ret	
1455                     ; 366 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1455                     ; 367 {
1456                     .text:	section	.text,new
1457  0000               _SPI_GetITStatus:
1459  0000 88            	push	a
1460  0001 89            	pushw	x
1461       00000002      OFST:	set	2
1464                     ; 368   ITStatus pendingbitstatus = RESET;
1466                     ; 369   uint8_t itpos = 0;
1468                     ; 370   uint8_t itmask1 = 0;
1470                     ; 371   uint8_t itmask2 = 0;
1472                     ; 372   uint8_t enablestatus = 0;
1474                     ; 373   assert_param(IS_SPI_GET_IT_OK(SPI_IT));
1476                     ; 375   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1478  0002 a40f          	and	a,#15
1479  0004 5f            	clrw	x
1480  0005 97            	ld	xl,a
1481  0006 a601          	ld	a,#1
1482  0008 5d            	tnzw	x
1483  0009 2704          	jreq	L45
1484  000b               L65:
1485  000b 48            	sll	a
1486  000c 5a            	decw	x
1487  000d 26fc          	jrne	L65
1488  000f               L45:
1489  000f 6b01          	ld	(OFST-1,sp),a
1491                     ; 378   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1493  0011 7b03          	ld	a,(OFST+1,sp)
1494  0013 4e            	swap	a
1495  0014 a40f          	and	a,#15
1496  0016 6b02          	ld	(OFST+0,sp),a
1498                     ; 380   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1500  0018 5f            	clrw	x
1501  0019 97            	ld	xl,a
1502  001a a601          	ld	a,#1
1503  001c 5d            	tnzw	x
1504  001d 2704          	jreq	L06
1505  001f               L26:
1506  001f 48            	sll	a
1507  0020 5a            	decw	x
1508  0021 26fc          	jrne	L26
1509  0023               L06:
1511                     ; 382   enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1513  0023 c45203        	and	a,20995
1514  0026 6b02          	ld	(OFST+0,sp),a
1516                     ; 384   if (((SPI->ICR & itpos) != RESET) && enablestatus)
1518  0028 c65202        	ld	a,20994
1519  002b 1501          	bcp	a,(OFST-1,sp)
1520  002d 2708          	jreq	L746
1522  002f 7b02          	ld	a,(OFST+0,sp)
1523  0031 2704          	jreq	L746
1524                     ; 387     pendingbitstatus = SET;
1526  0033 a601          	ld	a,#1
1529  0035 2001          	jra	L156
1530  0037               L746:
1531                     ; 392     pendingbitstatus = RESET;
1533  0037 4f            	clr	a
1535  0038               L156:
1536                     ; 395   return  pendingbitstatus;
1540  0038 5b03          	addw	sp,#3
1541  003a 81            	ret	
1584                     ; 412 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
1584                     ; 413 {
1585                     .text:	section	.text,new
1586  0000               _SPI_ClearITPendingBit:
1588       00000001      OFST:	set	1
1591                     ; 414   uint8_t itpos = 0;
1593                     ; 415   assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
1595                     ; 420   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
1597  0000 4e            	swap	a
1598  0001 a40f          	and	a,#15
1599  0003 5f            	clrw	x
1600  0004 97            	ld	xl,a
1601  0005 a601          	ld	a,#1
1602  0007 5d            	tnzw	x
1603  0008 2704          	jreq	L66
1604  000a               L07:
1605  000a 48            	sll	a
1606  000b 5a            	decw	x
1607  000c 26fc          	jrne	L07
1608  000e               L66:
1610                     ; 422   SPI->SR = (uint8_t)(~itpos);
1612  000e 43            	cpl	a
1613  000f c75203        	ld	20995,a
1614                     ; 424 }
1617  0012 81            	ret	
1630                     	xdef	_SPI_ClearITPendingBit
1631                     	xdef	_SPI_GetITStatus
1632                     	xdef	_SPI_ClearFlag
1633                     	xdef	_SPI_GetFlagStatus
1634                     	xdef	_SPI_BiDirectionalLineConfig
1635                     	xdef	_SPI_GetCRCPolynomial
1636                     	xdef	_SPI_ResetCRC
1637                     	xdef	_SPI_GetCRC
1638                     	xdef	_SPI_CalculateCRCCmd
1639                     	xdef	_SPI_TransmitCRC
1640                     	xdef	_SPI_NSSInternalSoftwareCmd
1641                     	xdef	_SPI_ReceiveData
1642                     	xdef	_SPI_SendData
1643                     	xdef	_SPI_ITConfig
1644                     	xdef	_SPI_Cmd
1645                     	xdef	_SPI_Init
1646                     	xdef	_SPI_DeInit
1665                     	end
