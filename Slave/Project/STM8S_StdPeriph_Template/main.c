#include "fob.h"
#include "rf24l01.h"
#include "config.h"

bool open5 = false; // whether the drawer is open for 5s
bool noPerson5 = false; // whether there is no person for 5s
bool timer2 = false;
uint8_t ctTim2 = 0;

uint8_t tx_addr[5] = {0xAA, 0xBB, 0xCC, 0xDD, 0xEE};
uint8_t rx_addr[5] = {0xAA, 0xBB, 0xCC, 0xDD, 0xEE};
uint8_t channel = 21;
uint8_t tx_data[32] = {0x00, 0x01, 0x02, 0x03, 0x04, 
											0x05, 0x06, 0x07, 0x08, 0x09, 
											0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F,
											0x10, 0x11, 0x12, 0x13, 0x14, 
											0x15, 0x16, 0x17, 0x18, 0x19, 
											0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F};
uint8_t rx_data[32];

uint8_t id[9];
uint8_t received_id;
uint8_t trust = 1;
uint8_t i;

uint8_t start = 0;
uint16_t count = 0;
uint8_t tmp_tim;

void TIM2_setup(void);
void TIM2_reset(void);
void GPIO_setup(void);

/*
RF24L01 connector pinout:
GND    VCC
CE     CSN
SCK    MOSI
MISO   IRQ

Connections:
  PC3 -> CE
  PC4 -> CSN
	PC5 -> SCK
  PC6 -> MOSI
  PC7 -> MISO
*/
OneWire_t OneWire;

int main( void )
{
	clock_setup();
	GPIO_setup();
	OneWire_Init(&OneWire, IBUTTON_PORT, IBUTTON_PIN);
	id[8] = SLAVER_ID;
	/* 
	* TEST
	while (1) {
		if (ibutton_present() == 1) {
			GPIO_WriteHigh(LED_PORT, LED_PIN);
		} else {
			GPIO_WriteLow(LED_PORT, LED_PIN);
		}
	}
	*/
	
#ifdef SLAVER_DRAWER
	while (1) {
		start = 0;
		count = 0;
		trust = 1;
		
		while (1) {			
			if (!OneWire_Reset(&OneWire)) {
				OneWire_WriteByte(&OneWire, 0x33);
	
				for (i = 0; i < 8; i++) {
					received_id = OneWire_ReadByte(&OneWire);
					if (id[i] != received_id) {
						trust = 0;
					}
					id[i] = received_id;
				}
				if (id[0] == 0x01) {
					break;
				}
			}
			
			if (GPIO_ReadInputPin(REED_SWITCH_PORT, REED_SWITCH_PIN) == 0 && open5 == false) {
				// GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN);
				GPIO_WriteHigh(LED_PORT, LED_PIN);
				open5 = true;
				
				for (i = 0; i < drawerOpenLimit; i++) {
					if (GPIO_ReadInputPin(REED_SWITCH_PORT, REED_SWITCH_PIN) == 0) {
						GPIO_WriteHigh(LED_PORT, LED_PIN);
					}
					else {
						GPIO_WriteLow(LED_PORT, LED_PIN);
						open5 = false;
						break;
					}
					delay_ms(50);
				}
			}
			else if (GPIO_ReadInputPin(REED_SWITCH_PORT, REED_SWITCH_PIN) == 0 && open5 == true) {
				GPIO_WriteHigh(LED_PORT, LED_PIN);
				GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN);
			}
			else {
				open5 = false;
				GPIO_WriteLow(LED_PORT, LED_PIN);
				GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
			}
			delay_us(50);
		}
		
		RF24L01_init();
		RF24L01_set_mode_TX((uint8_t *)&tx_addr, channel);
		
		if (RF24L01_write_payload(id, 32) == 1) {
			RF24L01_set_mode_RX((uint8_t *)&rx_addr, channel);
			while (1) {
				count++;
				if (RF24L01_is_data_available(1) == 1) {
					RF24L01_read_payload(rx_data, 32);
					break;
				}
				if (count > 0XFFFFFFF0) {
					count = 0;
					rx_data[0] = 0;
					break;
				}
			}
			
			delay_us(20);
			
			if (rx_data[0] == (SLAVER_ID+1) && trust == 1 && rx_data[1] == SLAVER_ID) {
				start = 1;
			} else {
				start = 0;
			}
			
			if (start == 1 && trust == 1 && rx_data[1] == SLAVER_ID) {
				GPIO_WriteHigh(RELAY_PORT, RELAY_PIN);
				
				GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN);
				GPIO_WriteHigh(LED_PORT, LED_PIN);
				delay_ms(100);
				GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
				GPIO_WriteLow(LED_PORT, LED_PIN);
				delay_ms(100);
				GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN);
				GPIO_WriteHigh(LED_PORT, LED_PIN);
				delay_ms(100);
				GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
				GPIO_WriteLow(LED_PORT, LED_PIN);
				delay_ms(100);
				
				delay_s(2);
				GPIO_WriteLow(RELAY_PORT, RELAY_PIN);
			} else {
				if (start == 0 && trust == 1 && rx_data[1] == SLAVER_ID) {
					GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN);
					delay_ms(400);
					GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
				}
			}
			
			delay_ms(20);
		}
	}
