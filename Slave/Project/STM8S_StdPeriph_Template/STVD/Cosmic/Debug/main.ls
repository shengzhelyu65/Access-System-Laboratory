   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.8 - 08 Nov 2022
   3                     ; Generator (Limited) V4.5.5 - 08 Nov 2022
   4                     ; Optimizer V4.5.5 - 08 Nov 2022
  21                     	switch	.data
  22  0000               _open5:
  23  0000 00            	dc.b	0
  24  0001               _noPerson5:
  25  0001 00            	dc.b	0
  26  0002               _timer2:
  27  0002 00            	dc.b	0
  28  0003               _ctTim2:
  29  0003 00            	dc.b	0
  30  0004               _tx_addr:
  31  0004 aa            	dc.b	170
  32  0005 bb            	dc.b	187
  33  0006 cc            	dc.b	204
  34  0007 dd            	dc.b	221
  35  0008 ee            	dc.b	238
  36  0009               _rx_addr:
  37  0009 aa            	dc.b	170
  38  000a bb            	dc.b	187
  39  000b cc            	dc.b	204
  40  000c dd            	dc.b	221
  41  000d ee            	dc.b	238
  42  000e               _channel:
  43  000e 15            	dc.b	21
  44  000f               _tx_data:
  45  000f 00            	dc.b	0
  46  0010 01            	dc.b	1
  47  0011 02            	dc.b	2
  48  0012 03            	dc.b	3
  49  0013 04            	dc.b	4
  50  0014 05            	dc.b	5
  51  0015 06            	dc.b	6
  52  0016 07            	dc.b	7
  53  0017 08            	dc.b	8
  54  0018 09            	dc.b	9
  55  0019 0a            	dc.b	10
  56  001a 0b            	dc.b	11
  57  001b 0c            	dc.b	12
  58  001c 0d            	dc.b	13
  59  001d 0e            	dc.b	14
  60  001e 0f            	dc.b	15
  61  001f 10            	dc.b	16
  62  0020 11            	dc.b	17
  63  0021 12            	dc.b	18
  64  0022 13            	dc.b	19
  65  0023 14            	dc.b	20
  66  0024 15            	dc.b	21
  67  0025 16            	dc.b	22
  68  0026 17            	dc.b	23
  69  0027 18            	dc.b	24
  70  0028 19            	dc.b	25
  71  0029 1a            	dc.b	26
  72  002a 1b            	dc.b	27
  73  002b 1c            	dc.b	28
  74  002c 1d            	dc.b	29
  75  002d 1e            	dc.b	30
  76  002e 1f            	dc.b	31
  77  002f               _trust:
  78  002f 01            	dc.b	1
  79  0030               _start:
  80  0030 00            	dc.b	0
  81  0031               _count:
  82  0031 0000          	dc.w	0
 145                     ; 50 int main( void )
 145                     ; 51 {
 147                     .text:	section	.text,new
 148  0000               _main:
 152                     ; 52 	clock_setup();
 154  0000 cd0000        	call	_clock_setup
 156                     ; 53 	GPIO_setup();
 158  0003 cd0000        	call	_GPIO_setup
 160                     ; 54 	OneWire_Init(&OneWire, IBUTTON_PORT, IBUTTON_PIN);
 162  0006 4b04          	push	#4
 163  0008 ae5005        	ldw	x,#20485
 164  000b 89            	pushw	x
 165  000c ae0000        	ldw	x,#_OneWire
 166  000f cd0000        	call	_OneWire_Init
 168  0012 5b03          	addw	sp,#3
 169                     ; 55 	id[8] = SLAVER_ID;
 171  0014 35020019      	mov	_id+8,#2
 172  0018               L12:
 173                     ; 176 		start = 0;
 175  0018 725f0030      	clr	_start
 176                     ; 177 		count = 0;
 178  001c 5f            	clrw	x
 179  001d cf0031        	ldw	_count,x
 180                     ; 178 		trust = 1;
 182  0020 3501002f      	mov	_trust,#1
 183                     ; 180 		if (timer2 == false) {
 185  0024 c60002        	ld	a,_timer2
 186  0027 2703cc0151    	jrne	L52
 187  002c               L72:
 188                     ; 182 				if (!OneWire_Reset(&OneWire)) {
 190  002c ae0000        	ldw	x,#_OneWire
 191  002f cd0000        	call	_OneWire_Reset
 193  0032 4d            	tnz	a
 194  0033 2703cc00d8    	jrne	L33
 195                     ; 183 					OneWire_WriteByte(&OneWire, 0x33);
 197  0038 4b33          	push	#51
 198  003a ae0000        	ldw	x,#_OneWire
 199  003d cd0000        	call	_OneWire_WriteByte
 201  0040 725f000f      	clr	_i
 202  0044 84            	pop	a
 203                     ; 185 					for (i = 0; i < 8; i++) {
 205  0045               L53:
 206                     ; 186 						received_id = OneWire_ReadByte(&OneWire);
 208  0045 ae0000        	ldw	x,#_OneWire
 209  0048 cd0000        	call	_OneWire_ReadByte
 211  004b c70010        	ld	_received_id,a
 212                     ; 187 						if (id[i] != received_id) {
 214  004e 5f            	clrw	x
 215  004f c6000f        	ld	a,_i
 216  0052 97            	ld	xl,a
 217  0053 d60011        	ld	a,(_id,x)
 218  0056 c10010        	cp	a,_received_id
 219  0059 2704          	jreq	L34
 220                     ; 188 							trust = 0;
 222  005b 725f002f      	clr	_trust
 223  005f               L34:
 224                     ; 190 						id[i] = received_id;
 226  005f c6000f        	ld	a,_i
 227  0062 5f            	clrw	x
 228  0063 97            	ld	xl,a
 229  0064 c60010        	ld	a,_received_id
 230  0067 d70011        	ld	(_id,x),a
 231                     ; 185 					for (i = 0; i < 8; i++) {
 233  006a 725c000f      	inc	_i
 236  006e c6000f        	ld	a,_i
 237  0071 a108          	cp	a,#8
 238  0073 25d0          	jrult	L53
 239                     ; 192 					if (id[0] == 0x01) {
 241  0075 c60011        	ld	a,_id
 242  0078 4a            	dec	a
 243  0079 265d          	jrne	L33
 244                     ; 193 						break;
 245                     ; 199 			RF24L01_init();
 247  007b cd0000        	call	_RF24L01_init
 249                     ; 200 			RF24L01_set_mode_TX((uint8_t *)&tx_addr, channel);
 251  007e 3b000e        	push	_channel
 252  0081 ae0004        	ldw	x,#_tx_addr
 253  0084 cd0000        	call	_RF24L01_set_mode_TX
 255  0087 84            	pop	a
 256                     ; 202 			if (RF24L01_write_payload(id, 32) == 1) {
 258  0088 4b20          	push	#32
 259  008a ae0011        	ldw	x,#_id
 260  008d cd0000        	call	_RF24L01_write_payload
 262  0090 5b01          	addw	sp,#1
 263  0092 4a            	dec	a
 264  0093 2683          	jrne	L12
 265                     ; 203 				RF24L01_set_mode_RX((uint8_t *)&rx_addr, channel);
 267  0095 3b000e        	push	_channel
 268  0098 ae0009        	ldw	x,#_rx_addr
 269  009b cd0000        	call	_RF24L01_set_mode_RX
 271  009e 84            	pop	a
 272  009f               L15:
 273                     ; 205 					count++;
 275  009f ce0031        	ldw	x,_count
 276  00a2 5c            	incw	x
 277  00a3 cf0031        	ldw	_count,x
 278                     ; 206 					if (RF24L01_is_data_available(1) == 1) {
 280  00a6 ae0001        	ldw	x,#1
 281  00a9 cd0000        	call	_RF24L01_is_data_available
 283  00ac 4a            	dec	a
 284  00ad 26f0          	jrne	L15
 285                     ; 207 						RF24L01_read_payload(rx_data, 32);
 287  00af 4b20          	push	#32
 288  00b1 ae001a        	ldw	x,#_rx_data
 289  00b4 cd0000        	call	_RF24L01_read_payload
 291  00b7 ae0014        	ldw	x,#20
 292  00ba 84            	pop	a
 293                     ; 208 						break;
 294                     ; 217 				delay_us(20);
 296  00bb cd0000        	call	_delay_us
 298                     ; 219 				if (rx_data[0] == (SLAVER_ID+1) && trust == 1 && rx_data[1] == SLAVER_ID) {
 300  00be c6001a        	ld	a,_rx_data
 301  00c1 a103          	cp	a,#3
 302  00c3 261c          	jrne	L75
 304  00c5 c6002f        	ld	a,_trust
 305  00c8 4a            	dec	a
 306  00c9 2616          	jrne	L75
 308  00cb c6001b        	ld	a,_rx_data+1
 309  00ce a102          	cp	a,#2
 310  00d0 260f          	jrne	L75
 311                     ; 220 					start = 1;
 313  00d2 35010030      	mov	_start,#1
 315  00d6 200d          	jra	L16
 316  00d8               L33:
 317                     ; 196 				delay_us(50);
 319  00d8 ae0032        	ldw	x,#50
 320  00db cd0000        	call	_delay_us
 323  00de cc002c        	jra	L72
 324  00e1               L75:
 325                     ; 222 					start = 0;
 327  00e1 725f0030      	clr	_start
 328  00e5               L16:
 329                     ; 225 				if (start == 1 && trust == 1 && rx_data[1] == SLAVER_ID) { // permission granted
 331  00e5 c60030        	ld	a,_start
 332  00e8 4a            	dec	a
 333  00e9 2626          	jrne	L36
 335  00eb c6002f        	ld	a,_trust
 336  00ee 4a            	dec	a
 337  00ef 2620          	jrne	L36
 339  00f1 c6001b        	ld	a,_rx_data+1
 340  00f4 a102          	cp	a,#2
 341  00f6 2619          	jrne	L36
 342                     ; 226 					GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN);
 344  00f8 cd01c6        	call	LC002
 346                     ; 232 					GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN);
 348  00fb cd01c6        	call	LC002
 350                     ; 239 					timer2 = true;
 352  00fe 35010002      	mov	_timer2,#1
 353                     ; 240 					GPIO_WriteHigh(RELAY_PORT, RELAY_PIN);
 355  0102 4b20          	push	#32
 356  0104 ae5005        	ldw	x,#20485
 357  0107 cd0000        	call	_GPIO_WriteHigh
 359  010a 84            	pop	a
 360                     ; 241 					TIM2_setup();
 362  010b cd0000        	call	_TIM2_setup
 365  010e cc0018        	jra	L12
 366  0111               L36:
 367                     ; 243 					if (start == 0 && trust == 1 && rx_data[1] == SLAVER_ID) {
 369  0111 c60030        	ld	a,_start
 370  0114 2632          	jrne	L76
 372  0116 c6002f        	ld	a,_trust
 373  0119 4a            	dec	a
 374  011a 262c          	jrne	L76
 376  011c c6001b        	ld	a,_rx_data+1
 377  011f a102          	cp	a,#2
 378  0121 2625          	jrne	L76
 379                     ; 244 						GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN);
 381  0123 4b01          	push	#1
 382  0125 ae5005        	ldw	x,#20485
 383  0128 cd0000        	call	_GPIO_WriteHigh
 385  012b ae0190        	ldw	x,#400
 386  012e 84            	pop	a
 387                     ; 245 						delay_ms(400);
 389  012f cd0000        	call	_delay_ms
 391                     ; 246 						GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
 393  0132 4b01          	push	#1
 394  0134 ae5005        	ldw	x,#20485
 395  0137 cd0000        	call	_GPIO_WriteLow
 397  013a 725f0002      	clr	_timer2
 398  013e 84            	pop	a
 399                     ; 247 						timer2 = false;
 401                     ; 248 						GPIO_WriteLow(RELAY_PORT, RELAY_PIN);
 403  013f 4b20          	push	#32
 404  0141 ae5005        	ldw	x,#20485
 405  0144 cd0000        	call	_GPIO_WriteLow
 407  0147 84            	pop	a
 408  0148               L76:
 409                     ; 250 					delay_ms(200);
 411  0148 ae00c8        	ldw	x,#200
 412  014b cd0000        	call	_delay_ms
 414  014e cc0018        	jra	L12
 415  0151               L52:
 416                     ; 254 			if (ctTim2 > machineTimeLimit) { // TIM2 limit
 418  0151 c60003        	ld	a,_ctTim2
 419  0154 a129          	cp	a,#41
 420                     ; 255 				TIM2_reset();
 423  0156 2468          	jruge	LC001
 424                     ; 257 				if ((GPIO_ReadInputPin(PIR_PORT, PIR_PIN) == 0) && (noPerson5 == false)) {
 426  0158 cd01f6        	call	LC003
 427  015b 2650          	jrne	L77
 429  015d c60001        	ld	a,_noPerson5
 430  0160 264b          	jrne	L77
 431                     ; 258 					GPIO_WriteHigh(LED_PORT, LED_PIN);
 433  0162 4b02          	push	#2
 434  0164 ae500a        	ldw	x,#20490
 435  0167 cd0000        	call	_GPIO_WriteHigh
 437  016a 35010001      	mov	_noPerson5,#1
 438  016e 550003000e    	mov	_tmp_tim,_ctTim2
 439                     ; 259 					noPerson5 = true;
 441                     ; 260 					tmp_tim = ctTim2;
 444  0173 2024          	jra	L501
 445  0175               L101:
 446                     ; 262 						if ( (noPerson5 == true) && GPIO_ReadInputPin(PIR_PORT, PIR_PIN) == 0) {
 448  0175 c60001        	ld	a,_noPerson5
 449  0178 4a            	dec	a
 450  0179 260e          	jrne	L111
 452  017b ad79          	call	LC003
 453  017d 260a          	jrne	L111
 454                     ; 263 							GPIO_WriteHigh(LED_PORT, LED_PIN);
 456  017f 4b02          	push	#2
 457  0181 ae500a        	ldw	x,#20490
 458  0184 cd0000        	call	_GPIO_WriteHigh
 461  0187 2010          	jra	L501
 462  0189               L111:
 463                     ; 266 							GPIO_WriteLow(LED_PORT, LED_PIN);
 465  0189 4b02          	push	#2
 466  018b ae500a        	ldw	x,#20490
 467  018e cd0000        	call	_GPIO_WriteLow
 469  0191 725f0001      	clr	_noPerson5
 470  0195 84            	pop	a
 471                     ; 267 							noPerson5 = false;
 473                     ; 268 							break;
 475  0196 cc0018        	jra	L12
 476  0199               L501:
 477  0199 84            	pop	a
 478                     ; 261 					while ((ctTim2 - tmp_tim) <= noPersonLimit) {
 480  019a c60003        	ld	a,_ctTim2
 481  019d 5f            	clrw	x
 482  019e c0000e        	sub	a,_tmp_tim
 483  01a1 2401          	jrnc	L421
 484  01a3 5a            	decw	x
 485  01a4               L421:
 486  01a4 02            	rlwa	x,a
 487  01a5 a3000b        	cpw	x,#11
 488  01a8 2fcb          	jrslt	L101
 489  01aa cc0018        	jra	L12
 490  01ad               L77:
 491                     ; 271 				} else if ((GPIO_ReadInputPin(PIR_PORT, PIR_PIN) == 0) && (noPerson5 == true)) {
 493  01ad ad47          	call	LC003
 494  01af 26f9          	jrne	L12
 496  01b1 c60001        	ld	a,_noPerson5
 497  01b4 4a            	dec	a
 498  01b5 26f3          	jrne	L12
 499                     ; 272 					GPIO_WriteLow(LED_PORT, LED_PIN);
 501  01b7 4b02          	push	#2
 502  01b9 ae500a        	ldw	x,#20490
 503  01bc cd0000        	call	_GPIO_WriteLow
 505  01bf 84            	pop	a
 506                     ; 273 					TIM2_reset();
 508  01c0               LC001:
 510  01c0 cd0000        	call	_TIM2_reset
 512  01c3 cc0018        	jra	L12
 513  01c6               LC002:
 514  01c6 4b01          	push	#1
 515  01c8 ae5005        	ldw	x,#20485
 516  01cb cd0000        	call	_GPIO_WriteHigh
 518  01ce 84            	pop	a
 519                     ; 227 					GPIO_WriteHigh(LED_PORT, LED_PIN);
 521  01cf 4b02          	push	#2
 522  01d1 ae500a        	ldw	x,#20490
 523  01d4 cd0000        	call	_GPIO_WriteHigh
 525  01d7 ae0064        	ldw	x,#100
 526  01da 84            	pop	a
 527                     ; 228 					delay_ms(100);
 529  01db cd0000        	call	_delay_ms
 531                     ; 229 					GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
 533  01de 4b01          	push	#1
 534  01e0 ae5005        	ldw	x,#20485
 535  01e3 cd0000        	call	_GPIO_WriteLow
 537  01e6 84            	pop	a
 538                     ; 230 					GPIO_WriteLow(LED_PORT, LED_PIN);
 540  01e7 4b02          	push	#2
 541  01e9 ae500a        	ldw	x,#20490
 542  01ec cd0000        	call	_GPIO_WriteLow
 544  01ef ae0064        	ldw	x,#100
 545  01f2 84            	pop	a
 546                     ; 231 					delay_ms(100);
 548  01f3 cc0000        	jp	_delay_ms
 549  01f6               LC003:
 550  01f6 4b04          	push	#4
 551  01f8 ae500f        	ldw	x,#20495
 552  01fb cd0000        	call	_GPIO_ReadInputPin
 554  01fe 5b01          	addw	sp,#1
 555  0200 4d            	tnz	a
 556  0201 81            	ret	
 584                     ; 281 void TIM2_setup(void)
 584                     ; 282 {
 585                     .text:	section	.text,new
 586  0000               _TIM2_setup:
 590                     ; 283 	ctTim2 = 0;	
 592  0000 725f0003      	clr	_ctTim2
 593                     ; 285 	TIM2_TimeBaseInit(TIM2_PRESCALER_512, 15625); // 0.5s
 595  0004 ae3d09        	ldw	x,#15625
 596  0007 89            	pushw	x
 597  0008 a609          	ld	a,#9
 598  000a cd0000        	call	_TIM2_TimeBaseInit
 600  000d 85            	popw	x
 601                     ; 287 	TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
 603  000e ae0101        	ldw	x,#257
 604  0011 cd0000        	call	_TIM2_ITConfig
 606                     ; 289 	enableInterrupts();		
 609  0014 9a            	rim	
 611                     ; 291 	TIM2_Cmd(ENABLE);
 614  0015 a601          	ld	a,#1
 616                     ; 292 }
 619  0017 cc0000        	jp	_TIM2_Cmd
 652                     ; 294 void TIM2_reset(void)
 652                     ; 295 {
 653                     .text:	section	.text,new
 654  0000               _TIM2_reset:
 658                     ; 296 	GPIO_WriteLow(RELAY_PORT, RELAY_PIN);
 660  0000 4b20          	push	#32
 661  0002 ae5005        	ldw	x,#20485
 662  0005 cd0000        	call	_GPIO_WriteLow
 664  0008 84            	pop	a
 665                     ; 297 	GPIO_WriteLow(LED_PORT, LED_PIN);
 667  0009 4b02          	push	#2
 668  000b ae500a        	ldw	x,#20490
 669  000e cd0000        	call	_GPIO_WriteLow
 671  0011 725f0002      	clr	_timer2
 672  0015 725f0001      	clr	_noPerson5
 673  0019 ae0100        	ldw	x,#256
 674  001c 84            	pop	a
 675                     ; 298 	timer2 = false;
 677                     ; 299 	noPerson5 = false;
 679                     ; 301 	TIM2_ITConfig(TIM2_IT_UPDATE, DISABLE);
 681  001d cd0000        	call	_TIM2_ITConfig
 683                     ; 302 	TIM2_Cmd(DISABLE);
 685  0020 4f            	clr	a
 686  0021 cd0000        	call	_TIM2_Cmd
 688                     ; 303 	TIM2_ClearFlag(TIM2_FLAG_UPDATE);
 690  0024 ae0001        	ldw	x,#1
 691  0027 cd0000        	call	_TIM2_ClearFlag
 693                     ; 304 	ctTim2 = 0;
 695  002a 725f0003      	clr	_ctTim2
 696                     ; 305 	disableInterrupts();
 699  002e 9b            	sim	
 701                     ; 306 	GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN);
 704  002f 4b01          	push	#1
 705  0031 ae5005        	ldw	x,#20485
 706  0034 cd0000        	call	_GPIO_WriteHigh
 708  0037 ae0002        	ldw	x,#2
 709  003a 84            	pop	a
 710                     ; 307 	delay_s(2);
 712  003b cd0000        	call	_delay_s
 714                     ; 308 	GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
 716  003e 4b01          	push	#1
 717  0040 ae5005        	ldw	x,#20485
 718  0043 cd0000        	call	_GPIO_WriteLow
 720  0046 84            	pop	a
 721                     ; 309 }
 724  0047 81            	ret	
 748                     ; 311 void GPIO_setup(void)
 748                     ; 312 {
 749                     .text:	section	.text,new
 750  0000               _GPIO_setup:
 754                     ; 313 	GPIO_Init(GPIOA, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 756  0000 4be0          	push	#224
 757  0002 4b04          	push	#4
 758  0004 ae5000        	ldw	x,#20480
 759  0007 cd0000        	call	_GPIO_Init
 761  000a 85            	popw	x
 762                     ; 314 	GPIO_Init(GPIOA, GPIO_PIN_1, GPIO_MODE_OUT_PP_LOW_FAST);
 764  000b 4be0          	push	#224
 765  000d 4b02          	push	#2
 766  000f ae5000        	ldw	x,#20480
 767  0012 cd0000        	call	_GPIO_Init
 769  0015 85            	popw	x
 770                     ; 317 	GPIO_Init(BUZZER_PORT, BUZZER_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 772  0016 4be0          	push	#224
 773  0018 4b01          	push	#1
 774  001a ae5005        	ldw	x,#20485
 775  001d cd0000        	call	_GPIO_Init
 777  0020 85            	popw	x
 778                     ; 320 	GPIO_Init(LED_PORT, LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 780  0021 4be0          	push	#224
 781  0023 4b02          	push	#2
 782  0025 ae500a        	ldw	x,#20490
 783  0028 cd0000        	call	_GPIO_Init
 785  002b 85            	popw	x
 786                     ; 323 	GPIO_Init(RELAY_PORT, RELAY_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 788  002c 4be0          	push	#224
 789  002e 4b20          	push	#32
 790  0030 ae5005        	ldw	x,#20485
 791  0033 cd0000        	call	_GPIO_Init
 793  0036 85            	popw	x
 794                     ; 326 	GPIO_Init(REED_SWITCH_PORT, REED_SWITCH_PIN, GPIO_MODE_IN_FL_NO_IT);
 796  0037 4b00          	push	#0
 797  0039 4b02          	push	#2
 798  003b ae5005        	ldw	x,#20485
 799  003e cd0000        	call	_GPIO_Init
 801  0041 85            	popw	x
 802                     ; 329 	GPIO_Init(PIR_PORT, PIR_PIN, GPIO_MODE_IN_FL_NO_IT);
 804  0042 4b00          	push	#0
 805  0044 4b04          	push	#4
 806  0046 ae500f        	ldw	x,#20495
 807  0049 cd0000        	call	_GPIO_Init
 809  004c 72155007      	bres	20487,#2
 810  0050 85            	popw	x
 811                     ; 332   GPIOB->DDR &= ~(1 << 2);
 813                     ; 333 }
 816  0051 81            	ret	
1193                     	xdef	_main
1194                     	switch	.bss
1195  0000               _OneWire:
1196  0000 000000000000  	ds.b	14
1197                     	xdef	_OneWire
1198                     	xdef	_GPIO_setup
1199                     	xdef	_TIM2_reset
1200                     	xdef	_TIM2_setup
1201  000e               _tmp_tim:
1202  000e 00            	ds.b	1
1203                     	xdef	_tmp_tim
1204                     	xdef	_count
1205                     	xdef	_start
1206  000f               _i:
1207  000f 00            	ds.b	1
1208                     	xdef	_i
1209                     	xdef	_trust
1210  0010               _received_id:
1211  0010 00            	ds.b	1
1212                     	xdef	_received_id
1213  0011               _id:
1214  0011 000000000000  	ds.b	9
1215                     	xdef	_id
1216  001a               _rx_data:
1217  001a 000000000000  	ds.b	32
1218                     	xdef	_rx_data
1219                     	xdef	_tx_data
1220                     	xdef	_channel
1221                     	xdef	_rx_addr
1222                     	xdef	_tx_addr
1223                     	xdef	_ctTim2
1224                     	xdef	_timer2
1225                     	xdef	_noPerson5
1226                     	xdef	_open5
1227                     	xref	_RF24L01_is_data_available
1228                     	xref	_RF24L01_read_payload
1229                     	xref	_RF24L01_set_mode_RX
1230                     	xref	_RF24L01_write_payload
1231                     	xref	_RF24L01_set_mode_TX
1232                     	xref	_RF24L01_init
1233                     	xref	_OneWire_ReadByte
1234                     	xref	_OneWire_WriteByte
1235                     	xref	_OneWire_Reset
1236                     	xref	_OneWire_Init
1237                     	xref	_delay_s
1238                     	xref	_delay_ms
1239                     	xref	_delay_us
1240                     	xref	_clock_setup
1241                     	xref	_TIM2_ClearFlag
1242                     	xref	_TIM2_ITConfig
1243                     	xref	_TIM2_Cmd
1244                     	xref	_TIM2_TimeBaseInit
1245                     	xref	_GPIO_ReadInputPin
1246                     	xref	_GPIO_WriteLow
1247                     	xref	_GPIO_WriteHigh
1248                     	xref	_GPIO_Init
1268                     	end
