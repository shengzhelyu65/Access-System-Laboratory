   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.8 - 08 Nov 2022
   3                     ; Generator (Limited) V4.5.5 - 08 Nov 2022
   4                     ; Optimizer V4.5.5 - 08 Nov 2022
 283                     ; 3 void OneWire_Init(OneWire_t* OneWireStruct, GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin) {
 285                     .text:	section	.text,new
 286  0000               _OneWire_Init:
 288  0000 89            	pushw	x
 289       00000000      OFST:	set	0
 292                     ; 5 	GPIO_Init(GPIOx, GPIO_Pin, GPIO_MODE_OUT_PP_HIGH_FAST);
 294  0001 4bf0          	push	#240
 295  0003 7b08          	ld	a,(OFST+8,sp)
 296  0005 88            	push	a
 297  0006 1e07          	ldw	x,(OFST+7,sp)
 298  0008 cd0000        	call	_GPIO_Init
 300  000b 85            	popw	x
 301                     ; 6 	GPIO_ExternalPullUpConfig(GPIOx, GPIO_Pin, ENABLE);
 303  000c 4b01          	push	#1
 304  000e 7b08          	ld	a,(OFST+8,sp)
 305  0010 88            	push	a
 306  0011 1e07          	ldw	x,(OFST+7,sp)
 307  0013 cd0000        	call	_GPIO_ExternalPullUpConfig
 309  0016 85            	popw	x
 310                     ; 9 	OneWireStruct->GPIOx = GPIOx;
 312  0017 1e01          	ldw	x,(OFST+1,sp)
 313  0019 1605          	ldw	y,(OFST+5,sp)
 314  001b ff            	ldw	(x),y
 315                     ; 10 	OneWireStruct->GPIO_Pin = GPIO_Pin;
 317  001c 7b07          	ld	a,(OFST+7,sp)
 318  001e e702          	ld	(2,x),a
 319                     ; 11 }
 322  0020 85            	popw	x
 323  0021 81            	ret	
 371                     ; 13 uint8_t OneWire_Reset(OneWire_t* OneWireStruct) {
 372                     .text:	section	.text,new
 373  0000               _OneWire_Reset:
 375  0000 89            	pushw	x
 376  0001 88            	push	a
 377       00000001      OFST:	set	1
 380                     ; 17 	GPIO_Init(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin, GPIO_MODE_OUT_PP_HIGH_FAST);
 382  0002 4bf0          	push	#240
 383  0004 e602          	ld	a,(2,x)
 384  0006 88            	push	a
 385  0007 fe            	ldw	x,(x)
 386  0008 cd0000        	call	_GPIO_Init
 388  000b 85            	popw	x
 389                     ; 18 	GPIO_WriteLow(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin);
 391  000c 1e02          	ldw	x,(OFST+1,sp)
 392  000e e602          	ld	a,(2,x)
 393  0010 88            	push	a
 394  0011 fe            	ldw	x,(x)
 395  0012 cd0000        	call	_GPIO_WriteLow
 397  0015 ae01e0        	ldw	x,#480
 398  0018 84            	pop	a
 399                     ; 19 	delay_us(480);
 401  0019 cd0000        	call	_delay_us
 403                     ; 22 	GPIO_Init(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin, GPIO_MODE_IN_FL_NO_IT);
 405  001c 4b00          	push	#0
 406  001e 1e03          	ldw	x,(OFST+2,sp)
 407  0020 e602          	ld	a,(2,x)
 408  0022 88            	push	a
 409  0023 fe            	ldw	x,(x)
 410  0024 cd0000        	call	_GPIO_Init
 412  0027 85            	popw	x
 413                     ; 23 	delay_us(70);
 415  0028 ae0046        	ldw	x,#70
 416  002b cd0000        	call	_delay_us
 418                     ; 26 	i = GPIO_ReadInputPin(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin);
 420  002e 1e02          	ldw	x,(OFST+1,sp)
 421  0030 e602          	ld	a,(2,x)
 422  0032 88            	push	a
 423  0033 fe            	ldw	x,(x)
 424  0034 cd0000        	call	_GPIO_ReadInputPin
 426  0037 5b01          	addw	sp,#1
 427  0039 6b01          	ld	(OFST+0,sp),a
 429                     ; 29 	delay_us(410);
 431  003b ae019a        	ldw	x,#410
 432  003e cd0000        	call	_delay_us
 434                     ; 32 	return i;
 436  0041 7b01          	ld	a,(OFST+0,sp)
 439  0043 5b03          	addw	sp,#3
 440  0045 81            	ret	
 479                     ; 35 uint8_t OneWire_First(OneWire_t* OneWireStruct) {
 480                     .text:	section	.text,new
 481  0000               _OneWire_First:
 483  0000 89            	pushw	x
 484       00000000      OFST:	set	0
 487                     ; 37 	OneWire_ResetSearch(OneWireStruct);
 489  0001 cd0000        	call	_OneWire_ResetSearch
 491                     ; 40 	return OneWire_Search(OneWireStruct, ONEWIRE_CMD_SEARCHROM);
 493  0004 4bf0          	push	#240
 494  0006 1e02          	ldw	x,(OFST+2,sp)
 495  0008 cd0000        	call	_OneWire_Search
 499  000b 5b03          	addw	sp,#3
 500  000d 81            	ret	
 538                     ; 43 void OneWire_ResetSearch(OneWire_t* OneWireStruct) {
 539                     .text:	section	.text,new
 540  0000               _OneWire_ResetSearch:
 544                     ; 45 	OneWireStruct->LastDiscrepancy = 0;
 546  0000 6f03          	clr	(3,x)
 547                     ; 46 	OneWireStruct->LastDeviceFlag = 0;
 549  0002 6f05          	clr	(5,x)
 550                     ; 47 	OneWireStruct->LastFamilyDiscrepancy = 0;
 552  0004 6f04          	clr	(4,x)
 553                     ; 48 }
 556  0006 81            	ret	
 660                     ; 50 uint8_t OneWire_Search(OneWire_t* OneWireStruct, uint8_t command) {
 661                     .text:	section	.text,new
 662  0000               _OneWire_Search:
 664  0000 89            	pushw	x
 665  0001 5207          	subw	sp,#7
 666       00000007      OFST:	set	7
 669                     ; 57 	id_bit_number = 1;
 671  0003 a601          	ld	a,#1
 672  0005 6b04          	ld	(OFST-3,sp),a
 674                     ; 58 	last_zero = 0;
 676  0007 0f03          	clr	(OFST-4,sp)
 678                     ; 59 	rom_byte_number = 0;
 680  0009 0f05          	clr	(OFST-2,sp)
 682                     ; 60 	rom_byte_mask = 1;
 684  000b 6b06          	ld	(OFST-1,sp),a
 686                     ; 61 	search_result = 0;
 688  000d 0f01          	clr	(OFST-6,sp)
 690                     ; 64 	if (!OneWireStruct->LastDeviceFlag) {
 692  000f e605          	ld	a,(5,x)
 693  0011 2703cc00d5    	jrne	L103
 694                     ; 66 		if (OneWire_Reset(OneWireStruct)) { // Reset fail
 696  0016 cd0000        	call	_OneWire_Reset
 698  0019 4d            	tnz	a
 699  001a 270c          	jreq	L303
 700                     ; 68 			OneWireStruct->LastDiscrepancy = 0;
 702  001c 1e08          	ldw	x,(OFST+1,sp)
 703                     ; 69 			OneWireStruct->LastDeviceFlag = 0;
 705  001e 6f05          	clr	(5,x)
 706  0020 6f03          	clr	(3,x)
 707                     ; 70 			OneWireStruct->LastFamilyDiscrepancy = 0;
 709  0022 6f04          	clr	(4,x)
 710                     ; 71 			return 0;
 712  0024 4f            	clr	a
 714  0025 cc00eb        	jra	L66
 715  0028               L303:
 716                     ; 75 		OneWire_WriteByte(OneWireStruct, command);
 718  0028 7b0c          	ld	a,(OFST+5,sp)
 719  002a 88            	push	a
 720  002b 1e09          	ldw	x,(OFST+2,sp)
 721  002d cd0000        	call	_OneWire_WriteByte
 723  0030 84            	pop	a
 724  0031               L503:
 725                     ; 80 			id_bit = OneWire_ReadBit(OneWireStruct);
 727  0031 1e08          	ldw	x,(OFST+1,sp)
 728  0033 cd0000        	call	_OneWire_ReadBit
 730  0036 6b07          	ld	(OFST+0,sp),a
 732                     ; 81 			cmp_id_bit = OneWire_ReadBit(OneWireStruct);
 734  0038 1e08          	ldw	x,(OFST+1,sp)
 735  003a cd0000        	call	_OneWire_ReadBit
 737  003d 6b02          	ld	(OFST-5,sp),a
 739                     ; 84 			if ((id_bit == 1) && (cmp_id_bit == 1)) {
 741  003f 7b07          	ld	a,(OFST+0,sp)
 742  0041 a101          	cp	a,#1
 743  0043 2607          	jrne	L313
 745  0045 7b02          	ld	a,(OFST-5,sp)
 746  0047 4a            	dec	a
 747  0048 2776          	jreq	L113
 748                     ; 85 				break;
 750  004a 7b07          	ld	a,(OFST+0,sp)
 751  004c               L313:
 752                     ; 88 				if (id_bit != cmp_id_bit) {
 754  004c 1102          	cp	a,(OFST-5,sp)
 755  004e 2704          	jreq	L713
 756                     ; 89 					search_direction = id_bit;  // bit write value for search
 758  0050 6b07          	ld	(OFST+0,sp),a
 761  0052 202e          	jra	L123
 762  0054               L713:
 763                     ; 93 					if (id_bit_number < OneWireStruct->LastDiscrepancy) {
 765  0054 1e08          	ldw	x,(OFST+1,sp)
 766  0056 e603          	ld	a,(3,x)
 767  0058 1104          	cp	a,(OFST-3,sp)
 768  005a 2311          	jrule	L323
 769                     ; 94 						search_direction = ((OneWireStruct->ROM_NO[rom_byte_number] & rom_byte_mask) > 0);
 771  005c 7b05          	ld	a,(OFST-2,sp)
 772  005e 5f            	clrw	x
 773  005f 97            	ld	xl,a
 774  0060 72fb08        	addw	x,(OFST+1,sp)
 775  0063 e606          	ld	a,(6,x)
 776  0065 1506          	bcp	a,(OFST-1,sp)
 777  0067 2708          	jreq	L06
 778  0069               LC002:
 779  0069 a601          	ld	a,#1
 780  006b 2005          	jra	L26
 782  006d               L323:
 783                     ; 97 						search_direction = (id_bit_number == OneWireStruct->LastDiscrepancy);
 785  006d 1104          	cp	a,(OFST-3,sp)
 786  006f 27f8          	jreq	LC002
 787  0071               L06:
 788  0071 4f            	clr	a
 789  0072               L26:
 790  0072 6b07          	ld	(OFST+0,sp),a
 792                     ; 101 					if (search_direction == 0) {
 794  0074 260c          	jrne	L123
 795                     ; 102 						last_zero = id_bit_number;
 797  0076 7b04          	ld	a,(OFST-3,sp)
 798  0078 6b03          	ld	(OFST-4,sp),a
 800                     ; 105 						if (last_zero < 9) {
 802  007a a109          	cp	a,#9
 803  007c 2404          	jruge	L123
 804                     ; 106 							OneWireStruct->LastFamilyDiscrepancy = last_zero;
 806  007e 1e08          	ldw	x,(OFST+1,sp)
 807  0080 e704          	ld	(4,x),a
 808  0082               L123:
 809                     ; 113 				if (search_direction == 1) {
 811  0082 7b07          	ld	a,(OFST+0,sp)
 812  0084 4a            	dec	a
 813  0085 260d          	jrne	L333
 814                     ; 114 					OneWireStruct->ROM_NO[rom_byte_number] |= rom_byte_mask;
 816  0087 7b05          	ld	a,(OFST-2,sp)
 817  0089 5f            	clrw	x
 818  008a 97            	ld	xl,a
 819  008b 72fb08        	addw	x,(OFST+1,sp)
 820  008e e606          	ld	a,(6,x)
 821  0090 1a06          	or	a,(OFST-1,sp)
 823  0092 200c          	jra	L533
 824  0094               L333:
 825                     ; 116 					OneWireStruct->ROM_NO[rom_byte_number] &= ~rom_byte_mask;
 827  0094 7b05          	ld	a,(OFST-2,sp)
 828  0096 5f            	clrw	x
 829  0097 97            	ld	xl,a
 830  0098 72fb08        	addw	x,(OFST+1,sp)
 831  009b 7b06          	ld	a,(OFST-1,sp)
 832  009d 43            	cpl	a
 833  009e e406          	and	a,(6,x)
 834  00a0               L533:
 835  00a0 e706          	ld	(6,x),a
 836                     ; 120 				OneWire_WriteBit(OneWireStruct, search_direction);
 838  00a2 7b07          	ld	a,(OFST+0,sp)
 839  00a4 88            	push	a
 840  00a5 1e09          	ldw	x,(OFST+2,sp)
 841  00a7 cd0000        	call	_OneWire_WriteBit
 843  00aa 84            	pop	a
 844                     ; 124 				id_bit_number++;
 846  00ab 0c04          	inc	(OFST-3,sp)
 848                     ; 125 				rom_byte_mask <<= 1;
 850  00ad 0806          	sll	(OFST-1,sp)
 852                     ; 128 				if (rom_byte_mask == 0) {
 854  00af 2606          	jrne	L703
 855                     ; 130 					rom_byte_number++;
 857  00b1 0c05          	inc	(OFST-2,sp)
 859                     ; 131 					rom_byte_mask = 1;
 861  00b3 a601          	ld	a,#1
 862  00b5 6b06          	ld	(OFST-1,sp),a
 864  00b7               L703:
 865                     ; 134 		} while (rom_byte_number < 8);  // loop until through all ROM bytes 0-7
 867  00b7 7b05          	ld	a,(OFST-2,sp)
 868  00b9 a108          	cp	a,#8
 869  00bb 2403cc0031    	jrult	L503
 870  00c0               L113:
 871                     ; 137 		if (!(id_bit_number < 65)) {
 873  00c0 7b04          	ld	a,(OFST-3,sp)
 874  00c2 a141          	cp	a,#65
 875  00c4 250f          	jrult	L103
 876                     ; 139 			OneWireStruct->LastDiscrepancy = last_zero;
 878  00c6 1e08          	ldw	x,(OFST+1,sp)
 879  00c8 7b03          	ld	a,(OFST-4,sp)
 880  00ca e703          	ld	(3,x),a
 881                     ; 142 			if (OneWireStruct->LastDiscrepancy == 0) {
 883  00cc 2603          	jrne	L343
 884                     ; 143 				OneWireStruct->LastDeviceFlag = 1;
 886  00ce 4c            	inc	a
 887  00cf e705          	ld	(5,x),a
 888  00d1               L343:
 889                     ; 146 			search_result = 1;
 891  00d1 a601          	ld	a,#1
 892  00d3 6b01          	ld	(OFST-6,sp),a
 894  00d5               L103:
 895                     ; 151 	if (!search_result || !OneWireStruct->ROM_NO[0]) {
 897  00d5 7b01          	ld	a,(OFST-6,sp)
 898  00d7 2706          	jreq	L743
 900  00d9 1e08          	ldw	x,(OFST+1,sp)
 901  00db e606          	ld	a,(6,x)
 902  00dd 260a          	jrne	L543
 903  00df               L743:
 904                     ; 152 		OneWireStruct->LastDiscrepancy = 0;
 906  00df 1e08          	ldw	x,(OFST+1,sp)
 907                     ; 153 		OneWireStruct->LastDeviceFlag = 0;
 909  00e1 6f05          	clr	(5,x)
 910  00e3 6f03          	clr	(3,x)
 911                     ; 154 		OneWireStruct->LastFamilyDiscrepancy = 0;
 913  00e5 6f04          	clr	(4,x)
 914                     ; 155 		search_result = 0;
 916  00e7 0f01          	clr	(OFST-6,sp)
 918  00e9               L543:
 919                     ; 157 	return search_result;
 921  00e9 7b01          	ld	a,(OFST-6,sp)
 923  00eb               L66:
 925  00eb 5b09          	addw	sp,#9
 926  00ed 81            	ret	
 974                     ; 160 void OneWire_WriteBit(OneWire_t* OneWireStruct, uint8_t bit) {
 975                     .text:	section	.text,new
 976  0000               _OneWire_WriteBit:
 978  0000 89            	pushw	x
 979       00000000      OFST:	set	0
 982                     ; 161 	if (bit) {
 984  0001 7b05          	ld	a,(OFST+5,sp)
 985  0003 2730          	jreq	L373
 986                     ; 163 		GPIO_Init(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin, GPIO_MODE_OUT_PP_HIGH_FAST);
 988  0005 ad4e          	call	LC003
 989                     ; 164 		GPIO_WriteLow(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin);
 991  0007 1e01          	ldw	x,(OFST+1,sp)
 992  0009 e602          	ld	a,(2,x)
 993  000b 88            	push	a
 994  000c fe            	ldw	x,(x)
 995  000d cd0000        	call	_GPIO_WriteLow
 997  0010 ae000f        	ldw	x,#15
 998  0013 84            	pop	a
 999                     ; 165 		delay_us(15);
1001  0014 cd0000        	call	_delay_us
1003                     ; 168 		GPIO_WriteHigh(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin);
1005  0017 1e01          	ldw	x,(OFST+1,sp)
1006  0019 e602          	ld	a,(2,x)
1007  001b 88            	push	a
1008  001c fe            	ldw	x,(x)
1009  001d cd0000        	call	_GPIO_WriteHigh
1011  0020 84            	pop	a
1012                     ; 169 		GPIO_Init(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin, GPIO_MODE_IN_FL_NO_IT);
1014  0021 4b00          	push	#0
1015  0023 1e02          	ldw	x,(OFST+2,sp)
1016  0025 e602          	ld	a,(2,x)
1017  0027 88            	push	a
1018  0028 fe            	ldw	x,(x)
1019  0029 cd0000        	call	_GPIO_Init
1021  002c 85            	popw	x
1022                     ; 172 		delay_us(45);
1024  002d ae002d        	ldw	x,#45
1025  0030 cd0000        	call	_delay_us
1028  0033 201e          	jra	L573
1029  0035               L373:
1030                     ; 175 		GPIO_Init(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin, GPIO_MODE_OUT_PP_HIGH_FAST);
1032  0035 ad1e          	call	LC003
1033                     ; 176 		GPIO_WriteLow(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin);
1035  0037 1e01          	ldw	x,(OFST+1,sp)
1036  0039 e602          	ld	a,(2,x)
1037  003b 88            	push	a
1038  003c fe            	ldw	x,(x)
1039  003d cd0000        	call	_GPIO_WriteLow
1041  0040 ae003c        	ldw	x,#60
1042  0043 84            	pop	a
1043                     ; 177 		delay_us(60);
1045  0044 cd0000        	call	_delay_us
1047                     ; 180 		GPIO_Init(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin, GPIO_MODE_IN_FL_NO_IT);
1049  0047 4b00          	push	#0
1050  0049 1e02          	ldw	x,(OFST+2,sp)
1051  004b e602          	ld	a,(2,x)
1052  004d 88            	push	a
1053  004e fe            	ldw	x,(x)
1054  004f cd0000        	call	_GPIO_Init
1056  0052 85            	popw	x
1057  0053               L573:
1058                     ; 182 }
1061  0053 85            	popw	x
1062  0054 81            	ret	
1063  0055               LC003:
1064  0055 4bf0          	push	#240
1065  0057 e602          	ld	a,(2,x)
1066  0059 88            	push	a
1067  005a fe            	ldw	x,(x)
1068  005b cd0000        	call	_GPIO_Init
1070  005e 85            	popw	x
1071  005f 81            	ret	
1119                     ; 184 uint8_t OneWire_ReadBit(OneWire_t* OneWireStruct) {
1120                     .text:	section	.text,new
1121  0000               _OneWire_ReadBit:
1123  0000 89            	pushw	x
1124  0001 88            	push	a
1125       00000001      OFST:	set	1
1128                     ; 185 	uint8_t bit = 0;
1130  0002 0f01          	clr	(OFST+0,sp)
1132                     ; 188 	GPIO_Init(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin, GPIO_MODE_OUT_PP_HIGH_FAST);
1134  0004 4bf0          	push	#240
1135  0006 e602          	ld	a,(2,x)
1136  0008 88            	push	a
1137  0009 fe            	ldw	x,(x)
1138  000a cd0000        	call	_GPIO_Init
1140  000d 85            	popw	x
1141                     ; 189 	GPIO_WriteLow(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin);
1143  000e 1e02          	ldw	x,(OFST+1,sp)
1144  0010 e602          	ld	a,(2,x)
1145  0012 88            	push	a
1146  0013 fe            	ldw	x,(x)
1147  0014 cd0000        	call	_GPIO_WriteLow
1149  0017 ae000f        	ldw	x,#15
1150  001a 84            	pop	a
1151                     ; 190 	delay_us(15);
1153  001b cd0000        	call	_delay_us
1155                     ; 193 	GPIO_Init(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin, GPIO_MODE_IN_FL_NO_IT);
1157  001e 4b00          	push	#0
1158  0020 1e03          	ldw	x,(OFST+2,sp)
1159  0022 e602          	ld	a,(2,x)
1160  0024 88            	push	a
1161  0025 fe            	ldw	x,(x)
1162  0026 cd0000        	call	_GPIO_Init
1164  0029 85            	popw	x
1165                     ; 194 	delay_us(12);
1167  002a ae000c        	ldw	x,#12
1168  002d cd0000        	call	_delay_us
1170                     ; 197 	if (GPIO_ReadInputPin(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin)) {
1172  0030 1e02          	ldw	x,(OFST+1,sp)
1173  0032 e602          	ld	a,(2,x)
1174  0034 88            	push	a
1175  0035 fe            	ldw	x,(x)
1176  0036 cd0000        	call	_GPIO_ReadInputPin
1178  0039 5b01          	addw	sp,#1
1179  003b 4d            	tnz	a
1180  003c 2704          	jreq	L124
1181                     ; 199 		bit = 1;
1183  003e a601          	ld	a,#1
1184  0040 6b01          	ld	(OFST+0,sp),a
1186  0042               L124:
1187                     ; 202 	GPIO_Init(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin, GPIO_MODE_IN_FL_NO_IT);
1189  0042 4b00          	push	#0
1190  0044 1e03          	ldw	x,(OFST+2,sp)
1191  0046 e602          	ld	a,(2,x)
1192  0048 88            	push	a
1193  0049 fe            	ldw	x,(x)
1194  004a cd0000        	call	_GPIO_Init
1196  004d 85            	popw	x
1197                     ; 203 	delay_us(36);
1199  004e ae0024        	ldw	x,#36
1200  0051 cd0000        	call	_delay_us
1202                     ; 206 	return bit;
1204  0054 7b01          	ld	a,(OFST+0,sp)
1207  0056 5b03          	addw	sp,#3
1208  0058 81            	ret	
1260                     ; 209 void OneWire_WriteByte(OneWire_t* OneWireStruct, uint8_t byte) {
1261                     .text:	section	.text,new
1262  0000               _OneWire_WriteByte:
1264  0000 89            	pushw	x
1265  0001 88            	push	a
1266       00000001      OFST:	set	1
1269                     ; 210 	uint8_t i = 8;
1271  0002 a608          	ld	a,#8
1272  0004 6b01          	ld	(OFST+0,sp),a
1275  0006 200f          	jra	L354
1276  0008               L744:
1277                     ; 214 		OneWire_WriteBit(OneWireStruct, byte & 0x01);
1279  0008 7b06          	ld	a,(OFST+5,sp)
1280  000a a401          	and	a,#1
1281  000c 88            	push	a
1282  000d 1e03          	ldw	x,(OFST+2,sp)
1283  000f cd0000        	call	_OneWire_WriteBit
1285  0012 84            	pop	a
1286                     ; 215 		byte >>= 1;
1288  0013 0406          	srl	(OFST+5,sp)
1289  0015 7b01          	ld	a,(OFST+0,sp)
1290  0017               L354:
1291                     ; 212 	while (i--) {
1293  0017 0a01          	dec	(OFST+0,sp)
1295  0019 4d            	tnz	a
1296  001a 26ec          	jrne	L744
1297                     ; 217 }
1300  001c 5b03          	addw	sp,#3
1301  001e 81            	ret	
1353                     ; 219 uint8_t OneWire_ReadByte(OneWire_t* OneWireStruct) {
1354                     .text:	section	.text,new
1355  0000               _OneWire_ReadByte:
1357  0000 89            	pushw	x
1358  0001 89            	pushw	x
1359       00000002      OFST:	set	2
1362                     ; 220 	uint8_t i = 8;
1364  0002 a608          	ld	a,#8
1365  0004 6b01          	ld	(OFST-1,sp),a
1367                     ; 221 	uint8_t byte = 0;
1369  0006 0f02          	clr	(OFST+0,sp)
1372  0008 2010          	jra	L705
1373  000a               L305:
1374                     ; 223 		byte >>= 1;
1376  000a 0402          	srl	(OFST+0,sp)
1378                     ; 224 		byte |= (OneWire_ReadBit(OneWireStruct) << 7);
1380  000c 1e03          	ldw	x,(OFST+1,sp)
1381  000e cd0000        	call	_OneWire_ReadBit
1383  0011 97            	ld	xl,a
1384  0012 a680          	ld	a,#128
1385  0014 42            	mul	x,a
1386  0015 9f            	ld	a,xl
1387  0016 1a02          	or	a,(OFST+0,sp)
1388  0018 6b02          	ld	(OFST+0,sp),a
1390  001a               L705:
1391                     ; 222 	while (i--) {
1393  001a 7b01          	ld	a,(OFST-1,sp)
1394  001c 0a01          	dec	(OFST-1,sp)
1396  001e 4d            	tnz	a
1397  001f 26e9          	jrne	L305
1398                     ; 227 	return byte;
1400  0021 7b02          	ld	a,(OFST+0,sp)
1403  0023 5b04          	addw	sp,#4
1404  0025 81            	ret	
1442                     ; 230 uint8_t OneWire_Next(OneWire_t* OneWireStruct) {
1443                     .text:	section	.text,new
1444  0000               _OneWire_Next:
1448                     ; 232 	return OneWire_Search(OneWireStruct, ONEWIRE_CMD_SEARCHROM);
1450  0000 4bf0          	push	#240
1451  0002 cd0000        	call	_OneWire_Search
1453  0005 5b01          	addw	sp,#1
1456  0007 81            	ret	
1500                     ; 235 uint8_t OneWire_GetROM(OneWire_t* OneWireStruct, uint8_t index) {
1501                     .text:	section	.text,new
1502  0000               _OneWire_GetROM:
1504       fffffffe      OFST: set -2
1507                     ; 236 	return OneWireStruct->ROM_NO[index];
1509  0000 01            	rrwa	x,a
1510  0001 1b03          	add	a,(OFST+5,sp)
1511  0003 2401          	jrnc	L651
1512  0005 5c            	incw	x
1513  0006               L651:
1514  0006 02            	rlwa	x,a
1515  0007 e606          	ld	a,(6,x)
1518  0009 81            	ret	
1572                     ; 239 void OneWire_GetFullROM(OneWire_t* OneWireStruct, uint8_t* firstIndex) {
1573                     .text:	section	.text,new
1574  0000               _OneWire_GetFullROM:
1576  0000 89            	pushw	x
1577  0001 88            	push	a
1578       00000001      OFST:	set	1
1581                     ; 241     for (i = 0; i < 8; i++) {
1583  0002 4f            	clr	a
1584  0003 6b01          	ld	(OFST+0,sp),a
1586  0005               L306:
1587                     ; 242         *(firstIndex + i) = OneWireStruct->ROM_NO[i];
1589  0005 5f            	clrw	x
1590  0006 97            	ld	xl,a
1591  0007 72fb06        	addw	x,(OFST+5,sp)
1592  000a 905f          	clrw	y
1593  000c 9097          	ld	yl,a
1594  000e 72f902        	addw	y,(OFST+1,sp)
1595  0011 90e606        	ld	a,(6,y)
1596  0014 f7            	ld	(x),a
1597                     ; 241     for (i = 0; i < 8; i++) {
1599  0015 0c01          	inc	(OFST+0,sp)
1603  0017 7b01          	ld	a,(OFST+0,sp)
1604  0019 a108          	cp	a,#8
1605  001b 25e8          	jrult	L306
1606                     ; 244 }
1609  001d 5b03          	addw	sp,#3
1610  001f 81            	ret	
1623                     	xdef	_OneWire_GetFullROM
1624                     	xdef	_OneWire_GetROM
1625                     	xdef	_OneWire_ReadByte
1626                     	xdef	_OneWire_WriteByte
1627                     	xdef	_OneWire_ReadBit
1628                     	xdef	_OneWire_WriteBit
1629                     	xdef	_OneWire_Next
1630                     	xdef	_OneWire_Search
1631                     	xdef	_OneWire_ResetSearch
1632                     	xdef	_OneWire_First
1633                     	xdef	_OneWire_Reset
1634                     	xdef	_OneWire_Init
1635                     	xref	_delay_us
1636                     	xref	_GPIO_ExternalPullUpConfig
1637                     	xref	_GPIO_ReadInputPin
1638                     	xref	_GPIO_WriteLow
1639                     	xref	_GPIO_WriteHigh
1640                     	xref	_GPIO_Init
1659                     	end
