   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.8 - 08 Nov 2022
   3                     ; Generator (Limited) V4.5.5 - 08 Nov 2022
   4                     ; Optimizer V4.5.5 - 08 Nov 2022
  49                     ; 53 void UART2_DeInit(void)
  49                     ; 54 {
  51                     .text:	section	.text,new
  52  0000               _UART2_DeInit:
  56                     ; 57   (void) UART2->SR;
  58  0000 c65240        	ld	a,21056
  59                     ; 58   (void)UART2->DR;
  61  0003 c65241        	ld	a,21057
  62                     ; 60   UART2->BRR2 = UART2_BRR2_RESET_VALUE;  /*  Set UART2_BRR2 to reset value 0x00 */
  64  0006 725f5243      	clr	21059
  65                     ; 61   UART2->BRR1 = UART2_BRR1_RESET_VALUE;  /*  Set UART2_BRR1 to reset value 0x00 */
  67  000a 725f5242      	clr	21058
  68                     ; 63   UART2->CR1 = UART2_CR1_RESET_VALUE; /*  Set UART2_CR1 to reset value 0x00  */
  70  000e 725f5244      	clr	21060
  71                     ; 64   UART2->CR2 = UART2_CR2_RESET_VALUE; /*  Set UART2_CR2 to reset value 0x00  */
  73  0012 725f5245      	clr	21061
  74                     ; 65   UART2->CR3 = UART2_CR3_RESET_VALUE; /*  Set UART2_CR3 to reset value 0x00  */
  76  0016 725f5246      	clr	21062
  77                     ; 66   UART2->CR4 = UART2_CR4_RESET_VALUE; /*  Set UART2_CR4 to reset value 0x00  */
  79  001a 725f5247      	clr	21063
  80                     ; 67   UART2->CR5 = UART2_CR5_RESET_VALUE; /*  Set UART2_CR5 to reset value 0x00  */
  82  001e 725f5248      	clr	21064
  83                     ; 68   UART2->CR6 = UART2_CR6_RESET_VALUE; /*  Set UART2_CR6 to reset value 0x00  */
  85  0022 725f5249      	clr	21065
  86                     ; 69 }
  89  0026 81            	ret	
 400                     .const:	section	.text
 401  0000               L41:
 402  0000 00000064      	dc.l	100
 403                     ; 85 void UART2_Init(uint32_t BaudRate, UART2_WordLength_TypeDef WordLength, UART2_StopBits_TypeDef StopBits, UART2_Parity_TypeDef Parity, UART2_SyncMode_TypeDef SyncMode, UART2_Mode_TypeDef Mode)
 403                     ; 86 {
 404                     .text:	section	.text,new
 405  0000               _UART2_Init:
 407  0000 520e          	subw	sp,#14
 408       0000000e      OFST:	set	14
 411                     ; 87   uint8_t BRR2_1 = 0, BRR2_2 = 0;
 415                     ; 88   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 419                     ; 91   assert_param(IS_UART2_BAUDRATE_OK(BaudRate));
 421                     ; 92   assert_param(IS_UART2_WORDLENGTH_OK(WordLength));
 423                     ; 93   assert_param(IS_UART2_STOPBITS_OK(StopBits));
 425                     ; 94   assert_param(IS_UART2_PARITY_OK(Parity));
 427                     ; 95   assert_param(IS_UART2_MODE_OK((uint8_t)Mode));
 429                     ; 96   assert_param(IS_UART2_SYNCMODE_OK((uint8_t)SyncMode));
 431                     ; 99   UART2->CR1 &= (uint8_t)(~UART2_CR1_M);
 433  0002 72195244      	bres	21060,#4
 434                     ; 101   UART2->CR1 |= (uint8_t)WordLength; 
 436  0006 c65244        	ld	a,21060
 437  0009 1a15          	or	a,(OFST+7,sp)
 438  000b c75244        	ld	21060,a
 439                     ; 104   UART2->CR3 &= (uint8_t)(~UART2_CR3_STOP);
 441  000e c65246        	ld	a,21062
 442  0011 a4cf          	and	a,#207
 443  0013 c75246        	ld	21062,a
 444                     ; 106   UART2->CR3 |= (uint8_t)StopBits; 
 446  0016 c65246        	ld	a,21062
 447  0019 1a16          	or	a,(OFST+8,sp)
 448  001b c75246        	ld	21062,a
 449                     ; 109   UART2->CR1 &= (uint8_t)(~(UART2_CR1_PCEN | UART2_CR1_PS  ));
 451  001e c65244        	ld	a,21060
 452  0021 a4f9          	and	a,#249
 453  0023 c75244        	ld	21060,a
 454                     ; 111   UART2->CR1 |= (uint8_t)Parity;
 456  0026 c65244        	ld	a,21060
 457  0029 1a17          	or	a,(OFST+9,sp)
 458  002b c75244        	ld	21060,a
 459                     ; 114   UART2->BRR1 &= (uint8_t)(~UART2_BRR1_DIVM);
 461  002e 725f5242      	clr	21058
 462                     ; 116   UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVM);
 464  0032 c65243        	ld	a,21059
 465  0035 a40f          	and	a,#15
 466  0037 c75243        	ld	21059,a
 467                     ; 118   UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVF);
 469  003a c65243        	ld	a,21059
 470  003d a4f0          	and	a,#240
 471  003f c75243        	ld	21059,a
 472                     ; 121   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 474  0042 96            	ldw	x,sp
 475  0043 cd0107        	call	LC001
 477  0046 96            	ldw	x,sp
 478  0047 5c            	incw	x
 479  0048 cd0000        	call	c_rtol
 482  004b cd0000        	call	_CLK_GetClockFreq
 484  004e 96            	ldw	x,sp
 485  004f 5c            	incw	x
 486  0050 cd0000        	call	c_ludv
 488  0053 96            	ldw	x,sp
 489  0054 1c000b        	addw	x,#OFST-3
 490  0057 cd0000        	call	c_rtol
 493                     ; 122   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 495  005a 96            	ldw	x,sp
 496  005b cd0107        	call	LC001
 498  005e 96            	ldw	x,sp
 499  005f 5c            	incw	x
 500  0060 cd0000        	call	c_rtol
 503  0063 cd0000        	call	_CLK_GetClockFreq
 505  0066 a664          	ld	a,#100
 506  0068 cd0000        	call	c_smul
 508  006b 96            	ldw	x,sp
 509  006c 5c            	incw	x
 510  006d cd0000        	call	c_ludv
 512  0070 96            	ldw	x,sp
 513  0071 1c0007        	addw	x,#OFST-7
 514  0074 cd0000        	call	c_rtol
 517                     ; 126   BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 517                     ; 127                                 << 4) / 100) & (uint8_t)0x0F); 
 519  0077 96            	ldw	x,sp
 520  0078 1c000b        	addw	x,#OFST-3
 521  007b cd0000        	call	c_ltor
 523  007e a664          	ld	a,#100
 524  0080 cd0000        	call	c_smul
 526  0083 96            	ldw	x,sp
 527  0084 5c            	incw	x
 528  0085 cd0000        	call	c_rtol
 531  0088 96            	ldw	x,sp
 532  0089 1c0007        	addw	x,#OFST-7
 533  008c cd0000        	call	c_ltor
 535  008f 96            	ldw	x,sp
 536  0090 5c            	incw	x
 537  0091 cd0000        	call	c_lsub
 539  0094 a604          	ld	a,#4
 540  0096 cd0000        	call	c_llsh
 542  0099 ae0000        	ldw	x,#L41
 543  009c cd0000        	call	c_ludv
 545  009f b603          	ld	a,c_lreg+3
 546  00a1 a40f          	and	a,#15
 547  00a3 6b05          	ld	(OFST-9,sp),a
 549                     ; 128   BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 551  00a5 1e0d          	ldw	x,(OFST-1,sp)
 552  00a7 54            	srlw	x
 553  00a8 54            	srlw	x
 554  00a9 54            	srlw	x
 555  00aa 54            	srlw	x
 556  00ab 01            	rrwa	x,a
 557  00ac a4f0          	and	a,#240
 558  00ae 6b06          	ld	(OFST-8,sp),a
 560                     ; 130   UART2->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 562  00b0 1a05          	or	a,(OFST-9,sp)
 563  00b2 c75243        	ld	21059,a
 564                     ; 132   UART2->BRR1 = (uint8_t)BaudRate_Mantissa;           
 566  00b5 7b0e          	ld	a,(OFST+0,sp)
 567  00b7 c75242        	ld	21058,a
 568                     ; 135   UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
 570  00ba c65245        	ld	a,21061
 571  00bd a4f3          	and	a,#243
 572  00bf c75245        	ld	21061,a
 573                     ; 137   UART2->CR3 &= (uint8_t)~(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL);
 575  00c2 c65246        	ld	a,21062
 576  00c5 a4f8          	and	a,#248
 577  00c7 c75246        	ld	21062,a
 578                     ; 139   UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART2_CR3_CPOL | \
 578                     ; 140     UART2_CR3_CPHA | UART2_CR3_LBCL));
 580  00ca 7b18          	ld	a,(OFST+10,sp)
 581  00cc a407          	and	a,#7
 582  00ce ca5246        	or	a,21062
 583  00d1 c75246        	ld	21062,a
 584                     ; 142   if ((uint8_t)(Mode & UART2_MODE_TX_ENABLE))
 586  00d4 7b19          	ld	a,(OFST+11,sp)
 587  00d6 a504          	bcp	a,#4
 588  00d8 2706          	jreq	L171
 589                     ; 145     UART2->CR2 |= (uint8_t)UART2_CR2_TEN;
 591  00da 72165245      	bset	21061,#3
 593  00de 2004          	jra	L371
 594  00e0               L171:
 595                     ; 150     UART2->CR2 &= (uint8_t)(~UART2_CR2_TEN);
 597  00e0 72175245      	bres	21061,#3
 598  00e4               L371:
 599                     ; 152   if ((uint8_t)(Mode & UART2_MODE_RX_ENABLE))
 601  00e4 a508          	bcp	a,#8
 602  00e6 2706          	jreq	L571
 603                     ; 155     UART2->CR2 |= (uint8_t)UART2_CR2_REN;
 605  00e8 72145245      	bset	21061,#2
 607  00ec 2004          	jra	L771
 608  00ee               L571:
 609                     ; 160     UART2->CR2 &= (uint8_t)(~UART2_CR2_REN);
 611  00ee 72155245      	bres	21061,#2
 612  00f2               L771:
 613                     ; 164   if ((uint8_t)(SyncMode & UART2_SYNCMODE_CLOCK_DISABLE))
 615  00f2 7b18          	ld	a,(OFST+10,sp)
 616  00f4 2a06          	jrpl	L102
 617                     ; 167     UART2->CR3 &= (uint8_t)(~UART2_CR3_CKEN); 
 619  00f6 72175246      	bres	21062,#3
 621  00fa 2008          	jra	L302
 622  00fc               L102:
 623                     ; 171     UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & UART2_CR3_CKEN);
 625  00fc a408          	and	a,#8
 626  00fe ca5246        	or	a,21062
 627  0101 c75246        	ld	21062,a
 628  0104               L302:
 629                     ; 173 }
 632  0104 5b0e          	addw	sp,#14
 633  0106 81            	ret	
 634  0107               LC001:
 635  0107 1c0011        	addw	x,#OFST+3
 636  010a cd0000        	call	c_ltor
 638  010d a604          	ld	a,#4
 639  010f cc0000        	jp	c_llsh
 694                     ; 181 void UART2_Cmd(FunctionalState NewState)
 694                     ; 182 {
 695                     .text:	section	.text,new
 696  0000               _UART2_Cmd:
 700                     ; 183   if (NewState != DISABLE)
 702  0000 4d            	tnz	a
 703  0001 2705          	jreq	L332
 704                     ; 186     UART2->CR1 &= (uint8_t)(~UART2_CR1_UARTD);
 706  0003 721b5244      	bres	21060,#5
 709  0007 81            	ret	
 710  0008               L332:
 711                     ; 191     UART2->CR1 |= UART2_CR1_UARTD; 
 713  0008 721a5244      	bset	21060,#5
 714                     ; 193 }
 717  000c 81            	ret	
 845                     ; 210 void UART2_ITConfig(UART2_IT_TypeDef UART2_IT, FunctionalState NewState)
 845                     ; 211 {
 846                     .text:	section	.text,new
 847  0000               _UART2_ITConfig:
 849  0000 89            	pushw	x
 850  0001 89            	pushw	x
 851       00000002      OFST:	set	2
 854                     ; 212   uint8_t uartreg = 0, itpos = 0x00;
 858                     ; 215   assert_param(IS_UART2_CONFIG_IT_OK(UART2_IT));
 860                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 862                     ; 219   uartreg = (uint8_t)((uint16_t)UART2_IT >> 0x08);
 864  0002 9e            	ld	a,xh
 865  0003 6b01          	ld	(OFST-1,sp),a
 867                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
 869  0005 9f            	ld	a,xl
 870  0006 a40f          	and	a,#15
 871  0008 5f            	clrw	x
 872  0009 97            	ld	xl,a
 873  000a a601          	ld	a,#1
 874  000c 5d            	tnzw	x
 875  000d 2704          	jreq	L22
 876  000f               L42:
 877  000f 48            	sll	a
 878  0010 5a            	decw	x
 879  0011 26fc          	jrne	L42
 880  0013               L22:
 881  0013 6b02          	ld	(OFST+0,sp),a
 883                     ; 224   if (NewState != DISABLE)
 885  0015 7b07          	ld	a,(OFST+5,sp)
 886  0017 272a          	jreq	L313
 887                     ; 227     if (uartreg == 0x01)
 889  0019 7b01          	ld	a,(OFST-1,sp)
 890  001b a101          	cp	a,#1
 891  001d 2607          	jrne	L513
 892                     ; 229       UART2->CR1 |= itpos;
 894  001f c65244        	ld	a,21060
 895  0022 1a02          	or	a,(OFST+0,sp)
 897  0024 2029          	jp	LC004
 898  0026               L513:
 899                     ; 231     else if (uartreg == 0x02)
 901  0026 a102          	cp	a,#2
 902  0028 2607          	jrne	L123
 903                     ; 233       UART2->CR2 |= itpos;
 905  002a c65245        	ld	a,21061
 906  002d 1a02          	or	a,(OFST+0,sp)
 908  002f 202d          	jp	LC003
 909  0031               L123:
 910                     ; 235     else if (uartreg == 0x03)
 912  0031 a103          	cp	a,#3
 913  0033 2607          	jrne	L523
 914                     ; 237       UART2->CR4 |= itpos;
 916  0035 c65247        	ld	a,21063
 917  0038 1a02          	or	a,(OFST+0,sp)
 919  003a 2031          	jp	LC005
 920  003c               L523:
 921                     ; 241       UART2->CR6 |= itpos;
 923  003c c65249        	ld	a,21065
 924  003f 1a02          	or	a,(OFST+0,sp)
 925  0041 2035          	jp	LC002
 926  0043               L313:
 927                     ; 247     if (uartreg == 0x01)
 929  0043 7b01          	ld	a,(OFST-1,sp)
 930  0045 a101          	cp	a,#1
 931  0047 260b          	jrne	L333
 932                     ; 249       UART2->CR1 &= (uint8_t)(~itpos);
 934  0049 7b02          	ld	a,(OFST+0,sp)
 935  004b 43            	cpl	a
 936  004c c45244        	and	a,21060
 937  004f               LC004:
 938  004f c75244        	ld	21060,a
 940  0052 2027          	jra	L133
 941  0054               L333:
 942                     ; 251     else if (uartreg == 0x02)
 944  0054 a102          	cp	a,#2
 945  0056 260b          	jrne	L733
 946                     ; 253       UART2->CR2 &= (uint8_t)(~itpos);
 948  0058 7b02          	ld	a,(OFST+0,sp)
 949  005a 43            	cpl	a
 950  005b c45245        	and	a,21061
 951  005e               LC003:
 952  005e c75245        	ld	21061,a
 954  0061 2018          	jra	L133
 955  0063               L733:
 956                     ; 255     else if (uartreg == 0x03)
 958  0063 a103          	cp	a,#3
 959  0065 260b          	jrne	L343
 960                     ; 257       UART2->CR4 &= (uint8_t)(~itpos);
 962  0067 7b02          	ld	a,(OFST+0,sp)
 963  0069 43            	cpl	a
 964  006a c45247        	and	a,21063
 965  006d               LC005:
 966  006d c75247        	ld	21063,a
 968  0070 2009          	jra	L133
 969  0072               L343:
 970                     ; 261       UART2->CR6 &= (uint8_t)(~itpos);
 972  0072 7b02          	ld	a,(OFST+0,sp)
 973  0074 43            	cpl	a
 974  0075 c45249        	and	a,21065
 975  0078               LC002:
 976  0078 c75249        	ld	21065,a
 977  007b               L133:
 978                     ; 264 }
 981  007b 5b04          	addw	sp,#4
 982  007d 81            	ret	
