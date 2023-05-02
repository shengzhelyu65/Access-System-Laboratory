   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.8 - 08 Nov 2022
   3                     ; Generator (Limited) V4.5.5 - 08 Nov 2022
   4                     ; Optimizer V4.5.5 - 08 Nov 2022
  84                     ; 48 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  84                     ; 49 {
  86                     .text:	section	.text,new
  87  0000               _IWDG_WriteAccessCmd:
  91                     ; 51   assert_param(IS_IWDG_WRITEACCESS_MODE_OK(IWDG_WriteAccess));
  93                     ; 53   IWDG->KR = (uint8_t)IWDG_WriteAccess; /* Write Access */
  95  0000 c750e0        	ld	20704,a
  96                     ; 54 }
  99  0003 81            	ret	
 189                     ; 63 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 189                     ; 64 {
 190                     .text:	section	.text,new
 191  0000               _IWDG_SetPrescaler:
 195                     ; 66   assert_param(IS_IWDG_PRESCALER_OK(IWDG_Prescaler));
 197                     ; 68   IWDG->PR = (uint8_t)IWDG_Prescaler;
 199  0000 c750e1        	ld	20705,a
 200                     ; 69 }
 203  0003 81            	ret	
 235                     ; 78 void IWDG_SetReload(uint8_t IWDG_Reload)
 235                     ; 79 {
 236                     .text:	section	.text,new
 237  0000               _IWDG_SetReload:
 241                     ; 80   IWDG->RLR = IWDG_Reload;
 243  0000 c750e2        	ld	20706,a
 244                     ; 81 }
 247  0003 81            	ret	
 270                     ; 89 void IWDG_ReloadCounter(void)
 270                     ; 90 {
 271                     .text:	section	.text,new
 272  0000               _IWDG_ReloadCounter:
 276                     ; 91   IWDG->KR = IWDG_KEY_REFRESH;
 278  0000 35aa50e0      	mov	20704,#170
 279                     ; 92 }
 282  0004 81            	ret	
 305                     ; 99 void IWDG_Enable(void)
 305                     ; 100 {
 306                     .text:	section	.text,new
 307  0000               _IWDG_Enable:
 311                     ; 101   IWDG->KR = IWDG_KEY_ENABLE;
 313  0000 35cc50e0      	mov	20704,#204
 314                     ; 102 }
 317  0004 81            	ret	
 330                     	xdef	_IWDG_Enable
 331                     	xdef	_IWDG_ReloadCounter
 332                     	xdef	_IWDG_SetReload
 333                     	xdef	_IWDG_SetPrescaler
 334                     	xdef	_IWDG_WriteAccessCmd
 353                     	end
