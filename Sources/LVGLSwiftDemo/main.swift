import Foundation
import CLVGLSwift

var disp_buf1:lv_disp_buf_t!
var buf1_1:[lv_color_t]

/**
 * Initialize the Hardware Abstraction Layer (HAL) for the Littlev graphics
 * library
 */

func hal_init() {
    
    // Use the 'monitor' driver which creates window on PC's monitor to simulate a display
    
    
    
    
    /*
     // Create a display buffer
     static lv_disp_buf_t disp_buf1;
     static lv_color_t buf1_1[LV_HOR_RES_MAX * 120];
     lv_disp_buf_init(&disp_buf1, buf1_1, NULL, LV_HOR_RES_MAX * 120);
     
     // Create a display
     lv_disp_drv_t disp_drv;
     lv_disp_drv_init(&disp_drv); /*Basic initialization*/
     disp_drv.buffer = &disp_buf1;
     disp_drv.flush_cb = monitor_flush;
     lv_disp_drv_register(&disp_drv);
     
     // Add the mouse as input device
     // Use the 'mouse' driver which reads the PC's mouse
     mouse_init();
     lv_indev_drv_t indev_drv;
     lv_indev_drv_init(&indev_drv); //Basic initialization
     indev_drv.type = LV_INDEV_TYPE_POINTER;
     
     // This function will be called periodically (by the library) to get the mouse position and state
     indev_drv.read_cb = mouse_read;
     lv_indev_t *mouse_indev = lv_indev_drv_register(&indev_drv);
     
     // Set a cursor for the mouse
     LV_IMG_DECLARE(mouse_cursor_icon); // Declare the image file.
     lv_obj_t * cursor_obj = lv_img_create(lv_scr_act(), NULL); // Create an image object for the cursor
     lv_img_set_src(cursor_obj, &mouse_cursor_icon);           // Set the image source
     lv_indev_set_cursor(mouse_indev, cursor_obj);             // Connect the image  object to the driver
     
     // Tick init.
     // You have to call 'lv_tick_inc()' in periodically to inform LittelvGL about
     // how much time were elapsed Create an SDL thread to do this
     SDL_CreateThread(tick_thread, "tick", NULL);
     
     // Optional:
     // Create a memory monitor task which prints the memory usage in
     // periodically.
     lv_task_create(memory_monitor, 5000, LV_TASK_PRIO_MID, NULL);
     */
}

var lvglTaskTimer:Timer!

let text = "Hello from Swift!".cString(using: String.Encoding.ascii)
let font_montserrat48 = withUnsafePointer(to: lv_font_montserrat_48) { UnsafePointer<lv_font_t>($0) }
var opacity:lv_opa_t = 0xFF
var direction = true

func letsGetThisPartyStarted() {
    
    print("\(#function)")
    
    // Initialize LVGL
    lv_init()
    
    // Initialise the monitor for LVGL (using SDL)
    monitorForSwift_init()
    
    let black = lv_color_make(0, 0, 0)
    let screen = lv_scr_act()
    lv_obj_set_style_local_bg_color(screen, UInt8(LV_OBJ_PART_MAIN), lv_state_t(LV_STATE_DEFAULT), black)
        
    let white = lv_color_make(0xFF, 0xFF, 0xFF)
    
    lv_obj_set_style_local_value_color(lv_scr_act(), UInt8(LV_OBJ_PART_MAIN), lv_state_t(LV_STATE_DEFAULT), white);
    lv_obj_set_style_local_value_str(lv_scr_act(), UInt8(LV_OBJ_PART_MAIN), lv_state_t(LV_STATE_DEFAULT), text)
    lv_obj_set_style_local_value_font(lv_scr_act(), UInt8(LV_OBJ_PART_MAIN), lv_state_t(LV_STATE_DEFAULT), font_montserrat48);
    
//    lvglTaskTimer = Timer.scheduledTimer(withTimeInterval: 1/60, repeats: true, block: { (_) in
//        doWorkInMainLoop()
//    })

    while (true) {
        doWorkInMainLoop()
        usleep(2000)
    }
    
//    RunLoop.current.run()
    
}

func doWorkInMainLoop() {
    
    if direction {
        if opacity >= 1 {
            opacity -= 1
        } else {
            direction = !direction
            opacity += 1
        }
    } else {
        if opacity <= (0xFF - 1) {
            opacity += 1
        } else {
            direction = !direction
            opacity -= 1
        }
    }
    
    lv_obj_set_style_local_value_opa(lv_scr_act(), UInt8(LV_OBJ_PART_MAIN), lv_state_t(LV_STATE_DEFAULT), opacity)
    lv_task_handler()
    
}

/**********************
 *   STATIC FUNCTIONS
 **********************/



/**
 * A task to measure the elapsed time for LVGL
 * @param data unused
 * @return never return
 */
func tick_thread(/*void *data*/) -> Int {
    /*
     (void)data;
     
     while (1) {
     SDL_Delay(5);   // Sleep for 5 millisecond
     lv_tick_inc(5); // Tell LittelvGL that 5 milliseconds were elapsed
     }
     
     return 0;
     */
    
    return 0
}

/**
 * Print the memory usage periodically
 * @param param
 */
func memory_monitor(/*lv_task_t *param*/) {
    /*    (void)param; /*Unused*/
     
     lv_mem_monitor_t mon;
     lv_mem_monitor(&mon);
     printf("used: %6d (%3d %%), frag: %3d %%, biggest free: %6d\n",
     (int)mon.total_size - mon.free_size, mon.used_pct, mon.frag_pct,
     (int)mon.free_biggest_size);
     */
}

letsGetThisPartyStarted()
