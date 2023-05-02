   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.8 - 08 Nov 2022
   3                     ; Generator (Limited) V4.5.5 - 08 Nov 2022
   4                     ; Optimizer V4.5.5 - 08 Nov 2022
  65                     ; 53 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  65                     ; 54 {
  67                     .text:	section	.text,new
  68  0000               _WWDG_Init:
  70  0000 89            	pushw	x
  71       00000000      OFST:	set	0
  74                     ; 56   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
  76                     ; 58   WWDG->WR = WWDG_WR_RESET_VALUE;
  78  0001 357f50d2      	mov	20690,#127
  79                     ; 59   WWDG->CR = (uint8_t)((uint8_t)(WWDG_CR_WDGA | WWDG_CR_T6) | (uint8_t)Counter);
  81  0005 9e            	ld	a,xh
  82  0006 aac0          	or	a,#192
  83  0008 c750d1        	ld	20689,a
  84                     ; 60   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
  86  000b 7b02          	ld	a,(OFST+2,sp)
  87  000d a47f          	and	a,#127
  88  000f aa40          	or	a,#64
  89  0011 c750d2        	ld	20690,a
  90                     ; 61 }
  93  0014 85            	popw	x
  94  0015 81            	ret	
 126                     ; 69 void WWDG_SetCounter(uint8_t Counter)
 126                     ; 70 {
 127                     .text:	section	.text,new
 128  0000               _WWDG_SetCounter:
 132                     ; 72   assert_param(IS_WWDG_COUNTERVALUE_OK(Counter));
 134                     ; 76   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 136  0000 a47f          	and	a,#127
 137  0002 c750d1        	ld	20689,a
 138                     ; 77 }
 141  0005 81            	ret	
 164                     ; 86 uint8_t WWDG_GetCounter(void)
 164                     ; 87 {
 165                     .text:	section	.text,new
 166  0000               _WWDG_GetCounter:
 170                     ; 88   return(WWDG->CR);
 172  0000 c650d1        	ld	a,20689
 175  0003 81            	ret	
 198                     ; 96 void WWDG_SWReset(void)
 198                     ; 97 {
 199                     .text:	section	.text,new
 200  0000               _WWDG_SWReset:
 204                     ; 98   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 206  0000 358050d1      	mov	20689,#128
 207                     ; 99 }
 210  0004 81            	ret	
 243                     ; 108 void WWDG_SetWindowValue(uint8_t WindowValue)
 243                     ; 109 {
 244                     .text:	section	.text,new
 245  0000               _WWDG_SetWindowValue:
 249                     ; 111   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
 251                     ; 113   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
 253  0000 a47f          	and	a,#127
 254  0002 aa40          	or	a,#64
 255  0004 c750d2        	ld	20690,a
 256                     ; 114 }
 259  0007 81            	ret	
 272                     	xdef	_WWDG_SetWindowValue
 273                     	xdef	_WWDG_SWReset
 274                     	xdef	_WWDG_GetCounter
 275                     	xdef	_WWDG_SetCounter
 276                     	xdef	_WWDG_Init
 295                     	end
