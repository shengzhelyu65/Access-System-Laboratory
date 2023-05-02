#ifndef DELAY_H
#define DELAY_H

#include "stm8s.h" //Required for the stdint typedefs

void clock_setup(void);
void delay(unsigned int us);
void delay_us(unsigned int us);
void delay_ms(signed int ms);
void delay_s(signed int s);

#endif