1039                     ; 272 void UART2_IrDAConfig(UART2_IrDAMode_TypeDef UART2_IrDAMode)
1039                     ; 273 {
1040                     .text:	section	.text,new
1041  0000               _UART2_IrDAConfig:
1045                     ; 274   assert_param(IS_UART2_IRDAMODE_OK(UART2_IrDAMode));
1047                     ; 276   if (UART2_IrDAMode != UART2_IRDAMODE_NORMAL)
1049  0000 4d            	tnz	a
1050  0001 2705          	jreq	L573
1051                     ; 278     UART2->CR5 |= UART2_CR5_IRLP;
1053  0003 72145248      	bset	21064,#2
1056  0007 81            	ret	
1057  0008               L573:
1058                     ; 282     UART2->CR5 &= ((uint8_t)~UART2_CR5_IRLP);
1060  0008 72155248      	bres	21064,#2
1061                     ; 284 }
1064  000c 81            	ret	
1099                     ; 292 void UART2_IrDACmd(FunctionalState NewState)
1099                     ; 293 {
1100                     .text:	section	.text,new
1101  0000               _UART2_IrDACmd:
1105                     ; 295   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1107                     ; 297   if (NewState != DISABLE)
1109  0000 4d            	tnz	a
1110  0001 2705          	jreq	L714
1111                     ; 300     UART2->CR5 |= UART2_CR5_IREN;
1113  0003 72125248      	bset	21064,#1
1116  0007 81            	ret	
1117  0008               L714:
1118                     ; 305     UART2->CR5 &= ((uint8_t)~UART2_CR5_IREN);
1120  0008 72135248      	bres	21064,#1
1121                     ; 307 }
1124  000c 81            	ret	
1183                     ; 316 void UART2_LINBreakDetectionConfig(UART2_LINBreakDetectionLength_TypeDef UART2_LINBreakDetectionLength)
1183                     ; 317 {
1184                     .text:	section	.text,new
1185  0000               _UART2_LINBreakDetectionConfig:
1189                     ; 319   assert_param(IS_UART2_LINBREAKDETECTIONLENGTH_OK(UART2_LINBreakDetectionLength));
1191                     ; 321   if (UART2_LINBreakDetectionLength != UART2_LINBREAKDETECTIONLENGTH_10BITS)
1193  0000 4d            	tnz	a
1194  0001 2705          	jreq	L154
1195                     ; 323     UART2->CR4 |= UART2_CR4_LBDL;
1197  0003 721a5247      	bset	21063,#5
1200  0007 81            	ret	
1201  0008               L154:
1202                     ; 327     UART2->CR4 &= ((uint8_t)~UART2_CR4_LBDL);
1204  0008 721b5247      	bres	21063,#5
1205                     ; 329 }
1208  000c 81            	ret	
1329                     ; 341 void UART2_LINConfig(UART2_LinMode_TypeDef UART2_Mode, 
1329                     ; 342                      UART2_LinAutosync_TypeDef UART2_Autosync, 
1329                     ; 343                      UART2_LinDivUp_TypeDef UART2_DivUp)
1329                     ; 344 {
1330                     .text:	section	.text,new
1331  0000               _UART2_LINConfig:
1333  0000 89            	pushw	x
1334       00000000      OFST:	set	0
1337                     ; 346   assert_param(IS_UART2_SLAVE_OK(UART2_Mode));
1339                     ; 347   assert_param(IS_UART2_AUTOSYNC_OK(UART2_Autosync));
1341                     ; 348   assert_param(IS_UART2_DIVUP_OK(UART2_DivUp));
1343                     ; 350   if (UART2_Mode != UART2_LIN_MODE_MASTER)
1345  0001 9e            	ld	a,xh
1346  0002 4d            	tnz	a
1347  0003 2706          	jreq	L335
1348                     ; 352     UART2->CR6 |=  UART2_CR6_LSLV;
1350  0005 721a5249      	bset	21065,#5
1352  0009 2004          	jra	L535
1353  000b               L335:
1354                     ; 356     UART2->CR6 &= ((uint8_t)~UART2_CR6_LSLV);
1356  000b 721b5249      	bres	21065,#5
1357  000f               L535:
1358                     ; 359   if (UART2_Autosync != UART2_LIN_AUTOSYNC_DISABLE)
1360  000f 7b02          	ld	a,(OFST+2,sp)
1361  0011 2706          	jreq	L735
1362                     ; 361     UART2->CR6 |=  UART2_CR6_LASE ;
1364  0013 72185249      	bset	21065,#4
1366  0017 2004          	jra	L145
1367  0019               L735:
1368                     ; 365     UART2->CR6 &= ((uint8_t)~ UART2_CR6_LASE );
1370  0019 72195249      	bres	21065,#4
1371  001d               L145:
1372                     ; 368   if (UART2_DivUp != UART2_LIN_DIVUP_LBRR1)
1374  001d 7b05          	ld	a,(OFST+5,sp)
1375  001f 2706          	jreq	L345
1376                     ; 370     UART2->CR6 |=  UART2_CR6_LDUM;
1378  0021 721e5249      	bset	21065,#7
1380  0025 2004          	jra	L545
1381  0027               L345:
1382                     ; 374     UART2->CR6 &= ((uint8_t)~ UART2_CR6_LDUM);
1384  0027 721f5249      	bres	21065,#7
1385  002b               L545:
1386                     ; 376 }
1389  002b 85            	popw	x
1390  002c 81            	ret	
1425                     ; 384 void UART2_LINCmd(FunctionalState NewState)
1425                     ; 385 {
1426                     .text:	section	.text,new
1427  0000               _UART2_LINCmd:
1431                     ; 386   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1433                     ; 388   if (NewState != DISABLE)
1435  0000 4d            	tnz	a
1436  0001 2705          	jreq	L565
1437                     ; 391     UART2->CR3 |= UART2_CR3_LINEN;
1439  0003 721c5246      	bset	21062,#6
1442  0007 81            	ret	
1443  0008               L565:
1444                     ; 396     UART2->CR3 &= ((uint8_t)~UART2_CR3_LINEN);
1446  0008 721d5246      	bres	21062,#6
1447                     ; 398 }
1450  000c 81            	ret	
1485                     ; 406 void UART2_SmartCardCmd(FunctionalState NewState)
1485                     ; 407 {
1486                     .text:	section	.text,new
1487  0000               _UART2_SmartCardCmd:
1491                     ; 409   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1493                     ; 411   if (NewState != DISABLE)
1495  0000 4d            	tnz	a
1496  0001 2705          	jreq	L706
1497                     ; 414     UART2->CR5 |= UART2_CR5_SCEN;
1499  0003 721a5248      	bset	21064,#5
1502  0007 81            	ret	
1503  0008               L706:
1504                     ; 419     UART2->CR5 &= ((uint8_t)(~UART2_CR5_SCEN));
1506  0008 721b5248      	bres	21064,#5
1507                     ; 421 }
1510  000c 81            	ret	
1546                     ; 429 void UART2_SmartCardNACKCmd(FunctionalState NewState)
1546                     ; 430 {
1547                     .text:	section	.text,new
1548  0000               _UART2_SmartCardNACKCmd:
1552                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1554                     ; 434   if (NewState != DISABLE)
1556  0000 4d            	tnz	a
1557  0001 2705          	jreq	L136
1558                     ; 437     UART2->CR5 |= UART2_CR5_NACK;
1560  0003 72185248      	bset	21064,#4
1563  0007 81            	ret	
1564  0008               L136:
1565                     ; 442     UART2->CR5 &= ((uint8_t)~(UART2_CR5_NACK));
1567  0008 72195248      	bres	21064,#4
1568                     ; 444 }
1571  000c 81            	ret	
1628                     ; 452 void UART2_WakeUpConfig(UART2_WakeUp_TypeDef UART2_WakeUp)
1628                     ; 453 {
1629                     .text:	section	.text,new
1630  0000               _UART2_WakeUpConfig:
1634                     ; 454   assert_param(IS_UART2_WAKEUP_OK(UART2_WakeUp));
1636                     ; 456   UART2->CR1 &= ((uint8_t)~UART2_CR1_WAKE);
1638  0000 72175244      	bres	21060,#3
1639                     ; 457   UART2->CR1 |= (uint8_t)UART2_WakeUp;
1641  0004 ca5244        	or	a,21060
1642  0007 c75244        	ld	21060,a
1643                     ; 458 }
1646  000a 81            	ret	
1682                     ; 466 void UART2_ReceiverWakeUpCmd(FunctionalState NewState)
1682                     ; 467 {
1683                     .text:	section	.text,new
1684  0000               _UART2_ReceiverWakeUpCmd:
1688                     ; 468   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1690                     ; 470   if (NewState != DISABLE)
1692  0000 4d            	tnz	a
1693  0001 2705          	jreq	L107
1694                     ; 473     UART2->CR2 |= UART2_CR2_RWU;
1696  0003 72125245      	bset	21061,#1
1699  0007 81            	ret	
1700  0008               L107:
1701                     ; 478     UART2->CR2 &= ((uint8_t)~UART2_CR2_RWU);
1703  0008 72135245      	bres	21061,#1
1704                     ; 480 }
1707  000c 81            	ret	
1730                     ; 487 uint8_t UART2_ReceiveData8(void)
1730                     ; 488 {
1731                     .text:	section	.text,new
1732  0000               _UART2_ReceiveData8:
1736                     ; 489   return ((uint8_t)UART2->DR);
1738  0000 c65241        	ld	a,21057
1741  0003 81            	ret	
1773                     ; 497 uint16_t UART2_ReceiveData9(void)
1773                     ; 498 {
1774                     .text:	section	.text,new
1775  0000               _UART2_ReceiveData9:
1777  0000 89            	pushw	x
1778       00000002      OFST:	set	2
1781                     ; 499   uint16_t temp = 0;
1783                     ; 501   temp = ((uint16_t)(((uint16_t)((uint16_t)UART2->CR1 & (uint16_t)UART2_CR1_R8)) << 1));
1785  0001 c65244        	ld	a,21060
1786  0004 a480          	and	a,#128
1787  0006 5f            	clrw	x
1788  0007 02            	rlwa	x,a
1789  0008 58            	sllw	x
1790  0009 1f01          	ldw	(OFST-1,sp),x
1792                     ; 503   return (uint16_t)((((uint16_t)UART2->DR) | temp) & ((uint16_t)0x01FF));
1794  000b c65241        	ld	a,21057
1795  000e 5f            	clrw	x
1796  000f 97            	ld	xl,a
1797  0010 01            	rrwa	x,a
1798  0011 1a02          	or	a,(OFST+0,sp)
1799  0013 01            	rrwa	x,a
1800  0014 1a01          	or	a,(OFST-1,sp)
1801  0016 a401          	and	a,#1
1802  0018 01            	rrwa	x,a
1805  0019 5b02          	addw	sp,#2
1806  001b 81            	ret	
1838                     ; 511 void UART2_SendData8(uint8_t Data)
1838                     ; 512 {
1839                     .text:	section	.text,new
1840  0000               _UART2_SendData8:
1844                     ; 514   UART2->DR = Data;
1846  0000 c75241        	ld	21057,a
1847                     ; 515 }
1850  0003 81            	ret	
1882                     ; 522 void UART2_SendData9(uint16_t Data)
1882                     ; 523 {
1883                     .text:	section	.text,new
1884  0000               _UART2_SendData9:
1886  0000 89            	pushw	x
1887       00000000      OFST:	set	0
1890                     ; 525   UART2->CR1 &= ((uint8_t)~UART2_CR1_T8);                  
1892  0001 721d5244      	bres	21060,#6
1893                     ; 528   UART2->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART2_CR1_T8); 
1895  0005 54            	srlw	x
1896  0006 54            	srlw	x
1897  0007 9f            	ld	a,xl
1898  0008 a440          	and	a,#64
1899  000a ca5244        	or	a,21060
1900  000d c75244        	ld	21060,a
1901                     ; 531   UART2->DR   = (uint8_t)(Data);                    
1903  0010 7b02          	ld	a,(OFST+2,sp)
1904  0012 c75241        	ld	21057,a
1905                     ; 532 }
1908  0015 85            	popw	x
1909  0016 81            	ret	
1932                     ; 539 void UART2_SendBreak(void)
1932                     ; 540 {
1933                     .text:	section	.text,new
1934  0000               _UART2_SendBreak:
1938                     ; 541   UART2->CR2 |= UART2_CR2_SBK;
1940  0000 72105245      	bset	21061,#0
1941                     ; 542 }
1944  0004 81            	ret	
1976                     ; 549 void UART2_SetAddress(uint8_t UART2_Address)
1976                     ; 550 {
1977                     .text:	section	.text,new
1978  0000               _UART2_SetAddress:
1980  0000 88            	push	a
1981       00000000      OFST:	set	0
1984                     ; 552   assert_param(IS_UART2_ADDRESS_OK(UART2_Address));
1986                     ; 555   UART2->CR4 &= ((uint8_t)~UART2_CR4_ADD);
1988  0001 c65247        	ld	a,21063
1989  0004 a4f0          	and	a,#240
1990  0006 c75247        	ld	21063,a
1991                     ; 557   UART2->CR4 |= UART2_Address;
1993  0009 c65247        	ld	a,21063
1994  000c 1a01          	or	a,(OFST+1,sp)
1995  000e c75247        	ld	21063,a
1996                     ; 558 }
1999  0011 84            	pop	a
2000  0012 81            	ret	
2032                     ; 566 void UART2_SetGuardTime(uint8_t UART2_GuardTime)
2032                     ; 567 {
2033                     .text:	section	.text,new
2034  0000               _UART2_SetGuardTime:
2038                     ; 569   UART2->GTR = UART2_GuardTime;
2040  0000 c7524a        	ld	21066,a
2041                     ; 570 }
2044  0003 81            	ret	
2076                     ; 594 void UART2_SetPrescaler(uint8_t UART2_Prescaler)
2076                     ; 595 {
2077                     .text:	section	.text,new
2078  0000               _UART2_SetPrescaler:
2082                     ; 597   UART2->PSCR = UART2_Prescaler;
2084  0000 c7524b        	ld	21067,a
2085                     ; 598 }
2088  0003 81            	ret	
2245                     ; 606 FlagStatus UART2_GetFlagStatus(UART2_Flag_TypeDef UART2_FLAG)
2245                     ; 607 {
2246                     .text:	section	.text,new
2247  0000               _UART2_GetFlagStatus:
2249  0000 89            	pushw	x
2250  0001 88            	push	a
2251       00000001      OFST:	set	1
2254                     ; 608   FlagStatus status = RESET;
2256                     ; 611   assert_param(IS_UART2_FLAG_OK(UART2_FLAG));
2258                     ; 614   if (UART2_FLAG == UART2_FLAG_LBDF)
2260  0002 a30210        	cpw	x,#528
2261  0005 2608          	jrne	L3211
2262                     ; 616     if ((UART2->CR4 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2264  0007 9f            	ld	a,xl
2265  0008 c45247        	and	a,21063
2266  000b 2726          	jreq	L1311
2267                     ; 619       status = SET;
2269  000d 201f          	jp	LC008
2270                     ; 624       status = RESET;
2271  000f               L3211:
2272                     ; 627   else if (UART2_FLAG == UART2_FLAG_SBK)
2274  000f a30101        	cpw	x,#257
2275  0012 2609          	jrne	L3311
2276                     ; 629     if ((UART2->CR2 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2278  0014 c65245        	ld	a,21061
2279  0017 1503          	bcp	a,(OFST+2,sp)
2280  0019 2717          	jreq	L7411
2281                     ; 632       status = SET;
2283  001b 2011          	jp	LC008
2284                     ; 637       status = RESET;
2285  001d               L3311:
2286                     ; 640   else if ((UART2_FLAG == UART2_FLAG_LHDF) || (UART2_FLAG == UART2_FLAG_LSF))
2288  001d a30302        	cpw	x,#770
2289  0020 2705          	jreq	L5411
2291  0022 a30301        	cpw	x,#769
2292  0025 260f          	jrne	L3411
2293  0027               L5411:
2294                     ; 642     if ((UART2->CR6 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2296  0027 c65249        	ld	a,21065
2297  002a 1503          	bcp	a,(OFST+2,sp)
2298  002c 2704          	jreq	L7411
2299                     ; 645       status = SET;
2301  002e               LC008:
2305  002e a601          	ld	a,#1
2309  0030 2001          	jra	L1311
2310  0032               L7411:
2311                     ; 650       status = RESET;
2315  0032 4f            	clr	a
2317  0033               L1311:
2318                     ; 668   return  status;
2322  0033 5b03          	addw	sp,#3
2323  0035 81            	ret	
2324  0036               L3411:
2325                     ; 655     if ((UART2->SR & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2327  0036 c65240        	ld	a,21056
2328  0039 1503          	bcp	a,(OFST+2,sp)
2329  003b 27f5          	jreq	L7411
2330                     ; 658       status = SET;
2332  003d 20ef          	jp	LC008
2333                     ; 663       status = RESET;
2368                     ; 699 void UART2_ClearFlag(UART2_Flag_TypeDef UART2_FLAG)
2368                     ; 700 {
2369                     .text:	section	.text,new
2370  0000               _UART2_ClearFlag:
2372       00000000      OFST:	set	0
2375                     ; 701   assert_param(IS_UART2_CLEAR_FLAG_OK(UART2_FLAG));
2377                     ; 704   if (UART2_FLAG == UART2_FLAG_RXNE)
2379  0000 a30020        	cpw	x,#32
2380  0003 2605          	jrne	L7711
2381                     ; 706     UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2383  0005 35df5240      	mov	21056,#223
2386  0009 81            	ret	
2387  000a               L7711:
2388                     ; 709   else if (UART2_FLAG == UART2_FLAG_LBDF)
2390  000a a30210        	cpw	x,#528
2391  000d 2605          	jrne	L3021
2392                     ; 711     UART2->CR4 &= (uint8_t)(~UART2_CR4_LBDF);
2394  000f 72195247      	bres	21063,#4
2397  0013 81            	ret	
2398  0014               L3021:
2399                     ; 714   else if (UART2_FLAG == UART2_FLAG_LHDF)
2401  0014 a30302        	cpw	x,#770
2402  0017 2605          	jrne	L7021
2403                     ; 716     UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2405  0019 72135249      	bres	21065,#1
2408  001d 81            	ret	
2409  001e               L7021:
2410                     ; 721     UART2->CR6 &= (uint8_t)(~UART2_CR6_LSF);
2412  001e 72115249      	bres	21065,#0
2413                     ; 723 }
2416  0022 81            	ret	
2490                     ; 738 ITStatus UART2_GetITStatus(UART2_IT_TypeDef UART2_IT)
2490                     ; 739 {
2491                     .text:	section	.text,new
2492  0000               _UART2_GetITStatus:
2494  0000 89            	pushw	x
2495  0001 89            	pushw	x
2496       00000002      OFST:	set	2
2499                     ; 740   ITStatus pendingbitstatus = RESET;
2501                     ; 741   uint8_t itpos = 0;
2503                     ; 742   uint8_t itmask1 = 0;
2505                     ; 743   uint8_t itmask2 = 0;
2507                     ; 744   uint8_t enablestatus = 0;
2509                     ; 747   assert_param(IS_UART2_GET_IT_OK(UART2_IT));
2511                     ; 750   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
2513  0002 9f            	ld	a,xl
2514  0003 a40f          	and	a,#15
2515  0005 5f            	clrw	x
2516  0006 97            	ld	xl,a
2517  0007 a601          	ld	a,#1
2518  0009 5d            	tnzw	x
2519  000a 2704          	jreq	L67
2520  000c               L001:
2521  000c 48            	sll	a
2522  000d 5a            	decw	x
2523  000e 26fc          	jrne	L001
2524  0010               L67:
2525  0010 6b01          	ld	(OFST-1,sp),a
2527                     ; 752   itmask1 = (uint8_t)((uint8_t)UART2_IT >> (uint8_t)4);
2529  0012 7b04          	ld	a,(OFST+2,sp)
2530  0014 4e            	swap	a
2531  0015 a40f          	and	a,#15
2532  0017 6b02          	ld	(OFST+0,sp),a
2534                     ; 754   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2536  0019 5f            	clrw	x
2537  001a 97            	ld	xl,a
2538  001b a601          	ld	a,#1
2539  001d 5d            	tnzw	x
2540  001e 2704          	jreq	L201
2541  0020               L401:
2542  0020 48            	sll	a
2543  0021 5a            	decw	x
2544  0022 26fc          	jrne	L401
2545  0024               L201:
2546  0024 6b02          	ld	(OFST+0,sp),a
2548                     ; 757   if (UART2_IT == UART2_IT_PE)
2550  0026 1e03          	ldw	x,(OFST+1,sp)
2551  0028 a30100        	cpw	x,#256
2552  002b 260c          	jrne	L5421
2553                     ; 760     enablestatus = (uint8_t)((uint8_t)UART2->CR1 & itmask2);
2555  002d c65244        	ld	a,21060
2556  0030 1402          	and	a,(OFST+0,sp)
2557  0032 6b02          	ld	(OFST+0,sp),a
2559                     ; 763     if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
2561  0034 c65240        	ld	a,21056
2563                     ; 766       pendingbitstatus = SET;
2565  0037 2020          	jp	LC011
2566                     ; 771       pendingbitstatus = RESET;
2567  0039               L5421:
2568                     ; 774   else if (UART2_IT == UART2_IT_LBDF)
2570  0039 a30346        	cpw	x,#838
2571  003c 260c          	jrne	L5521
2572                     ; 777     enablestatus = (uint8_t)((uint8_t)UART2->CR4 & itmask2);
2574  003e c65247        	ld	a,21063
2575  0041 1402          	and	a,(OFST+0,sp)
2576  0043 6b02          	ld	(OFST+0,sp),a
2578                     ; 779     if (((UART2->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2580  0045 c65247        	ld	a,21063
2582                     ; 782       pendingbitstatus = SET;
2584  0048 200f          	jp	LC011
2585                     ; 787       pendingbitstatus = RESET;
2586  004a               L5521:
2587                     ; 790   else if (UART2_IT == UART2_IT_LHDF)
2589  004a a30412        	cpw	x,#1042
2590  004d 2616          	jrne	L5621
2591                     ; 793     enablestatus = (uint8_t)((uint8_t)UART2->CR6 & itmask2);
2593  004f c65249        	ld	a,21065
2594  0052 1402          	and	a,(OFST+0,sp)
2595  0054 6b02          	ld	(OFST+0,sp),a
2597                     ; 795     if (((UART2->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
2599  0056 c65249        	ld	a,21065
2601  0059               LC011:
2602  0059 1501          	bcp	a,(OFST-1,sp)
2603  005b 271a          	jreq	L5721
2604  005d 7b02          	ld	a,(OFST+0,sp)
2605  005f 2716          	jreq	L5721
2606                     ; 798       pendingbitstatus = SET;
2608  0061               LC010:
2612  0061 a601          	ld	a,#1
2615  0063 2013          	jra	L3521
2616                     ; 803       pendingbitstatus = RESET;
2617  0065               L5621:
2618                     ; 809     enablestatus = (uint8_t)((uint8_t)UART2->CR2 & itmask2);
2620  0065 c65245        	ld	a,21061
2621  0068 1402          	and	a,(OFST+0,sp)
2622  006a 6b02          	ld	(OFST+0,sp),a
2624                     ; 811     if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
2626  006c c65240        	ld	a,21056
2627  006f 1501          	bcp	a,(OFST-1,sp)
2628  0071 2704          	jreq	L5721
2630  0073 7b02          	ld	a,(OFST+0,sp)
2631                     ; 814       pendingbitstatus = SET;
2633  0075 26ea          	jrne	LC010
2634  0077               L5721:
2635                     ; 819       pendingbitstatus = RESET;
2640  0077 4f            	clr	a
2642  0078               L3521:
2643                     ; 823   return  pendingbitstatus;
2647  0078 5b04          	addw	sp,#4
2648  007a 81            	ret	
2684                     ; 852 void UART2_ClearITPendingBit(UART2_IT_TypeDef UART2_IT)
2684                     ; 853 {
2685                     .text:	section	.text,new
2686  0000               _UART2_ClearITPendingBit:
2688       00000000      OFST:	set	0
2691                     ; 854   assert_param(IS_UART2_CLEAR_IT_OK(UART2_IT));
2693                     ; 857   if (UART2_IT == UART2_IT_RXNE)
2695  0000 a30255        	cpw	x,#597
2696  0003 2605          	jrne	L7131
2697                     ; 859     UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2699  0005 35df5240      	mov	21056,#223
2702  0009 81            	ret	
2703  000a               L7131:
2704                     ; 862   else if (UART2_IT == UART2_IT_LBDF)
2706  000a a30346        	cpw	x,#838
2707  000d 2605          	jrne	L3231
2708                     ; 864     UART2->CR4 &= (uint8_t)~(UART2_CR4_LBDF);
2710  000f 72195247      	bres	21063,#4
2713  0013 81            	ret	
2714  0014               L3231:
2715                     ; 869     UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2717  0014 72135249      	bres	21065,#1
2718                     ; 871 }
2721  0018 81            	ret	
2734                     	xdef	_UART2_ClearITPendingBit
2735                     	xdef	_UART2_GetITStatus
2736                     	xdef	_UART2_ClearFlag
2737                     	xdef	_UART2_GetFlagStatus
2738                     	xdef	_UART2_SetPrescaler
2739                     	xdef	_UART2_SetGuardTime
2740                     	xdef	_UART2_SetAddress
2741                     	xdef	_UART2_SendBreak
2742                     	xdef	_UART2_SendData9
2743                     	xdef	_UART2_SendData8
2744                     	xdef	_UART2_ReceiveData9
2745                     	xdef	_UART2_ReceiveData8
2746                     	xdef	_UART2_ReceiverWakeUpCmd
2747                     	xdef	_UART2_WakeUpConfig
2748                     	xdef	_UART2_SmartCardNACKCmd
2749                     	xdef	_UART2_SmartCardCmd
2750                     	xdef	_UART2_LINCmd
2751                     	xdef	_UART2_LINConfig
2752                     	xdef	_UART2_LINBreakDetectionConfig
2753                     	xdef	_UART2_IrDACmd
2754                     	xdef	_UART2_IrDAConfig
2755                     	xdef	_UART2_ITConfig
2756                     	xdef	_UART2_Cmd
2757                     	xdef	_UART2_Init
2758                     	xdef	_UART2_DeInit
2759                     	xref	_CLK_GetClockFreq
2760                     	xref.b	c_lreg
2761                     	xref.b	c_x
2780                     	xref	c_lsub
2781                     	xref	c_smul
2782                     	xref	c_ludv
2783                     	xref	c_rtol
2784                     	xref	c_llsh
2785                     	xref	c_ltor
2786                     	end
