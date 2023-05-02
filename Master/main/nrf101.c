#include"nrf101.h"
#include"my_config.h"
static uint8_t receivedata[32];
static uint8_t senddata_access[32]={0x01};
static uint8_t senddata_noaccess[32]={0x00};

static uint8_t receiver_address[5] = {0xAA, 0xBB, 0xCC, 0xDD, 0xEE};
static uint8_t destination_address[5] = {0xAA, 0xBB, 0xCC, 0xDD, 0xEE};
static bool AccessFlag = false;
void mirf_receiver(void *pvParameters)
{
	ESP_LOGI(pcTaskGetName(0), "Start");
	NRF24_t dev;
	Nrf24_init(&dev);

	ESP_LOGI(pcTaskGetName(0), "CONFIG_PAYLOAD_SIZE=%d", CONFIG_PAYLOAD_SIZE);
	ESP_LOGI(pcTaskGetName(0), "CONFIG_RECEIVER_ADDRESS=[%s]", receiver_address);
	ESP_LOGI(pcTaskGetName(0), "CONFIG_RADIO_CHANNEL=%d", CONFIG_RADIO_CHANNEL);
	//uint8_t mydata[CONFIG_PAYLOAD_SIZE];
	uint8_t payload = sizeof(receivedata);
	uint8_t channel = CONFIG_RADIO_CHANNEL;
	Nrf24_config(&dev, channel, payload);

	//Set own address
	esp_err_t ret = Nrf24_setRADDR(&dev, (uint8_t *)receiver_address);
	if (ret != ESP_OK) {
		ESP_LOGE(pcTaskGetName(0), "nrf24l01 not installed");
		while(1) { vTaskDelay(1); }
	}

	//Print settings
	Nrf24_printDetails(&dev);

	ESP_LOGI(pcTaskGetName(0), "Wait for radio...");
	//MQTT_t mqttBuf;
	while(1) {
		if (Nrf24_dataReady(&dev)) {
			Nrf24_getData(&dev, receivedata);
			// When the program is received, the received data is output from the serial port
			ESP_LOGI(pcTaskGetName(0), "Got data from nRF24L01");
			for(int i = 0 ; i < 8; i++){
				ESP_LOGI(pcTaskGetName(0), "data: %x", receivedata[i]);
			}
			// display the received data using serial port esp_logi
			// ESP_LOGI(pcTaskGetName(0), "%s",receivedata);

		} // end if
		vTaskDelay(pdMS_TO_TICKS(1000));
	} // end while
}

