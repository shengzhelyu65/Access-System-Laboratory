#include"microphone.h"
const static char *TAG = "EXAMPLE";
static int adc_raw;
static int voltage;
static gpio_num_t led_array[6] = {GPIO_NUM_3,GPIO_NUM_8,GPIO_NUM_7,GPIO_NUM_6,GPIO_NUM_5,GPIO_NUM_4};
 void configure_led(void)
{
    for (int i = 0; i < sizeof(led_array) / sizeof(gpio_num_t); i++) {
        gpio_reset_pin(led_array[i]);
        gpio_set_direction(led_array[i], GPIO_MODE_OUTPUT);
        gpio_set_level(led_array[i], false);
    }
    ESP_LOGI(TAG, "Configured GPIO LED!");
}

void microphone_led_manager(void *vdParameter)
{
    configure_led();
    //-------------ADC1 Init---------------//
    adc_oneshot_unit_handle_t adc1_handle;
    adc_oneshot_unit_init_cfg_t init_config1 = {
        .unit_id = ADC_UNIT_1,
    };
    ESP_ERROR_CHECK(adc_oneshot_new_unit(&init_config1, &adc1_handle));
    /*
        * Configure the ADC pattern.
        * https://docs.espressif.com/projects/esp-idf/en/v4.4/esp32s3/api-reference/peripherals/adc.html
        * ADC_ATTEN_DB_11 => 0 mV ~ 3100 mV
    */
    //-------------ADC1 Config---------------//
    adc_oneshot_chan_cfg_t config = {
        .bitwidth = ADC_BITWIDTH_DEFAULT,
        .atten = ADC_ATTEN_DB_11,
    };
    ESP_ERROR_CHECK(adc_oneshot_config_channel(adc1_handle, EXAMPLE_ADC1_CHAN0, &config));

    //-------------ADC1 Calibration Init---------------//
    adc_cali_handle_t adc1_cali_handle = NULL;
    bool do_calibration1 = example_adc_calibration_init(ADC_UNIT_1, ADC_ATTEN_DB_11, &adc1_cali_handle);
    //variable
    int voltagebuffer; 
    bool NoiseLevel[6];
    while (1) {
        ESP_ERROR_CHECK(adc_oneshot_read(adc1_handle, EXAMPLE_ADC1_CHAN0, &adc_raw));
        // ESP_LOGI(TAG, "ADC%d Channel[%d] Raw Data: %d", ADC_UNIT_1 + 1, EXAMPLE_ADC1_CHAN0, adc_raw);
        if (do_calibration1) {
            ESP_ERROR_CHECK(adc_cali_raw_to_voltage(adc1_cali_handle, adc_raw, &voltage));
            //ESP_LOGI(TAG, "ADC%d Channel[%d] Cali Voltage: %d mV", ADC_UNIT_1 + 1, EXAMPLE_ADC1_CHAN0, voltage);
        voltagebuffer = abs(voltage-1330); 
            for(int i=0;i<6;i++)
                {
                    NoiseLevel[i]=false;
                }

            if(voltagebuffer>100)
            NoiseLevel[0]=true;
                if(voltagebuffer>250)
                NoiseLevel[1]=true;
                    if(voltagebuffer>500)
                    NoiseLevel[2]=true;
                        if(voltagebuffer>750)
                        NoiseLevel[3]=true;
                            if(voltagebuffer>1000)
                            NoiseLevel[4]=true;
                                if(voltagebuffer>1250)
                                NoiseLevel[5]=true;                
            for(int i=0;i<6;i++)
            {
                gpio_set_level(led_array[i], NoiseLevel[i]);
            }    
        }
        vTaskDelay(pdMS_TO_TICKS(100));
    }

    //Tear Down
    ESP_ERROR_CHECK(adc_oneshot_del_unit(adc1_handle));
    if (do_calibration1) {
        example_adc_calibration_deinit(adc1_cali_handle);
    }
}

/*---------------------------------------------------------------
        ADC Calibration
---------------------------------------------------------------*/
 bool example_adc_calibration_init(adc_unit_t unit, adc_atten_t atten, adc_cali_handle_t *out_handle)
{
    adc_cali_handle_t handle = NULL;
    esp_err_t ret = ESP_FAIL;
    bool calibrated = false;

    if (!calibrated) {
        ESP_LOGI(TAG, "calibration scheme version is %s", "Curve Fitting");
        adc_cali_curve_fitting_config_t cali_config = {
            .unit_id = unit,
            .atten = atten,
            .bitwidth = ADC_BITWIDTH_DEFAULT,
        };
        ret = adc_cali_create_scheme_curve_fitting(&cali_config, &handle);
        if (ret == ESP_OK) {
            calibrated = true;
        }
    }

    *out_handle = handle;
    if (ret == ESP_OK) {
        ESP_LOGI(TAG, "Calibration Success");
    } else if (ret == ESP_ERR_NOT_SUPPORTED || !calibrated) {
        ESP_LOGW(TAG, "eFuse not burnt, skip software calibration");
    } else {
        ESP_LOGE(TAG, "Invalid arg or no memory");
    }

    return calibrated;
}

 void example_adc_calibration_deinit(adc_cali_handle_t handle)
{
    ESP_LOGI(TAG, "deregister %s calibration scheme", "Curve Fitting");
    ESP_ERROR_CHECK(adc_cali_delete_scheme_curve_fitting(handle));
}