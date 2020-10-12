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

First step in our Time Sync magic... Detect incoming Bluetooth LE connections.

We're using the open-source NimBLE Bluetooth LE stack, which exposes a hook for us to detect incoming connections: [`apps/my_sensor_app/src/ble_main.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/apps/my_sensor_app/src/ble_main.c#L368-L416)

```c
//  The NimBLE stack executes this callback function when a GAP Event occurs
static int bleprph_gap_event(struct ble_gap_event *event, void *arg) {
    //  Check the GAP Event
    switch (event->type) {

        //  When a BLE connection is established...
        case BLE_GAP_EVENT_CONNECT:

            //  Remember the BLE Peer
            blepeer_add(
                event->connect.conn_handle  //  BLE Connection
            );

            //  Discover all GATT Sevices and Characteristics in the BLE Peer
            blepeer_disc_all(
                event->connect.conn_handle,  //  BLE Connection
                blecent_on_disc_complete,    //  Callback function that will be called when discovery is complete
                NULL                         //  No argument for callback
            );
```

When we see an incoming Bluetooth LE connection, we react by remembering the peer-to-peer connection with `blepeer_add`. 

Then we discover all GATT Services and Characteristics of our peer (mobile phone) by calling `blepeer_disc_all`.

Here's the callback function that's called when the GATT Services and Characteristics have been discovered: [`apps/my_sensor_app/src/ble_main.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/apps/my_sensor_app/src/ble_main.c#L88-L107)

```c
/// Called when GATT Service Discovery of the BLE Peer has completed
static void blecent_on_disc_complete(const struct blepeer *peer, int status, void *arg) {
    //  Omitted: Check that discovery status is successful

    //  GATT Service Discovery has completed successfully.
    //  Now we have a complete list of services, characteristics 
    //  and descriptors that the peer supports.

    //  Read the GATT Characteristics from the peer
    blecent_read(peer);
}
```

Now we can call `blecent_read` to read the Current Time Characteristic exposed to PineTime by our phone. We'll learn how in the next section.

_What are `blepeer_add` and `blepeer_disc_all`?_

They are __Bluetooth LE Peer Functions__ provided by NimBLE to maintain peer-to-peer Bluetooth LE connections and to remember the discovered GATT Services and Characteristics.

See [`apps/my_sensor_app/src/ble_peer.h`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/apps/my_sensor_app/src/ble_peer.h) and [`ble_peer.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/apps/my_sensor_app/src/ble_peer.c) 

# Read GATT Characteristic for Current Time

Our Time Sync story so far...

1.  PineTime has detected an incoming Bluetooth LE connection from our mobile phone

1.  PineTime reacts by discovering all GATT Services and Characteristics exposed by our phone (through the nRF Connect mobile app)

1.  PineTime is now ready to read the Current Time Characteristic exposed by our phone

Here's how we read the Current Time Characteristic with NimBLE: [`apps/my_sensor_app/src/ble_main.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/apps/my_sensor_app/src/ble_main.c#L109-L139)

```c
/// Read the GATT Characteristic for Current Time from the BLE Peer
static void blecent_read(const struct blepeer *peer) {
    //  Find the GATT Characteristic for Current Time Service from the discovered GATT Characteristics
    const struct blepeer_chr *chr = blepeer_chr_find_uuid(
        peer,
        BLE_UUID16_DECLARE( BLE_GATT_SVC_CTS ),      //  GATT Service for Current Time Service
        BLE_UUID16_DECLARE( BLE_GATT_CHR_CUR_TIME )  //  GATT Characteristic for Current Time Service
    );

    //  Omitted: Check that the Current Time Characteristic exists

    //  Read the Current Time Characteristic
    ble_gattc_read(
        peer->conn_handle,      //  BLE Connection
        chr->chr.val_handle,    //  GATT Characteristic
        blecent_on_read,        //  Callback function that will be called when reading is complete
        NULL                    //  No argument for callback
    );
}
```

`ble_gattc_read` is the function provided by NimBLE to transmit a Bluetooth LE request to read a GATT Characteristic (the Current Time Characteristic).