#else
	while (1)
	{
		start = 0;
		count = 0;
		trust = 1;
	
		if (timer2 == false) {
			while (1) {	
				if (!OneWire_Reset(&OneWire)) {
					OneWire_WriteByte(&OneWire, 0x33);
		
					for (i = 0; i < 8; i++) {
						received_id = OneWire_ReadByte(&OneWire);
						if (id[i] != received_id) {
							trust = 0;
						}
						id[i] = received_id;
					}
					if (id[0] == 0x01) {
						break;
					}
				}
				delay_us(50);
			}
			
			RF24L01_init();
			RF24L01_set_mode_TX((uint8_t *)&tx_addr, channel);
			
			if (RF24L01_write_payload(id, 32) == 1) {
				RF24L01_set_mode_RX((uint8_t *)&rx_addr, channel);
				while (1) {
					count++;
					if (RF24L01_is_data_available(1) == 1) {
						RF24L01_read_payload(rx_data, 32);
						break;
					}
					if (count > 0XFFFFFFF0) {
						count = 0;
						rx_data[0] = 0;
						break;
					}
				}
				
				delay_us(20);
				
				if (rx_data[0] == (SLAVER_ID+1) && trust == 1 && rx_data[1] == SLAVER_ID) {
					start = 1;
				} else {
					start = 0;
				}
				
				if (start == 1 && trust == 1 && rx_data[1] == SLAVER_ID) { // permission granted
					GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN);
					GPIO_WriteHigh(LED_PORT, LED_PIN);
					delay_ms(100);
					GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
					GPIO_WriteLow(LED_PORT, LED_PIN);
					delay_ms(100);
					GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN);
					GPIO_WriteHigh(LED_PORT, LED_PIN);
					delay_ms(100);
					GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
					GPIO_WriteLow(LED_PORT, LED_PIN);
					delay_ms(100);
					
					timer2 = true;
					GPIO_WriteHigh(RELAY_PORT, RELAY_PIN);
					TIM2_setup();
				} else {
					if (start == 0 && trust == 1 && rx_data[1] == SLAVER_ID) {
						GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN);
						delay_ms(400);
						GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
						timer2 = false;
						GPIO_WriteLow(RELAY_PORT, RELAY_PIN);
					}
					delay_ms(200);
				}
			}
		} else { // TIM2 is running
			if (ctTim2 > machineTimeLimit) { // TIM2 limit
				TIM2_reset();
			} else { // TIM2 is still on but not reach the limit
				if ((GPIO_ReadInputPin(PIR_PORT, PIR_PIN) == 0) && (noPerson5 == false)) {
					GPIO_WriteHigh(LED_PORT, LED_PIN);
					noPerson5 = true;
					tmp_tim = ctTim2;
					while ((ctTim2 - tmp_tim) <= noPersonLimit) {
						if ( (noPerson5 == true) && GPIO_ReadInputPin(PIR_PORT, PIR_PIN) == 0) {
							GPIO_WriteHigh(LED_PORT, LED_PIN);
						}
						else {
							GPIO_WriteLow(LED_PORT, LED_PIN);
							noPerson5 = false;
							break;
						}
					}
				} else if ((GPIO_ReadInputPin(PIR_PORT, PIR_PIN) == 0) && (noPerson5 == true)) {
					GPIO_WriteLow(LED_PORT, LED_PIN);
					TIM2_reset();
				}
			}
		} 
	}
#endif
}

void TIM2_setup(void)
{
	ctTim2 = 0;	
	/* Initialize Timer 2 */
	TIM2_TimeBaseInit(TIM2_PRESCALER_512, 15625); // 0.5s
	/* Enable the TIM2 interrupt */
	TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
	/* Enable global interrupts */
	enableInterrupts();		
	/* Enable Timer 2 */
	TIM2_Cmd(ENABLE);
}

void TIM2_reset(void)
{
	GPIO_WriteLow(RELAY_PORT, RELAY_PIN);
	GPIO_WriteLow(LED_PORT, LED_PIN);
	timer2 = false;
	noPerson5 = false;
	// TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
	TIM2_ITConfig(TIM2_IT_UPDATE, DISABLE);
	TIM2_Cmd(DISABLE);
	TIM2_ClearFlag(TIM2_FLAG_UPDATE);
	ctTim2 = 0;
	disableInterrupts();
	GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN);
	delay_s(2);
	GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
}

void GPIO_setup(void)
{
	GPIO_Init(GPIOA, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(GPIOA, GPIO_PIN_1, GPIO_MODE_OUT_PP_LOW_FAST);
	
	/* Initialize BUZZER as output */
	GPIO_Init(BUZZER_PORT, BUZZER_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	
	/* Initialize LED as output */
	GPIO_Init(LED_PORT, LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	
	/* Initialize RELAY as output */
	GPIO_Init(RELAY_PORT, RELAY_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	
	/* Initialize REED SWITCH as input */ 
	GPIO_Init(REED_SWITCH_PORT, REED_SWITCH_PIN, GPIO_MODE_IN_FL_NO_IT);
	
	/* Initialize PIR as input */ 
	GPIO_Init(PIR_PORT, PIR_PIN, GPIO_MODE_IN_FL_NO_IT);
	
	/* Initialize FOB READER as input */
  GPIOB->DDR &= ~(1 << 2);
}