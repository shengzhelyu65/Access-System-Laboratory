   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.8 - 08 Nov 2022
   3                     ; Generator (Limited) V4.5.5 - 08 Nov 2022
   4                     ; Optimizer V4.5.5 - 08 Nov 2022
  50                     ; 56 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  50                     ; 57 {
  51                     .text:	section	.text,new
  52  0000               f_NonHandledInterrupt:
  56                     ; 61 }
  59  0000 80            	iret	
  81                     ; 69 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  81                     ; 70 {
  82                     .text:	section	.text,new
  83  0000               f_TRAP_IRQHandler:
  87                     ; 74 }
  90  0000 80            	iret	
 112                     ; 81 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 112                     ; 82 
 112                     ; 83 {
 113                     .text:	section	.text,new
 114  0000               f_TLI_IRQHandler:
 118                     ; 87 }
 121  0000 80            	iret	
 143                     ; 94 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 143                     ; 95 {
 144                     .text:	section	.text,new
 145  0000               f_AWU_IRQHandler:
 149                     ; 99 }
 152  0000 80            	iret	
 174                     ; 106 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 174                     ; 107 {
 175                     .text:	section	.text,new
 176  0000               f_CLK_IRQHandler:
 180                     ; 111 }
 183  0000 80            	iret	
 206                     ; 118 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 206                     ; 119 {
 207                     .text:	section	.text,new
 208  0000               f_EXTI_PORTA_IRQHandler:
 212                     ; 123 }
 215  0000 80            	iret	
 238                     ; 130 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 238                     ; 131 {
 239                     .text:	section	.text,new
 240  0000               f_EXTI_PORTB_IRQHandler:
 244                     ; 135 }
 247  0000 80            	iret	
 270                     ; 142 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 270                     ; 143 {
 271                     .text:	section	.text,new
 272  0000               f_EXTI_PORTC_IRQHandler:
 276                     ; 147 }
 279  0000 80            	iret	
 302                     ; 154 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 302                     ; 155 {
 303                     .text:	section	.text,new
 304  0000               f_EXTI_PORTD_IRQHandler:
 308                     ; 159 }
 311  0000 80            	iret	
 334                     ; 166 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 334                     ; 167 {
 335                     .text:	section	.text,new
 336  0000               f_EXTI_PORTE_IRQHandler:
 340                     ; 171 }
 343  0000 80            	iret	
 365                     ; 218 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 365                     ; 219 {
 366                     .text:	section	.text,new
 367  0000               f_SPI_IRQHandler:
 371                     ; 223 }
 374  0000 80            	iret	
 397                     ; 230 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 397                     ; 231 {
 398                     .text:	section	.text,new
 399  0000               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 403                     ; 235 }
 406  0000 80            	iret	
 429                     ; 242 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 429                     ; 243 {
 430                     .text:	section	.text,new
 431  0000               f_TIM1_CAP_COM_IRQHandler:
 435                     ; 247 }
 438  0000 80            	iret	
 464                     ; 280  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 464                     ; 281  {
 465                     .text:	section	.text,new
 466  0000               f_TIM2_UPD_OVF_BRK_IRQHandler:
 468  0000 8a            	push	cc
 469  0001 84            	pop	a
 470  0002 a4bf          	and	a,#191
 471  0004 88            	push	a
 472  0005 86            	pop	cc
 473  0006 3b0002        	push	c_x+2
 474  0009 be00          	ldw	x,c_x
 475  000b 89            	pushw	x
 476  000c 3b0002        	push	c_y+2
 477  000f be00          	ldw	x,c_y
 478  0011 89            	pushw	x
 481                     ; 285 	if (TIM2_GetITStatus(TIM2_IT_UPDATE) == SET) {
 483  0012 a601          	ld	a,#1
 484  0014 cd0000        	call	_TIM2_GetITStatus
 486  0017 4a            	dec	a
 487  0018 2608          	jrne	L171
 488                     ; 286 		TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
 490  001a 4c            	inc	a
 491  001b cd0000        	call	_TIM2_ClearITPendingBit
 493                     ; 287 		ctTim2++;
 495  001e 725c0000      	inc	_ctTim2
 496  0022               L171:
 497                     ; 289  }
 500  0022 85            	popw	x
 501  0023 bf00          	ldw	c_y,x
 502  0025 320002        	pop	c_y+2
 503  0028 85            	popw	x
 504  0029 bf00          	ldw	c_x,x
 505  002b 320002        	pop	c_x+2
 506  002e 80            	iret	
 529                     ; 296  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 529                     ; 297  {
 530                     .text:	section	.text,new
 531  0000               f_TIM2_CAP_COM_IRQHandler:
 535                     ; 301  }
 538  0000 80            	iret	
 561                     ; 311  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 561                     ; 312  {
 562                     .text:	section	.text,new
 563  0000               f_TIM3_UPD_OVF_BRK_IRQHandler:
 567                     ; 316  }
 570  0000 80            	iret	
 593                     ; 323  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 593                     ; 324  {
 594                     .text:	section	.text,new
 595  0000               f_TIM3_CAP_COM_IRQHandler:
 599                     ; 328  }
 602  0000 80            	iret	
 624                     ; 389 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 624                     ; 390 {
 625                     .text:	section	.text,new
 626  0000               f_I2C_IRQHandler:
 630                     ; 394 }
 633  0000 80            	iret	
 656                     ; 402  INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
 656                     ; 403  {
 657                     .text:	section	.text,new
 658  0000               f_UART2_TX_IRQHandler:
 662                     ; 407  }
 665  0000 80            	iret	
 688                     ; 414  INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
 688                     ; 415  {
 689                     .text:	section	.text,new
 690  0000               f_UART2_RX_IRQHandler:
 694                     ; 419  }
 697  0000 80            	iret	
 719                     ; 468  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 719                     ; 469  {
 720                     .text:	section	.text,new
 721  0000               f_ADC1_IRQHandler:
 725                     ; 473  }
 728  0000 80            	iret	
 752                     ; 494  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 752                     ; 495  {
 753                     .text:	section	.text,new
 754  0000               f_TIM4_UPD_OVF_IRQHandler:
 756  0000 8a            	push	cc
 757  0001 84            	pop	a
 758  0002 a4bf          	and	a,#191
 759  0004 88            	push	a
 760  0005 86            	pop	cc
 761  0006 3b0002        	push	c_x+2
 762  0009 be00          	ldw	x,c_x
 763  000b 89            	pushw	x
 764  000c 3b0002        	push	c_y+2
 765  000f be00          	ldw	x,c_y
 766  0011 89            	pushw	x
 769                     ; 499 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 771  0012 a601          	ld	a,#1
 772  0014 cd0000        	call	_TIM4_ClearITPendingBit
 774                     ; 501  }
 777  0017 85            	popw	x
 778  0018 bf00          	ldw	c_y,x
 779  001a 320002        	pop	c_y+2
 780  001d 85            	popw	x
 781  001e bf00          	ldw	c_x,x
 782  0020 320002        	pop	c_x+2
 783  0023 80            	iret	
 806                     ; 509 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 806                     ; 510 {
 807                     .text:	section	.text,new
 808  0000               f_EEPROM_EEC_IRQHandler:
 812                     ; 514 }
 815  0000 80            	iret	
 827                     	xref	_ctTim2
 828                     	xdef	f_EEPROM_EEC_IRQHandler
 829                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 830                     	xdef	f_ADC1_IRQHandler
 831                     	xdef	f_UART2_TX_IRQHandler
 832                     	xdef	f_UART2_RX_IRQHandler
 833                     	xdef	f_I2C_IRQHandler
 834                     	xdef	f_TIM3_CAP_COM_IRQHandler
 835                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
 836                     	xdef	f_TIM2_CAP_COM_IRQHandler
 837                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 838                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 839                     	xdef	f_TIM1_CAP_COM_IRQHandler
 840                     	xdef	f_SPI_IRQHandler
 841                     	xdef	f_EXTI_PORTE_IRQHandler
 842                     	xdef	f_EXTI_PORTD_IRQHandler
 843                     	xdef	f_EXTI_PORTC_IRQHandler
 844                     	xdef	f_EXTI_PORTB_IRQHandler
 845                     	xdef	f_EXTI_PORTA_IRQHandler
 846                     	xdef	f_CLK_IRQHandler
 847                     	xdef	f_AWU_IRQHandler
 848                     	xdef	f_TLI_IRQHandler
 849                     	xdef	f_TRAP_IRQHandler
 850                     	xdef	f_NonHandledInterrupt
 851                     	xref	_TIM4_ClearITPendingBit
 852                     	xref	_TIM2_ClearITPendingBit
 853                     	xref	_TIM2_GetITStatus
 854                     	xref.b	c_x
 855                     	xref.b	c_y
 874                     	end