The Current Time Service and Current Time Characteristic are defined in the [Bluetooth Specifications](https://www.bluetooth.com/specifications/gatt/services/)...

```c
#define BLE_GATT_SVC_CTS        (0x1805)  //  GATT Service for Current Time Service
#define BLE_GATT_CHR_CUR_TIME   (0x2A2B)  //  GATT Characteristic for Current Time
```

The [Current Time Characteristic](https://www.bluetooth.com/wp-content/uploads/Sitecore-Media-Library/Gatt/Xml/Services/org.bluetooth.service.current_time.xml) returns the current date and time in this 10-byte format: [`apps/my_sensor_app/src/ble_main.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/apps/my_sensor_app/src/ble_main.c#L75-L86)

```c
/// Data Format for Current Time Service. Based on https://github.com/sdalu/mynewt-nimble/blob/495ff291a15306787859a2fe8f2cc8765b546e02/nimble/host/services/cts/src/ble_svc_cts.c
struct ble_current_time {
    uint16_t year;
    uint8_t  month;
    uint8_t  day;
    uint8_t  hours;
    uint8_t  minutes;
    uint8_t  seconds;
    uint8_t  day_of_week;  //  From 1 (Monday) to 7 (Sunday)
    uint8_t  fraction256;
    uint8_t  adjust_reason;
} __attribute__((__packed__));
```

So when our phone returns these 10 bytes to PineTime as the current date/time...

```
e4 07 0a 04 0e 05 29 07 87 00 
```

PineTime shall decode the 10 bytes as...

```
2020-10-04 14:05:41.527343 Sunday
```

We'll see in a while how PineTime decodes the 10 bytes and sets the Mynewt system time.

# Set System Time

One fine Sunday afternoon in sunny Singapore, the 4th of October 2020, at 2:05 PM (and 41.527343 seconds), PineTime received these 10 encoded bytes...

```
e4 07 0a 04 0e 05 29 07 87 00 
```

That's the Encoded Current Time, in Bluetooth LE format, returned by our phone (with nRF Connect) to PineTime. The NimBLE Bluetooth LE Stack passes these 10 bytes to our firmware in the __Mbuf Format.__

_What's an Mbuf?_

An [Mbuf (Memory Buffer)](https://mynewt.apache.org/latest/os/core_os/mbuf/mbuf.html) is a linked list of fixed-size blocks thats uses RAM efficiently for networking tasks, like Bluetooth LE.

To work with the data inside the Mbuf linked list, we need to "flatten" the Mbuf (like `om`) into an array or struct (like `current_time`)...

```c
//  Get the Mbuf size
uint16_t om_len = OS_MBUF_PKTLEN(om);

//  Allocate storage for the BLE Current Time
struct ble_current_time current_time;

//  Copy the data from the Mbuf to the BLE Current Time
ble_hs_mbuf_to_flat(  //  Flatten and copy the Mbuf...
    om,               //  From om...
    &current_time,    //  To current_time...
    om_len,           //  For om_len bytes
    NULL
);
```

Here's how we use the Mbuf data to decode the Current Time: [`apps/my_sensor_app/src/ble_main.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/apps/my_sensor_app/src/ble_main.c#L141-L235)

```c
/// Called when Current Time GATT Characteristic has been read
static int blecent_on_read(uint16_t conn_handle, const struct ble_gatt_error *error, struct ble_gatt_attr *attr, void *arg) {
    //  Set the system time from the received time in Mbuf format
    set_system_time(attr->om);
    return 0;
}

/// Set system time given the BLE Current Time in Mbuf format. Based on https://github.com/sdalu/mynewt-nimble/blob/495ff291a15306787859a2fe8f2cc8765b546e02/nimble/host/services/cts/src/ble_svc_cts.c
static int set_system_time(const struct os_mbuf *om) {
    //  Get the Mbuf size
    uint16_t om_len = OS_MBUF_PKTLEN(om);

    //  Allocate storage for the BLE Current Time
    struct ble_current_time current_time;

    //  Copy the data from the Mbuf to the BLE Current Time
    ble_hs_mbuf_to_flat(  //  Flatten and copy the Mbuf...
        om,               //  From om...
		&current_time,    //  To current_time...
        om_len,           //  For om_len bytes
        NULL
    );

    //  Convert BLE Current Time to clocktime format
    struct clocktime ct;
    ct.year = le16toh(current_time.year);
    ct.mon  = current_time.month;
    ct.day  = current_time.day;
    ct.hour = current_time.hours;
    ct.min  = current_time.minutes;
    ct.sec  = current_time.seconds;
    ct.usec = (current_time.fraction256 * 1000000) / 256;
```

We have just populated a `clocktime` struct `ct` with the decoded date and time values.

Now we fetch the default timezone `tz` from Mynewt (because it's needed later for setting the time)...

```c
    //  Get the timezone, which will used for clocktime conversion
    struct os_timeval tv0;
    struct os_timezone tz;
    os_gettimeofday(&tv0, &tz);
```

Mynewt only accepts system time in the `timeval` format, so we convert it here (passing the timezone)...

```c
    //  Convert clocktime format to timeval format, passing the timezone
    struct os_timeval tv;    
    clocktime_to_timeval(&ct, &tz, &tv);
```

Finally we call the Mynewt Function `os_settimeofday` to set the system time.

```c
    //  Set the system time in timeval format
    os_settimeofday(&tv, NULL);
```

And that's how we sync the time from our mobile phone to PineTime!

# Bluetooth Log for Time Sync

When we perform Time Sync over Bluetooth LE, we'll see these debugging messages emitted by PineTime: [`apps/my_sensor_app/src/ble_main.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/apps/my_sensor_app/src/ble_main.c#L246-L259)

| Debug Message | Remark |
|:---|:---|
| `Starting BLE...` | Start the NimBLE Bluetooth LE Stack
| `BLE started` | 
| `Render LVGL display...`<br>`Flush display: `<br>`left=63, top=27, right=196, bottom=42...` | Render the initial watch face
| `connection established` | Mobile phone connects to PineTime
| `connection updated ` | 
| `Service discovery complete; `<br>`status=0 conn_handle=1` | PineTime discovers the Current Time Service 
| `Read complete; `<br>`status=0 conn_handle=1 attr_handle=67`<br>`value=e4 07 0a 04 0e 05 29 07 87 00 ` | PineTime reads and receives the <br> 10-byte current time
| `Current Time: `<br>`2020-10-04T14:05:41.527343+00:00` | PineTime decodes the current time
| ... | 
| `Render LVGL display...`<br>`Flush display: `<br>`left=60, top=27, right=183, bottom=42...` | Render the updated watch face
| ... | 
| `Render LVGL display...`<br>`Flush display: `<br>`left=59, top=27, right=181, bottom=42...` | Render the updates every minute

We'll learn about Watch Faces in a while.

Before that, let's find out how to read the Mynewt system time in C and in Rust.

# Get the Time in C

Here's how we fetch the Mynewt system time in C for building Watch Faces: [`my_sensor_app/src/watch_face.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/apps/my_sensor_app/src/watch_face.c#L65-L82)

```c
//  Get the system time in timeval format
struct os_timeval tv;
struct os_timezone tz;
int rc = os_gettimeofday(&tv, &tz);
if (rc != 0) { console_printf("Can't get time: %d\n", rc); return 2; }
```

This produces a [`timeval` struct](http://mynewt.apache.org/v1_7_0/os/core_os/time/os_time.html) in `tv` that indicates the number of microseconds elapsed since Jan 1 1970.

Which isn't really meaningful for building Watch Faces. Let's convert `timeval` to a [`clocktime` struct](https://github.com/apache/mynewt-core/blob/master/time/datetime/include/datetime/datetime.h#L31-L40) format...

```c
//  Convert the time from timeval format to clocktime format
struct clocktime ct;
rc = timeval_to_clocktime(&tv, &tz, &ct);
if (rc != 0) { console_printf("Can't convert time: %d\n", rc); return 3; }
```

This produces `ct`, a [`clocktime` struct](https://github.com/apache/mynewt-core/blob/master/time/datetime/include/datetime/datetime.h#L31-L40) that contains the date and time components: day, month, year, hours, minutes, seconds and day of week.

Perfect for building a Watch Face!

If we need the current date and time in printable [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format...

```c
//  Format the clocktime time as 2020-10-04T13:20:26.839843+00:00
char buf[50];
rc = datetime_format(&tv, &tz, buf, sizeof(buf));
if (rc != 0) { console_printf("Can't format time: %d\n", rc); return 4; }
```

This produces the currrent date and time in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format like...

```
2020-10-04T13:20:26.839843+00:00
```

For our simple Watch Face in C, we'll truncate the time up to the minute...

```c
//  Truncate after minute: 2020-10-04T13:20
buf[16] = 0;
```

Which looks like this...

```
2020-10-04T13:20
```

# Get the Time in Rust

Here's how we fetch the Mynewt system time in Rust: [`pinetime-watchface/src/lib.rs`](https://github.com/lupyuen/pinetime-watchface/blob/master/src/lib.rs#L164-L190)

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

This produces a [`WatchFaceTime` struct](https://github.com/lupyuen/pinetime-watchface/blob/master/src/lib.rs#L226-L243) that's defined in our [`pinetime-watchface` Watch Face Framework](https://crates.io/crates/pinetime-watchface).

Later we'll use `WatchFaceTime` and `pinetime-watchface` to create our Rust Watch Face.

![Watch Face in C](https://lupyuen.github.io/images/timesync-c-watchface.png)

# Create Watch Face in C

Now that we can sync the time and fetch the current time, let's create a simple watch face in C!

Our Watch Face shall have only one button, laid out on PineTime's 240 x 240 display like this...

![Watch Face Coordinates](https://lupyuen.github.io/images/timesync-coords.jpg)

Here's how we create the button: [`my_sensor_app/src/watch_face.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/apps/my_sensor_app/src/watch_face.c#L29-L57)

```c
static lv_obj_t *btn;    //  Button
static lv_obj_t *label;  //  Label

/// Render a watch face. Called by main() in rust/app/src/lib.rs
int create_watch_face(void) {
    btn = lv_btn_create(lv_scr_act(), NULL);     //  Add a button the current screen
    lv_obj_set_pos(btn, 10, 10);                 //  Set its position: X=10, Y=10
    lv_obj_set_size(btn, 220, 50);               //  Set its size: Width=220, Height=50
```

To display the current date and time on the button, we'll create a label for the button like so...

```c
    label = lv_label_create(btn, NULL);          //  Add a label to the button
    lv_label_set_text(label, "Time Sync");       //  Set the label text
```

We're using the [__Button Widget__](https://docs.lvgl.io/latest/en/html/widgets/btn.html) and [__Label Widget__](https://docs.lvgl.io/latest/en/html/widgets/label.html) provided by the [__LVGL Library (Version 7)__](https://docs.lvgl.io/latest/en/html/index.html), which we have ported to Mynewt on PineTime as [__`pinetime_lvgl_mynewt`__](https://gitlab.com/lupyuen/pinetime_lvgl_mynewt)

The Watch Face shall be updated every minute. To do that in Mynewt, we create a [__Callout Timer__](https://mynewt.apache.org/latest/os/core_os/callout/callout.html) by calling [__`os_callout_init`__](https://mynewt.apache.org/latest/os/core_os/callout/callout.html)...

```c
    static struct os_callout watch_face_callout;  //  Timer that is triggered every minute
    ...
    //  Set a timer to update the watch face every minute
    os_callout_init(
        &watch_face_callout,   //  Timer for the watch face
        os_eventq_dflt_get(),  //  Use default event queue
        watch_face_callback,   //  Callback function for the timer
        NULL                   //  No argument for the callback function
    );
```

To trigger the timer in 60 seconds, we call [__`os_callout_reset`__](https://mynewt.apache.org/latest/os/core_os/callout/callout.html#c.os_callout_reset)...

```c
    //  Trigger the timer in 60 seconds
    os_callout_reset(
        &watch_face_callout,   //  Timer for the watch face
        OS_TICKS_PER_SEC * 60  //  Trigger timer in 60 seconds
    );
    return 0;
}
```

We have just defined the function __`create_watch_face`__ that creates our Watch Face and triggers the Callout Timer...

![Watch Face Functions](https://lupyuen.github.io/images/timesync-c.jpg)

Next we shall define two more functions...

1. __`watch_face_callback`__: Callback Function that is triggered by the Callout Timer every minute

1. __`update_watch_face`__: Function that updates the date and time on the PineTime display

# Update Watch Face in C

Let's look at `update_watch_face`, our function that updates the date and time on the PineTime display: [`my_sensor_app/src/watch_face.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/apps/my_sensor_app/src/watch_face.c#L59-L87)

![Watch Face Function: update_watch_face](https://lupyuen.github.io/images/timesync-c2.jpg)

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
``` 

The code above looks familiar... We have seen this code eariler for fetching the current date and time.

`update_watch_face` has one new unfamiliar line of code...

```c
    //  Set the label text
    lv_label_set_text(label, buf);
    return 0;
}
```

`buf` contains the current date and time in the format...

```
2020-10-04T13:20
```

When we call the LVGL Function `lv_label_set_text`, our Button Label will be set to the current date and time.

Thus to make a functioning Watch Face, we need to call `update_watch_face` every minute.

And that's handled by `watch_face_callback` in [`my_sensor_app/src/watch_face.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/apps/my_sensor_app/src/watch_face.c#L89-L104)

![Watch Face Function: watch_face_callback](https://lupyuen.github.io/images/timesync-c3.jpg)

```c
/// Timer callback that is called every minute
static void watch_face_callback(struct os_event *ev) {
    assert(ev != NULL);

    //  Update the watch face
    update_watch_face();
```

Remember that `watch_face_callback` is first triggered by the Callout Timer in `create_watch_face`.

Here we call `update_watch_face` to set our Button Label to the current date and time (as we have seen above).

Next we render the LVGL Button and Label to PineTime's display...

```c
    //  Render the watch face
    pinetime_lvgl_mynewt_render();
```

Finally we set our Callout Timer to trigger `watch_face_callback` again in 60 seconds...

```c
    //  Set the watch face timer
    os_callout_reset(
        &watch_face_callout,   //  Timer for the watch face
        OS_TICKS_PER_SEC * 60  //  Trigger timer in 60 seconds
    );
}
```

That's how we create a simple watch face in C!

_We can build complicated Watch Faces in C... Right?_

As our Watch Face code in C grows in complexity... It becomes harder to test, deploy, maintain and extend.

In the next section we'll look at a more sustainable way to build Watch Faces... With a __Watch Face Framework in Rust__!

Rust Watch Faces may also be catalogued at __[crates.io](https://crates.io/crates/barebones-watchface)__... So that PineTime Owners may easily discover, extend and remix the Watch Faces.

Let's learn how...

# Create Watch Face in Rust

Watch Faces are built in Rust with the [Watch Face Framework `pinetime-watchface`](https://crates.io/crates/pinetime-watchface).

All Rust Watch Faces are required to implement the `WatchFace` Trait defined in [`pinetime-watchface/blob/master/src/lib.rs`](https://github.com/lupyuen/pinetime-watchface/blob/master/src/lib.rs#L164-L190)

```rust
/// Watch Faces shall implement this trait
pub trait WatchFace {
    /// Create the widgets for the Watch Face
    fn new() -> MynewtResult<Self>
        where Self: core::marker::Sized;  //  Result type must have known size

    /// Update the widgets in the Watch Face with the current state
    fn update(&self, state: &WatchFaceState) -> MynewtResult<()>;
}
```

(If you're new to Rust... A Trait in Rust works like an Interface in Java and TypeScript)

The `WatchFace` Trait defines two functions...

1.  `new`: Create the Watch Face. Called by the Watch Face Framework when PineTime starts.

1.  `update`: Update the Watch Face with the current date and time. Called by the Watch Face Framework every minute.

(`new` and `update` work the same way as our Watch Face Functions in C: `create_watch_face` and `update_watch_face`)

Here's how we implement the `new` function for our simple Watch Face `BarebonesWatchFace`: [`barebones-watchface/src/lib.rs`](https://github.com/lupyuen/barebones-watchface/blob/master/src/lib.rs#L72-L129)

![Watch Face Layout](https://lupyuen.github.io/images/timesync-layout.png)

[__Preview this Watch Face in your web browser__](https://lupyuen.github.io/barebones-watchface/lvgl.html)

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

Calling the LVGL API in Rust looks... Different. Check out the article ["Porting PineTime Watch Face from C to Rust On RIOT with LVGL"](https://lupyuen.github.io/pinetime-rust-riot/articles/watch_face)

The code above creates a __Time Label__ for the time and positions the Label at the centre of PineTime's display.

Below the Time Label, we create a __Date Label__ for the date...

```rust
            //  Create a Label for Date: "MON 22 MAY 2020"
            date_label: {
                let lbl = label::create(screen, ptr::null()) ? ;
                label::set_long_mode(lbl, label::LV_LABEL_LONG_BREAK) ? ;
                obj::set_width(      lbl, 200) ? ;
                obj::set_height(     lbl, 200) ? ;
                label::set_text(     lbl, strn!("")) ? ;  //  strn creates a null-terminated string
                label::set_align(    lbl, label::LV_LABEL_ALIGN_CENTER) ? ;
                obj::align(          lbl, screen, obj::LV_ALIGN_CENTER, 0, 40) ? ;
                lbl  //  Return the label as date_label
            },
```

At top left we create a __Bluetooth Label__ to indicate whether PineTime is connected on Bluetooth LE...

```rust
            //  Create a Label for Bluetooth State
            bluetooth_label: {
                let lbl = label::create(screen, ptr::null()) ? ;
                obj::set_width(     lbl, 50) ? ;
                obj::set_height(    lbl, 80) ? ;
                label::set_text(    lbl, strn!("")) ? ;  //  strn creates a null-terminated string
                label::set_recolor( lbl, true) ? ;
                label::set_align(   lbl, label::LV_LABEL_ALIGN_LEFT) ? ;
                obj::align(         lbl, screen, obj::LV_ALIGN_IN_TOP_LEFT, 0, 0) ? ;
                lbl  //  Return the label as bluetooth_label
            },
```

At top right we create a __Power Label__ to indicate the battery status and whether PineTime is charging...

```rust
            //  Create a Label for Power Indicator
            power_label: {
                let lbl = label::create(screen, ptr::null()) ? ;
                obj::set_width(    lbl, 80) ? ;
                obj::set_height(   lbl, 20) ? ;
                label::set_text(   lbl, strn!("")) ? ;  //  strn creates a null-terminated string
                label::set_recolor(lbl, true) ? ;
                label::set_align(  lbl, label::LV_LABEL_ALIGN_RIGHT) ? ;
                obj::align(        lbl, screen, obj::LV_ALIGN_IN_TOP_RIGHT, 0, 0) ? ;
                lbl  //  Return the label as power_label
            },
        };
        //  Return the watch face
        Ok(watch_face)
    }
```

_Why did we call `set_recolor` for the Bluetooth and Power labels?_

Instead of the default white colour, we'll be showing the Bluetooth and Power Labels in various colour (to indicate the current status).

By calling `set_recolor` on the Bluetooth and Power Labels, we may specify `#RGB` Colour Codes inside the labels. For example, this label...

```
#00ff00 OK#
```

Will show the text `OK` in Green. We'll see the `#RGB` Colour Codes in a while.

_Where are the Labels defined?_

The Labels are now neatly defined in the `BarebonesWatchFace` Struct: [`barebones-watchface/src/lib.rs`](https://github.com/lupyuen/barebones-watchface/blob/master/src/lib.rs#L55-L65)

```rust
/// Barebones Watch Face with no frills
pub struct BarebonesWatchFace {
    /// Label for Time: "12:34"
    pub time_label:      lvgl::Ptr,
    /// Label for Date: "MON 22 MAY 2020"
    pub date_label:      lvgl::Ptr,
    /// Label for Bluetooth State (Bluetooth Icon)
    pub bluetooth_label: lvgl::Ptr,
    /// Label for Power Indicator (Charging & Battery)
    pub power_label:     lvgl::Ptr,
}
```

# Update Watch Face in Rust

To roll our Watch Face in Rust we need to provide two functions: `new` (to create the Watch Face) and `update` (to update our Watch Face).

In the previous section we have done `new`, now let's do `update`: [`barebones-watchface/src/lib.rs`](https://github.com/lupyuen/barebones-watchface/blob/master/src/lib.rs#L131-L146)

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

Let's study how the `update_date_time`, `update_bluetooth` and `update_power` functions refresh the Date, Time, Bluetooth and Power Labels...

![Watch Face Layout](https://lupyuen.github.io/images/timesync-layout.png)

[__Preview this Watch Face in your web browser__](https://lupyuen.github.io/barebones-watchface/lvgl.html)

## Update Time Label

Our function `update_date_time` refreshes the Time Label like so: [`barebones-watchface/src/lib.rs`](https://github.com/lupyuen/barebones-watchface/blob/master/src/lib.rs#L148-L189)

```rust
impl BarebonesWatchFace {

    /// Populate the Time and Date Labels with the time and date
    fn update_date_time(&self, state: &WatchFaceState) -> MynewtResult<()> {
        //  Format the time as "12:34"
        let mut buf = new_string();
        write!(
            &mut buf,         //  Write the formatted text here
            "{:02}:{:02}\0",  //  Must terminate Rust strings with null
            state.time.hour,
            state.time.minute
        ).expect("time fail");

        //  Set the label
        label::set_text(      
            self.time_label, 
            &to_strn(&buf)
        ) ? ;
```

`write!` is explained here: ["Heapless Strings in Rust"](https://lupyuen.github.io/pinetime-rust-riot/articles/watch_face#heapless-strings-in-rust)

Our Watch Face Framework exposes a `String` type that limits strings to 64 characters (and prevents buffer overflows). Which is sufficient for most Watch Faces.

## Update Date Label

Our function `update_date_time` also refreshes the Date Label:  [`barebones-watchface/src/lib.rs`](https://github.com/lupyuen/barebones-watchface/blob/master/src/lib.rs#L148-L189)


```rust
impl BarebonesWatchFace {

    /// Populate the Time and Date Labels with the time and date
    fn update_date_time(&self, state: &WatchFaceState) -> MynewtResult<()> {
        //  Omitted: Format and set the time label
        ...

        //  Get the short day name and short month name
        let day   = get_day_name(&state.time);
        let month = get_month_name(&state.time);

        //  Format the date as "MON 22 MAY 2020"
        let mut buf = new_string();
        write!(
            &mut buf,           //  Write the formatted text here
            "{} {} {} {}\n\0",  //  Must terminate Rust strings with null
            day,
            state.time.day,
            month,
            state.time.year
        ).expect("date fail");

        //  Set the label
        label::set_text(
            self.date_label, 
            &to_strn(&buf)
        ) ? ;
        Ok(())
    }    
```

## Update Bluetooth Label

Our function `update_bluetooth` refreshes the Bluetooth Label like so: [`barebones-watchface/src/lib.rs`](https://github.com/lupyuen/barebones-watchface/blob/master/src/lib.rs#L191-L223)

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
                    BluetoothState::BLUETOOTH_STATE_ADVERTISING  => "#0000ff",  //  Blue
                    BluetoothState::BLUETOOTH_STATE_DISCONNECTED => "#ff0000",  //  Red
                    BluetoothState::BLUETOOTH_STATE_CONNECTED    => "#00ff00",  //  Green
                };

            //  Format the Bluetooth status
            let mut buf = new_string();
            write!(
                &mut buf,              //  Write the formatted text here
                "{} \u{F293}#\0",      //  LV_SYMBOL_BLUETOOTH. Must terminate Rust strings with null.
                color
            ).expect("bt fail");

            //  Set the label
            label::set_text(
                self.bluetooth_label, 
                &to_strn(&buf)
            ) ? ;
        }
        Ok(())
    }
```

The Bluetooth Label is coloured by `#RGB` Colour Codes. For example, this label...

```
#00ff00 OK#
```

Will show the text `OK` in Green.

_What's `\u{F293}`?_

`\u{F293}` is the Unicode Symbol for the Bluetooth Icon. So when we set a label to...

```
#00ff00 \u{F293}#
```

This means we're displaying the Bluetooth Icon in Green.

## Update Power Label

Lastly our function `update_power` refreshes the Power Label like so: [`barebones-watchface/src/lib.rs`](https://github.com/lupyuen/barebones-watchface/blob/master/src/lib.rs#L225-L265)

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

        //  Format the Power Indicator
        let mut buf = new_string();
        write!(
            &mut buf,                    //  Write the formatted text here
            "{} {}%{}#\nRUST ({}mV)\0",  //  Must terminate Rust strings with null
            color,
            percentage,
            symbol,
            state.millivolts
        ).expect("batt fail");

        //  Set the label
        label::set_text(
            self.power_label, 
            &to_strn(&buf)
        ) ? ; 

        //  Align the label to the top right of the screen
        obj::align(
            self.power_label, screen, 
            obj::LV_ALIGN_IN_TOP_RIGHT, 0, 0
        ) ? ;
        Ok(())
    }
```

`\u{F0E7}` is the Unicode Symbol for the Charging Icon.

# Watch Face Framework in Rust

TODO: Watch Face Framework in [`pinetime-watchface/blob/master/src/lib.rs`](https://github.com/lupyuen/pinetime-watchface/blob/master/src/lib.rs)

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

# Preview a Rust Watch Face

TODO

# Build and Flash a Rust Watch Face

TODO

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