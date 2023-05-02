   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.8 - 08 Nov 2022
   3                     ; Generator (Limited) V4.5.5 - 08 Nov 2022
   4                     ; Optimizer V4.5.5 - 08 Nov 2022
  49                     ; 67 void I2C_DeInit(void)
  49                     ; 68 {
  51                     .text:	section	.text,new
  52  0000               _I2C_DeInit:
  56                     ; 69   I2C->CR1 = I2C_CR1_RESET_VALUE;
  58  0000 725f5210      	clr	21008
  59                     ; 70   I2C->CR2 = I2C_CR2_RESET_VALUE;
  61  0004 725f5211      	clr	21009
  62                     ; 71   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  64  0008 725f5212      	clr	21010
  65                     ; 72   I2C->OARL = I2C_OARL_RESET_VALUE;
  67  000c 725f5213      	clr	21011
  68                     ; 73   I2C->OARH = I2C_OARH_RESET_VALUE;
  70  0010 725f5214      	clr	21012
  71                     ; 74   I2C->ITR = I2C_ITR_RESET_VALUE;
  73  0014 725f521a      	clr	21018
  74                     ; 75   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  76  0018 725f521b      	clr	21019
  77                     ; 76   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  79  001c 725f521c      	clr	21020
  80                     ; 77   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  82  0020 3502521d      	mov	21021,#2
  83                     ; 78 }
  86  0024 81            	ret	
 253                     .const:	section	.text
 254  0000               L01:
 255  0000 000186a1      	dc.l	100001
 256  0004               L21:
 257  0004 000f4240      	dc.l	1000000
 258                     ; 96 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 258                     ; 97               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 258                     ; 98               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 258                     ; 99 {
 259                     .text:	section	.text,new
 260  0000               _I2C_Init:
 262  0000 5209          	subw	sp,#9
 263       00000009      OFST:	set	9
 266                     ; 100   uint16_t result = 0x0004;
 268                     ; 101   uint16_t tmpval = 0;
 270                     ; 102   uint8_t tmpccrh = 0;
 272  0002 0f07          	clr	(OFST-2,sp)
 274                     ; 105   assert_param(IS_I2C_ACK_OK(Ack));
 276                     ; 106   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 278                     ; 107   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 280                     ; 108   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 282                     ; 109   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 284                     ; 110   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 286                     ; 115   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 288  0004 c65212        	ld	a,21010
 289  0007 a4c0          	and	a,#192
 290  0009 c75212        	ld	21010,a
 291                     ; 117   I2C->FREQR |= InputClockFrequencyMHz;
 293  000c c65212        	ld	a,21010
 294  000f 1a15          	or	a,(OFST+12,sp)
 295  0011 c75212        	ld	21010,a
 296                     ; 121   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 298  0014 72115210      	bres	21008,#0
 299                     ; 124   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 301  0018 c6521c        	ld	a,21020
 302  001b a430          	and	a,#48
 303  001d c7521c        	ld	21020,a
 304                     ; 125   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 306  0020 725f521b      	clr	21019
 307                     ; 128   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 309  0024 96            	ldw	x,sp
 310  0025 1c000c        	addw	x,#OFST+3
 311  0028 cd0000        	call	c_ltor
 313  002b ae0000        	ldw	x,#L01
 314  002e cd0000        	call	c_lcmp
 316  0031 2560          	jrult	L511
 317                     ; 131     tmpccrh = I2C_CCRH_FS;
 319  0033 a680          	ld	a,#128
 320  0035 6b07          	ld	(OFST-2,sp),a
 322                     ; 133     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 324  0037 96            	ldw	x,sp
 325  0038 0d12          	tnz	(OFST+9,sp)
 326  003a 261d          	jrne	L711
 327                     ; 136       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 329  003c 1c000c        	addw	x,#OFST+3
 330  003f cd0000        	call	c_ltor
 332  0042 a603          	ld	a,#3
 333  0044 cd0000        	call	c_smul
 335  0047 96            	ldw	x,sp
 336  0048 5c            	incw	x
 337  0049 cd0000        	call	c_rtol
 340  004c 7b15          	ld	a,(OFST+12,sp)
 341  004e cd00f1        	call	LC001
 343  0051 96            	ldw	x,sp
 344  0052 cd00ff        	call	LC002
 345  0055 1f08          	ldw	(OFST-1,sp),x
 348  0057 2021          	jra	L121
 349  0059               L711:
 350                     ; 141       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 352  0059 1c000c        	addw	x,#OFST+3
 353  005c cd0000        	call	c_ltor
 355  005f a619          	ld	a,#25
 356  0061 cd0000        	call	c_smul
 358  0064 96            	ldw	x,sp
 359  0065 5c            	incw	x
 360  0066 cd0000        	call	c_rtol
 363  0069 7b15          	ld	a,(OFST+12,sp)
 364  006b cd00f1        	call	LC001
 366  006e 96            	ldw	x,sp
 367  006f cd00ff        	call	LC002
 368  0072 1f08          	ldw	(OFST-1,sp),x
 370                     ; 143       tmpccrh |= I2C_CCRH_DUTY;
 372  0074 7b07          	ld	a,(OFST-2,sp)
 373  0076 aa40          	or	a,#64
 374  0078 6b07          	ld	(OFST-2,sp),a
 376  007a               L121:
 377                     ; 147     if (result < (uint16_t)0x01)
 379  007a 1e08          	ldw	x,(OFST-1,sp)
 380  007c 2603          	jrne	L321
 381                     ; 150       result = (uint16_t)0x0001;
 383  007e 5c            	incw	x
 384  007f 1f08          	ldw	(OFST-1,sp),x
 386  0081               L321:
 387                     ; 156     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 389  0081 7b15          	ld	a,(OFST+12,sp)
 390  0083 97            	ld	xl,a
 391  0084 a603          	ld	a,#3
 392  0086 42            	mul	x,a
 393  0087 a60a          	ld	a,#10
 394  0089 cd0000        	call	c_sdivx
 396  008c 5c            	incw	x
 397  008d 1f05          	ldw	(OFST-4,sp),x
 399                     ; 157     I2C->TRISER = (uint8_t)tmpval;
 401  008f 7b06          	ld	a,(OFST-3,sp)
 403  0091 2028          	jra	L521
 404  0093               L511:
 405                     ; 164     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 407  0093 96            	ldw	x,sp
 408  0094 1c000c        	addw	x,#OFST+3
 409  0097 cd0000        	call	c_ltor
 411  009a 3803          	sll	c_lreg+3
 412  009c 3902          	rlc	c_lreg+2
 413  009e 3901          	rlc	c_lreg+1
 414  00a0 96            	ldw	x,sp
 415  00a1 3900          	rlc	c_lreg
 416  00a3 5c            	incw	x
 417  00a4 cd0000        	call	c_rtol
 420  00a7 7b15          	ld	a,(OFST+12,sp)
 421  00a9 ad46          	call	LC001
 423  00ab 96            	ldw	x,sp
 424  00ac ad51          	call	LC002
 426                     ; 167     if (result < (uint16_t)0x0004)
 428  00ae a30004        	cpw	x,#4
 429  00b1 2403          	jruge	L721
 430                     ; 170       result = (uint16_t)0x0004;
 432  00b3 ae0004        	ldw	x,#4
 434  00b6               L721:
 435  00b6 1f08          	ldw	(OFST-1,sp),x
 436                     ; 176     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 438  00b8 7b15          	ld	a,(OFST+12,sp)
 439  00ba 4c            	inc	a
 440  00bb               L521:
 441  00bb c7521d        	ld	21021,a
 442                     ; 181   I2C->CCRL = (uint8_t)result;
 444  00be 7b09          	ld	a,(OFST+0,sp)
 445  00c0 c7521b        	ld	21019,a
 446                     ; 182   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 448  00c3 7b08          	ld	a,(OFST-1,sp)
 449  00c5 a40f          	and	a,#15
 450  00c7 1a07          	or	a,(OFST-2,sp)
 451  00c9 c7521c        	ld	21020,a
 452                     ; 185   I2C->CR1 |= I2C_CR1_PE;
 454  00cc 72105210      	bset	21008,#0
 455                     ; 188   I2C_AcknowledgeConfig(Ack);
 457  00d0 7b13          	ld	a,(OFST+10,sp)
 458  00d2 cd0000        	call	_I2C_AcknowledgeConfig
 460                     ; 191   I2C->OARL = (uint8_t)(OwnAddress);
 462  00d5 7b11          	ld	a,(OFST+8,sp)
 463  00d7 c75213        	ld	21011,a
 464                     ; 192   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 464                     ; 193                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 466  00da 1e10          	ldw	x,(OFST+7,sp)
 467  00dc 4f            	clr	a
 468  00dd 01            	rrwa	x,a
 469  00de 48            	sll	a
 470  00df 01            	rrwa	x,a
 471  00e0 49            	rlc	a
 472  00e1 a406          	and	a,#6
 473  00e3 6b04          	ld	(OFST-5,sp),a
 475  00e5 7b14          	ld	a,(OFST+11,sp)
 476  00e7 aa40          	or	a,#64
 477  00e9 1a04          	or	a,(OFST-5,sp)
 478  00eb c75214        	ld	21012,a
 479                     ; 194 }
 482  00ee 5b09          	addw	sp,#9
 483  00f0 81            	ret	
 484  00f1               LC001:
 485  00f1 b703          	ld	c_lreg+3,a
 486  00f3 3f02          	clr	c_lreg+2
 487  00f5 3f01          	clr	c_lreg+1
 488  00f7 3f00          	clr	c_lreg
 489  00f9 ae0004        	ldw	x,#L21
 490  00fc cc0000        	jp	c_lmul
 491  00ff               LC002:
 492  00ff 5c            	incw	x
 493  0100 cd0000        	call	c_ludv
 495  0103 be02          	ldw	x,c_lreg+2
 496  0105 81            	ret	
 551                     ; 202 void I2C_Cmd(FunctionalState NewState)
 551                     ; 203 {
 552                     .text:	section	.text,new
 553  0000               _I2C_Cmd:
 557                     ; 205   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 559                     ; 207   if (NewState != DISABLE)
 561  0000 4d            	tnz	a
 562  0001 2705          	jreq	L751
 563                     ; 210     I2C->CR1 |= I2C_CR1_PE;
 565  0003 72105210      	bset	21008,#0
 568  0007 81            	ret	
 569  0008               L751:
 570                     ; 215     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 572  0008 72115210      	bres	21008,#0
 573                     ; 217 }
 576  000c 81            	ret	
 611                     ; 225 void I2C_GeneralCallCmd(FunctionalState NewState)
 611                     ; 226 {
 612                     .text:	section	.text,new
 613  0000               _I2C_GeneralCallCmd:
 617                     ; 228   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 619                     ; 230   if (NewState != DISABLE)
 621  0000 4d            	tnz	a
 622  0001 2705          	jreq	L102
 623                     ; 233     I2C->CR1 |= I2C_CR1_ENGC;
 625  0003 721c5210      	bset	21008,#6
 628  0007 81            	ret	
 629  0008               L102:
 630                     ; 238     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 632  0008 721d5210      	bres	21008,#6
 633                     ; 240 }
 636  000c 81            	ret	
 671                     ; 250 void I2C_GenerateSTART(FunctionalState NewState)
 671                     ; 251 {
 672                     .text:	section	.text,new
 673  0000               _I2C_GenerateSTART:
 677                     ; 253   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 679                     ; 255   if (NewState != DISABLE)
 681  0000 4d            	tnz	a
 682  0001 2705          	jreq	L322
 683                     ; 258     I2C->CR2 |= I2C_CR2_START;
 685  0003 72105211      	bset	21009,#0
 688  0007 81            	ret	
 689  0008               L322:
 690                     ; 263     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 692  0008 72115211      	bres	21009,#0
 693                     ; 265 }
 696  000c 81            	ret	
 731                     ; 273 void I2C_GenerateSTOP(FunctionalState NewState)
 731                     ; 274 {
 732                     .text:	section	.text,new
 733  0000               _I2C_GenerateSTOP:
 737                     ; 276   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 739                     ; 278   if (NewState != DISABLE)
 741  0000 4d            	tnz	a
 742  0001 2705          	jreq	L542
 743                     ; 281     I2C->CR2 |= I2C_CR2_STOP;
 745  0003 72125211      	bset	21009,#1
 748  0007 81            	ret	
 749  0008               L542:
 750                     ; 286     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 752  0008 72135211      	bres	21009,#1
 753                     ; 288 }
 756  000c 81            	ret	
 792                     ; 296 void I2C_SoftwareResetCmd(FunctionalState NewState)
 792                     ; 297 {
 793                     .text:	section	.text,new
 794  0000               _I2C_SoftwareResetCmd:
 798                     ; 299   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 800                     ; 301   if (NewState != DISABLE)
 802  0000 4d            	tnz	a
 803  0001 2705          	jreq	L762
 804                     ; 304     I2C->CR2 |= I2C_CR2_SWRST;
 806  0003 721e5211      	bset	21009,#7
 809  0007 81            	ret	
 810  0008               L762:
 811                     ; 309     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 813  0008 721f5211      	bres	21009,#7
 814                     ; 311 }
 817  000c 81            	ret	
 853                     ; 320 void I2C_StretchClockCmd(FunctionalState NewState)
 853                     ; 321 {
 854                     .text:	section	.text,new
 855  0000               _I2C_StretchClockCmd:
 859                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 861                     ; 325   if (NewState != DISABLE)
 863  0000 4d            	tnz	a
 864  0001 2705          	jreq	L113
 865                     ; 328     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 867  0003 721f5210      	bres	21008,#7
 870  0007 81            	ret	
 871  0008               L113:
 872                     ; 334     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 874  0008 721e5210      	bset	21008,#7
 875                     ; 336 }
 878  000c 81            	ret	
 914                     ; 345 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
 914                     ; 346 {
 915                     .text:	section	.text,new
 916  0000               _I2C_AcknowledgeConfig:
 918       00000000      OFST:	set	0
 921                     ; 348   assert_param(IS_I2C_ACK_OK(Ack));
 923                     ; 350   if (Ack == I2C_ACK_NONE)
 925  0000 4d            	tnz	a
 926  0001 2605          	jrne	L333
 927                     ; 353     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 929  0003 72155211      	bres	21009,#2
 932  0007 81            	ret	
 933  0008               L333:
 934                     ; 358     I2C->CR2 |= I2C_CR2_ACK;
 936  0008 72145211      	bset	21009,#2
 937                     ; 360     if (Ack == I2C_ACK_CURR)
 939  000c 4a            	dec	a
 940  000d 2605          	jrne	L733
 941                     ; 363       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
 943  000f 72175211      	bres	21009,#3
 946  0013 81            	ret	
 947  0014               L733:
 948                     ; 368       I2C->CR2 |= I2C_CR2_POS;
 950  0014 72165211      	bset	21009,#3
 951                     ; 371 }
 954  0018 81            	ret	
