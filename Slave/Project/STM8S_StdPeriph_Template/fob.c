#include "fob.h"

void OneWire_Init(OneWire_t* OneWireStruct, GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin) {
	/* Init GPIO pin */
	GPIO_Init(GPIOx, GPIO_Pin, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_ExternalPullUpConfig(GPIOx, GPIO_Pin, ENABLE);

	/* Save settings */
	OneWireStruct->GPIOx = GPIOx;
	OneWireStruct->GPIO_Pin = GPIO_Pin;
}

uint8_t OneWire_Reset(OneWire_t* OneWireStruct) {
	uint8_t i;

	/* Line low, and wait 480us */
	GPIO_Init(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_WriteLow(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin);
	delay_us(480);

	/* Release line and wait for 70us */
	GPIO_Init(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin, GPIO_MODE_IN_FL_NO_IT);
	delay_us(70);

	/* Check bit value */
	i = GPIO_ReadInputPin(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin);

	/* Delay for 410 us */
	delay_us(410);

	/* Return value of presence pulse, 0 = OK, 1 = ERROR */
	return i;
}

uint8_t OneWire_First(OneWire_t* OneWireStruct) {
	/* Reset search values */
	OneWire_ResetSearch(OneWireStruct);

	/* Start with searching */
	return OneWire_Search(OneWireStruct, ONEWIRE_CMD_SEARCHROM);
}

void OneWire_ResetSearch(OneWire_t* OneWireStruct) {
	/* Reset the search state */
	OneWireStruct->LastDiscrepancy = 0;
	OneWireStruct->LastDeviceFlag = 0;
	OneWireStruct->LastFamilyDiscrepancy = 0;
}

uint8_t OneWire_Search(OneWire_t* OneWireStruct, uint8_t command) {
	uint8_t id_bit_number;
	uint8_t last_zero, rom_byte_number, search_result;
	uint8_t id_bit, cmp_id_bit;
	uint8_t rom_byte_mask, search_direction;

	/* Initialize for search */
	id_bit_number = 1;
	last_zero = 0;
	rom_byte_number = 0;
	rom_byte_mask = 1;
	search_result = 0;

	// if the last call was not the last one
	if (!OneWireStruct->LastDeviceFlag) {
		// 1-Wire reset
		if (OneWire_Reset(OneWireStruct)) { // Reset fail
			/* Reset the search */
			OneWireStruct->LastDiscrepancy = 0;
			OneWireStruct->LastDeviceFlag = 0;
			OneWireStruct->LastFamilyDiscrepancy = 0;
			return 0;
		}

		// issue the search command
		OneWire_WriteByte(OneWireStruct, command);

		// loop to do the search
		do {
			// read a bit and its complement
			id_bit = OneWire_ReadBit(OneWireStruct);
			cmp_id_bit = OneWire_ReadBit(OneWireStruct);

			// check for no devices on 1-wire
			if ((id_bit == 1) && (cmp_id_bit == 1)) {
				break;
			} else {
				// all devices coupled have 0 or 1
				if (id_bit != cmp_id_bit) {
					search_direction = id_bit;  // bit write value for search
				} else {
					// if this discrepancy if before the Last Discrepancy
					// on a previous next then pick the same as last time
					if (id_bit_number < OneWireStruct->LastDiscrepancy) {
						search_direction = ((OneWireStruct->ROM_NO[rom_byte_number] & rom_byte_mask) > 0);
					} else {
						// if equal to last pick 1, if not then pick 0
						search_direction = (id_bit_number == OneWireStruct->LastDiscrepancy);
					}

					// if 0 was picked then record its position in LastZero
					if (search_direction == 0) {
						last_zero = id_bit_number;

						// check for Last discrepancy in family
						if (last_zero < 9) {
							OneWireStruct->LastFamilyDiscrepancy = last_zero;
						}
					}
				}

				// set or clear the bit in the ROM byte rom_byte_number
				// with mask rom_byte_mask
				if (search_direction == 1) {
					OneWireStruct->ROM_NO[rom_byte_number] |= rom_byte_mask;
				} else {
					OneWireStruct->ROM_NO[rom_byte_number] &= ~rom_byte_mask;
				}

				// serial number search direction write bit
				OneWire_WriteBit(OneWireStruct, search_direction);

				// increment the byte counter id_bit_number
				// and shift the mask rom_byte_mask
				id_bit_number++;
				rom_byte_mask <<= 1;

				// if the mask is 0 then go to new SerialNum byte rom_byte_number and reset mask
				if (rom_byte_mask == 0) {
					//docrc8(ROM_NO[rom_byte_number]);  // accumulate the CRC
					rom_byte_number++;
					rom_byte_mask = 1;
				}
			}
		} while (rom_byte_number < 8);  // loop until through all ROM bytes 0-7

		// if the search was successful then
		if (!(id_bit_number < 65)) {
			// search successful so set LastDiscrepancy,LastDeviceFlag,search_result
			OneWireStruct->LastDiscrepancy = last_zero;

			// check for last device
			if (OneWireStruct->LastDiscrepancy == 0) {
				OneWireStruct->LastDeviceFlag = 1;
			}

			search_result = 1;
		}
	}

	// if no device found then reset counters so next 'search' will be like a first
	if (!search_result || !OneWireStruct->ROM_NO[0]) {
		OneWireStruct->LastDiscrepancy = 0;
		OneWireStruct->LastDeviceFlag = 0;
		OneWireStruct->LastFamilyDiscrepancy = 0;
		search_result = 0;
	}
	return search_result;
}

void OneWire_WriteBit(OneWire_t* OneWireStruct, uint8_t bit) {
	if (bit) {
		/* Set line low */
		GPIO_Init(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin, GPIO_MODE_OUT_PP_HIGH_FAST);
		GPIO_WriteLow(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin);
		delay_us(15);
		
		/* Bit high */
		GPIO_WriteHigh(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin);
		GPIO_Init(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin, GPIO_MODE_IN_FL_NO_IT);
		
		/* Wait for 55 us and release the line */
		delay_us(45);
	} else {
		/* Set line low */
		GPIO_Init(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin, GPIO_MODE_OUT_PP_HIGH_FAST);
		GPIO_WriteLow(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin);
		delay_us(60);
		
		/* Wait for 5 us and release the line */
		GPIO_Init(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin, GPIO_MODE_IN_FL_NO_IT);
	}
}

uint8_t OneWire_ReadBit(OneWire_t* OneWireStruct) {
	uint8_t bit = 0;

	/* Line low */
	GPIO_Init(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_WriteLow(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin);
	delay_us(15);

	/* Release line */
	GPIO_Init(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin, GPIO_MODE_IN_FL_NO_IT);
	delay_us(12);

	/* Read line value */
	if (GPIO_ReadInputPin(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin)) {
		/* Bit is HIGH */
		bit = 1;
	}

	GPIO_Init(OneWireStruct->GPIOx, OneWireStruct->GPIO_Pin, GPIO_MODE_IN_FL_NO_IT);
	delay_us(36);

	/* Return bit value */
	return bit;
}

void OneWire_WriteByte(OneWire_t* OneWireStruct, uint8_t byte) {
	uint8_t i = 8;
	/* Write 8 bits */
	while (i--) {
		/* LSB bit is first */
		OneWire_WriteBit(OneWireStruct, byte & 0x01);
		byte >>= 1;
	}
}

uint8_t OneWire_ReadByte(OneWire_t* OneWireStruct) {
	uint8_t i = 8;
	uint8_t byte = 0;
	while (i--) {
		byte >>= 1;
		byte |= (OneWire_ReadBit(OneWireStruct) << 7);
	}

	return byte;
}

uint8_t OneWire_Next(OneWire_t* OneWireStruct) {
	/* Leave the search state alone */
	return OneWire_Search(OneWireStruct, ONEWIRE_CMD_SEARCHROM);
}

uint8_t OneWire_GetROM(OneWire_t* OneWireStruct, uint8_t index) {
	return OneWireStruct->ROM_NO[index];
}

void OneWire_GetFullROM(OneWire_t* OneWireStruct, uint8_t* firstIndex) {
    uint8_t i;
    for (i = 0; i < 8; i++) {
        *(firstIndex + i) = OneWireStruct->ROM_NO[i];
    }
}