void mirf_transmitter(void *pvParameters)
{
	ESP_LOGI(pcTaskGetName(0), "Start");
	NRF24_t dev;
	Nrf24_init(&dev);

	ESP_LOGI(pcTaskGetName(0), "CONFIG_PAYLOAD_SIZE=%d", CONFIG_PAYLOAD_SIZE);
	ESP_LOGI(pcTaskGetName(0), "CONFIG_DESTINATION_ADDRESS=[%s]", destination_address);
	ESP_LOGI(pcTaskGetName(0), "CONFIG_RADIO_CHANNEL=%d", CONFIG_RADIO_CHANNEL);
	//uint8_t mydata[CONFIG_PAYLOAD_SIZE];
	uint8_t payload = sizeof(senddata_access);
	uint8_t channel = CONFIG_RADIO_CHANNEL;
	Nrf24_config(&dev, channel, payload);

	// Set the receiver address
	//Nrf24_setTADDR(&dev, (uint8_t *)"FGHIJ");
	esp_err_t ret = Nrf24_setTADDR(&dev, (uint8_t *)destination_address);
	if (ret != ESP_OK) {
		ESP_LOGE(pcTaskGetName(0), "nrf24l01 not installed");
		while(1) { vTaskDelay(1); }
	}

	//Print settings
	Nrf24_printDetails(&dev);
	while(1) {
		Nrf24_send(&dev, senddata_access);

		//ESP_LOGI(pcTaskGetName(0), "Wait for sending.....");
		if (Nrf24_isSend(&dev, 1000)) {
			ESP_LOGI(pcTaskGetName(0),"Send success");
		} else {
			//ESP_LOGW(pcTaskGetName(0),"Send fail");
		}
		vTaskDelay(pdMS_TO_TICKS(500));
		//} // end if
	} // end while
}
char* transferIDtoChar(uint8_t id[8],int slaveId,char url[100])
{
	char idStr[17];

    // Format the bytes as hexadecimal values and store the result in a string
    sprintf(idStr, "%02X%02X%02X%02X%02X%02X%02X%02X",
            id[0], id[1], id[2], id[3],
            id[4], id[5], id[6], id[7]);
	// concatenate value and access to the end of the string
    sprintf(url,"https://a22-access6.studev.groept.be/fob_slave.php?fob_id_hex=%s&id_inventory=%i",idStr,slaveId);
    return url;
}
esp_err_t _http_event_handler(esp_http_client_event_t *evt)
{
    switch(evt->event_id) {
        case HTTP_EVENT_ERROR:
            ESP_LOGI(TAG, "HTTP_EVENT_ERROR");
            break;
        case HTTP_EVENT_ON_CONNECTED:
            ESP_LOGI(TAG, "HTTP_EVENT_ON_CONNECTED");
            break;
        case HTTP_EVENT_HEADER_SENT:
            ESP_LOGI(TAG, "HTTP_EVENT_HEADER_SENT");
            break;
        case HTTP_EVENT_ON_HEADER:
            ESP_LOGI(TAG, "HTTP_EVENT_ON_HEADER");
            printf("%.*s", evt->data_len, (char*)evt->data);
            break;
        case HTTP_EVENT_ON_DATA:
            ESP_LOGI(TAG, "HTTP_EVENT_ON_DATA, len=%d", evt->data_len);
			if(evt->data_len<10)
                {
                    AccessFlag = false;
					ESP_LOGI(TAG, "Access False");
                }
                else
                {
                    AccessFlag = true;
					ESP_LOGI(TAG, "Access True");
                }        
            if (!esp_http_client_is_chunked_response(evt->client)) {
                printf("%.*s", evt->data_len, (char*)evt->data);    
                }
            break;
        case HTTP_EVENT_ON_FINISH:
            ESP_LOGI(TAG, "HTTP_EVENT_ON_FINISH");
            break;
        case HTTP_EVENT_DISCONNECTED:
            ESP_LOGI(TAG, "HTTP_EVENT_DISCONNECTED");
            break;
		case HTTP_EVENT_REDIRECT:
			ESP_LOGI(TAG, "HTTP_EVENT_REDIRECT");
            break;
    }	
    return ESP_OK;
}

void http_test_task(void *ignore)
{      
            ESP_LOGI(pcTaskGetName(0),"Access HTML ing ...");
          char URL[1024];
//     cJSON *root  = cJSON_CreateObject();
//    cJSON_AddItemToObject(root , "level",cJSON_CreateNumber(2));
    transferIDtoChar(((datas*)ignore)->fob_id_hex,((datas*)ignore)->id_inventory,URL);
    esp_http_client_config_t config = {
        .url = URL,
        .event_handler = _http_event_handler,
    };

   esp_http_client_handle_t client = esp_http_client_init(&config);
   // Set the HTTP method to GET
    esp_http_client_set_method(client, HTTP_METHOD_GET);
  // esp_http_client_set_post_field(client, post_data, strlen(post_data));
   esp_err_t err = esp_http_client_perform(client);
   ((datas*)ignore)->access=AccessFlag;
   if (err == ESP_OK) {
       ESP_LOGI(TAG, "HTTP POST Status = %d, content_length = %lld",esp_http_client_get_status_code(client),esp_http_client_get_content_length(client));    
        // Read the HTTP response body into the buffer
       // int content_length = esp_http_client_get_content_length(client);
       // int bytes_read = esp_http_client_read_response(client, buffer, BUFFER_SIZE);

        printf("HTTP access: %d\n",(bool)((datas*)ignore)->access );
   } else {
       ESP_LOGE(TAG, "HTTP POST request failed: %s", esp_err_to_name(err));
   }   
   esp_http_client_cleanup(client);
}



void secondary(void *pvParameters)

