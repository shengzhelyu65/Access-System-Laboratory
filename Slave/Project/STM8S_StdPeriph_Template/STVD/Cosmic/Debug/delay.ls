   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.8 - 08 Nov 2022
   3                     ; Generator (Limited) V4.5.5 - 08 Nov 2022
   4                     ; Optimizer V4.5.5 - 08 Nov 2022
  51                     ; 3 void clock_setup(void)
  51                     ; 4 {
  53                     .text:	section	.text,new
  54  0000               _clock_setup:
  58                     ; 5 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
  60  0000 4f            	clr	a
  61  0001 cd0000        	call	_CLK_HSIPrescalerConfig
  63                     ; 7 	TIM4_DeInit();
  66                     ; 8 }
  69  0004 cc0000        	jp	_TIM4_DeInit
 106                     ; 10 void delay(unsigned int us)
 106                     ; 11 {
 107                     .text:	section	.text,new
 108  0000               _delay:
 112                     ; 13 	TIM4_TimeBaseInit(TIM4_PRESCALER_16, us);
 114  0000 9f            	ld	a,xl
 115  0001 ae0400        	ldw	x,#1024
 116  0004 97            	ld	xl,a
 117  0005 cd0000        	call	_TIM4_TimeBaseInit
 119                     ; 16 	TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 121  0008 a601          	ld	a,#1
 122  000a cd0000        	call	_TIM4_ClearFlag
 124                     ; 18 	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
 126  000d ae0101        	ldw	x,#257
 127  0010 cd0000        	call	_TIM4_ITConfig
 129                     ; 21 	TIM4_Cmd(ENABLE);
 131  0013 a601          	ld	a,#1
 132  0015 cd0000        	call	_TIM4_Cmd
 135  0018               L73:
 136                     ; 23 	while(SET != TIM4_GetFlagStatus(TIM4_FLAG_UPDATE));
 138  0018 a601          	ld	a,#1
 139  001a cd0000        	call	_TIM4_GetFlagStatus
 141  001d 4a            	dec	a
 142  001e 26f8          	jrne	L73
 143                     ; 27 }
 146  0020 81            	ret	
 179                     ; 29 void delay_us(unsigned int us)
 179                     ; 30 {
 180                     .text:	section	.text,new
 181  0000               _delay_us:
 183  0000 89            	pushw	x
 184       00000000      OFST:	set	0
 187                     ; 32 	if (us <= 200) {
 189  0001 a300c9        	cpw	x,#201
 190  0004 240f          	jruge	L56
 191                     ; 33 		delay(us);
 194  0006 2017          	jp	LC001
 195  0008               L36:
 196                     ; 36 			delay(200);
 198  0008 ae00c8        	ldw	x,#200
 199  000b cd0000        	call	_delay
 201                     ; 37 			us = us - 200;
 203  000e 1e01          	ldw	x,(OFST+1,sp)
 204  0010 1d00c8        	subw	x,#200
 205  0013 1f01          	ldw	(OFST+1,sp),x
 206  0015               L56:
 207                     ; 35 		while (us > 200) {
 209  0015 1e01          	ldw	x,(OFST+1,sp)
 210  0017 a300c9        	cpw	x,#201
 211  001a 24ec          	jruge	L36
 212                     ; 39 		if (us != 0) {
 214  001c 5d            	tnzw	x
 215  001d 2703          	jreq	L16
 216                     ; 40 			delay(us);
 218  001f               LC001:
 220  001f cd0000        	call	_delay
 222  0022               L16:
 223                     ; 43 }
 226  0022 85            	popw	x
 227  0023 81            	ret	
 260                     ; 45 void delay_ms(signed int ms)
 260                     ; 46 {
 261                     .text:	section	.text,new
 262  0000               _delay_ms:
 264  0000 89            	pushw	x
 265       00000000      OFST:	set	0
 268  0001 200a          	jra	L111
 269  0003               L701:
 270                     ; 48 		delay_us(200);
 272  0003 ad12          	call	LC002
 274                     ; 50 		delay_us(200);
 276  0005 ad10          	call	LC002
 278                     ; 52 		delay_us(200);
 280  0007 ae00c8        	ldw	x,#200
 281  000a cd0000        	call	_delay_us
 283  000d               L111:
 284                     ; 47 	while (ms--) {
 286  000d 1e01          	ldw	x,(OFST+1,sp)
 287  000f 5a            	decw	x
 288  0010 1f01          	ldw	(OFST+1,sp),x
 289  0012 5c            	incw	x
 290  0013 26ee          	jrne	L701
 291                     ; 54 }
 294  0015 85            	popw	x
 295  0016 81            	ret	
 296  0017               LC002:
 297  0017 ae00c8        	ldw	x,#200
 298  001a cd0000        	call	_delay_us
 300                     ; 49 		delay_us(200);
 302  001d ae00c8        	ldw	x,#200
 303  0020 cc0000        	jp	_delay_us
 336                     ; 56 void delay_s(signed int s)
 336                     ; 57 {
 337                     .text:	section	.text,new
 338  0000               _delay_s:
 340  0000 89            	pushw	x
 341       00000000      OFST:	set	0
 344  0001 2006          	jra	L331
 345  0003               L131:
 346                     ; 59 		delay_ms(1000);
 348  0003 ae03e8        	ldw	x,#1000
 349  0006 cd0000        	call	_delay_ms
 351  0009               L331:
 352                     ; 58 	while (s--) {
 354  0009 1e01          	ldw	x,(OFST+1,sp)
 355  000b 5a            	decw	x
 356  000c 1f01          	ldw	(OFST+1,sp),x
 357  000e 5c            	incw	x
 358  000f 26f2          	jrne	L131
 359                     ; 61 }
 362  0011 85            	popw	x
 363  0012 81            	ret	
 376                     	xdef	_delay_s
 377                     	xdef	_delay_ms
 378                     	xdef	_delay_us
 379                     	xdef	_delay
 380                     	xdef	_clock_setup
 381                     	xref	_TIM4_ClearFlag
 382                     	xref	_TIM4_GetFlagStatus
 383                     	xref	_TIM4_ITConfig
 384                     	xref	_TIM4_Cmd
 385                     	xref	_TIM4_TimeBaseInit
 386                     	xref	_TIM4_DeInit
 387                     	xref	_CLK_HSIPrescalerConfig
 406                     	end
