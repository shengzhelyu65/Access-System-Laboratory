#ifndef CONFIG_H
#define CONFIG_H

#define IBUTTON_PIN 			GPIO_PIN_2
#define IBUTTON_PORT 			GPIOB
#define REED_SWITCH_PIN 	GPIO_PIN_1
#define REED_SWITCH_PORT 	GPIOB
#define PIR_PIN 					GPIO_PIN_2
#define PIR_PORT 					GPIOD
#define BUZZER_PIN 				GPIO_PIN_0
#define BUZZER_PORT 			GPIOB
#define LED_PIN 					GPIO_PIN_1
#define LED_PORT 					GPIOC
#define RELAY_PIN					GPIO_PIN_5
#define RELAY_PORT				GPIOB

#define true 1
#define false 0

#define drawerOpenLimit 100 // how many delays, each delay 50ms
#define machineTimeLimit 40		// real time / 2
#define noPersonLimit 10 // real time / 2
#define TIMEOUT_VALUE 10

#define SLAVER_DRAWER
#define SLAVER_ID 1

#endif /* CONFIG_H */