#include "rf24l01.h"

void CS_Select (void) {
	GPIO_WriteLow(CS_PORT, CS_PIN);
}
void CS_UnSelect (void) {
	GPIO_WriteHigh(CS_PORT, CS_PIN);
}
void CE_Enable (void) {
	GPIO_WriteHigh(CE_PORT, CE_PIN);
}
void CE_Disable (void)
{
	GPIO_WriteLow(CE_PORT, CE_PIN);
}

void RF24L01_send_command(uint8_t command) {
  CS_Select();
  
	while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET);
  SPI_SendData(command);
  while (SPI_GetFlagStatus(SPI_FLAG_BSY)== SET);
  while (SPI_GetFlagStatus(SPI_FLAG_RXNE)== RESET);
  SPI_ReceiveData();
  
  CS_UnSelect();
}

void RF24L01_write_register(uint8_t register_addr, uint8_t *value, uint8_t length) {
  uint8_t i;
	CS_Select();
  
  while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET);
  SPI_SendData(RF24L01_command_W_REGISTER | register_addr);
  while (SPI_GetFlagStatus(SPI_FLAG_BSY)== SET);
  while (SPI_GetFlagStatus(SPI_FLAG_RXNE)== RESET);
  SPI_ReceiveData();

  for (i=0; i<length; i++) {
    while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET);
    SPI_SendData(value[i]);
    while (SPI_GetFlagStatus(SPI_FLAG_BSY)== SET);
    while (SPI_GetFlagStatus(SPI_FLAG_RXNE)== RESET);
    SPI_ReceiveData();
  }
  
  CS_UnSelect();
}

uint8_t RF24L01_read_register(uint8_t register_addr) {
  uint8_t result;
	CS_Select();
  
  while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET);
  SPI_SendData(RF24L01_command_R_REGISTER | register_addr);
  while (SPI_GetFlagStatus(SPI_FLAG_BSY)== SET);
  while (SPI_GetFlagStatus(SPI_FLAG_RXNE)== RESET);
  SPI_ReceiveData();
  
	while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET);
	SPI_SendData(0x00);
	while (SPI_GetFlagStatus(SPI_FLAG_BSY)== SET);
	while (SPI_GetFlagStatus(SPI_FLAG_RXNE)== RESET);
	result = SPI_ReceiveData();
  
  CS_UnSelect();
  return result;
}

void RF24L01_read_register_multi(uint8_t register_addr, uint8_t *value, uint8_t length) {
	uint8_t i;
	CS_Select();
  
  while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET);
  SPI_SendData(RF24L01_command_R_REGISTER | register_addr);
  while (SPI_GetFlagStatus(SPI_FLAG_BSY)== SET);
  while (SPI_GetFlagStatus(SPI_FLAG_RXNE)== RESET);
  SPI_ReceiveData();
  
  for (i=0; i<length; i++) {
    while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET);
    SPI_SendData(0x00);
    while (SPI_GetFlagStatus(SPI_FLAG_BSY)== SET);
    while (SPI_GetFlagStatus(SPI_FLAG_RXNE)== RESET);
    value[i] = SPI_ReceiveData();
  }
  
  CS_UnSelect();
}

