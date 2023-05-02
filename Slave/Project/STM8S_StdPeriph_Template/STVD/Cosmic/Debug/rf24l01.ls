   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.8 - 08 Nov 2022
   3                     ; Generator (Limited) V4.5.5 - 08 Nov 2022
   4                     ; Optimizer V4.5.5 - 08 Nov 2022
  50                     ; 3 void CS_Select (void) {
  52                     .text:	section	.text,new
  53  0000               _CS_Select:
  57                     ; 4 	GPIO_WriteLow(CS_PORT, CS_PIN);
  59  0000 4b10          	push	#16
  60  0002 ae500a        	ldw	x,#20490
  61  0005 cd0000        	call	_GPIO_WriteLow
  63  0008 84            	pop	a
  64                     ; 5 }
  67  0009 81            	ret	
  91                     ; 6 void CS_UnSelect (void) {
  92                     .text:	section	.text,new
  93  0000               _CS_UnSelect:
  97                     ; 7 	GPIO_WriteHigh(CS_PORT, CS_PIN);
  99  0000 4b10          	push	#16
 100  0002 ae500a        	ldw	x,#20490
 101  0005 cd0000        	call	_GPIO_WriteHigh
 103  0008 84            	pop	a
 104                     ; 8 }
 107  0009 81            	ret	
 131                     ; 9 void CE_Enable (void) {
 132                     .text:	section	.text,new
 133  0000               _CE_Enable:
 137                     ; 10 	GPIO_WriteHigh(CE_PORT, CE_PIN);
 139  0000 4b08          	push	#8
 140  0002 ae500a        	ldw	x,#20490
 141  0005 cd0000        	call	_GPIO_WriteHigh
 143  0008 84            	pop	a
 144                     ; 11 }
 147  0009 81            	ret	
 171                     ; 12 void CE_Disable (void)
 171                     ; 13 {
 172                     .text:	section	.text,new
 173  0000               _CE_Disable:
 177                     ; 14 	GPIO_WriteLow(CE_PORT, CE_PIN);
 179  0000 4b08          	push	#8
 180  0002 ae500a        	ldw	x,#20490
 181  0005 cd0000        	call	_GPIO_WriteLow
 183  0008 84            	pop	a
 184                     ; 15 }
 187  0009 81            	ret	
 225                     ; 17 void RF24L01_send_command(uint8_t command) {
 226                     .text:	section	.text,new
 227  0000               _RF24L01_send_command:
 229  0000 88            	push	a
 230       00000000      OFST:	set	0
 233                     ; 18   CS_Select();
 235  0001 cd0000        	call	_CS_Select
 238  0004               L76:
 239                     ; 20 	while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET);
 241  0004 a602          	ld	a,#2
 242  0006 cd0000        	call	_SPI_GetFlagStatus
 244  0009 4d            	tnz	a
 245  000a 27f8          	jreq	L76
 246                     ; 21   SPI_SendData(command);
 248  000c 7b01          	ld	a,(OFST+1,sp)
 249  000e cd0000        	call	_SPI_SendData
 252  0011               L57:
 253                     ; 22   while (SPI_GetFlagStatus(SPI_FLAG_BSY)== SET);
 255  0011 a680          	ld	a,#128
 256  0013 cd0000        	call	_SPI_GetFlagStatus
 258  0016 4a            	dec	a
 259  0017 27f8          	jreq	L57
 261  0019               L301:
 262                     ; 23   while (SPI_GetFlagStatus(SPI_FLAG_RXNE)== RESET);
 264  0019 a601          	ld	a,#1
 265  001b cd0000        	call	_SPI_GetFlagStatus
 267  001e 4d            	tnz	a
 268  001f 27f8          	jreq	L301
 269                     ; 24   SPI_ReceiveData();
 271  0021 cd0000        	call	_SPI_ReceiveData
 273                     ; 26   CS_UnSelect();
 275  0024 cd0000        	call	_CS_UnSelect
 277                     ; 27 }
 280  0027 84            	pop	a
 281  0028 81            	ret	
 343                     ; 29 void RF24L01_write_register(uint8_t register_addr, uint8_t *value, uint8_t length) {
 344                     .text:	section	.text,new
 345  0000               _RF24L01_write_register:
 347  0000 88            	push	a
 348  0001 88            	push	a
 349       00000001      OFST:	set	1
 352                     ; 31 	CS_Select();
 354  0002 cd0000        	call	_CS_Select
 357  0005               L531:
 358                     ; 33   while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET);
 360  0005 a602          	ld	a,#2
 361  0007 cd0000        	call	_SPI_GetFlagStatus
 363  000a 4d            	tnz	a
 364  000b 27f8          	jreq	L531
 365                     ; 34   SPI_SendData(RF24L01_command_W_REGISTER | register_addr);
 367  000d 7b02          	ld	a,(OFST+1,sp)
 368  000f aa20          	or	a,#32
 369  0011 cd0000        	call	_SPI_SendData
 372  0014               L341:
 373                     ; 35   while (SPI_GetFlagStatus(SPI_FLAG_BSY)== SET);
 375  0014 a680          	ld	a,#128
 376  0016 cd0000        	call	_SPI_GetFlagStatus
 378  0019 4a            	dec	a
 379  001a 27f8          	jreq	L341
 381  001c               L151:
 382                     ; 36   while (SPI_GetFlagStatus(SPI_FLAG_RXNE)== RESET);
 384  001c a601          	ld	a,#1
 385  001e cd0000        	call	_SPI_GetFlagStatus
 387  0021 4d            	tnz	a
 388  0022 27f8          	jreq	L151
 389                     ; 37   SPI_ReceiveData();
 391  0024 cd0000        	call	_SPI_ReceiveData
 393                     ; 39   for (i=0; i<length; i++) {
 395  0027 0f01          	clr	(OFST+0,sp)
 398  0029 2028          	jra	L161
 399  002b               L761:
 400                     ; 40     while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET);
 402  002b a602          	ld	a,#2
 403  002d cd0000        	call	_SPI_GetFlagStatus
 405  0030 4d            	tnz	a
 406  0031 27f8          	jreq	L761
 407                     ; 41     SPI_SendData(value[i]);
 409  0033 7b01          	ld	a,(OFST+0,sp)
 410  0035 5f            	clrw	x
 411  0036 97            	ld	xl,a
 412  0037 72fb05        	addw	x,(OFST+4,sp)
 413  003a f6            	ld	a,(x)
 414  003b cd0000        	call	_SPI_SendData
 417  003e               L571:
 418                     ; 42     while (SPI_GetFlagStatus(SPI_FLAG_BSY)== SET);
 420  003e a680          	ld	a,#128
 421  0040 cd0000        	call	_SPI_GetFlagStatus
 423  0043 4a            	dec	a
 424  0044 27f8          	jreq	L571
 426  0046               L302:
 427                     ; 43     while (SPI_GetFlagStatus(SPI_FLAG_RXNE)== RESET);
 429  0046 a601          	ld	a,#1
 430  0048 cd0000        	call	_SPI_GetFlagStatus
 432  004b 4d            	tnz	a
 433  004c 27f8          	jreq	L302
 434                     ; 44     SPI_ReceiveData();
 436  004e cd0000        	call	_SPI_ReceiveData
 438                     ; 39   for (i=0; i<length; i++) {
 440  0051 0c01          	inc	(OFST+0,sp)
 442  0053               L161:
 445  0053 7b01          	ld	a,(OFST+0,sp)
 446  0055 1107          	cp	a,(OFST+6,sp)
 447  0057 25d2          	jrult	L761
 448                     ; 47   CS_UnSelect();
 450  0059 cd0000        	call	_CS_UnSelect
 452                     ; 48 }
 455  005c 85            	popw	x
 456  005d 81            	ret	
 501                     ; 50 uint8_t RF24L01_read_register(uint8_t register_addr) {
 502                     .text:	section	.text,new
 503  0000               _RF24L01_read_register:
 505  0000 88            	push	a
 506  0001 88            	push	a
 507       00000001      OFST:	set	1
 510                     ; 52 	CS_Select();
 512  0002 cd0000        	call	_CS_Select
 515  0005               L722:
 516                     ; 54   while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET);
 518  0005 a602          	ld	a,#2
 519  0007 cd0000        	call	_SPI_GetFlagStatus
 521  000a 4d            	tnz	a
 522  000b 27f8          	jreq	L722
 523                     ; 55   SPI_SendData(RF24L01_command_R_REGISTER | register_addr);
 525  000d 7b02          	ld	a,(OFST+1,sp)
 526  000f cd0000        	call	_SPI_SendData
 529  0012               L532:
 530                     ; 56   while (SPI_GetFlagStatus(SPI_FLAG_BSY)== SET);
 532  0012 a680          	ld	a,#128
 533  0014 cd0000        	call	_SPI_GetFlagStatus
 535  0017 4a            	dec	a
 536  0018 27f8          	jreq	L532
 538  001a               L342:
 539                     ; 57   while (SPI_GetFlagStatus(SPI_FLAG_RXNE)== RESET);
 541  001a a601          	ld	a,#1
 542  001c cd0000        	call	_SPI_GetFlagStatus
 544  001f 4d            	tnz	a
 545  0020 27f8          	jreq	L342
 546                     ; 58   SPI_ReceiveData();
 548  0022 cd0000        	call	_SPI_ReceiveData
 551  0025               L152:
 552                     ; 60 	while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET);
 554  0025 a602          	ld	a,#2
 555  0027 cd0000        	call	_SPI_GetFlagStatus
 557  002a 4d            	tnz	a
 558  002b 27f8          	jreq	L152
 559                     ; 61 	SPI_SendData(0x00);
 561  002d 4f            	clr	a
 562  002e cd0000        	call	_SPI_SendData
 565  0031               L752:
 566                     ; 62 	while (SPI_GetFlagStatus(SPI_FLAG_BSY)== SET);
 568  0031 a680          	ld	a,#128
 569  0033 cd0000        	call	_SPI_GetFlagStatus
 571  0036 4a            	dec	a
 572  0037 27f8          	jreq	L752
 574  0039               L562:
 575                     ; 63 	while (SPI_GetFlagStatus(SPI_FLAG_RXNE)== RESET);
 577  0039 a601          	ld	a,#1
 578  003b cd0000        	call	_SPI_GetFlagStatus
 580  003e 4d            	tnz	a
 581  003f 27f8          	jreq	L562
 582                     ; 64 	result = SPI_ReceiveData();
 584  0041 cd0000        	call	_SPI_ReceiveData
 586  0044 6b01          	ld	(OFST+0,sp),a
 588                     ; 66   CS_UnSelect();
 590  0046 cd0000        	call	_CS_UnSelect
 592                     ; 67   return result;
 594  0049 7b01          	ld	a,(OFST+0,sp)
 597  004b 85            	popw	x
 598  004c 81            	ret	
 660                     ; 70 void RF24L01_read_register_multi(uint8_t register_addr, uint8_t *value, uint8_t length) {
 661                     .text:	section	.text,new
 662  0000               _RF24L01_read_register_multi:
 664  0000 88            	push	a
 665  0001 88            	push	a
 666       00000001      OFST:	set	1
 669                     ; 72 	CS_Select();
 671  0002 cd0000        	call	_CS_Select
 674  0005               L713:
 675                     ; 74   while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET);
 677  0005 a602          	ld	a,#2
 678  0007 cd0000        	call	_SPI_GetFlagStatus
 680  000a 4d            	tnz	a
 681  000b 27f8          	jreq	L713
 682                     ; 75   SPI_SendData(RF24L01_command_R_REGISTER | register_addr);
 684  000d 7b02          	ld	a,(OFST+1,sp)
 685  000f cd0000        	call	_SPI_SendData
 688  0012               L523:
 689                     ; 76   while (SPI_GetFlagStatus(SPI_FLAG_BSY)== SET);
 691  0012 a680          	ld	a,#128
 692  0014 cd0000        	call	_SPI_GetFlagStatus
 694  0017 4a            	dec	a
 695  0018 27f8          	jreq	L523
 697  001a               L333:
 698                     ; 77   while (SPI_GetFlagStatus(SPI_FLAG_RXNE)== RESET);
 700  001a a601          	ld	a,#1
 701  001c cd0000        	call	_SPI_GetFlagStatus
 703  001f 4d            	tnz	a
 704  0020 27f8          	jreq	L333
 705                     ; 78   SPI_ReceiveData();
 707  0022 cd0000        	call	_SPI_ReceiveData
 709                     ; 80   for (i=0; i<length; i++) {
 711  0025 0f01          	clr	(OFST+0,sp)
 714  0027 202b          	jra	L343
 715  0029               L153:
 716                     ; 81     while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET);
 718  0029 a602          	ld	a,#2
 719  002b cd0000        	call	_SPI_GetFlagStatus
 721  002e 4d            	tnz	a
 722  002f 27f8          	jreq	L153
 723                     ; 82     SPI_SendData(0x00);
 725  0031 4f            	clr	a
 726  0032 cd0000        	call	_SPI_SendData
 729  0035               L753:
 730                     ; 83     while (SPI_GetFlagStatus(SPI_FLAG_BSY)== SET);
 732  0035 a680          	ld	a,#128
 733  0037 cd0000        	call	_SPI_GetFlagStatus
 735  003a 4a            	dec	a
 736  003b 27f8          	jreq	L753
 738  003d               L563:
 739                     ; 84     while (SPI_GetFlagStatus(SPI_FLAG_RXNE)== RESET);
 741  003d a601          	ld	a,#1
 742  003f cd0000        	call	_SPI_GetFlagStatus
 744  0042 4d            	tnz	a
 745  0043 27f8          	jreq	L563
 746                     ; 85     value[i] = SPI_ReceiveData();
 748  0045 7b01          	ld	a,(OFST+0,sp)
 749  0047 5f            	clrw	x
 750  0048 97            	ld	xl,a
 751  0049 72fb05        	addw	x,(OFST+4,sp)
 752  004c 89            	pushw	x
 753  004d cd0000        	call	_SPI_ReceiveData
 755  0050 85            	popw	x
 756  0051 f7            	ld	(x),a
 757                     ; 80   for (i=0; i<length; i++) {
 759  0052 0c01          	inc	(OFST+0,sp)
 761  0054               L343:
 764  0054 7b01          	ld	a,(OFST+0,sp)
 765  0056 1107          	cp	a,(OFST+6,sp)
 766  0058 25cf          	jrult	L153
 767                     ; 88   CS_UnSelect();
 769  005a cd0000        	call	_CS_UnSelect
 771                     ; 89 }
 774  005d 85            	popw	x
 775  005e 81            	ret	
 818                     ; 91 void RF24L01_init(void) {
 819                     .text:	section	.text,new
 820  0000               _RF24L01_init:
 822  0000 88            	push	a
 823       00000001      OFST:	set	1
 826                     ; 95   GPIO_Init(CS_PORT, CS_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
 828  0001 4bf0          	push	#240
 829  0003 4b10          	push	#16
 830  0005 ae500a        	ldw	x,#20490
 831  0008 cd0000        	call	_GPIO_Init
 833  000b 85            	popw	x
 834                     ; 96   GPIO_WriteHigh(CS_PORT, CS_PIN);
 836  000c 4b10          	push	#16
 837  000e ae500a        	ldw	x,#20490
 838  0011 cd0000        	call	_GPIO_WriteHigh
 840  0014 84            	pop	a
 841                     ; 98   GPIO_Init(CE_PORT, CE_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
 843  0015 4bf0          	push	#240
 844  0017 4b08          	push	#8
 845  0019 ae500a        	ldw	x,#20490
 846  001c cd0000        	call	_GPIO_Init
 848  001f 85            	popw	x
 849                     ; 99   GPIO_WriteLow(CE_PORT, CE_PIN);
 851  0020 4b08          	push	#8
 852  0022 ae500a        	ldw	x,#20490
 853  0025 cd0000        	call	_GPIO_WriteLow
 855  0028 84            	pop	a
 856                     ; 101   GPIO_ExternalPullUpConfig(GPIOC, GPIO_PIN_6 | GPIO_PIN_5 | GPIO_PIN_7, ENABLE);
 858  0029 4b01          	push	#1
 859  002b 4be0          	push	#224
 860  002d ae500a        	ldw	x,#20490
 861  0030 cd0000        	call	_GPIO_ExternalPullUpConfig
 863  0033 85            	popw	x
 864                     ; 104 	SPI_DeInit();
 866  0034 cd0000        	call	_SPI_DeInit
 868                     ; 105   SPI_Init(SPI_FIRSTBIT_MSB,
 868                     ; 106 		SPI_BAUDRATEPRESCALER_2,
 868                     ; 107 		SPI_MODE_MASTER,
 868                     ; 108 		SPI_CLOCKPOLARITY_LOW,
 868                     ; 109 		SPI_CLOCKPHASE_1EDGE,
 868                     ; 110 		SPI_DATADIRECTION_2LINES_FULLDUPLEX,
 868                     ; 111 		SPI_NSS_SOFT,
 868                     ; 112 		(uint8_t)0x07 // frame format - data size=8 bits
 868                     ; 113   );
 870  0037 4b07          	push	#7
 871  0039 4b02          	push	#2
 872  003b 4b00          	push	#0
 873  003d 4b00          	push	#0
 874  003f 4b00          	push	#0
 875  0041 4b04          	push	#4
 876  0043 5f            	clrw	x
 877  0044 cd0000        	call	_SPI_Init
 879  0047 5b06          	addw	sp,#6
 880                     ; 114   SPI_Cmd(ENABLE);
 882  0049 a601          	ld	a,#1
 883  004b cd0000        	call	_SPI_Cmd
 885                     ; 117 	CE_Disable();
 887  004e cd0000        	call	_CE_Disable
 889                     ; 119 	RF24L01_reset(0);
 891  0051 4f            	clr	a
 892  0052 cd0000        	call	_RF24L01_reset
 894                     ; 121 	reg_write = 0;
 896  0055 0f01          	clr	(OFST+0,sp)
 898                     ; 122   RF24L01_write_register(RF24L01_reg_CONFIG, &reg_write, 1);
 900  0057 4b01          	push	#1
 901  0059 96            	ldw	x,sp
 902  005a 1c0002        	addw	x,#OFST+1
 903  005d 89            	pushw	x
 904  005e 4f            	clr	a
 905  005f cd0000        	call	_RF24L01_write_register
 907  0062 5b03          	addw	sp,#3
 908                     ; 124 	reg_write = 0;
 910  0064 0f01          	clr	(OFST+0,sp)
 912                     ; 125   RF24L01_write_register(RF24L01_reg_EN_AA, &reg_write, 1);
 914  0066 4b01          	push	#1
 915  0068 96            	ldw	x,sp
 916  0069 1c0002        	addw	x,#OFST+1
 917  006c 89            	pushw	x
 918  006d a601          	ld	a,#1
 919  006f cd0000        	call	_RF24L01_write_register
 921  0072 5b03          	addw	sp,#3
 922                     ; 127 	reg_write = 0;
 924  0074 0f01          	clr	(OFST+0,sp)
 926                     ; 128   RF24L01_write_register(RF24L01_reg_EN_RXADDR, &reg_write, 1);
 928  0076 4b01          	push	#1
 929  0078 96            	ldw	x,sp
 930  0079 1c0002        	addw	x,#OFST+1
 931  007c 89            	pushw	x
 932  007d a602          	ld	a,#2
 933  007f cd0000        	call	_RF24L01_write_register
 935  0082 5b03          	addw	sp,#3
 936                     ; 130   reg_write = 0x03; // 5 bytes for TX/RX address
 938  0084 a603          	ld	a,#3
 939  0086 6b01          	ld	(OFST+0,sp),a
 941                     ; 131   RF24L01_write_register(RF24L01_reg_SETUP_AW, &reg_write, 1);
 943  0088 4b01          	push	#1
 944  008a 96            	ldw	x,sp
 945  008b 1c0002        	addw	x,#OFST+1
 946  008e 89            	pushw	x
 947  008f cd0000        	call	_RF24L01_write_register
 949  0092 5b03          	addw	sp,#3
 950                     ; 133 	reg_write = 0;
 952  0094 0f01          	clr	(OFST+0,sp)
 954                     ; 134   RF24L01_write_register(RF24L01_reg_SETUP_RETR, &reg_write, 1);
 956  0096 4b01          	push	#1
 957  0098 96            	ldw	x,sp
 958  0099 1c0002        	addw	x,#OFST+1
 959  009c 89            	pushw	x
 960  009d a604          	ld	a,#4
 961  009f cd0000        	call	_RF24L01_write_register
 963  00a2 5b03          	addw	sp,#3
 964                     ; 136   reg_write = 0;
 966  00a4 0f01          	clr	(OFST+0,sp)
 968                     ; 137   RF24L01_write_register(RF24L01_reg_RF_CH, &reg_write, 1);
 970  00a6 4b01          	push	#1
 971  00a8 96            	ldw	x,sp
 972  00a9 1c0002        	addw	x,#OFST+1
 973  00ac 89            	pushw	x
 974  00ad a605          	ld	a,#5
 975  00af cd0000        	call	_RF24L01_write_register
 977  00b2 5b03          	addw	sp,#3
 978                     ; 139   reg_write = 0x0E;
 980  00b4 a60e          	ld	a,#14
 981  00b6 6b01          	ld	(OFST+0,sp),a
 983                     ; 142   RF24L01_write_register(RF24L01_reg_RF_SETUP, &reg_write, 1);
 985  00b8 4b01          	push	#1
 986  00ba 96            	ldw	x,sp
 987  00bb 1c0002        	addw	x,#OFST+1
 988  00be 89            	pushw	x
 989  00bf a606          	ld	a,#6
 990  00c1 cd0000        	call	_RF24L01_write_register
 992  00c4 5b03          	addw	sp,#3
 993                     ; 144 	CE_Enable();
 995  00c6 cd0000        	call	_CE_Enable
 997                     ; 145 }
1000  00c9 84            	pop	a
1001  00ca 81            	ret	
1055                     ; 147 void RF24L01_set_mode_TX(uint8_t *tx_addr, uint8_t channel) {
1056                     .text:	section	.text,new
1057  0000               _RF24L01_set_mode_TX:
1059  0000 89            	pushw	x
1060  0001 88            	push	a
1061       00000001      OFST:	set	1
1064                     ; 150 	CE_Disable();
1066  0002 cd0000        	call	_CE_Disable
1068                     ; 152 	reg_write = channel;
1070  0005 7b06          	ld	a,(OFST+5,sp)
1071  0007 6b01          	ld	(OFST+0,sp),a
1073                     ; 153   RF24L01_write_register(RF24L01_reg_RF_CH, &reg_write, 1);
1075  0009 4b01          	push	#1
1076  000b 96            	ldw	x,sp
1077  000c 1c0002        	addw	x,#OFST+1
1078  000f 89            	pushw	x
1079  0010 a605          	ld	a,#5
1080  0012 cd0000        	call	_RF24L01_write_register
1082  0015 5b03          	addw	sp,#3
1083                     ; 155 	RF24L01_write_register(RF24L01_reg_TX_ADDR, tx_addr, 5);
1085  0017 4b05          	push	#5
1086  0019 1e03          	ldw	x,(OFST+2,sp)
1087  001b 89            	pushw	x
1088  001c a610          	ld	a,#16
1089  001e cd0000        	call	_RF24L01_write_register
1091  0021 5b03          	addw	sp,#3
1092                     ; 158 	reg_write = RF24L01_read_register(RF24L01_reg_CONFIG);
1094  0023 4f            	clr	a
1095  0024 cd0000        	call	_RF24L01_read_register
1098                     ; 159   reg_write = reg_write | (1<<1);    // write 1 in the PWR_UP, and all other bits are masked
1100  0027 aa02          	or	a,#2
1101  0029 6b01          	ld	(OFST+0,sp),a
1103                     ; 161 	RF24L01_write_register(RF24L01_reg_CONFIG, &reg_write, 1);
1105  002b 4b01          	push	#1
1106  002d 96            	ldw	x,sp
1107  002e 1c0002        	addw	x,#OFST+1
1108  0031 89            	pushw	x
1109  0032 4f            	clr	a
1110  0033 cd0000        	call	_RF24L01_write_register
1112  0036 5b03          	addw	sp,#3
1113                     ; 163 	CE_Enable();	
1115  0038 cd0000        	call	_CE_Enable
1117                     ; 164 }
1120  003b 5b03          	addw	sp,#3
1121  003d 81            	ret	
1187                     ; 166 uint8_t RF24L01_write_payload(uint8_t *data, uint8_t length) {
1188                     .text:	section	.text,new
1189  0000               _RF24L01_write_payload:
1191  0000 89            	pushw	x
1192  0001 88            	push	a
1193       00000001      OFST:	set	1
1196                     ; 170 	CS_Select();
1198  0002 cd0000        	call	_CS_Select
1201  0005               L554:
1202                     ; 172   while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET);
1204  0005 a602          	ld	a,#2
1205  0007 cd0000        	call	_SPI_GetFlagStatus
1207  000a 4d            	tnz	a
1208  000b 27f8          	jreq	L554
1209                     ; 173   SPI_SendData(RF24L01_command_W_TX_PAYLOAD);
1211  000d a6a0          	ld	a,#160
1212  000f cd0000        	call	_SPI_SendData
1215  0012               L364:
1216                     ; 174   while (SPI_GetFlagStatus(SPI_FLAG_BSY)== SET);
1218  0012 a680          	ld	a,#128
1219  0014 cd0000        	call	_SPI_GetFlagStatus
1221  0017 4a            	dec	a
1222  0018 27f8          	jreq	L364
1224  001a               L174:
1225                     ; 175   while (SPI_GetFlagStatus(SPI_FLAG_RXNE)== RESET);
1227  001a a601          	ld	a,#1
1228  001c cd0000        	call	_SPI_GetFlagStatus
1230  001f 4d            	tnz	a
1231  0020 27f8          	jreq	L174
1232                     ; 176   SPI_ReceiveData();
1234  0022 cd0000        	call	_SPI_ReceiveData
1236                     ; 178   for (i=0; i<length; i++) {
1238  0025 0f01          	clr	(OFST+0,sp)
1241  0027 2028          	jra	L105
1242  0029               L705:
1243                     ; 179     while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET);
1245  0029 a602          	ld	a,#2
1246  002b cd0000        	call	_SPI_GetFlagStatus
1248  002e 4d            	tnz	a
1249  002f 27f8          	jreq	L705
1250                     ; 180     SPI_SendData(data[i]);
1252  0031 7b01          	ld	a,(OFST+0,sp)
1253  0033 5f            	clrw	x
1254  0034 97            	ld	xl,a
1255  0035 72fb02        	addw	x,(OFST+1,sp)
1256  0038 f6            	ld	a,(x)
1257  0039 cd0000        	call	_SPI_SendData
1260  003c               L515:
1261                     ; 181     while (SPI_GetFlagStatus(SPI_FLAG_BSY)== SET);
1263  003c a680          	ld	a,#128
1264  003e cd0000        	call	_SPI_GetFlagStatus
1266  0041 4a            	dec	a
1267  0042 27f8          	jreq	L515
1269  0044               L325:
1270                     ; 182     while (SPI_GetFlagStatus(SPI_FLAG_RXNE)== RESET);
1272  0044 a601          	ld	a,#1
1273  0046 cd0000        	call	_SPI_GetFlagStatus
1275  0049 4d            	tnz	a
1276  004a 27f8          	jreq	L325
1277                     ; 183     SPI_ReceiveData();
1279  004c cd0000        	call	_SPI_ReceiveData
1281                     ; 178   for (i=0; i<length; i++) {
1283  004f 0c01          	inc	(OFST+0,sp)
1285  0051               L105:
1288  0051 7b01          	ld	a,(OFST+0,sp)
1289  0053 1106          	cp	a,(OFST+5,sp)
1290  0055 25d2          	jrult	L705
1291                     ; 186 	CS_UnSelect();
1293  0057 cd0000        	call	_CS_UnSelect
1295                     ; 188 	delay_ms(1);
1297  005a ae0001        	ldw	x,#1
1298  005d cd0000        	call	_delay_ms
1300                     ; 190   FIFO_STATUS = RF24L01_read_register(RF24L01_reg_FIFO_STATUS);
1302  0060 a617          	ld	a,#23
1303  0062 cd0000        	call	_RF24L01_read_register
1305  0065 6b01          	ld	(OFST+0,sp),a
1307                     ; 192 	if ((FIFO_STATUS&(1<<4)) && (!(FIFO_STATUS&(1<<3))))
1309  0067 a510          	bcp	a,#16
1310  0069 2712          	jreq	L725
1312  006b a508          	bcp	a,#8
1313  006d 260e          	jrne	L725
1314                     ; 194 		RF24L01_send_command(RF24L01_command_FLUSH_TX);
1316  006f a6e1          	ld	a,#225
1317  0071 cd0000        	call	_RF24L01_send_command
1319                     ; 195 		RF24L01_reset(RF24L01_reg_FIFO_STATUS);
1321  0074 a617          	ld	a,#23
1322  0076 cd0000        	call	_RF24L01_reset
1324                     ; 196 		return 1;
1326  0079 a601          	ld	a,#1
1328  007b 2001          	jra	L013
1329  007d               L725:
1330                     ; 198   return 0;
1332  007d 4f            	clr	a
1334  007e               L013:
1336  007e 5b03          	addw	sp,#3
1337  0080 81            	ret	
1391                     ; 201 void RF24L01_set_mode_RX(uint8_t *rx_addr, uint8_t channel) {
1392                     .text:	section	.text,new
1393  0000               _RF24L01_set_mode_RX:
1395  0000 89            	pushw	x
1396  0001 88            	push	a
1397       00000001      OFST:	set	1
1400                     ; 204 	CE_Disable();
1402  0002 cd0000        	call	_CE_Disable
1404                     ; 206 	reg_write = channel;
1406  0005 7b06          	ld	a,(OFST+5,sp)
1407  0007 6b01          	ld	(OFST+0,sp),a
1409                     ; 207   RF24L01_write_register(RF24L01_reg_RF_CH, &reg_write, 1);
1411  0009 4b01          	push	#1
1412  000b 96            	ldw	x,sp
1413  000c 1c0002        	addw	x,#OFST+1
1414  000f 89            	pushw	x
1415  0010 a605          	ld	a,#5
1416  0012 cd0000        	call	_RF24L01_write_register
1418  0015 5b03          	addw	sp,#3
1419                     ; 210 	reg_write = RF24L01_read_register(RF24L01_reg_EN_RXADDR);
1421  0017 a602          	ld	a,#2
1422  0019 cd0000        	call	_RF24L01_read_register
1425                     ; 211 	reg_write = reg_write | (1<<1); // pipe1
1427  001c aa02          	or	a,#2
1428  001e 6b01          	ld	(OFST+0,sp),a
1430                     ; 213 	RF24L01_write_register(RF24L01_reg_EN_RXADDR, &reg_write, 1);
1432  0020 4b01          	push	#1
1433  0022 96            	ldw	x,sp
1434  0023 1c0002        	addw	x,#OFST+1
1435  0026 89            	pushw	x
1436  0027 a602          	ld	a,#2
1437  0029 cd0000        	call	_RF24L01_write_register
1439  002c 5b03          	addw	sp,#3
1440                     ; 223   RF24L01_write_register(RF24L01_reg_RX_ADDR_P1, rx_addr, 5);
1442  002e 4b05          	push	#5
1443  0030 1e03          	ldw	x,(OFST+2,sp)
1444  0032 89            	pushw	x
1445  0033 a60b          	ld	a,#11
1446  0035 cd0000        	call	_RF24L01_write_register
1448  0038 5b03          	addw	sp,#3
1449                     ; 227   reg_write = 32;
1451  003a a620          	ld	a,#32
1452  003c 6b01          	ld	(OFST+0,sp),a
1454                     ; 228 	RF24L01_write_register(RF24L01_reg_RX_PW_P1, &reg_write, 1);   // 32 bytes payload size for pipe 1
1456  003e 4b01          	push	#1
1457  0040 96            	ldw	x,sp
1458  0041 1c0002        	addw	x,#OFST+1
1459  0044 89            	pushw	x
1460  0045 a612          	ld	a,#18
1461  0047 cd0000        	call	_RF24L01_write_register
1463  004a 5b03          	addw	sp,#3
1464                     ; 232 	reg_write = RF24L01_read_register(RF24L01_reg_CONFIG);
1466  004c 4f            	clr	a
1467  004d cd0000        	call	_RF24L01_read_register
1470                     ; 233   reg_write = reg_write | (1<<1) | (1<<0);    // write 1 in the PWR_UP, and all other bits are masked
1472  0050 aa03          	or	a,#3
1473  0052 6b01          	ld	(OFST+0,sp),a
1475                     ; 234 	RF24L01_write_register(RF24L01_reg_CONFIG, &reg_write, 1);
1477  0054 4b01          	push	#1
1478  0056 96            	ldw	x,sp
1479  0057 1c0002        	addw	x,#OFST+1
1480  005a 89            	pushw	x
1481  005b 4f            	clr	a
1482  005c cd0000        	call	_RF24L01_write_register
1484  005f 5b03          	addw	sp,#3
1485                     ; 236 	CE_Enable();	
1487  0061 cd0000        	call	_CE_Enable
1489                     ; 237 }
1492  0064 5b03          	addw	sp,#3
1493  0066 81            	ret	
1550                     ; 239 void RF24L01_read_payload(uint8_t *data, uint8_t length) {
1551                     .text:	section	.text,new
1552  0000               _RF24L01_read_payload:
1554  0000 89            	pushw	x
1555  0001 88            	push	a
1556       00000001      OFST:	set	1
1559                     ; 242 	CS_Select();
1561  0002 cd0000        	call	_CS_Select
1564  0005               L775:
1565                     ; 244   while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET);
1567  0005 a602          	ld	a,#2
1568  0007 cd0000        	call	_SPI_GetFlagStatus
1570  000a 4d            	tnz	a
1571  000b 27f8          	jreq	L775
1572                     ; 245   SPI_SendData(RF24L01_command_R_RX_PAYLOAD);
1574  000d a661          	ld	a,#97
1575  000f cd0000        	call	_SPI_SendData
1578  0012               L506:
1579                     ; 246   while (SPI_GetFlagStatus(SPI_FLAG_BSY)== SET);
1581  0012 a680          	ld	a,#128
1582  0014 cd0000        	call	_SPI_GetFlagStatus
1584  0017 4a            	dec	a
1585  0018 27f8          	jreq	L506
1587  001a               L316:
1588                     ; 247   while (SPI_GetFlagStatus(SPI_FLAG_RXNE)== RESET);
1590  001a a601          	ld	a,#1
1591  001c cd0000        	call	_SPI_GetFlagStatus
1593  001f 4d            	tnz	a
1594  0020 27f8          	jreq	L316
1595                     ; 248   SPI_ReceiveData();
1597  0022 cd0000        	call	_SPI_ReceiveData
1599                     ; 250   for (i=0; i<length; i++) {
1601  0025 0f01          	clr	(OFST+0,sp)
1604  0027 202b          	jra	L326
1605  0029               L136:
1606                     ; 251     while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET);
1608  0029 a602          	ld	a,#2
1609  002b cd0000        	call	_SPI_GetFlagStatus
1611  002e 4d            	tnz	a
1612  002f 27f8          	jreq	L136
1613                     ; 252     SPI_SendData(0x00);
1615  0031 4f            	clr	a
1616  0032 cd0000        	call	_SPI_SendData
1619  0035               L736:
1620                     ; 253     while (SPI_GetFlagStatus(SPI_FLAG_BSY)== SET);
1622  0035 a680          	ld	a,#128
1623  0037 cd0000        	call	_SPI_GetFlagStatus
1625  003a 4a            	dec	a
1626  003b 27f8          	jreq	L736
1628  003d               L546:
1629                     ; 254     while (SPI_GetFlagStatus(SPI_FLAG_RXNE)== RESET);
1631  003d a601          	ld	a,#1
1632  003f cd0000        	call	_SPI_GetFlagStatus
1634  0042 4d            	tnz	a
1635  0043 27f8          	jreq	L546
1636                     ; 255     data[i] = SPI_ReceiveData();
1638  0045 7b01          	ld	a,(OFST+0,sp)
1639  0047 5f            	clrw	x
1640  0048 97            	ld	xl,a
1641  0049 72fb02        	addw	x,(OFST+1,sp)
1642  004c 89            	pushw	x
1643  004d cd0000        	call	_SPI_ReceiveData
1645  0050 85            	popw	x
1646  0051 f7            	ld	(x),a
1647                     ; 250   for (i=0; i<length; i++) {
1649  0052 0c01          	inc	(OFST+0,sp)
1651  0054               L326:
1654  0054 7b01          	ld	a,(OFST+0,sp)
1655  0056 1106          	cp	a,(OFST+5,sp)
1656  0058 25cf          	jrult	L136
1657                     ; 258 	CS_UnSelect();
1659  005a cd0000        	call	_CS_UnSelect
1661                     ; 260 	delay_ms(1);
1663  005d ae0001        	ldw	x,#1
1664  0060 cd0000        	call	_delay_ms
1666                     ; 262   RF24L01_send_command(RF24L01_command_FLUSH_RX);
1668  0063 a6e2          	ld	a,#226
1669  0065 cd0000        	call	_RF24L01_send_command
1671                     ; 263 }
1674  0068 5b03          	addw	sp,#3
1675  006a 81            	ret	
1717                     ; 265 uint8_t RF24L01_is_data_available(int pipenum) {
1718                     .text:	section	.text,new
1719  0000               _RF24L01_is_data_available:
1721  0000 89            	pushw	x
1722  0001 5203          	subw	sp,#3
1723       00000003      OFST:	set	3
1726                     ; 268   reg_write = RF24L01_read_register(RF24L01_reg_STATUS);
1728  0003 a607          	ld	a,#7
1729  0005 cd0000        	call	_RF24L01_read_register
1731  0008 6b03          	ld	(OFST+0,sp),a
1733                     ; 269 	if ((reg_write & (1<<6))&&(reg_write & (pipenum << 1))) {
1735  000a a540          	bcp	a,#64
1736  000c 2727          	jreq	L766
1738  000e 5f            	clrw	x
1739  000f 97            	ld	xl,a
1740  0010 1f01          	ldw	(OFST-2,sp),x
1742  0012 1e04          	ldw	x,(OFST+1,sp)
1743  0014 58            	sllw	x
1744  0015 01            	rrwa	x,a
1745  0016 1402          	and	a,(OFST-1,sp)
1746  0018 01            	rrwa	x,a
1747  0019 1401          	and	a,(OFST-2,sp)
1748  001b 01            	rrwa	x,a
1749  001c 5d            	tnzw	x
1750  001d 2716          	jreq	L766
1751                     ; 270 		reg_write = (1<<6);
1753  001f a640          	ld	a,#64
1754  0021 6b03          	ld	(OFST+0,sp),a
1756                     ; 271 		RF24L01_write_register(RF24L01_reg_STATUS, &reg_write, 1);
1758  0023 4b01          	push	#1
1759  0025 96            	ldw	x,sp
1760  0026 1c0004        	addw	x,#OFST+1
1761  0029 89            	pushw	x
1762  002a a607          	ld	a,#7
1763  002c cd0000        	call	_RF24L01_write_register
1765  002f 5b03          	addw	sp,#3
1766                     ; 272 		return 1;
1768  0031 a601          	ld	a,#1
1770  0033 2001          	jra	L204
1771  0035               L766:
1772                     ; 274 	return 0;
1774  0035 4f            	clr	a
1776  0036               L204:
1778  0036 5b05          	addw	sp,#5
1779  0038 81            	ret	
1782                     .const:	section	.text
1783  0000               L176_rx_addr_p0_def:
1784  0000 e7            	dc.b	231
1785  0001 e7            	dc.b	231
1786  0002 e7            	dc.b	231
1787  0003 e7            	dc.b	231
1788  0004 e7            	dc.b	231
1789  0005               L376_rx_addr_p1_def:
1790  0005 c2            	dc.b	194
1791  0006 c2            	dc.b	194
1792  0007 c2            	dc.b	194
1793  0008 c2            	dc.b	194
1794  0009 c2            	dc.b	194
1795  000a               L576_tx_addr_def:
1796  000a e7            	dc.b	231
1797  000b e7            	dc.b	231
1798  000c e7            	dc.b	231
1799  000d e7            	dc.b	231
1800  000e e7            	dc.b	231
1868                     ; 278 void RF24L01_reset(uint8_t REG) {
1869                     .text:	section	.text,new
1870  0000               _RF24L01_reset:
1872  0000 88            	push	a
1873  0001 5210          	subw	sp,#16
1874       00000010      OFST:	set	16
1877                     ; 280 	uint8_t rx_addr_p0_def[5] = {0xE7, 0xE7, 0xE7, 0xE7, 0xE7};
1879  0003 96            	ldw	x,sp
1880  0004 5c            	incw	x
1881  0005 90ae0000      	ldw	y,#L176_rx_addr_p0_def
1882  0009 a605          	ld	a,#5
1883  000b cd0000        	call	c_xymov
1885                     ; 281 	uint8_t rx_addr_p1_def[5] = {0xC2, 0xC2, 0xC2, 0xC2, 0xC2};
1887  000e 96            	ldw	x,sp
1888  000f 1c0006        	addw	x,#OFST-10
1889  0012 90ae0005      	ldw	y,#L376_rx_addr_p1_def
1890  0016 a605          	ld	a,#5
1891  0018 cd0000        	call	c_xymov
1893                     ; 282 	uint8_t tx_addr_def[5] = {0xE7, 0xE7, 0xE7, 0xE7, 0xE7};
1895  001b 96            	ldw	x,sp
1896  001c 1c000b        	addw	x,#OFST-5
1897  001f 90ae000a      	ldw	y,#L576_tx_addr_def
1898  0023 a605          	ld	a,#5
1899  0025 cd0000        	call	c_xymov
1901                     ; 284 	if (REG == RF24L01_reg_STATUS)
1903  0028 7b11          	ld	a,(OFST+1,sp)
1904  002a a107          	cp	a,#7
1905  002c 260e          	jrne	L137
1906                     ; 286     reg_write = 0x00;
1908  002e 0f10          	clr	(OFST+0,sp)
1910                     ; 287 		RF24L01_write_register(RF24L01_reg_STATUS, &reg_write, 1);
1912  0030 4b01          	push	#1
1913  0032 96            	ldw	x,sp
1914  0033 1c0011        	addw	x,#OFST+1
1915  0036 89            	pushw	x
1916  0037 a607          	ld	a,#7
1919  0039 cc01f9        	jra	L337
1920  003c               L137:
1921                     ; 289 	else if (REG == RF24L01_reg_FIFO_STATUS)
1923  003c a117          	cp	a,#23
1924  003e 2610          	jrne	L537
1925                     ; 291     reg_write = 0x11;
1927  0040 a611          	ld	a,#17
1928  0042 6b10          	ld	(OFST+0,sp),a
1930                     ; 292 		RF24L01_write_register(RF24L01_reg_FIFO_STATUS, &reg_write, 1);
1932  0044 4b01          	push	#1
1933  0046 96            	ldw	x,sp
1934  0047 1c0011        	addw	x,#OFST+1
1935  004a 89            	pushw	x
1936  004b a617          	ld	a,#23
1939  004d cc01f9        	jra	L337
1940  0050               L537:
1941                     ; 295     reg_write = 0x08;
1943  0050 a608          	ld	a,#8
1944  0052 6b10          	ld	(OFST+0,sp),a
1946                     ; 296 	  RF24L01_write_register(RF24L01_reg_CONFIG, &reg_write, 1);
1948  0054 4b01          	push	#1
1949  0056 96            	ldw	x,sp
1950  0057 1c0011        	addw	x,#OFST+1
1951  005a 89            	pushw	x
1952  005b 4f            	clr	a
1953  005c cd0000        	call	_RF24L01_write_register
1955  005f 5b03          	addw	sp,#3
1956                     ; 297     reg_write = 0x3F;
1958  0061 a63f          	ld	a,#63
1959  0063 6b10          	ld	(OFST+0,sp),a
1961                     ; 298 	  RF24L01_write_register(RF24L01_reg_EN_AA, &reg_write, 1);
1963  0065 4b01          	push	#1
1964  0067 96            	ldw	x,sp
1965  0068 1c0011        	addw	x,#OFST+1
1966  006b 89            	pushw	x
1967  006c a601          	ld	a,#1
1968  006e cd0000        	call	_RF24L01_write_register
1970  0071 5b03          	addw	sp,#3
1971                     ; 299     reg_write = 0x03;
1973  0073 a603          	ld	a,#3
1974  0075 6b10          	ld	(OFST+0,sp),a
1976                     ; 300     RF24L01_write_register(RF24L01_reg_EN_RXADDR, &reg_write, 1);
1978  0077 4b01          	push	#1
1979  0079 96            	ldw	x,sp
1980  007a 1c0011        	addw	x,#OFST+1
1981  007d 89            	pushw	x
1982  007e a602          	ld	a,#2
1983  0080 cd0000        	call	_RF24L01_write_register
1985  0083 5b03          	addw	sp,#3
1986                     ; 301     reg_write = 0x03;
1988  0085 a603          	ld	a,#3
1989  0087 6b10          	ld	(OFST+0,sp),a
1991                     ; 302     RF24L01_write_register(RF24L01_reg_SETUP_AW, &reg_write, 1);
1993  0089 4b01          	push	#1
1994  008b 96            	ldw	x,sp
1995  008c 1c0011        	addw	x,#OFST+1
1996  008f 89            	pushw	x
1997  0090 cd0000        	call	_RF24L01_write_register
1999  0093 5b03          	addw	sp,#3
2000                     ; 303     reg_write = 0x03;
2002  0095 a603          	ld	a,#3
2003  0097 6b10          	ld	(OFST+0,sp),a
2005                     ; 304     RF24L01_write_register(RF24L01_reg_SETUP_RETR, &reg_write, 1);
2007  0099 4b01          	push	#1
2008  009b 96            	ldw	x,sp
2009  009c 1c0011        	addw	x,#OFST+1
2010  009f 89            	pushw	x
2011  00a0 4c            	inc	a
2012  00a1 cd0000        	call	_RF24L01_write_register
2014  00a4 5b03          	addw	sp,#3
2015                     ; 305     reg_write = 0x02;
2017  00a6 a602          	ld	a,#2
2018  00a8 6b10          	ld	(OFST+0,sp),a
2020                     ; 306     RF24L01_write_register(RF24L01_reg_RF_CH, &reg_write, 1);
2022  00aa 4b01          	push	#1
2023  00ac 96            	ldw	x,sp
2024  00ad 1c0011        	addw	x,#OFST+1
2025  00b0 89            	pushw	x
2026  00b1 a605          	ld	a,#5
2027  00b3 cd0000        	call	_RF24L01_write_register
2029  00b6 5b03          	addw	sp,#3
2030                     ; 307     reg_write = 0x0E;
2032  00b8 a60e          	ld	a,#14
2033  00ba 6b10          	ld	(OFST+0,sp),a
2035                     ; 308     RF24L01_write_register(RF24L01_reg_RF_SETUP, &reg_write, 1);
2037  00bc 4b01          	push	#1
2038  00be 96            	ldw	x,sp
2039  00bf 1c0011        	addw	x,#OFST+1
2040  00c2 89            	pushw	x
2041  00c3 a606          	ld	a,#6
2042  00c5 cd0000        	call	_RF24L01_write_register
2044  00c8 5b03          	addw	sp,#3
2045                     ; 309     reg_write = 0x00;
2047  00ca 0f10          	clr	(OFST+0,sp)
2049                     ; 310     RF24L01_write_register(RF24L01_reg_STATUS, &reg_write, 1);
2051  00cc 4b01          	push	#1
2052  00ce 96            	ldw	x,sp
2053  00cf 1c0011        	addw	x,#OFST+1
2054  00d2 89            	pushw	x
2055  00d3 a607          	ld	a,#7
2056  00d5 cd0000        	call	_RF24L01_write_register
2058  00d8 5b03          	addw	sp,#3
2059                     ; 311     reg_write = 0x00;
2061  00da 0f10          	clr	(OFST+0,sp)
2063                     ; 312     RF24L01_write_register(RF24L01_reg_OBSERVE_TX, &reg_write, 1);
2065  00dc 4b01          	push	#1
2066  00de 96            	ldw	x,sp
2067  00df 1c0011        	addw	x,#OFST+1
2068  00e2 89            	pushw	x
2069  00e3 a608          	ld	a,#8
2070  00e5 cd0000        	call	_RF24L01_write_register
2072  00e8 5b03          	addw	sp,#3
2073                     ; 313     reg_write = 0x00;
2075  00ea 0f10          	clr	(OFST+0,sp)
2077                     ; 314     RF24L01_write_register(RF24L01_reg_CD, &reg_write, 1);
2079  00ec 4b01          	push	#1
2080  00ee 96            	ldw	x,sp
2081  00ef 1c0011        	addw	x,#OFST+1
2082  00f2 89            	pushw	x
2083  00f3 a609          	ld	a,#9
2084  00f5 cd0000        	call	_RF24L01_write_register
2086  00f8 5b03          	addw	sp,#3
2087                     ; 315     RF24L01_write_register(RF24L01_reg_RX_ADDR_P0, rx_addr_p0_def, 5);
2089  00fa 4b05          	push	#5
2090  00fc 96            	ldw	x,sp
2091  00fd 1c0002        	addw	x,#OFST-14
2092  0100 89            	pushw	x
2093  0101 a60a          	ld	a,#10
2094  0103 cd0000        	call	_RF24L01_write_register
2096  0106 5b03          	addw	sp,#3
2097                     ; 316     RF24L01_write_register(RF24L01_reg_RX_ADDR_P1, rx_addr_p1_def, 5);
2099  0108 4b05          	push	#5
2100  010a 96            	ldw	x,sp
2101  010b 1c0007        	addw	x,#OFST-9
2102  010e 89            	pushw	x
2103  010f a60b          	ld	a,#11
2104  0111 cd0000        	call	_RF24L01_write_register
2106  0114 5b03          	addw	sp,#3
2107                     ; 317     reg_write = 0xC3;
2109  0116 a6c3          	ld	a,#195
2110  0118 6b10          	ld	(OFST+0,sp),a
2112                     ; 318     RF24L01_write_register(RF24L01_reg_RX_ADDR_P2, &reg_write, 1);
2114  011a 4b01          	push	#1
2115  011c 96            	ldw	x,sp
2116  011d 1c0011        	addw	x,#OFST+1
2117  0120 89            	pushw	x
2118  0121 a60c          	ld	a,#12
2119  0123 cd0000        	call	_RF24L01_write_register
2121  0126 5b03          	addw	sp,#3
2122                     ; 319     reg_write = 0xC4;
2124  0128 a6c4          	ld	a,#196
2125  012a 6b10          	ld	(OFST+0,sp),a
2127                     ; 320     RF24L01_write_register(RF24L01_reg_RX_ADDR_P3, &reg_write, 1);
2129  012c 4b01          	push	#1
2130  012e 96            	ldw	x,sp
2131  012f 1c0011        	addw	x,#OFST+1
2132  0132 89            	pushw	x
2133  0133 a60d          	ld	a,#13
2134  0135 cd0000        	call	_RF24L01_write_register
2136  0138 5b03          	addw	sp,#3
2137                     ; 321     reg_write = 0xC5;
2139  013a a6c5          	ld	a,#197
2140  013c 6b10          	ld	(OFST+0,sp),a
2142                     ; 322     RF24L01_write_register(RF24L01_reg_RX_ADDR_P4, &reg_write, 1);
2144  013e 4b01          	push	#1
2145  0140 96            	ldw	x,sp
2146  0141 1c0011        	addw	x,#OFST+1
2147  0144 89            	pushw	x
2148  0145 a60e          	ld	a,#14
2149  0147 cd0000        	call	_RF24L01_write_register
2151  014a 5b03          	addw	sp,#3
2152                     ; 323     reg_write = 0xC6;
2154  014c a6c6          	ld	a,#198
2155  014e 6b10          	ld	(OFST+0,sp),a
2157                     ; 324     RF24L01_write_register(RF24L01_reg_RX_ADDR_P5, &reg_write, 1);
2159  0150 4b01          	push	#1
2160  0152 96            	ldw	x,sp
2161  0153 1c0011        	addw	x,#OFST+1
2162  0156 89            	pushw	x
2163  0157 a60f          	ld	a,#15
2164  0159 cd0000        	call	_RF24L01_write_register
2166  015c 5b03          	addw	sp,#3
2167                     ; 325     RF24L01_write_register(RF24L01_reg_TX_ADDR, tx_addr_def, 5);
2169  015e 4b05          	push	#5
2170  0160 96            	ldw	x,sp
2171  0161 1c000c        	addw	x,#OFST-4
2172  0164 89            	pushw	x
2173  0165 a610          	ld	a,#16
2174  0167 cd0000        	call	_RF24L01_write_register
2176  016a 5b03          	addw	sp,#3
2177                     ; 326     reg_write = 0x00;
2179  016c 0f10          	clr	(OFST+0,sp)
2181                     ; 327     RF24L01_write_register(RF24L01_reg_RX_PW_P0, &reg_write, 1);
2183  016e 4b01          	push	#1
2184  0170 96            	ldw	x,sp
2185  0171 1c0011        	addw	x,#OFST+1
2186  0174 89            	pushw	x
2187  0175 a611          	ld	a,#17
2188  0177 cd0000        	call	_RF24L01_write_register
2190  017a 5b03          	addw	sp,#3
2191                     ; 328     reg_write = 0x00;
2193  017c 0f10          	clr	(OFST+0,sp)
2195                     ; 329     RF24L01_write_register(RF24L01_reg_RX_PW_P1, &reg_write, 1);
2197  017e 4b01          	push	#1
2198  0180 96            	ldw	x,sp
2199  0181 1c0011        	addw	x,#OFST+1
2200  0184 89            	pushw	x
2201  0185 a612          	ld	a,#18
2202  0187 cd0000        	call	_RF24L01_write_register
2204  018a 5b03          	addw	sp,#3
2205                     ; 330     reg_write = 0x00;
2207  018c 0f10          	clr	(OFST+0,sp)
2209                     ; 331     RF24L01_write_register(RF24L01_reg_RX_PW_P2, &reg_write, 1);
2211  018e 4b01          	push	#1
2212  0190 96            	ldw	x,sp
2213  0191 1c0011        	addw	x,#OFST+1
2214  0194 89            	pushw	x
2215  0195 a613          	ld	a,#19
2216  0197 cd0000        	call	_RF24L01_write_register
2218  019a 5b03          	addw	sp,#3
2219                     ; 332     reg_write = 0x00;
2221  019c 0f10          	clr	(OFST+0,sp)
2223                     ; 333     RF24L01_write_register(RF24L01_reg_RX_PW_P3, &reg_write, 1);
2225  019e 4b01          	push	#1
2226  01a0 96            	ldw	x,sp
2227  01a1 1c0011        	addw	x,#OFST+1
2228  01a4 89            	pushw	x
2229  01a5 a614          	ld	a,#20
2230  01a7 cd0000        	call	_RF24L01_write_register
2232  01aa 5b03          	addw	sp,#3
2233                     ; 334     reg_write = 0x00;
2235  01ac 0f10          	clr	(OFST+0,sp)
2237                     ; 335     RF24L01_write_register(RF24L01_reg_RX_PW_P4, &reg_write, 1);
2239  01ae 4b01          	push	#1
2240  01b0 96            	ldw	x,sp
2241  01b1 1c0011        	addw	x,#OFST+1
2242  01b4 89            	pushw	x
2243  01b5 a615          	ld	a,#21
2244  01b7 cd0000        	call	_RF24L01_write_register
2246  01ba 5b03          	addw	sp,#3
2247                     ; 336     reg_write = 0x00;
2249  01bc 0f10          	clr	(OFST+0,sp)
2251                     ; 337     RF24L01_write_register(RF24L01_reg_RX_PW_P5, &reg_write, 1);
2253  01be 4b01          	push	#1
2254  01c0 96            	ldw	x,sp
2255  01c1 1c0011        	addw	x,#OFST+1
2256  01c4 89            	pushw	x
2257  01c5 a616          	ld	a,#22
2258  01c7 cd0000        	call	_RF24L01_write_register
2260  01ca 5b03          	addw	sp,#3
2261                     ; 338     reg_write = 0x11;
2263  01cc a611          	ld	a,#17
2264  01ce 6b10          	ld	(OFST+0,sp),a
2266                     ; 339     RF24L01_write_register(RF24L01_reg_FIFO_STATUS, &reg_write, 1);
2268  01d0 4b01          	push	#1
2269  01d2 96            	ldw	x,sp
2270  01d3 1c0011        	addw	x,#OFST+1
2271  01d6 89            	pushw	x
2272  01d7 a617          	ld	a,#23
2273  01d9 cd0000        	call	_RF24L01_write_register
2275  01dc 5b03          	addw	sp,#3
2276                     ; 340     reg_write = 0x00;
2278  01de 0f10          	clr	(OFST+0,sp)
2280                     ; 341     RF24L01_write_register(RF24L01_reg_DYNPD, &reg_write, 1);
2282  01e0 4b01          	push	#1
2283  01e2 96            	ldw	x,sp
2284  01e3 1c0011        	addw	x,#OFST+1
2285  01e6 89            	pushw	x
2286  01e7 a61c          	ld	a,#28
2287  01e9 cd0000        	call	_RF24L01_write_register
2289  01ec 5b03          	addw	sp,#3
2290                     ; 342     reg_write = 0x00;
2292  01ee 0f10          	clr	(OFST+0,sp)
2294                     ; 343     RF24L01_write_register(RF24L01_reg_FEATURE, &reg_write, 1);
2296  01f0 4b01          	push	#1
2297  01f2 96            	ldw	x,sp
2298  01f3 1c0011        	addw	x,#OFST+1
2299  01f6 89            	pushw	x
2300  01f7 a61d          	ld	a,#29
2302  01f9               L337:
2303  01f9 cd0000        	call	_RF24L01_write_register
2304  01fc 5b14          	addw	sp,#20
2305                     ; 345 }
2308  01fe 81            	ret	
2321                     	xdef	_RF24L01_reset
2322                     	xdef	_RF24L01_is_data_available
2323                     	xdef	_RF24L01_read_payload
2324                     	xdef	_RF24L01_set_mode_RX
2325                     	xdef	_RF24L01_write_payload
2326                     	xdef	_RF24L01_set_mode_TX
2327                     	xdef	_RF24L01_init
2328                     	xdef	_RF24L01_read_register_multi
2329                     	xdef	_RF24L01_read_register
2330                     	xdef	_RF24L01_write_register
2331                     	xdef	_RF24L01_send_command
2332                     	xdef	_CE_Disable
2333                     	xdef	_CE_Enable
2334                     	xdef	_CS_UnSelect
2335                     	xdef	_CS_Select
2336                     	xref	_delay_ms
2337                     	xref	_SPI_GetFlagStatus
2338                     	xref	_SPI_ReceiveData
2339                     	xref	_SPI_SendData
2340                     	xref	_SPI_Cmd
2341                     	xref	_SPI_Init
2342                     	xref	_SPI_DeInit
2343                     	xref	_GPIO_ExternalPullUpConfig
2344                     	xref	_GPIO_WriteLow
2345                     	xref	_GPIO_WriteHigh
2346                     	xref	_GPIO_Init
2347                     	xref.b	c_x
2366                     	xref	c_xymov
2367                     	end