1026                     ; 381 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1026                     ; 382 {
1027                     .text:	section	.text,new
1028  0000               _I2C_ITConfig:
1030  0000 89            	pushw	x
1031       00000000      OFST:	set	0
1034                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1036                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1038                     ; 387   if (NewState != DISABLE)
1040  0001 9f            	ld	a,xl
1041  0002 4d            	tnz	a
1042  0003 2706          	jreq	L773
1043                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1045  0005 9e            	ld	a,xh
1046  0006 ca521a        	or	a,21018
1048  0009 2006          	jra	L104
1049  000b               L773:
1050                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1052  000b 7b01          	ld	a,(OFST+1,sp)
1053  000d 43            	cpl	a
1054  000e c4521a        	and	a,21018
1055  0011               L104:
1056  0011 c7521a        	ld	21018,a
1057                     ; 397 }
1060  0014 85            	popw	x
1061  0015 81            	ret	
1097                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1097                     ; 406 {
1098                     .text:	section	.text,new
1099  0000               _I2C_FastModeDutyCycleConfig:
1103                     ; 408   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1105                     ; 410   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1107  0000 a140          	cp	a,#64
1108  0002 2605          	jrne	L124
1109                     ; 413     I2C->CCRH |= I2C_CCRH_DUTY;
1111  0004 721c521c      	bset	21020,#6
1114  0008 81            	ret	
1115  0009               L124:
1116                     ; 418     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1118  0009 721d521c      	bres	21020,#6
1119                     ; 420 }
1122  000d 81            	ret	
1145                     ; 427 uint8_t I2C_ReceiveData(void)
1145                     ; 428 {
1146                     .text:	section	.text,new
1147  0000               _I2C_ReceiveData:
1151                     ; 430   return ((uint8_t)I2C->DR);
1153  0000 c65216        	ld	a,21014
1156  0003 81            	ret	
1219                     ; 440 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1219                     ; 441 {
1220                     .text:	section	.text,new
1221  0000               _I2C_Send7bitAddress:
1223  0000 89            	pushw	x
1224       00000000      OFST:	set	0
1227                     ; 443   assert_param(IS_I2C_ADDRESS_OK(Address));
1229                     ; 444   assert_param(IS_I2C_DIRECTION_OK(Direction));
1231                     ; 447   Address &= (uint8_t)0xFE;
1233  0001 7b01          	ld	a,(OFST+1,sp)
1234  0003 a4fe          	and	a,#254
1235  0005 6b01          	ld	(OFST+1,sp),a
1236                     ; 450   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1238  0007 1a02          	or	a,(OFST+2,sp)
1239  0009 c75216        	ld	21014,a
1240                     ; 451 }
1243  000c 85            	popw	x
1244  000d 81            	ret	
1276                     ; 458 void I2C_SendData(uint8_t Data)
1276                     ; 459 {
1277                     .text:	section	.text,new
1278  0000               _I2C_SendData:
1282                     ; 461   I2C->DR = Data;
1284  0000 c75216        	ld	21014,a
1285                     ; 462 }
1288  0003 81            	ret	
1508                     ; 578 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1508                     ; 579 {
1509                     .text:	section	.text,new
1510  0000               _I2C_CheckEvent:
1512  0000 89            	pushw	x
1513  0001 5206          	subw	sp,#6
1514       00000006      OFST:	set	6
1517                     ; 580   __IO uint16_t lastevent = 0x00;
1519  0003 5f            	clrw	x
1520  0004 1f04          	ldw	(OFST-2,sp),x
1522                     ; 581   uint8_t flag1 = 0x00 ;
1524                     ; 582   uint8_t flag2 = 0x00;
1526                     ; 583   ErrorStatus status = ERROR;
1528                     ; 586   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1530                     ; 588   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1532  0006 1e07          	ldw	x,(OFST+1,sp)
1533  0008 a30004        	cpw	x,#4
1534  000b 2609          	jrne	L506
1535                     ; 590     lastevent = I2C->SR2 & I2C_SR2_AF;
1537  000d c65218        	ld	a,21016
1538  0010 a404          	and	a,#4
1539  0012 5f            	clrw	x
1540  0013 97            	ld	xl,a
1542  0014 201a          	jra	L706
1543  0016               L506:
1544                     ; 594     flag1 = I2C->SR1;
1546  0016 c65217        	ld	a,21015
1547  0019 6b03          	ld	(OFST-3,sp),a
1549                     ; 595     flag2 = I2C->SR3;
1551  001b c65219        	ld	a,21017
1552  001e 6b06          	ld	(OFST+0,sp),a
1554                     ; 596     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1556  0020 5f            	clrw	x
1557  0021 7b03          	ld	a,(OFST-3,sp)
1558  0023 97            	ld	xl,a
1559  0024 1f01          	ldw	(OFST-5,sp),x
1561  0026 5f            	clrw	x
1562  0027 7b06          	ld	a,(OFST+0,sp)
1563  0029 97            	ld	xl,a
1564  002a 7b02          	ld	a,(OFST-4,sp)
1565  002c 01            	rrwa	x,a
1566  002d 1a01          	or	a,(OFST-5,sp)
1567  002f 01            	rrwa	x,a
1568  0030               L706:
1569  0030 1f04          	ldw	(OFST-2,sp),x
1571                     ; 599   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
1573  0032 1e04          	ldw	x,(OFST-2,sp)
1574  0034 01            	rrwa	x,a
1575  0035 1408          	and	a,(OFST+2,sp)
1576  0037 01            	rrwa	x,a
1577  0038 1407          	and	a,(OFST+1,sp)
1578  003a 01            	rrwa	x,a
1579  003b 1307          	cpw	x,(OFST+1,sp)
1580  003d 2604          	jrne	L116
1581                     ; 602     status = SUCCESS;
1583  003f a601          	ld	a,#1
1586  0041 2001          	jra	L316
1587  0043               L116:
1588                     ; 607     status = ERROR;
1590  0043 4f            	clr	a
1592  0044               L316:
1593                     ; 611   return status;
1597  0044 5b08          	addw	sp,#8
1598  0046 81            	ret	
1647                     ; 628 I2C_Event_TypeDef I2C_GetLastEvent(void)
1647                     ; 629 {
1648                     .text:	section	.text,new
1649  0000               _I2C_GetLastEvent:
1651  0000 5206          	subw	sp,#6
1652       00000006      OFST:	set	6
1655                     ; 630   __IO uint16_t lastevent = 0;
1657  0002 5f            	clrw	x
1658  0003 1f05          	ldw	(OFST-1,sp),x
1660                     ; 631   uint16_t flag1 = 0;
1662                     ; 632   uint16_t flag2 = 0;
1664                     ; 634   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
1666  0005 7205521805    	btjf	21016,#2,L736
1667                     ; 636     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
1669  000a ae0004        	ldw	x,#4
1671  000d 2013          	jra	L146
1672  000f               L736:
1673                     ; 641     flag1 = I2C->SR1;
1675  000f c65217        	ld	a,21015
1676  0012 97            	ld	xl,a
1677  0013 1f01          	ldw	(OFST-5,sp),x
1679                     ; 642     flag2 = I2C->SR3;
1681  0015 c65219        	ld	a,21017
1682  0018 5f            	clrw	x
1683  0019 97            	ld	xl,a
1684  001a 1f03          	ldw	(OFST-3,sp),x
1686                     ; 645     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
1688  001c 7b02          	ld	a,(OFST-4,sp)
1689  001e 01            	rrwa	x,a
1690  001f 1a01          	or	a,(OFST-5,sp)
1691  0021 01            	rrwa	x,a
1692  0022               L146:
1693  0022 1f05          	ldw	(OFST-1,sp),x
1695                     ; 648   return (I2C_Event_TypeDef)lastevent;
1697  0024 1e05          	ldw	x,(OFST-1,sp)
1700  0026 5b06          	addw	sp,#6
1701  0028 81            	ret	
1912                     ; 679 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
1912                     ; 680 {
1913                     .text:	section	.text,new
1914  0000               _I2C_GetFlagStatus:
1916  0000 89            	pushw	x
1917  0001 89            	pushw	x
1918       00000002      OFST:	set	2
1921                     ; 681   uint8_t tempreg = 0;
1923  0002 0f02          	clr	(OFST+0,sp)
1925                     ; 682   uint8_t regindex = 0;
1927                     ; 683   FlagStatus bitstatus = RESET;
1929                     ; 686   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
1931                     ; 689   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
1933  0004 9e            	ld	a,xh
1934  0005 6b01          	ld	(OFST-1,sp),a
1936                     ; 691   switch (regindex)
1939                     ; 708     default:
1939                     ; 709       break;
1940  0007 4a            	dec	a
1941  0008 2708          	jreq	L346
1942  000a 4a            	dec	a
1943  000b 270a          	jreq	L546
1944  000d 4a            	dec	a
1945  000e 270c          	jreq	L746
1946  0010 200f          	jra	L757
1947  0012               L346:
1948                     ; 694     case 0x01:
1948                     ; 695       tempreg = (uint8_t)I2C->SR1;
1950  0012 c65217        	ld	a,21015
1951                     ; 696       break;
1953  0015 2008          	jp	LC003
1954  0017               L546:
1955                     ; 699     case 0x02:
1955                     ; 700       tempreg = (uint8_t)I2C->SR2;
1957  0017 c65218        	ld	a,21016
1958                     ; 701       break;
1960  001a 2003          	jp	LC003
1961  001c               L746:
1962                     ; 704     case 0x03:
1962                     ; 705       tempreg = (uint8_t)I2C->SR3;
1964  001c c65219        	ld	a,21017
1965  001f               LC003:
1966  001f 6b02          	ld	(OFST+0,sp),a
1968                     ; 706       break;
1970                     ; 708     default:
1970                     ; 709       break;
1972  0021               L757:
1973                     ; 713   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
1975  0021 7b04          	ld	a,(OFST+2,sp)
1976  0023 1502          	bcp	a,(OFST+0,sp)
1977  0025 2704          	jreq	L167
1978                     ; 716     bitstatus = SET;
1980  0027 a601          	ld	a,#1
1983  0029 2001          	jra	L367
1984  002b               L167:
1985                     ; 721     bitstatus = RESET;
1987  002b 4f            	clr	a
1989  002c               L367:
1990                     ; 724   return bitstatus;
1994  002c 5b04          	addw	sp,#4
1995  002e 81            	ret	
2037                     ; 759 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2037                     ; 760 {
2038                     .text:	section	.text,new
2039  0000               _I2C_ClearFlag:
2041  0000 89            	pushw	x
2042       00000002      OFST:	set	2
2045                     ; 761   uint16_t flagpos = 0;
2047                     ; 763   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2049                     ; 766   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2051  0001 01            	rrwa	x,a
2052  0002 5f            	clrw	x
2053  0003 02            	rlwa	x,a
2054  0004 1f01          	ldw	(OFST-1,sp),x
2056                     ; 768   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2058  0006 7b02          	ld	a,(OFST+0,sp)
2059  0008 43            	cpl	a
2060  0009 c75218        	ld	21016,a
2061                     ; 769 }
2064  000c 85            	popw	x
2065  000d 81            	ret	
2229                     ; 791 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2229                     ; 792 {
2230                     .text:	section	.text,new
2231  0000               _I2C_GetITStatus:
2233  0000 89            	pushw	x
2234  0001 5204          	subw	sp,#4
2235       00000004      OFST:	set	4
2238                     ; 793   ITStatus bitstatus = RESET;
2240                     ; 794   __IO uint8_t enablestatus = 0;
2242  0003 0f03          	clr	(OFST-1,sp)
2244                     ; 795   uint16_t tempregister = 0;
2246                     ; 798     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2248                     ; 800   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2250  0005 9e            	ld	a,xh
2251  0006 a407          	and	a,#7
2252  0008 5f            	clrw	x
2253  0009 97            	ld	xl,a
2254  000a 1f01          	ldw	(OFST-3,sp),x
2256                     ; 803   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2258  000c c6521a        	ld	a,21018
2259  000f 1402          	and	a,(OFST-2,sp)
2260  0011 6b03          	ld	(OFST-1,sp),a
2262                     ; 805   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2264  0013 7b05          	ld	a,(OFST+1,sp)
2265  0015 a430          	and	a,#48
2266  0017 97            	ld	xl,a
2267  0018 4f            	clr	a
2268  0019 02            	rlwa	x,a
2269  001a a30100        	cpw	x,#256
2270  001d 260d          	jrne	L1701
2271                     ; 808     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2273  001f c65217        	ld	a,21015
2274  0022 1506          	bcp	a,(OFST+2,sp)
2275  0024 2715          	jreq	L1011
2277  0026 0d03          	tnz	(OFST-1,sp)
2278  0028 2711          	jreq	L1011
2279                     ; 811       bitstatus = SET;
2281  002a 200b          	jp	LC005
2282                     ; 816       bitstatus = RESET;
2283  002c               L1701:
2284                     ; 822     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2286  002c c65218        	ld	a,21016
2287  002f 1506          	bcp	a,(OFST+2,sp)
2288  0031 2708          	jreq	L1011
2290  0033 0d03          	tnz	(OFST-1,sp)
2291  0035 2704          	jreq	L1011
2292                     ; 825       bitstatus = SET;
2294  0037               LC005:
2296  0037 a601          	ld	a,#1
2299  0039 2001          	jra	L7701
2300  003b               L1011:
2301                     ; 830       bitstatus = RESET;
2304  003b 4f            	clr	a
2306  003c               L7701:
2307                     ; 834   return  bitstatus;
2311  003c 5b06          	addw	sp,#6
2312  003e 81            	ret	
2355                     ; 871 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2355                     ; 872 {
2356                     .text:	section	.text,new
2357  0000               _I2C_ClearITPendingBit:
2359  0000 89            	pushw	x
2360       00000002      OFST:	set	2
2363                     ; 873   uint16_t flagpos = 0;
2365                     ; 876   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
2367                     ; 879   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
2369  0001 01            	rrwa	x,a
2370  0002 5f            	clrw	x
2371  0003 02            	rlwa	x,a
2372  0004 1f01          	ldw	(OFST-1,sp),x
2374                     ; 882   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2376  0006 7b02          	ld	a,(OFST+0,sp)
2377  0008 43            	cpl	a
2378  0009 c75218        	ld	21016,a
2379                     ; 883 }
2382  000c 85            	popw	x
2383  000d 81            	ret	
2396                     	xdef	_I2C_ClearITPendingBit
2397                     	xdef	_I2C_GetITStatus
2398                     	xdef	_I2C_ClearFlag
2399                     	xdef	_I2C_GetFlagStatus
2400                     	xdef	_I2C_GetLastEvent
2401                     	xdef	_I2C_CheckEvent
2402                     	xdef	_I2C_SendData
2403                     	xdef	_I2C_Send7bitAddress
2404                     	xdef	_I2C_ReceiveData
2405                     	xdef	_I2C_ITConfig
2406                     	xdef	_I2C_FastModeDutyCycleConfig
2407                     	xdef	_I2C_AcknowledgeConfig
2408                     	xdef	_I2C_StretchClockCmd
2409                     	xdef	_I2C_SoftwareResetCmd
2410                     	xdef	_I2C_GenerateSTOP
2411                     	xdef	_I2C_GenerateSTART
2412                     	xdef	_I2C_GeneralCallCmd
2413                     	xdef	_I2C_Cmd
2414                     	xdef	_I2C_Init
2415                     	xdef	_I2C_DeInit
2416                     	xref.b	c_lreg
2417                     	xref.b	c_x
2436                     	xref	c_sdivx
2437                     	xref	c_ludv
2438                     	xref	c_rtol
2439                     	xref	c_smul
2440                     	xref	c_lmul
2441                     	xref	c_lcmp
2442                     	xref	c_ltor
2443                     	end
