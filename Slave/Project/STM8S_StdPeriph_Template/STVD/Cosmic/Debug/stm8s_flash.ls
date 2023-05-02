   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.8 - 08 Nov 2022
   3                     ; Generator (Limited) V4.5.5 - 08 Nov 2022
   4                     ; Optimizer V4.5.5 - 08 Nov 2022
  81                     ; 87 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  81                     ; 88 {
  83                     .text:	section	.text,new
  84  0000               _FLASH_Unlock:
  88                     ; 90   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  90                     ; 93   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
  92  0000 a1fd          	cp	a,#253
  93  0002 2609          	jrne	L73
  94                     ; 95     FLASH->PUKR = FLASH_RASS_KEY1;
  96  0004 35565062      	mov	20578,#86
  97                     ; 96     FLASH->PUKR = FLASH_RASS_KEY2;
  99  0008 35ae5062      	mov	20578,#174
 102  000c 81            	ret	
 103  000d               L73:
 104                     ; 101     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 106  000d 35ae5064      	mov	20580,#174
 107                     ; 102     FLASH->DUKR = FLASH_RASS_KEY1;
 109  0011 35565064      	mov	20580,#86
 110                     ; 104 }
 113  0015 81            	ret	
 148                     ; 112 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 148                     ; 113 {
 149                     .text:	section	.text,new
 150  0000               _FLASH_Lock:
 154                     ; 115   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 156                     ; 118   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 158  0000 c4505f        	and	a,20575
 159  0003 c7505f        	ld	20575,a
 160                     ; 119 }
 163  0006 81            	ret	
 186                     ; 126 void FLASH_DeInit(void)
 186                     ; 127 {
 187                     .text:	section	.text,new
 188  0000               _FLASH_DeInit:
 192                     ; 128   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 194  0000 725f505a      	clr	20570
 195                     ; 129   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 197  0004 725f505b      	clr	20571
 198                     ; 130   FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 200  0008 35ff505c      	mov	20572,#255
 201                     ; 131   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 203  000c 7217505f      	bres	20575,#3
 204                     ; 132   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 206  0010 7213505f      	bres	20575,#1
 207                     ; 133   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 209  0014 c6505f        	ld	a,20575
 210                     ; 134 }
 213  0017 81            	ret	
 268                     ; 142 void FLASH_ITConfig(FunctionalState NewState)
 268                     ; 143 {
 269                     .text:	section	.text,new
 270  0000               _FLASH_ITConfig:
 274                     ; 145   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 276                     ; 147   if(NewState != DISABLE)
 278  0000 4d            	tnz	a
 279  0001 2705          	jreq	L711
 280                     ; 149     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 282  0003 7212505a      	bset	20570,#1
 285  0007 81            	ret	
 286  0008               L711:
 287                     ; 153     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 289  0008 7213505a      	bres	20570,#1
 290                     ; 155 }
 293  000c 81            	ret	
 325                     ; 164 void FLASH_EraseByte(uint32_t Address)
 325                     ; 165 {
 326                     .text:	section	.text,new
 327  0000               _FLASH_EraseByte:
 329       00000000      OFST:	set	0
 332                     ; 167   assert_param(IS_FLASH_ADDRESS_OK(Address));
 334                     ; 170   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; 
 336  0000 1e05          	ldw	x,(OFST+5,sp)
 337  0002 7f            	clr	(x)
 338                     ; 171 }
 341  0003 81            	ret	
 380                     ; 181 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 380                     ; 182 {
 381                     .text:	section	.text,new
 382  0000               _FLASH_ProgramByte:
 384       00000000      OFST:	set	0
 387                     ; 184   assert_param(IS_FLASH_ADDRESS_OK(Address));
 389                     ; 185   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 391  0000 1e05          	ldw	x,(OFST+5,sp)
 392  0002 7b07          	ld	a,(OFST+7,sp)
 393  0004 f7            	ld	(x),a
 394                     ; 186 }
 397  0005 81            	ret	
 429                     ; 195 uint8_t FLASH_ReadByte(uint32_t Address)
 429                     ; 196 {
 430                     .text:	section	.text,new
 431  0000               _FLASH_ReadByte:
 433       00000000      OFST:	set	0
 436                     ; 198   assert_param(IS_FLASH_ADDRESS_OK(Address));
 438                     ; 201   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
 440  0000 1e05          	ldw	x,(OFST+5,sp)
 441  0002 f6            	ld	a,(x)
 444  0003 81            	ret	
 483                     ; 212 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 483                     ; 213 {
 484                     .text:	section	.text,new
 485  0000               _FLASH_ProgramWord:
 487       00000000      OFST:	set	0
 490                     ; 215   assert_param(IS_FLASH_ADDRESS_OK(Address));
 492                     ; 218   FLASH->CR2 |= FLASH_CR2_WPRG;
 494  0000 721c505b      	bset	20571,#6
 495                     ; 219   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 497  0004 721d505c      	bres	20572,#6
 498                     ; 222   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
 500  0008 1e05          	ldw	x,(OFST+5,sp)
 501  000a 7b07          	ld	a,(OFST+7,sp)
 502  000c f7            	ld	(x),a
 503                     ; 224   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
 505  000d 7b08          	ld	a,(OFST+8,sp)
 506  000f e701          	ld	(1,x),a
 507                     ; 226   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
 509  0011 7b09          	ld	a,(OFST+9,sp)
 510  0013 e702          	ld	(2,x),a
 511                     ; 228   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
 513  0015 7b0a          	ld	a,(OFST+10,sp)
 514  0017 e703          	ld	(3,x),a
 515                     ; 229 }
 518  0019 81            	ret	
 559                     ; 237 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 559                     ; 238 {
 560                     .text:	section	.text,new
 561  0000               _FLASH_ProgramOptionByte:
 563  0000 89            	pushw	x
 564       00000000      OFST:	set	0
 567                     ; 240   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 569                     ; 243   FLASH->CR2 |= FLASH_CR2_OPT;
 571  0001 721e505b      	bset	20571,#7
 572                     ; 244   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 574  0005 721f505c      	bres	20572,#7
 575                     ; 247   if(Address == 0x4800)
 577  0009 a34800        	cpw	x,#18432
 578  000c 2605          	jrne	L522
 579                     ; 250     *((NEAR uint8_t*)Address) = Data;
 581  000e 7b05          	ld	a,(OFST+5,sp)
 582  0010 f7            	ld	(x),a
 584  0011 2006          	jra	L722
 585  0013               L522:
 586                     ; 255     *((NEAR uint8_t*)Address) = Data;
 588  0013 7b05          	ld	a,(OFST+5,sp)
 589  0015 f7            	ld	(x),a
 590                     ; 256     *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 592  0016 43            	cpl	a
 593  0017 e701          	ld	(1,x),a
 594  0019               L722:
 595                     ; 258   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 597  0019 a6fd          	ld	a,#253
 598  001b cd0000        	call	_FLASH_WaitForLastOperation
 600                     ; 261   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 602  001e 721f505b      	bres	20571,#7
 603                     ; 262   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 605  0022 721e505c      	bset	20572,#7
 606                     ; 263 }
 609  0026 85            	popw	x
 610  0027 81            	ret	
 644                     ; 270 void FLASH_EraseOptionByte(uint16_t Address)
 644                     ; 271 {
 645                     .text:	section	.text,new
 646  0000               _FLASH_EraseOptionByte:
 648  0000 89            	pushw	x
 649       00000000      OFST:	set	0
 652                     ; 273   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 654                     ; 276   FLASH->CR2 |= FLASH_CR2_OPT;
 656  0001 721e505b      	bset	20571,#7
 657                     ; 277   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 659  0005 721f505c      	bres	20572,#7
 660                     ; 280   if(Address == 0x4800)
 662  0009 a34800        	cpw	x,#18432
 663  000c 2603          	jrne	L542
 664                     ; 283     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 666  000e 7f            	clr	(x)
 668  000f 2005          	jra	L742
 669  0011               L542:
 670                     ; 288     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 672  0011 7f            	clr	(x)
 673                     ; 289     *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 675  0012 a6ff          	ld	a,#255
 676  0014 e701          	ld	(1,x),a
 677  0016               L742:
 678                     ; 291   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 680  0016 a6fd          	ld	a,#253
 681  0018 cd0000        	call	_FLASH_WaitForLastOperation
 683                     ; 294   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 685  001b 721f505b      	bres	20571,#7
 686                     ; 295   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 688  001f 721e505c      	bset	20572,#7
 689                     ; 296 }
 692  0023 85            	popw	x
 693  0024 81            	ret	
 748                     ; 303 uint16_t FLASH_ReadOptionByte(uint16_t Address)
 748                     ; 304 {
 749                     .text:	section	.text,new
 750  0000               _FLASH_ReadOptionByte:
 752  0000 5204          	subw	sp,#4
 753       00000004      OFST:	set	4
 756                     ; 305   uint8_t value_optbyte, value_optbyte_complement = 0;
 758                     ; 306   uint16_t res_value = 0;
 760                     ; 309   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 762                     ; 311   value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
 764  0002 f6            	ld	a,(x)
 765  0003 6b01          	ld	(OFST-3,sp),a
 767                     ; 312   value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
 769  0005 e601          	ld	a,(1,x)
 770  0007 6b02          	ld	(OFST-2,sp),a
 772                     ; 315   if(Address == 0x4800)	 
 774  0009 a34800        	cpw	x,#18432
 775  000c 2606          	jrne	L372
 776                     ; 317     res_value =	 value_optbyte;
 778  000e 7b01          	ld	a,(OFST-3,sp)
 779  0010 5f            	clrw	x
 780  0011 97            	ld	xl,a
 783  0012 201c          	jra	L572
 784  0014               L372:
 785                     ; 321     if(value_optbyte == (uint8_t)(~value_optbyte_complement))
 787  0014 43            	cpl	a
 788  0015 1101          	cp	a,(OFST-3,sp)
 789  0017 2614          	jrne	L772
 790                     ; 323       res_value = (uint16_t)((uint16_t)value_optbyte << 8);
 792  0019 7b01          	ld	a,(OFST-3,sp)
 793  001b 97            	ld	xl,a
 794  001c 4f            	clr	a
 795  001d 02            	rlwa	x,a
 796  001e 1f03          	ldw	(OFST-1,sp),x
 798                     ; 324       res_value = res_value | (uint16_t)value_optbyte_complement;
 800  0020 5f            	clrw	x
 801  0021 7b02          	ld	a,(OFST-2,sp)
 802  0023 97            	ld	xl,a
 803  0024 01            	rrwa	x,a
 804  0025 1a04          	or	a,(OFST+0,sp)
 805  0027 01            	rrwa	x,a
 806  0028 1a03          	or	a,(OFST-1,sp)
 807  002a 01            	rrwa	x,a
 810  002b 2003          	jra	L572
 811  002d               L772:
 812                     ; 328       res_value = FLASH_OPTIONBYTE_ERROR;
 814  002d ae5555        	ldw	x,#21845
 816  0030               L572:
 817                     ; 331   return(res_value);
 821  0030 5b04          	addw	sp,#4
 822  0032 81            	ret	
 896                     ; 340 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
 896                     ; 341 {
 897                     .text:	section	.text,new
 898  0000               _FLASH_SetLowPowerMode:
 900  0000 88            	push	a
 901       00000000      OFST:	set	0
 904                     ; 343   assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
 906                     ; 346   FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
 908  0001 c6505a        	ld	a,20570
 909  0004 a4f3          	and	a,#243
 910  0006 c7505a        	ld	20570,a
 911                     ; 349   FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
 913  0009 c6505a        	ld	a,20570
 914  000c 1a01          	or	a,(OFST+1,sp)
 915  000e c7505a        	ld	20570,a
 916                     ; 350 }
 919  0011 84            	pop	a
 920  0012 81            	ret	
 978                     ; 358 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
 978                     ; 359 {
 979                     .text:	section	.text,new
 980  0000               _FLASH_SetProgrammingTime:
 984                     ; 361   assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
 986                     ; 363   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
 988  0000 7211505a      	bres	20570,#0
 989                     ; 364   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
 991  0004 ca505a        	or	a,20570
 992  0007 c7505a        	ld	20570,a
 993                     ; 365 }
 996  000a 81            	ret	
1021                     ; 372 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1021                     ; 373 {
1022                     .text:	section	.text,new
1023  0000               _FLASH_GetLowPowerMode:
1027                     ; 374   return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1029  0000 c6505a        	ld	a,20570
1030  0003 a40c          	and	a,#12
1033  0005 81            	ret	
1058                     ; 382 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1058                     ; 383 {
1059                     .text:	section	.text,new
1060  0000               _FLASH_GetProgrammingTime:
1064                     ; 384   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1066  0000 c6505a        	ld	a,20570
1067  0003 a401          	and	a,#1
1070  0005 81            	ret	
1102                     ; 392 uint32_t FLASH_GetBootSize(void)
1102                     ; 393 {
1103                     .text:	section	.text,new
1104  0000               _FLASH_GetBootSize:
1106  0000 5204          	subw	sp,#4
1107       00000004      OFST:	set	4
1110                     ; 394   uint32_t temp = 0;
1112                     ; 397   temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1114  0002 c6505d        	ld	a,20573
1115  0005 5f            	clrw	x
1116  0006 97            	ld	xl,a
1117  0007 90ae0200      	ldw	y,#512
1118  000b cd0000        	call	c_umul
1120  000e 96            	ldw	x,sp
1121  000f 5c            	incw	x
1122  0010 cd0000        	call	c_rtol
1125                     ; 400   if(FLASH->FPR == 0xFF)
1127  0013 c6505d        	ld	a,20573
1128  0016 4c            	inc	a
1129  0017 260d          	jrne	L714
1130                     ; 402     temp += 512;
1132  0019 ae0200        	ldw	x,#512
1133  001c bf02          	ldw	c_lreg+2,x
1134  001e 5f            	clrw	x
1135  001f bf00          	ldw	c_lreg,x
1136  0021 96            	ldw	x,sp
1137  0022 5c            	incw	x
1138  0023 cd0000        	call	c_lgadd
1141  0026               L714:
1142                     ; 406   return(temp);
1144  0026 96            	ldw	x,sp
1145  0027 5c            	incw	x
1146  0028 cd0000        	call	c_ltor
1150  002b 5b04          	addw	sp,#4
1151  002d 81            	ret	
1260                     ; 417 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1260                     ; 418 {
1261                     .text:	section	.text,new
1262  0000               _FLASH_GetFlagStatus:
1264       00000001      OFST:	set	1
1267                     ; 419   FlagStatus status = RESET;
1269                     ; 421   assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1271                     ; 424   if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1273  0000 c4505f        	and	a,20575
1274  0003 2702          	jreq	L174
1275                     ; 426     status = SET; /* FLASH_FLAG is set */
1277  0005 a601          	ld	a,#1
1280  0007               L174:
1281                     ; 430     status = RESET; /* FLASH_FLAG is reset*/
1284                     ; 434   return status;
1288  0007 81            	ret	
1377                     ; 549 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1377                     ; 550 {
1378                     .text:	section	.text,new
1379  0000               _FLASH_WaitForLastOperation:
1381  0000 5203          	subw	sp,#3
1382       00000003      OFST:	set	3
1385                     ; 551   uint8_t flagstatus = 0x00;
1387  0002 0f03          	clr	(OFST+0,sp)
1389                     ; 552   uint16_t timeout = OPERATION_TIMEOUT;
1391  0004 aeffff        	ldw	x,#65535
1392  0007 1f01          	ldw	(OFST-2,sp),x
1394                     ; 557     if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1396  0009 a1fd          	cp	a,#253
1397  000b 2620          	jrne	L155
1399  000d 200a          	jra	L735
1400  000f               L535:
1401                     ; 561         flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1401                     ; 562                                                         FLASH_IAPSR_WR_PG_DIS));
1403  000f c6505f        	ld	a,20575
1404  0012 a405          	and	a,#5
1405  0014 6b03          	ld	(OFST+0,sp),a
1407                     ; 563         timeout--;
1409  0016 5a            	decw	x
1410  0017 1f01          	ldw	(OFST-2,sp),x
1412  0019               L735:
1413                     ; 559       while((flagstatus == 0x00) && (timeout != 0x00))
1415  0019 7b03          	ld	a,(OFST+0,sp)
1416  001b 2618          	jrne	L545
1418  001d 1e01          	ldw	x,(OFST-2,sp)
1419  001f 26ee          	jrne	L535
1420  0021 2012          	jra	L545
1421  0023               L745:
1422                     ; 570         flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1422                     ; 571                                                         FLASH_IAPSR_WR_PG_DIS));
1424  0023 c6505f        	ld	a,20575
1425  0026 a441          	and	a,#65
1426  0028 6b03          	ld	(OFST+0,sp),a
1428                     ; 572         timeout--;
1430  002a 5a            	decw	x
1431  002b 1f01          	ldw	(OFST-2,sp),x
1433  002d               L155:
1434                     ; 568       while((flagstatus == 0x00) && (timeout != 0x00))
1436  002d 7b03          	ld	a,(OFST+0,sp)
1437  002f 2604          	jrne	L545
1439  0031 1e01          	ldw	x,(OFST-2,sp)
1440  0033 26ee          	jrne	L745
1441  0035               L545:
1442                     ; 584   if(timeout == 0x00 )
1444  0035 1e01          	ldw	x,(OFST-2,sp)
1445  0037 2602          	jrne	L755
1446                     ; 586     flagstatus = FLASH_STATUS_TIMEOUT;
1448  0039 a602          	ld	a,#2
1450  003b               L755:
1451                     ; 589   return((FLASH_Status_TypeDef)flagstatus);
1455  003b 5b03          	addw	sp,#3
1456  003d 81            	ret	
1515                     ; 599 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1515                     ; 600 {
1516                     .text:	section	.text,new
1517  0000               _FLASH_EraseBlock:
1519  0000 89            	pushw	x
1520  0001 5206          	subw	sp,#6
1521       00000006      OFST:	set	6
1524                     ; 601   uint32_t startaddress = 0;
1526                     ; 611   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1528                     ; 612   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1530  0003 7b0b          	ld	a,(OFST+5,sp)
1531  0005 a1fd          	cp	a,#253
1532  0007 2605          	jrne	L706
1533                     ; 614     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1535                     ; 615     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1537  0009 ae8000        	ldw	x,#32768
1539  000c 2003          	jra	L116
1540  000e               L706:
1541                     ; 619     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1543                     ; 620     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1545  000e ae4000        	ldw	x,#16384
1546  0011               L116:
1547  0011 1f05          	ldw	(OFST-1,sp),x
1548  0013 5f            	clrw	x
1549  0014 1f03          	ldw	(OFST-3,sp),x
1551                     ; 628     pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1553  0016 a680          	ld	a,#128
1554  0018 1e07          	ldw	x,(OFST+1,sp)
1555  001a cd0000        	call	c_cmulx
1557  001d 96            	ldw	x,sp
1558  001e 1c0003        	addw	x,#OFST-3
1559  0021 cd0000        	call	c_ladd
1561  0024 be02          	ldw	x,c_lreg+2
1562  0026 1f01          	ldw	(OFST-5,sp),x
1564                     ; 632   FLASH->CR2 |= FLASH_CR2_ERASE;
1566  0028 721a505b      	bset	20571,#5
1567                     ; 633   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
1569  002c 721b505c      	bres	20572,#5
1570                     ; 637     *pwFlash = (uint32_t)0;
1572  0030 4f            	clr	a
1573  0031 e703          	ld	(3,x),a
1574  0033 e702          	ld	(2,x),a
1575  0035 e701          	ld	(1,x),a
1576  0037 f7            	ld	(x),a
1577                     ; 645 }
1580  0038 5b08          	addw	sp,#8
1581  003a 81            	ret	
1679                     ; 656 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
1679                     ; 657                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1679                     ; 658 {
1680                     .text:	section	.text,new
1681  0000               _FLASH_ProgramBlock:
1683  0000 89            	pushw	x
1684  0001 5206          	subw	sp,#6
1685       00000006      OFST:	set	6
1688                     ; 659   uint16_t Count = 0;
1690                     ; 660   uint32_t startaddress = 0;
1692                     ; 663   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1694                     ; 664   assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
1696                     ; 665   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1698  0003 7b0b          	ld	a,(OFST+5,sp)
1699  0005 a1fd          	cp	a,#253
1700  0007 2605          	jrne	L756
1701                     ; 667     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1703                     ; 668     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1705  0009 ae8000        	ldw	x,#32768
1707  000c 2003          	jra	L166
1708  000e               L756:
1709                     ; 672     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1711                     ; 673     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1713  000e ae4000        	ldw	x,#16384
1714  0011               L166:
1715  0011 1f03          	ldw	(OFST-3,sp),x
1716  0013 5f            	clrw	x
1717  0014 1f01          	ldw	(OFST-5,sp),x
1719                     ; 677   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1721  0016 a680          	ld	a,#128
1722  0018 1e07          	ldw	x,(OFST+1,sp)
1723  001a cd0000        	call	c_cmulx
1725  001d 96            	ldw	x,sp
1726  001e 5c            	incw	x
1727  001f cd0000        	call	c_lgadd
1730                     ; 680   if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
1732  0022 7b0c          	ld	a,(OFST+6,sp)
1733  0024 260a          	jrne	L366
1734                     ; 683     FLASH->CR2 |= FLASH_CR2_PRG;
1736  0026 7210505b      	bset	20571,#0
1737                     ; 684     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
1739  002a 7211505c      	bres	20572,#0
1741  002e 2008          	jra	L566
1742  0030               L366:
1743                     ; 689     FLASH->CR2 |= FLASH_CR2_FPRG;
1745  0030 7218505b      	bset	20571,#4
1746                     ; 690     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
1748  0034 7219505c      	bres	20572,#4
1749  0038               L566:
1750                     ; 694   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1752  0038 5f            	clrw	x
1753  0039 1f05          	ldw	(OFST-1,sp),x
1755  003b               L766:
1756                     ; 696     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1758  003b 1e0d          	ldw	x,(OFST+7,sp)
1759  003d 72fb05        	addw	x,(OFST-1,sp)
1760  0040 f6            	ld	a,(x)
1761  0041 1e03          	ldw	x,(OFST-3,sp)
1762  0043 72fb05        	addw	x,(OFST-1,sp)
1763  0046 f7            	ld	(x),a
1764                     ; 694   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1766  0047 1e05          	ldw	x,(OFST-1,sp)
1767  0049 5c            	incw	x
1768  004a 1f05          	ldw	(OFST-1,sp),x
1772  004c a30080        	cpw	x,#128
1773  004f 25ea          	jrult	L766
1774                     ; 698 }
1777  0051 5b08          	addw	sp,#8
1778  0053 81            	ret	
1791                     	xdef	_FLASH_WaitForLastOperation
1792                     	xdef	_FLASH_ProgramBlock
1793                     	xdef	_FLASH_EraseBlock
1794                     	xdef	_FLASH_GetFlagStatus
1795                     	xdef	_FLASH_GetBootSize
1796                     	xdef	_FLASH_GetProgrammingTime
1797                     	xdef	_FLASH_GetLowPowerMode
1798                     	xdef	_FLASH_SetProgrammingTime
1799                     	xdef	_FLASH_SetLowPowerMode
1800                     	xdef	_FLASH_EraseOptionByte
1801                     	xdef	_FLASH_ProgramOptionByte
1802                     	xdef	_FLASH_ReadOptionByte
1803                     	xdef	_FLASH_ProgramWord
1804                     	xdef	_FLASH_ReadByte
1805                     	xdef	_FLASH_ProgramByte
1806                     	xdef	_FLASH_EraseByte
1807                     	xdef	_FLASH_ITConfig
1808                     	xdef	_FLASH_DeInit
1809                     	xdef	_FLASH_Lock
1810                     	xdef	_FLASH_Unlock
1811                     	xref.b	c_lreg
1812                     	xref.b	c_x
1813                     	xref.b	c_y
1832                     	xref	c_ladd
1833                     	xref	c_cmulx
1834                     	xref	c_ltor
1835                     	xref	c_lgadd
1836                     	xref	c_rtol
1837                     	xref	c_umul
1838                     	end