void RF24L01_init(void) {
	uint8_t reg_write;
	
	// CSN
  GPIO_Init(CS_PORT, CS_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
  GPIO_WriteHigh(CS_PORT, CS_PIN);
  // CE
  GPIO_Init(CE_PORT, CE_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
  GPIO_WriteLow(CE_PORT, CE_PIN);
	// MOSI MISO and SCK
  GPIO_ExternalPullUpConfig(GPIOC, GPIO_PIN_6 | GPIO_PIN_5 | GPIO_PIN_7, ENABLE);

  //SPI
	SPI_DeInit();
  SPI_Init(SPI_FIRSTBIT_MSB,
		SPI_BAUDRATEPRESCALER_2,
		SPI_MODE_MASTER,
		SPI_CLOCKPOLARITY_LOW,
		SPI_CLOCKPHASE_1EDGE,
		SPI_DATADIRECTION_2LINES_FULLDUPLEX,
		SPI_NSS_SOFT,
		(uint8_t)0x07 // frame format - data size=8 bits
  );
  SPI_Cmd(ENABLE);

	// disable the chip before configuring the device
	CE_Disable();
	
	RF24L01_reset(0);
	
	reg_write = 0;
  RF24L01_write_register(RF24L01_reg_CONFIG, &reg_write, 1);
	
	reg_write = 0;
  RF24L01_write_register(RF24L01_reg_EN_AA, &reg_write, 1);
	
	reg_write = 0;
  RF24L01_write_register(RF24L01_reg_EN_RXADDR, &reg_write, 1);
	
  reg_write = 0x03; // 5 bytes for TX/RX address
  RF24L01_write_register(RF24L01_reg_SETUP_AW, &reg_write, 1);
	
	reg_write = 0;
  RF24L01_write_register(RF24L01_reg_SETUP_RETR, &reg_write, 1);

  reg_write = 0;
  RF24L01_write_register(RF24L01_reg_RF_CH, &reg_write, 1);

  reg_write = 0x0E;
  // RF_SETUP.RF_PWR = 0x03; // Power= 0db
  // RF_SETUP.RF_DR = 0x01;	// data rate = 2Mbps
  RF24L01_write_register(RF24L01_reg_RF_SETUP, &reg_write, 1);
	
	CE_Enable();
}

void RF24L01_set_mode_TX(uint8_t *tx_addr, uint8_t channel) {
	uint8_t reg_write;
	
	CE_Disable();
	
	reg_write = channel;
  RF24L01_write_register(RF24L01_reg_RF_CH, &reg_write, 1);
	
	RF24L01_write_register(RF24L01_reg_TX_ADDR, tx_addr, 5);
	
  // power up the device
	reg_write = RF24L01_read_register(RF24L01_reg_CONFIG);
  reg_write = reg_write | (1<<1);    // write 1 in the PWR_UP, and all other bits are masked
	// reg_write = reg_write & (0xF2);    // write 0 in the PRIM_RX, and 1 in the PWR_UP, and all other bits are masked
	RF24L01_write_register(RF24L01_reg_CONFIG, &reg_write, 1);
	
	CE_Enable();	
}

uint8_t RF24L01_write_payload(uint8_t *data, uint8_t length) {
  uint8_t i;
	uint8_t FIFO_STATUS;
  
	CS_Select();

  while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET);
  SPI_SendData(RF24L01_command_W_TX_PAYLOAD);
  while (SPI_GetFlagStatus(SPI_FLAG_BSY)== SET);
  while (SPI_GetFlagStatus(SPI_FLAG_RXNE)== RESET);
  SPI_ReceiveData();

  for (i=0; i<length; i++) {
    while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET);
    SPI_SendData(data[i]);
    while (SPI_GetFlagStatus(SPI_FLAG_BSY)== SET);
    while (SPI_GetFlagStatus(SPI_FLAG_RXNE)== RESET);
    SPI_ReceiveData();
  }

	CS_UnSelect();
	
	delay_ms(1);

  FIFO_STATUS = RF24L01_read_register(RF24L01_reg_FIFO_STATUS);
  // check the fourth bit of FIFO_STATUS to know if the TX fifo is empty
	if ((FIFO_STATUS&(1<<4)) && (!(FIFO_STATUS&(1<<3))))
	{
		RF24L01_send_command(RF24L01_command_FLUSH_TX);
		RF24L01_reset(RF24L01_reg_FIFO_STATUS);
		return 1;
	}
  return 0;
}

void RF24L01_set_mode_RX(uint8_t *rx_addr, uint8_t channel) {
	uint8_t reg_write;
	
	CE_Disable();
	
	reg_write = channel;
  RF24L01_write_register(RF24L01_reg_RF_CH, &reg_write, 1);

  // select data pipe 1
	reg_write = RF24L01_read_register(RF24L01_reg_EN_RXADDR);
	reg_write = reg_write | (1<<1); // pipe1
	// reg_write = reg_write | (1<<2); // pipe2
	RF24L01_write_register(RF24L01_reg_EN_RXADDR, &reg_write, 1);

	/* We must write the address for Data Pipe 1, if we want to use any pipe from 2 to 5
	 * The Address from DATA Pipe 2 to Data Pipe 5 differs only in the LSB
	 * Their 4 MSB Bytes will still be same as Data Pipe 1
	 * For Eg->
	 * Pipe 1 ADDR = 0xAABBCCDD11
	 * Pipe 2 ADDR = 0xAABBCCDD22
	 * Pipe 3 ADDR = 0xAABBCCDD33
	 */
  RF24L01_write_register(RF24L01_reg_RX_ADDR_P1, rx_addr, 5);
	// reg_write = 0x51;
  // RF24L01_write_register(RF24L01_reg_RX_ADDR_P2, &reg_write, 1);  // Write the Pipe2 LSB address

  reg_write = 32;
	RF24L01_write_register(RF24L01_reg_RX_PW_P1, &reg_write, 1);   // 32 bytes payload size for pipe 1
	// RF24L01_write_register(RF24L01_reg_RX_PW_P2, &reg_write, 1);   // 32 bytes payload size for pipe 1

  // power up the device
	reg_write = RF24L01_read_register(RF24L01_reg_CONFIG);
  reg_write = reg_write | (1<<1) | (1<<0);    // write 1 in the PWR_UP, and all other bits are masked
	RF24L01_write_register(RF24L01_reg_CONFIG, &reg_write, 1);
	
	CE_Enable();	
}