{	
				/*
	hard ware code :
	uint8_t idYellow[8] = {0x01, 0x65, 0xC2, 0x95, 0x1E, 0x00, 0x00, 0x6A};
	uint8_t idRed[8] = {0x01, 0xB6, 0x5B, 0x96, 0x1E, 0x00, 0x00, 0x3B};

	*/
	ESP_LOGI(pcTaskGetName(0), "Start");
	NRF24_t dev;
	Nrf24_init(&dev);

	uint8_t payload = sizeof(receivedata);
	uint8_t channel = CONFIG_RADIO_CHANNEL;
	Nrf24_config(&dev, channel, payload);

	//Set own address using 5 characters
	esp_err_t ret = Nrf24_setRADDR(&dev, (uint8_t *)receiver_address);
	if (ret != ESP_OK) {
		ESP_LOGE(pcTaskGetName(0), "nrf24l01 not installed");
		while(1) { vTaskDelay(1); }
	}

	//Set the receiver address using 5 characters
	ret = Nrf24_setTADDR(&dev, (uint8_t *)destination_address);
	if (ret != ESP_OK) {
		ESP_LOGE(pcTaskGetName(0), "nrf24l01 not installed");
		while(1) { vTaskDelay(1); }
	}

	//Print settings
	Nrf24_printDetails(&dev);
	ESP_LOGI(pcTaskGetName(0), "Listening...");

	// Clear RX FiFo
	while(1) {
		if (Nrf24_dataReady(&dev) == false) break;
		Nrf24_getData(&dev, receivedata);
	}

	while(1) {
		
		for(int i = 0 ; i < 9; i++){
			receivedata[i] = 0;
		}
		if (Nrf24_dataReady(&dev)) {
			Nrf24_getData(&dev, receivedata);
			ESP_LOGI(pcTaskGetName(0), "Got data from nRF24L01");
			for(int i = 0 ; i < 9; i++){
				ESP_LOGI(pcTaskGetName(0), "data: %x", receivedata[i]);
			}
			vTaskDelay(1);
			
			/* Should be replaced BY:
			*
			* SEND DATA to DATABASE
			* DETERMINE the access
			*/
			/*
			hard-code achievement
	bool access_yellow = true;
			bool access_red = true;
			for (int i = 0 ; i < 8; i++) {
				if (receivedata[i] != idRed[i]) {
					access_red = false;
					break;
				}
			}
			for(int i = 0 ; i < 8; i++) {
				if (receivedata[i] != idYellow[i]) {
					access_yellow = false;
					break;
				}
			}

			if (receivedata[8] == 1) {
				access = access_yellow;
			} else if (receivedata[8] == 2) {
				access = access_red;
			}
			*/
		/*
		set the value of datas
		*/
			for (int i = 0 ; i < 8; i++) {
				((datas*)pvParameters)->fob_id_hex[i]=receivedata[i];
			}

			((datas*)pvParameters)->id_inventory = (int)receivedata[8];

			((datas*)pvParameters)->access = false;

			
			ESP_LOGI(pcTaskGetName(0), "slave id: %i", ((datas*)pvParameters)->id_inventory);
			ESP_LOGI(pcTaskGetName(0), "access: %02X%02X%02X%02X%02X%02X%02X%02X",
            ((datas*)pvParameters)->fob_id_hex[0], ((datas*)pvParameters)->fob_id_hex[1], ((datas*)pvParameters)->fob_id_hex[2], ((datas*)pvParameters)->fob_id_hex[3],
            ((datas*)pvParameters)->fob_id_hex[4], ((datas*)pvParameters)->fob_id_hex[5], ((datas*)pvParameters)->fob_id_hex[6], ((datas*)pvParameters)->fob_id_hex[7]);
		
		    /*http task*/
		   http_test_task(pvParameters);
			/*
			* END OF REPLACEMENT
			*/
			
			if (AccessFlag==true) {
				senddata_access[0] = receivedata[8] + 1;
				senddata_access[1] = receivedata[8];
			
				Nrf24_send(&dev, senddata_access);
			}
			else {
				senddata_noaccess[1] = receivedata[8];
				Nrf24_send(&dev, senddata_noaccess);
			}
			
			vTaskDelay(1);
			ESP_LOGI(pcTaskGetName(0), "Wait for sending.....");
			if (Nrf24_isSend(&dev, 1000)) {
				ESP_LOGI(pcTaskGetName(0),"Send success");
			} else {
				ESP_LOGW(pcTaskGetName(0),"Send fail");
			}
		}		
		 vTaskDelay(pdMS_TO_TICKS(1000));
	}
		
		
	
}

