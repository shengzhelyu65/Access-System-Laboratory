#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "driver/gpio.h"
#include "driver/i2c.h"
#include "esp_err.h"
#include "esp_log.h"
#include "esp_system.h"
#include "esp_wifi.h"
#include "esp_event.h"
#include "esp_vfs.h"
#include "nvs_flash.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "freertos/event_groups.h"
#include "mirf.h"
#include "esp_http_client.h"
#include "cJSON.h"
#include "datadef.h"
#include "esp_http_client.h"
#include "cJSON.h"

void mirf_receiver(void *pvParameters);
void mirf_transmitter(void *pvParameters);
void secondary(void *pvParameters);
char* transferIDtoChar(uint8_t id[8],int slaveId,char url[100]);
esp_err_t _http_event_handler(esp_http_client_event_t *evt);
void http_test_task(void *ignore);