void RF24L01_read_payload(uint8_t *data, uint8_t length) {
  uint8_t i;
  
	CS_Select();

  while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET);
  SPI_SendData(RF24L01_command_R_RX_PAYLOAD);
  while (SPI_GetFlagStatus(SPI_FLAG_BSY)== SET);
  while (SPI_GetFlagStatus(SPI_FLAG_RXNE)== RESET);
  SPI_ReceiveData();

  for (i=0; i<length; i++) {
    while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET);
    SPI_SendData(0x00);
    while (SPI_GetFlagStatus(SPI_FLAG_BSY)== SET);
    while (SPI_GetFlagStatus(SPI_FLAG_RXNE)== RESET);
    data[i] = SPI_ReceiveData();
  }

	CS_UnSelect();
	
	delay_ms(1);

  RF24L01_send_command(RF24L01_command_FLUSH_RX);
}

uint8_t RF24L01_is_data_available(int pipenum) {
  uint8_t reg_write;

  reg_write = RF24L01_read_register(RF24L01_reg_STATUS);
	if ((reg_write & (1<<6))&&(reg_write & (pipenum << 1))) {
		reg_write = (1<<6);
		RF24L01_write_register(RF24L01_reg_STATUS, &reg_write, 1);
		return 1;
	}
	return 0;
}


void RF24L01_reset(uint8_t REG) {
	uint8_t reg_write;
	uint8_t rx_addr_p0_def[5] = {0xE7, 0xE7, 0xE7, 0xE7, 0xE7};
	uint8_t rx_addr_p1_def[5] = {0xC2, 0xC2, 0xC2, 0xC2, 0xC2};
	uint8_t tx_addr_def[5] = {0xE7, 0xE7, 0xE7, 0xE7, 0xE7};
	
	if (REG == RF24L01_reg_STATUS)
	{
    reg_write = 0x00;
		RF24L01_write_register(RF24L01_reg_STATUS, &reg_write, 1);
	}
	else if (REG == RF24L01_reg_FIFO_STATUS)
	{
    reg_write = 0x11;
		RF24L01_write_register(RF24L01_reg_FIFO_STATUS, &reg_write, 1);
	}
	else {
    reg_write = 0x08;
	  RF24L01_write_register(RF24L01_reg_CONFIG, &reg_write, 1);
    reg_write = 0x3F;
	  RF24L01_write_register(RF24L01_reg_EN_AA, &reg_write, 1);
    reg_write = 0x03;
    RF24L01_write_register(RF24L01_reg_EN_RXADDR, &reg_write, 1);
    reg_write = 0x03;
    RF24L01_write_register(RF24L01_reg_SETUP_AW, &reg_write, 1);
    reg_write = 0x03;
    RF24L01_write_register(RF24L01_reg_SETUP_RETR, &reg_write, 1);
    reg_write = 0x02;
    RF24L01_write_register(RF24L01_reg_RF_CH, &reg_write, 1);
    reg_write = 0x0E;
    RF24L01_write_register(RF24L01_reg_RF_SETUP, &reg_write, 1);
    reg_write = 0x00;
    RF24L01_write_register(RF24L01_reg_STATUS, &reg_write, 1);
    reg_write = 0x00;
    RF24L01_write_register(RF24L01_reg_OBSERVE_TX, &reg_write, 1);
    reg_write = 0x00;
    RF24L01_write_register(RF24L01_reg_CD, &reg_write, 1);
    RF24L01_write_register(RF24L01_reg_RX_ADDR_P0, rx_addr_p0_def, 5);
    RF24L01_write_register(RF24L01_reg_RX_ADDR_P1, rx_addr_p1_def, 5);
    reg_write = 0xC3;
    RF24L01_write_register(RF24L01_reg_RX_ADDR_P2, &reg_write, 1);
    reg_write = 0xC4;
    RF24L01_write_register(RF24L01_reg_RX_ADDR_P3, &reg_write, 1);
    reg_write = 0xC5;
    RF24L01_write_register(RF24L01_reg_RX_ADDR_P4, &reg_write, 1);
    reg_write = 0xC6;
    RF24L01_write_register(RF24L01_reg_RX_ADDR_P5, &reg_write, 1);
    RF24L01_write_register(RF24L01_reg_TX_ADDR, tx_addr_def, 5);
    reg_write = 0x00;
    RF24L01_write_register(RF24L01_reg_RX_PW_P0, &reg_write, 1);
    reg_write = 0x00;
    RF24L01_write_register(RF24L01_reg_RX_PW_P1, &reg_write, 1);
    reg_write = 0x00;
    RF24L01_write_register(RF24L01_reg_RX_PW_P2, &reg_write, 1);
    reg_write = 0x00;
    RF24L01_write_register(RF24L01_reg_RX_PW_P3, &reg_write, 1);
    reg_write = 0x00;
    RF24L01_write_register(RF24L01_reg_RX_PW_P4, &reg_write, 1);
    reg_write = 0x00;
    RF24L01_write_register(RF24L01_reg_RX_PW_P5, &reg_write, 1);
    reg_write = 0x11;
    RF24L01_write_register(RF24L01_reg_FIFO_STATUS, &reg_write, 1);
    reg_write = 0x00;
    RF24L01_write_register(RF24L01_reg_DYNPD, &reg_write, 1);
    reg_write = 0x00;
    RF24L01_write_register(RF24L01_reg_FEATURE, &reg_write, 1);
	}
}