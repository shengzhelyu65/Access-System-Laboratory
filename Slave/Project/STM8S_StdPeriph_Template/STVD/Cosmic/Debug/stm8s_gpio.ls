   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.8 - 08 Nov 2022
   3                     ; Generator (Limited) V4.5.5 - 08 Nov 2022
   4                     ; Optimizer V4.5.5 - 08 Nov 2022
 115                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 115                     ; 54 {
 117                     .text:	section	.text,new
 118  0000               _GPIO_DeInit:
 122                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 124  0000 7f            	clr	(x)
 125                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 127  0001 6f02          	clr	(2,x)
 128                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 130  0003 6f03          	clr	(3,x)
 131                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 133  0005 6f04          	clr	(4,x)
 134                     ; 59 }
 137  0007 81            	ret	
 377                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 377                     ; 72 {
 378                     .text:	section	.text,new
 379  0000               _GPIO_Init:
 381  0000 89            	pushw	x
 382       00000000      OFST:	set	0
 385                     ; 77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 387                     ; 78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 389                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 391  0001 7b05          	ld	a,(OFST+5,sp)
 392  0003 43            	cpl	a
 393  0004 e404          	and	a,(4,x)
 394  0006 e704          	ld	(4,x),a
 395                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 397  0008 7b06          	ld	a,(OFST+6,sp)
 398  000a 2a16          	jrpl	L771
 399                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 401  000c a510          	bcp	a,#16
 402  000e 2705          	jreq	L102
 403                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
 405  0010 f6            	ld	a,(x)
 406  0011 1a05          	or	a,(OFST+5,sp)
 408  0013 2004          	jra	L302
 409  0015               L102:
 410                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 412  0015 7b05          	ld	a,(OFST+5,sp)
 413  0017 43            	cpl	a
 414  0018 f4            	and	a,(x)
 415  0019               L302:
 416  0019 f7            	ld	(x),a
 417                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
 419  001a 1e01          	ldw	x,(OFST+1,sp)
 420  001c e602          	ld	a,(2,x)
 421  001e 1a05          	or	a,(OFST+5,sp)
 423  0020 2005          	jra	L502
 424  0022               L771:
 425                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 427  0022 7b05          	ld	a,(OFST+5,sp)
 428  0024 43            	cpl	a
 429  0025 e402          	and	a,(2,x)
 430  0027               L502:
 431  0027 e702          	ld	(2,x),a
 432                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 434  0029 7b06          	ld	a,(OFST+6,sp)
 435  002b a540          	bcp	a,#64
 436  002d 2706          	jreq	L702
 437                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 439  002f e603          	ld	a,(3,x)
 440  0031 1a05          	or	a,(OFST+5,sp)
 442  0033 2005          	jra	L112
 443  0035               L702:
 444                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 446  0035 7b05          	ld	a,(OFST+5,sp)
 447  0037 43            	cpl	a
 448  0038 e403          	and	a,(3,x)
 449  003a               L112:
 450  003a e703          	ld	(3,x),a
 451                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 453  003c 7b06          	ld	a,(OFST+6,sp)
 454  003e a520          	bcp	a,#32
 455  0040 2706          	jreq	L312
 456                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 458  0042 e604          	ld	a,(4,x)
 459  0044 1a05          	or	a,(OFST+5,sp)
 461  0046 2005          	jra	L512
 462  0048               L312:
 463                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 465  0048 7b05          	ld	a,(OFST+5,sp)
 466  004a 43            	cpl	a
 467  004b e404          	and	a,(4,x)
 468  004d               L512:
 469  004d e704          	ld	(4,x),a
 470                     ; 131 }
 473  004f 85            	popw	x
 474  0050 81            	ret	
 518                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 518                     ; 142 {
 519                     .text:	section	.text,new
 520  0000               _GPIO_Write:
 522       fffffffe      OFST: set -2
 525                     ; 143   GPIOx->ODR = PortVal;
 527  0000 7b03          	ld	a,(OFST+5,sp)
 528  0002 f7            	ld	(x),a
 529                     ; 144 }
 532  0003 81            	ret	
 579                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 579                     ; 155 {
 580                     .text:	section	.text,new
 581  0000               _GPIO_WriteHigh:
 583       fffffffe      OFST: set -2
 586                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 588  0000 f6            	ld	a,(x)
 589  0001 1a03          	or	a,(OFST+5,sp)
 590  0003 f7            	ld	(x),a
 591                     ; 157 }
 594  0004 81            	ret	
 641                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 641                     ; 168 {
 642                     .text:	section	.text,new
 643  0000               _GPIO_WriteLow:
 645       fffffffe      OFST: set -2
 648                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 650  0000 7b03          	ld	a,(OFST+5,sp)
 651  0002 43            	cpl	a
 652  0003 f4            	and	a,(x)
 653  0004 f7            	ld	(x),a
 654                     ; 170 }
 657  0005 81            	ret	
 704                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 704                     ; 181 {
 705                     .text:	section	.text,new
 706  0000               _GPIO_WriteReverse:
 708       fffffffe      OFST: set -2
 711                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 713  0000 f6            	ld	a,(x)
 714  0001 1803          	xor	a,(OFST+5,sp)
 715  0003 f7            	ld	(x),a
 716                     ; 183 }
 719  0004 81            	ret	
 757                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 757                     ; 192 {
 758                     .text:	section	.text,new
 759  0000               _GPIO_ReadOutputData:
 763                     ; 193   return ((uint8_t)GPIOx->ODR);
 765  0000 f6            	ld	a,(x)
 768  0001 81            	ret	
 805                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 805                     ; 203 {
 806                     .text:	section	.text,new
 807  0000               _GPIO_ReadInputData:
 811                     ; 204   return ((uint8_t)GPIOx->IDR);
 813  0000 e601          	ld	a,(1,x)
 816  0002 81            	ret	
 884                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 884                     ; 214 {
 885                     .text:	section	.text,new
 886  0000               _GPIO_ReadInputPin:
 888       fffffffe      OFST: set -2
 891                     ; 215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 893  0000 e601          	ld	a,(1,x)
 894  0002 1403          	and	a,(OFST+5,sp)
 897  0004 81            	ret	
 975                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 975                     ; 226 {
 976                     .text:	section	.text,new
 977  0000               _GPIO_ExternalPullUpConfig:
 979       fffffffe      OFST: set -2
 982                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 984                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 986                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
 988  0000 7b04          	ld	a,(OFST+6,sp)
 989  0002 2706          	jreq	L174
 990                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 992  0004 e603          	ld	a,(3,x)
 993  0006 1a03          	or	a,(OFST+5,sp)
 995  0008 2005          	jra	L374
 996  000a               L174:
 997                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 999  000a 7b03          	ld	a,(OFST+5,sp)
1000  000c 43            	cpl	a
1001  000d e403          	and	a,(3,x)
1002  000f               L374:
1003  000f e703          	ld	(3,x),a
1004                     ; 238 }
1007  0011 81            	ret	
1020                     	xdef	_GPIO_ExternalPullUpConfig
1021                     	xdef	_GPIO_ReadInputPin
1022                     	xdef	_GPIO_ReadOutputData
1023                     	xdef	_GPIO_ReadInputData
1024                     	xdef	_GPIO_WriteReverse
1025                     	xdef	_GPIO_WriteLow
1026                     	xdef	_GPIO_WriteHigh
1027                     	xdef	_GPIO_Write
1028                     	xdef	_GPIO_Init
1029                     	xdef	_GPIO_DeInit
1048                     	end
