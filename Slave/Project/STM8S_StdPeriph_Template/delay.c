#include "delay.h"

void clock_setup(void)
{
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
		
	TIM4_DeInit();
}

void delay(unsigned int us)
{
	// TIM4_DeInit();
	TIM4_TimeBaseInit(TIM4_PRESCALER_16, us);
	
	/* Clear TIM4 update flag */
	TIM4_ClearFlag(TIM4_FLAG_UPDATE);
	/* Enable update interrupt */
	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
	
	/* Enable TIM4 */
	TIM4_Cmd(ENABLE);
	
	while(SET != TIM4_GetFlagStatus(TIM4_FLAG_UPDATE));

	// TIM4_Cmd(DISABLE);
	// TIM4_ITConfig(TIM4_IT_UPDATE, DISABLE);
}

void delay_us(unsigned int us)
{
	uint8_t i;
	if (us <= 200) {
		delay(us);
	} else {
		while (us > 200) {
			delay(200);
			us = us - 200;
		}
		if (us != 0) {
			delay(us);
		}
	}
}

void delay_ms(signed int ms)
{
	while (ms--) {
		delay_us(200);
		delay_us(200);
		delay_us(200);
		delay_us(200);
		delay_us(200);
  }	
}

void delay_s(signed int s)
{
	while (s--) {
		delay_ms(1000);
  }	
}