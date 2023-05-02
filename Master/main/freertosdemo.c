#include "my_config.h"
#include <stdio.h>
#include <esp_vfs_fat.h>

#include "my_wifi_sta.h"
#include"microphone.h"
#include "esp_http_client.h"
#include "cJSON.h"
#include "esp_err.h"
#include "esp_log.h"
#include "nrf101.h"


void app_main(void)
{
    datas*  data=(datas*) malloc(sizeof(datas));
    data->access=false;
    memset(data->fob_id_hex, 0, sizeof(data->fob_id_hex)); // set all elements of id to zero
    data->id_inventory=0;
    /*
     // Create a binary semaphore
    semaphore1 = xSemaphoreCreateBinary();
    semaphore2 = xSemaphoreCreateBinary();
    // Initialize the semaphore to the reset state
    xSemaphoreTake(semaphore1, 0);  
    xSemaphoreTake(semaphore2, 0);  
    */
     
    //release semaphore 1
    //station wifi code
    //Initialize NVS
    esp_err_t ret = nvs_flash_init();
    if (ret == ESP_ERR_NVS_NO_FREE_PAGES || ret == ESP_ERR_NVS_NEW_VERSION_FOUND) {
      ESP_ERROR_CHECK(nvs_flash_erase());
      ret = nvs_flash_init();
    }
    ESP_ERROR_CHECK(ret);
    ESP_LOGI(TAG, "ESP_WIFI_MODE_STA");
    wifi_init_sta();  
    xTaskCreate(secondary, "SECONDARY", 8192,(void*)data, 5, NULL);
    xTaskCreate(microphone_led_manager,"microphone_led_manager",4096,(void*)NULL,5,NULL);  
}