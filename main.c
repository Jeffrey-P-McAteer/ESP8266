
#include "ets_sys.h"
#include "osapi.h"
#include "gpio.h"
#include "os_type.h"

// HEADER STUFF
void sdk_init_done_cb(void);
void start_timer_cb(void *arg);

void user_init() { // MAIN
  system_init_done_cb(sdk_init_done_cb);
}

os_timer_t start_timer; /* declare a variable which will be used to control the timer */

void sdk_init_done_cb(void) {
  /* You app Initialization here */
  os_timer_disarm(&start_timer);
  os_timer_setfn(&start_timer, start_timer_cb, NULL); /* Set callback for timer */
  os_timer_arm(&start_timer, 5000 /* call every 5 second */, 1 /* repeat */); 
}

void start_timer_cb(void *arg) {
  // Called every 5 seconds
  
  static int on = 0;
  if (!on) { /* if LED is OFF - turn it on */
    gpio_output_set(BIT16, 0, BIT16, 0);
    on = 1;
  } else { /* if LED is ON - turn is off */
    gpio_output_set(0, BIT12, BIT12, 0);
    on = 0;
  }
  
}



