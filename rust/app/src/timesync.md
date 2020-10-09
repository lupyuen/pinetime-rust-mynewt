# Bluetooth Time Sync, Rust Watch Faces and LVGL on PineTime Mynewt

![PineTime Smart Watch with Bluetooth Time Sync and Rust Watch Face](https://lupyuen.github.io/images/timesync-title.png)

Let's learn how PineTime syncs the time over Bluetooth LE... And how we build PineTime Watch Faces with Rust and LVGL.

# Time Sync over Bluetooth LE

Try this on your Android phone...

1. Install the __nRF Connect__ mobile app. Launch the app.

1. Tap on `Menu` → `Configure GATT Server` → `Add Service`

1. Set `Server Configuration` to `Current Time Service`. Tap `OK`

1. In the app, browse for Bluetooth devices and connect to PineTime

The current date and time appears on PineTime!

_What is this magic that syncs the date the time from your phone to PineTime?_

The syncing magic is called __Bluetooth LE Current Time Service__...

![Bluetooth Time Sync](https://lupyuen.github.io/images/timesync-gatt.jpg)

1.  Our phone connects to PineTime over Bluetooth LE

1.  PineTime detects the incoming connection. 

    PineTime transmits a request to discover all GATT Services and Characteristics on our phone.
    
    (Like a "reverse snoop")

1.  PineTime discovers that our phone supports the Current Time Service. 

    PineTime transmits a request to read the current time. 
    
    The nRF Connect app on our phone responds with the current time.

_Is it really necessary to discover ALL GATT Services and Characteristics?_

Not really... It's actually more efficient for PineTime to connect directly to the Current Time Service without discovering all services.

But for now we'll discover all services as an educational exercise... Also to allow for future extension in case we need to support more services.

Let's learn how to discover GATT Services and Characteristics in the `pinetime-rust-mynewt` firmware for PineTime...

# Discover GATT Services and Characteristics

TODO: Bluetooth LE Current Time Service, Discovering Bluetooth LE Services and Characteristics, Reading Bluetooth LE Characteristics, Decoding Bluetooth LE Current Time

When a peer is connected, discover the services exposed by the peer: [`apps/my_sensor_app/src/ble_main.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/apps/my_sensor_app/src/ble_main.c#L368-L416)

```c
//  The NimBLE stack executes this callback when a GAP Event occurs
static int bleprph_gap_event(struct ble_gap_event *event, void *arg) {
    //  Check the GAP Event
    switch (event->type) {

        //  When a BLE connection is established...
        case BLE_GAP_EVENT_CONNECT:

            //  Remember the BLE Peer
            blepeer_add(
                event->connect.conn_handle
            );

            //  Discover all GATT Sevices and Characteristics in the BLE Peer
            blepeer_disc_all(
                event->connect.conn_handle, 
                blecent_on_disc_complete, 
                NULL
            );
```

Time Sync. When a BLE connection is established, we read the GATT Characteristic for the Current Time Service of the BLE Peer

Based on https://github.com/apache/mynewt-nimble/blob/master/apps/blecent/src/main.c

```c
#define BLE_GATT_SVC_CTS        (0x1805)  //  GATT Service for Current Time Service
#define BLE_GATT_CHR_CUR_TIME   (0x2A2B)  //  GATT Characteristic for Current Time
```

When services has been discovered...

https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/apps/my_sensor_app/src/ble_main.c#L88-L107

```c
/// Called when GATT Service Discovery of the BLE Peer has completed
static void blecent_on_disc_complete(const struct blepeer *peer, int status, void *arg) {
    if (status != 0) {
        //  Service discovery failed
        MODLOG_DFLT_ERROR("Error: Service discovery failed; status=%d conn_handle=%d\n", status, peer->conn_handle);
        goto err;
    }

    //  GATT Service Discovery has completed successfully.  Now we have a complete list of services, characteristics, and descriptors that the peer supports.
    MODLOG_DFLT_INFO("Service discovery complete; status=%d conn_handle=%d\n", status, peer->conn_handle);

    //  Read the GATT Characteristics from the peer
    blecent_read(peer);
    return;

err:
    //  Don't terminate the BLE connection yet, may be used by MCU Manager
    //  ble_gap_terminate(peer->conn_handle, BLE_ERR_REM_USER_CONN_TERM);
    return;
}
```

Read the Current Time Characteristic...

https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/apps/my_sensor_app/src/ble_main.c#L109-L139

```c
/// Read the GATT Characteristic for Current Time from the BLE Peer
static void blecent_read(const struct blepeer *peer) {
    //  Find the GATT Characteristic for Current Time Service from the discovered GATT Characteristics
    const struct blepeer_chr *chr = blepeer_chr_find_uuid(
        peer,
        BLE_UUID16_DECLARE(BLE_GATT_SVC_CTS),      //  GATT Service for Current Time Service
        BLE_UUID16_DECLARE(BLE_GATT_CHR_CUR_TIME)  //  GATT Characteristic for Current Time Service
    );
    if (chr == NULL) {
        MODLOG_DFLT_ERROR("Error: Peer doesn't support CTS\n");
        goto err;
    }

    //  Read the Current Time Service Characteristic
    int rc = ble_gattc_read(
        peer->conn_handle,      //  BLE Connection
        chr->chr.val_handle,    //  GATT Characteristic
        blecent_on_read,        //  Callback after reading
        NULL                    //  Callback argument
    );
    if (rc != 0) {
        MODLOG_DFLT(ERROR, "Error: Can't read CTS: %d\n", rc);
        goto err;
    }
    return;

err:
    //  Don't terminate the BLE connection yet, may be used by MCU Manager
    //  ble_gap_terminate(peer->conn_handle, BLE_ERR_REM_USER_CONN_TERM);
    return;
}
```

When the Current Time Characteristic has been read...

https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/apps/my_sensor_app/src/ble_main.c#L141-L178

```c
/// Called when Current Time GATT Characteristic has been read
static int blecent_on_read(uint16_t conn_handle, const struct ble_gatt_error *error, struct ble_gatt_attr *attr, void *arg) {
    //  Read the current time from the GATT Characteristic
    MODLOG_DFLT_INFO("Read complete; status=%d conn_handle=%d", error->status, conn_handle);
    if (error->status == 0) {
        MODLOG_DFLT_INFO(" attr_handle=%d value=", attr->handle);
        print_mbuf(attr->om);
    }
    MODLOG_DFLT_INFO("\n");

    //  Set the system time from the current time
    int rc = set_system_time(attr->om);
    if (rc != 0) {
        MODLOG_DFLT_ERROR("Error: Can't set time: %d\n", rc);
        goto err;
    }

    //  Get the system time
    struct os_timeval tv;
    struct os_timezone tz;
    rc = os_gettimeofday(&tv, &tz);
    if (rc != 0) { MODLOG_DFLT_ERROR("Error: Can't get time: %d\n", rc); goto err; }
    struct clocktime ct;
    rc = timeval_to_clocktime(&tv, &tz, &ct);
    if (rc != 0) { MODLOG_DFLT_ERROR("Error: Can't convert time: %d\n", rc); goto err; }

    //  Dump the system time as 2020-10-04T13:20:26.839843+00:00
    char buf[50];
    rc = datetime_format(&tv, &tz, buf, sizeof(buf));
    if (rc != 0) { MODLOG_DFLT_ERROR("Error: Can't format time: %d\n", rc); goto err; }
    console_printf("Current Time: %s\n", buf);

    //  TODO: Update the current time periodically
    return 0;

err:
    return 0;  //  Don't propagate error to system
}
```

Data Format for Current Time...

https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/apps/my_sensor_app/src/ble_main.c#L75-L86

```c
/// Data Format for Current Time Service. Based on https://github.com/sdalu/mynewt-nimble/blob/495ff291a15306787859a2fe8f2cc8765b546e02/nimble/host/services/cts/src/ble_svc_cts.c
struct ble_current_time {
    uint16_t year;
    uint8_t month;
    uint8_t day;
    uint8_t hours;
    uint8_t minutes;
    uint8_t secondes;
    uint8_t day_of_week;
    uint8_t fraction256;
    uint8_t adjust_reason;
} __attribute__((__packed__));
```

Set the Mynewt system time...

https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/apps/my_sensor_app/src/ble_main.c#L180-L235

```c
/// Set system time given the GATT Current Time in Mbuf format. Based on https://github.com/sdalu/mynewt-nimble/blob/495ff291a15306787859a2fe8f2cc8765b546e02/nimble/host/services/cts/src/ble_svc_cts.c
static int set_system_time(const struct os_mbuf *om) {
    //  Verify the Mbuf size
    uint16_t om_len = OS_MBUF_PKTLEN(om);
    if (om_len != sizeof(struct ble_current_time)) {  //  Should be 10 bytes
        return BLE_ATT_ERR_INVALID_ATTR_VALUE_LEN;
    }

    //  Copy the data from the Mbuf
    struct ble_current_time current_time;
    int rc = ble_hs_mbuf_to_flat(  //  Flatten and copy the Mbuf...
        om,                        //  From om...
		&current_time,             //  To current_time...
        om_len,                    //  For om_len bytes
        NULL
    );
    if (rc != 0) { return BLE_ATT_ERR_UNLIKELY; }

    //  Get timezone
    struct os_timeval tv0;
    struct os_timezone tz;
    rc = os_gettimeofday(&tv0, &tz);
    if (rc != 0) { return BLE_ATT_ERR_UNLIKELY; }

    //  Convert to clocktime format
    struct clocktime ct;
    ct.year = le16toh(current_time.year);
    ct.mon  = current_time.month;
    ct.day  = current_time.day;
    ct.hour = current_time.hours;
    ct.min  = current_time.minutes;
    ct.sec  = current_time.secondes;
    ct.usec = (current_time.fraction256 * 1000000) / 256;

    //  Convert to timeval format
    struct os_timeval tv;    
    rc = clocktime_to_timeval(&ct, &tz, &tv);
    if (rc != 0) { return BLE_ATT_ERR_UNLIKELY; }

    //  Set the system time
    rc = os_settimeofday(&tv, NULL);
    if (rc != 0) { return BLE_ATT_ERR_UNLIKELY; }
    return 0;
}
```

[`apps/my_sensor_app/src/ble_peer.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/apps/my_sensor_app/src/ble_peer.c)

Bluetooth Log:

```
Starting BLE...
BLE started
Render LVGL display...
Flush display: left=63, top=27, right=196, bottom=42...
connection established;
connection updated; 
Service discovery complete; status=0 conn_handle=1
Read complete; status=0 conn_handle=1 attr_handle=67 value=e4 07 0a 04 0e 05 29 07 87 00 
Current Time: 2020-10-04T14:05:41.527343+00:00
...
Render LVGL display...
Flush display: left=60, top=27, right=183, bottom=42...
...
Render LVGL display...
Flush display: left=59, top=27, right=181, bottom=42...
...
Render LVGL display...
Flush display: left=59, top=27, right=180, bottom=42...
```

# Get the Time in C

TODO: os_timeval, clocktime and ISO format, [`my_sensor_app/src/watch_face.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/apps/my_sensor_app/src/watch_face.c)

```c
//  Get the system time
struct os_timeval tv;
struct os_timezone tz;
int rc = os_gettimeofday(&tv, &tz);
if (rc != 0) { console_printf("Can't get time: %d\n", rc); return 2; }

//  Convert the time
struct clocktime ct;
rc = timeval_to_clocktime(&tv, &tz, &ct);
if (rc != 0) { console_printf("Can't convert time: %d\n", rc); return 3; }

//  Format the time as 2020-10-04T13:20:26.839843+00:00
char buf[50];
rc = datetime_format(&tv, &tz, buf, sizeof(buf));
if (rc != 0) { console_printf("Can't format time: %d\n", rc); return 4; }

//  Truncate after minute: 2020-10-04T13:20
buf[16] = 0;
```

# Get the Time in Rust

TODO: WatchFaceTime, [`pinetime-watchface/src/lib.rs`](https://github.com/lupyuen/pinetime-watchface/blob/master/src/lib.rs)

```rust
/// Get the system time
fn get_system_time() -> MynewtResult<WatchFaceTime> {
    //  Get the system time
    static mut TV: os::os_timeval  = fill_zero!(os::os_timeval);
    static mut TZ: os::os_timezone = fill_zero!(os::os_timezone);
    let rc = unsafe { os::os_gettimeofday(&mut TV, &mut TZ) };
    assert!(rc == 0, "Can't get time");    

    //  Convert the time
    static mut CT: clocktime = fill_zero!(clocktime);
    let rc = unsafe { timeval_to_clocktime(&TV, &TZ, &mut CT) };
    assert!(rc == 0, "Can't convert time");

    //  Return the time
    let result = unsafe {  //  Unsafe because CT is a mutable static
        WatchFaceTime {
            year:        CT.year as u16,  //  Year (4 digit year)
            month:       CT.mon  as  u8,  //  Month (1 - 12)
            day:         CT.day  as  u8,  //  Day (1 - 31)
            hour:        CT.hour as  u8,  //  Hour (0 - 23)
            minute:      CT.min  as  u8,  //  Minute (0 - 59)
            second:      CT.sec  as  u8,  //  Second (0 - 59)
            day_of_week: CT.dow  as  u8,  //  Day of week (0 - 6; 0 = Sunday)
        }
    };
    Ok(result)
}
```

# Watch Face in C

TODO: Mynewt timer, [`my_sensor_app/src/watch_face.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/apps/my_sensor_app/src/watch_face.c)

Create the watch face...

```c
/// Render a watch face. Called by main() in rust/app/src/lib.rs
int create_watch_face(void) {
    console_printf("Create watch face...\n"); console_flush();
    btn = lv_btn_create(lv_scr_act(), NULL);     //  Add a button the current screen
    lv_obj_set_pos(btn, 10, 10);                 //  Set its position
    lv_obj_set_size(btn, 220, 50);               //  Set its size

    label = lv_label_create(btn, NULL);          //  Add a label to the button
    lv_label_set_text(label, "Time Sync");       //  Set the label text

    //  Set a timer to update the watch face every minute
    //  TODO: Move this code to the caller
    os_callout_init(
        &watch_face_callout,   //  Timer for the watch face
        os_eventq_dflt_get(),  //  Use default event queue
        watch_face_callback,   //  Callback function for the timer
        NULL
    );
    //  Trigger the timer in 60 seconds
    os_callout_reset(
        &watch_face_callout,   //  Timer for the watch face
        OS_TICKS_PER_SEC * 60  //  Trigger timer in 60 seconds
    );
    return 0;
}
```

Update the watch face...

```c
/// Update the watch face
int update_watch_face(void) {
    //  If button or label not created, quit
    if (btn == NULL || label == NULL) { return 1; }

    //  Get the system time
    struct os_timeval tv;
    struct os_timezone tz;
    int rc = os_gettimeofday(&tv, &tz);
    if (rc != 0) { console_printf("Can't get time: %d\n", rc); return 2; }

    //  Convert the time
    struct clocktime ct;
    rc = timeval_to_clocktime(&tv, &tz, &ct);
    if (rc != 0) { console_printf("Can't convert time: %d\n", rc); return 3; }

    //  Format the time as 2020-10-04T13:20:26.839843+00:00
    char buf[50];
    rc = datetime_format(&tv, &tz, buf, sizeof(buf));
    if (rc != 0) { console_printf("Can't format time: %d\n", rc); return 4; }

    //  Truncate after minute: 2020-10-04T13:20
    buf[16] = 0;

    //  Set the label text
    lv_label_set_text(label, buf);
    return 0;
}
```

Callback every minute...

```c
/// Timer callback that is called every minute
static void watch_face_callback(struct os_event *ev) {
    assert(ev != NULL);

    //  Update the watch face
    update_watch_face();

    //  Render the watch face
    pinetime_lvgl_mynewt_render();

    //  Set the watch face timer
    os_callout_reset(
        &watch_face_callout,   //  Timer for the watch face
        OS_TICKS_PER_SEC * 60  //  Trigger timer in 60 seconds
    );
}
```

# Watch Face in Rust

TODO: Barebones watch face, LVGL styles

Watch Face Framework in [`pinetime-watchface/blob/master/src/lib.rs`](https://github.com/lupyuen/pinetime-watchface/blob/master/src/lib.rs)

Start the watch face...

```rust
/// Start rendering the watch face every minute
pub fn start_watch_face(update_watch_face: UpdateWatchFace) -> MynewtResult<()> {
    console::print("Init Rust watch face...\n"); console::flush();

    //  Save the callback for updating the watch face
    unsafe { UPDATE_WATCH_FACE = Some(update_watch_face); }

    //  Get active screen from LVGL
    let screen = get_active_screen();

    //  Allow touch events
    obj::set_click(screen, true) ? ;

    //  Render the watch face
    let rc = unsafe { pinetime_lvgl_mynewt_render() };
    assert!(rc == 0, "LVGL render fail");    

    //  Set a timer to update the watch face every minute
    unsafe {  //  Unsafe because os_callout_init is a Mynewt C function
        os::os_callout_init(
            &mut WATCH_FACE_CALLOUT,         //  Timer for the watch face
            os::eventq_dflt_get().unwrap(),  //  Use default event queue
            Some(watch_face_callback),       //  Callback function for the timer
            ptr::null_mut()                  //  No argument
        );    
    }

    //  Trigger the watch face timer in 60 seconds
    let rc = unsafe {  //  Unsafe because os_callout_reset is a Mynewt C function
        os::os_callout_reset(
            &mut WATCH_FACE_CALLOUT,   //  Timer for the watch face
            os::OS_TICKS_PER_SEC * 60  //  Trigger timer in 60 seconds
        )
    };
    assert!(rc == 0, "Timer fail");
    Ok(())
}
```

Update the watch face every minute...

```rust
/// Timer callback that is called every minute
extern fn watch_face_callback(_ev: *mut os::os_event) {
    console::print("Update Rust watch face...\n"); console::flush();
    
    //  If there is no callback, fail.
    assert!(unsafe { UPDATE_WATCH_FACE.is_some() }, "Update watch face missing");

    //  Get the system time    
    let time = get_system_time()
        .expect("Can't get system time");

    //  Compose the watch face state
    let state = WatchFaceState {
        time,
        millivolts: 0,     //  TODO: Get current voltage
        charging:   true,  //  TODO: Get charging status
        powered:    true,  //  TODO: Get powered status
        bluetooth:  BluetoothState::BLUETOOTH_STATE_CONNECTED,  //  TODO: Get BLE state
    };

    //  Update the watch face
    unsafe {  //  Unsafe because WATCH_FACE is a mutable static
        UPDATE_WATCH_FACE.unwrap()(&state)
            .expect("Update Watch Face fail");
    }

    //  Render the watch face
    let rc = unsafe { pinetime_lvgl_mynewt_render() };
    assert!(rc == 0, "LVGL render fail");    

    //  Trigger the watch face timer in 60 seconds
    let rc = unsafe {  //  Unsafe because os_callout_reset is a Mynewt C function
        os::os_callout_reset(
            &mut WATCH_FACE_CALLOUT,   //  Timer for the watch face
            os::OS_TICKS_PER_SEC * 60  //  Trigger timer in 60 seconds
        )
    };
    assert!(rc == 0, "Timer fail");
}
```

Create the widgets: [`barebones-watchface/src/lib.rs`](https://github.com/lupyuen/barebones-watchface/blob/master/src/lib.rs)

```rust
impl WatchFace for BarebonesWatchFace {

    ///////////////////////////////////////////////////////////////////////////////
    //  Create Watch Face

    /// Create the widgets for the Watch Face
    fn new() -> MynewtResult<Self> {
        //  Get the active screen
        let screen = watchface::get_active_screen();

        //  Create the widgets
        let watch_face = Self {
            //  Create a Label for Time: "00:00"
            time_label: {
                let lbl = label::create(screen, ptr::null()) ? ;  //  `?` will terminate the function in case of error
                label::set_long_mode(lbl, label::LV_LABEL_LONG_BREAK) ? ;
                label::set_text(     lbl, strn!("00:00")) ? ;     //  strn creates a null-terminated string
                obj::set_width(      lbl, 240) ? ;
                obj::set_height(     lbl, 200) ? ;
                label::set_align(    lbl, label::LV_LABEL_ALIGN_CENTER) ? ;
                obj::align(          lbl, screen, obj::LV_ALIGN_CENTER, 0, -30) ? ;    
                lbl  //  Return the label as time_label
            },
```

Update widgets...

```rust
impl WatchFace for BarebonesWatchFace {

    ///////////////////////////////////////////////////////////////////////////////
    //  Update Watch Face

    /// Update the widgets in the Watch Face with the current state
    fn update(&self, state: &WatchFaceState) -> MynewtResult<()> {
        //  Populate the Time and Date Labels
        self.update_date_time(state) ? ;

        //  Populate the Bluetooth Label
        self.update_bluetooth(state) ? ;

        //  Populate the Power Label
        self.update_power(state) ? ;
        Ok(())
    }    
```

Populate time and date widgets...

```rust
impl BarebonesWatchFace {

    /// Populate the Time and Date Labels with the time and date
    fn update_date_time(&self, state: &WatchFaceState) -> MynewtResult<()> {
        //  Create a string buffer to format the time
        static mut TIME_BUF: String = new_string();

        //  Format the time as "12:34" and set the label
        unsafe {                  //  Unsafe because TIME_BUF is a mutable static
            TIME_BUF.clear();     //  Erase the buffer

            write!(
                &mut TIME_BUF,    //  Write the formatted text
                "{:02}:{:02}\0",  //  Must terminate Rust strings with null
                state.time.hour,
                state.time.minute
            ).expect("time fail");

            label::set_text(      //  Set the label
                self.time_label, 
                &to_strn(&TIME_BUF)
            ) ? ;
        }

        //  Get the short day name and short month name
        let day   = get_day_name(&state.time);
        let month = get_month_name(&state.time);

        //  Create a string buffer to format the date
        static mut DATE_BUF: String = new_string();
        
        //  Format the date as "MON 22 MAY 2020" and set the label
        unsafe {                    //  Unsafe because DATE_BUF is a mutable static
            DATE_BUF.clear();       //  Erase the buffer

            write!(
                &mut DATE_BUF,      //  Write the formatted text
                "{} {} {} {}\n\0",  //  Must terminate Rust strings with null
                day,
                state.time.day,
                month,
                state.time.year
            ).expect("date fail");

            label::set_text(        //  Set the label
                self.date_label, 
                &to_strn(&DATE_BUF)
            ) ? ;
        }
        Ok(())
    }    
```

Update Bluetooth state...

```rust
impl BarebonesWatchFace {
    /// Populate the Bluetooth Label with the Bluetooth State (Bluetooth Icon)
    fn update_bluetooth(&self, state: &WatchFaceState) -> MynewtResult<()> {
        if state.bluetooth == BluetoothState::BLUETOOTH_STATE_DISCONNECTED {
            //  If Bluetooth is disconnected, leave the label empty
            label::set_text(
                self.bluetooth_label, 
                strn!("")
            ) ? ;
        } else {
            //  Compute the color of the Bluetooth icon
            let color = 
                match &state.bluetooth {
                    BluetoothState::BLUETOOTH_STATE_INACTIVE     => "#000000",  //  Black
                    BluetoothState::BLUETOOTH_STATE_ADVERTISING  => "#5794f2",  //  Blue
                    BluetoothState::BLUETOOTH_STATE_DISCONNECTED => "#f2495c",  //  Red
                    BluetoothState::BLUETOOTH_STATE_CONNECTED    => "#37872d",  //  Dark Green
                };

                //  Create a string buffer to format the Bluetooth status
            static mut BLUETOOTH_STATUS: String = new_string();

            //  Format the Bluetooth status and set the label
            unsafe {                       //  Unsafe because BLUETOOTH_STATUS is a mutable static
                BLUETOOTH_STATUS.clear();  //  Erase the buffer

                write!(
                    &mut BLUETOOTH_STATUS, //  Write the formatted text
                    "{} \u{F293}#\0",      //  LV_SYMBOL_BLUETOOTH. Must terminate Rust strings with null.
                    color
                ).expect("bt fail");

                label::set_text(           //  Set the label
                    self.bluetooth_label, 
                    &to_strn(&BLUETOOTH_STATUS)
                ) ? ;
            }
        }
        Ok(())
    }
```

Update power indicator...

```rust
impl BarebonesWatchFace {
    /// Populate the Power Label with the Power Indicator (Charging & Battery)
    fn update_power(&self, state: &WatchFaceState) -> MynewtResult<()> {
        //  Get the active screen
        let screen = watchface::get_active_screen();

        //  Compute the percentage power
        let percentage = convert_battery_voltage(state.millivolts);

        //  Compute the colour for the charging symbol
        let color =                                                     //  Charging color
            if percentage <= 20                        { "#f2495c" }    //  Low Battery
            else if state.powered && !(state.charging) { "#73bf69" }    //  Full Battery
            else                                       { "#fade2a" };   //  Mid Battery

        let symbol =                         //  Charging symbol
            if state.powered { "\u{F0E7}" }  //  LV_SYMBOL_CHARGE
            else             { " " };

        //  Create a string buffer to format the Power Indicator
        static mut BATTERY_STATUS: String = new_string();

        //  Format thePower Indicator and set the label
        unsafe {                             //  Unsafe because BATTERY_STATUS is a mutable static
            BATTERY_STATUS.clear();          //  Erase the buffer

            write!(
                &mut BATTERY_STATUS, 
                "{} {}%{}#\nRUST ({}mV)\0",  //  Must terminate Rust strings with null
                color,
                percentage,
                symbol,
                state.millivolts
            ).expect("batt fail");

            label::set_text(
                self.power_label, 
                &to_strn(&BATTERY_STATUS)
            ) ? ; 
        }
        obj::align(
            self.power_label, screen, 
            obj::LV_ALIGN_IN_TOP_RIGHT, 0, 0
        ) ? ;
        Ok(())
    }
```

# Porting LVGL to Mynewt

TODO: SPI Driver for ST7789 Display Controller, [`pinetime_lvgl_mynewt`](https://gitlab.com/lupyuen/pinetime_lvgl_mynewt)

Located at `libs/pinetime_lvgl_mynewt`

[`src/pinetime/lvgl.c`](https://gitlab.com/lupyuen/pinetime_lvgl_mynewt/blob/master/src/pinetime/lvgl.c)

```c
/// Init the LVGL library. Called by sysinit() during startup, defined in pkg.yml.
void pinetime_lvgl_mynewt_init(void) {    
    console_printf("Init LVGL...\n"); console_flush();
    assert(pinetime_lvgl_mynewt_started == false);

    //  Init the display controller
    int rc = pinetime_lvgl_mynewt_init_display(); assert(rc == 0);

    //  Init the LVGL display
    lv_init();
    lv_port_disp_init();
    pinetime_lvgl_mynewt_started = true;
}

/// Render the LVGL display
int pinetime_lvgl_mynewt_render(void) {
    console_printf("Render LVGL display...\n"); console_flush();
    //  Must tick at least 100 milliseconds to force LVGL to update display
    lv_tick_inc(100);
    //  LVGL will flush our display driver
    lv_task_handler();
    return 0;
}
```

Display Driver for ST7789: [`src/pinetime/lv_port_disp.c`](https://gitlab.com/lupyuen/pinetime_lvgl_mynewt/blob/master/src/pinetime/lv_port_disp.c)

```c
/// Flush the content of the internal buffer the specific area on the display
static void disp_flush(lv_disp_drv_t * disp_drv, const lv_area_t * area, lv_color_t * color_p) {
    //  Validate parameters
    assert(area->x2 >= area->x1);
    assert(area->y2 >= area->y1);

    //  Set the ST7789 display window
    pinetime_lvgl_mynewt_set_window(area->x1, area->y1, area->x2, area->y2);

    //  Write Pixels (RAMWR): st7735_lcd::draw() → set_pixel()
    int len = 
        ((area->x2 - area->x1) + 1) *  //  Width
        ((area->y2 - area->y1) + 1) *  //  Height
        2;                             //  2 bytes per pixel
    pinetime_lvgl_mynewt_write_command(RAMWR, NULL, 0);
    pinetime_lvgl_mynewt_write_data((const uint8_t *) color_p, len);

    //  IMPORTANT!!! Inform the graphics library that you are ready with the flushing
    lv_disp_flush_ready(disp_drv);
}
```

[`src/pinetime/display.c`](https://gitlab.com/lupyuen/pinetime_lvgl_mynewt/blob/master/src/pinetime/display.c)

```c
/// Set the ST7789 display window to the coordinates (left, top), (right, bottom)
int pinetime_lvgl_mynewt_set_window(uint8_t left, uint8_t top, uint8_t right, uint8_t bottom) {
    assert(left < COL_COUNT && right < COL_COUNT && top < ROW_COUNT && bottom < ROW_COUNT);
    assert(left <= right);
    assert(top <= bottom);
    //  Set Address Window Columns (CASET): st7735_lcd::draw() → set_pixel() → set_address_window()
    int rc = pinetime_lvgl_mynewt_write_command(CASET, NULL, 0); assert(rc == 0);
    uint8_t col_para[4] = { 0x00, left, 0x00, right };
    rc = pinetime_lvgl_mynewt_write_data(col_para, 4); assert(rc == 0);

    //  Set Address Window Rows (RASET): st7735_lcd::draw() → set_pixel() → set_address_window()
    rc = pinetime_lvgl_mynewt_write_command(RASET, NULL, 0); assert(rc == 0);
    uint8_t row_para[4] = { 0x00, top, 0x00, bottom };
    rc = pinetime_lvgl_mynewt_write_data(row_para, 4); assert(rc == 0);
    return 0;
}
```

```c
/// Transmit ST7789 command
int pinetime_lvgl_mynewt_write_command(uint8_t command, const uint8_t *params, uint16_t len) {
    hal_gpio_write(DISPLAY_DC, 0);
    int rc = transmit_spi(&command, 1);
    assert(rc == 0);
    if (params != NULL && len > 0) {
        rc = pinetime_lvgl_mynewt_write_data(params, len);
        assert(rc == 0);
    }
    return 0;
}

/// Transmit ST7789 data
int pinetime_lvgl_mynewt_write_data(const uint8_t *data, uint16_t len) {
    hal_gpio_write(DISPLAY_DC, 1);
    transmit_spi(data, len);
    return 0;
}
```

# Rust Wrapper for LVGL

TODO: Bindgen, Safe Wrapper Proc Macro, [`rust/lvgl`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/lvgl)

# What's Next

TODO: Bluetooth Time Sync, Rust Watch Faces and LVGL were developed and tested with Remote PineTime

[Check out my PineTime articles](https://lupyuen.github.io)

[RSS Feed](https://lupyuen.github.io/rss.xml)