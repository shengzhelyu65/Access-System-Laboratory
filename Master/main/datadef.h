#include <stdbool.h>
#include "freertos/semphr.h"
typedef struct {
    uint8_t fob_id_hex[8];
    int id_inventory;
    bool access;
} datas;
//static SemaphoreHandle_t semaphore1,semaphore2;
