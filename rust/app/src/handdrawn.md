# Draw your own PineTime Watch Face... From WebAssembly to Embedded Rust

![PineTime Smart Watch with Hand-Drawn Watch Face](https://lupyuen.github.io/images/handdrawn-title.png)

_Q: We're in the middle of the pandemic... Is there something fun and useful that we can learn on our own?_

A: Try learning __Embedded Programming__!

_Q: I need to buy an Arduino or a Microcontroller Board? And have it shipped sloooowly to me at exorbitant prices?_

A: Nope! Today we can build and test Embedded Programs in a Web Browser... __Without any Embedded Hardware__! Made possible with awesome WebAssembly tools.

_Q: But a Web Browser Simulator doesn't behave like Real Hardware right?_

A: We have a real [__PineTime Smart Watch__](https://wiki.pine64.org/index.php/PineTime) that's connected to the web for everyone to test our Embedded Programs... Try it for yourself and compare!

_Q: People say that Embedded Programming is hard... Needs strange languages like C_

A: Not any more! Today we'll code with __Rust__, a friendly, modern language. (And less frustating for new coders)

_Q: Great! But my computer is kinda old, slow and weak... Do I need a powerful Linux desktop?_

A: Any __Linux, macOS AND Windows__ computer works great for coding in Embedded Rust and WebAssembly... Even a Raspberry Pi!

If you prefer zero setup, we can build our Embedded Rust and WebAssembly programs __in the Cloud__! (Provided free of change by GitHub Actions and GitLab CI)

It feels strange... But building and testing Embedded Programs will work on a __Mobile Web Browser__!

_Q: Fantastic! Can't wait to build my very first Blinking LED program!_

A: Well it's 2020, and we have progressed waaaay beyond Blinking LEDs ;-)

Today we'll learn to build a __Smart Watch Face__ in Rust. We'll be coding for a Smart Watch with __Colour Touchscreen, Bluetooth Networking__ and __Real Time Clock__... Just like the expensive watches by A\*\*\*e and S\*\*\*\*\*g!

As promised, our Watch Face will run in a Web Browser, so it will be easy to test and troubleshoot.

And when you're done... Please flash your Watch Face to our __Remote PineTime__ over the web. Show the world your embedded creation... Running on a real watch!

_Q: But what's the catch?_

None really. Now's the perfect time to __Learn and Experiment with Embedded Programming__... At our own pace, with whatever materials we have.

Read on and join me for the learning adventure! :-)

# Rust Watch Face

TODO

Let's start with the 3 hardest lines of code in our Watch Face: [`lib.rs`](https://github.com/lupyuen/handdrawn-watchface/blob/master/src/lib.rs#L142-L150)

_(I promise you... The rest of the code will be much simpler)_

```rust
//  Update the top left image with the first digit of the hour

//  Compute the first digit of the hour
let digit = state.time.hour / 10;  

//  Fetch the bitmap for the digit as a constant pointer
let bitmap: *const img::lv_img_dsc_t =    
    &self.bitmaps[digit as usize];

img::set_src(                //  Set the source...
    self.top_left_image,     //  Of the the top left image...
    bitmap as *const c_void  //  To the digit bitmap
) ? ;                        //  Quit in case of error
```

Compute the digit...

```rust
//  Compute the first digit of the hour
let digit = state.time.hour / 10;
```

We interpret `state.time.hour` like a nested fairy tale...

> Once upon a time, there was an object named `state`... That contained an object named `time`... That contained a field named `hour`... The current hour of the day (from 0 to 23)

(We'll learn the backstory of `state` in a while)

Fetch the bitmap...

```rust
//  Fetch the bitmap for the digit as a constant pointer
let bitmap: *const img::lv_img_dsc_t =    
    &self.bitmaps[digit as usize];
```

Set the image source...

```rust
img::set_src(                //  Set the source...
    self.top_left_image,     //  Of the the top left image...
    bitmap as *const c_void  //  To the digit bitmap
) ? ;                        //  Quit in case of error
```

`self` and `state` come from the method declaration: [`lib.rs`](https://github.com/lupyuen/handdrawn-watchface/blob/master/src/lib.rs#L141-L181)

```rust
/// Update the widgets in the Watch Face with the current time
fn update(&mut self, state: &WatchFaceState) -> MynewtResult<()> {
    //  Update the top left image with the first digit of the hour
    let digit = state.time.hour / 10;      //  Compute the first digit of the hour
    let bitmap: *const img::lv_img_dsc_t = //  Fetch the bitmap for the digit...
        &self.bitmaps[digit as usize];     //  As a constant pointer
    img::set_src(                          //  Set the source...
        self.top_left_image,               //  Of the the top left image...
        bitmap as *const c_void            //  To the digit bitmap
    ) ? ;
    ...
    //  Omitted: Update the top right, bottom left and bottom right images, 
    ... 
    //  Return OK
    Ok(())
}
```

Create watch face: [`lib.rs`](https://github.com/lupyuen/handdrawn-watchface/blob/master/src/lib.rs#L76-L136)

```rust
/// Create the widgets for the Watch Face
fn new() -> MynewtResult<Self> {
    //  Get the active screen
    let screen = watchface::get_active_screen();

    //  Compose the image header
    let mut header = img::lv_img_header_t::default();
    header.set_cf(img::LV_IMG_CF_TRUE_COLOR);  //  Color Format
    header.set_w(IMAGE_WIDTH);                 //  Width
    header.set_h(IMAGE_HEIGHT);                //  Height

    //  Compute the image size
    let data_size = IMAGE_WIDTH * IMAGE_HEIGHT * BYTES_PER_PIXEL;
```

Create widgets...

```rust
    //  Create the widgets
    let watch_face = Self {
        //  Create the top left image
        top_left_image: {
            let image = img::create(screen, ptr::null()) ? ;  //  `?` will terminate the function in case of error
            obj::set_pos(image, 40, 20) ? ;  //  Set image position to top left
            image                            //  Return the image as top_left_image
        },

        //  Omitted: Create the top right image
        top_right_image: { ... },

        //  Omitted: Create the bottom left image
        bottom_left_image: { ... },

        //  Omitted: Create the bottom right image
        bottom_right_image: { ... },

        //  Omitted: Load the bitmaps
        bitmaps: [ ... ],
    };
    //  Return the watch face
    Ok(watch_face)
}
```

Top left image...

```rust
top_left_image: {
    //  Create the top left image
    //  `?` will terminate the function in case of error
    let image = img::create(screen, ptr::null()) ? ; 

    //  Set image position to top left
    obj::set_pos(image, 40, 20) ? ;  

    //  Return the image as top_left_image
    image                            
},
```

Create top right, bottom left and bottom right images...

```rust
//  Create the top right image
top_right_image: {
    let image = img::create(screen, ptr::null()) ? ;
    obj::set_pos(image, 120, 20) ? ;  //  Set image position to top right
    image                             //  Return the image as top_right_image
},

//  Create the bottom left image
bottom_left_image: {
    let image = img::create(screen, ptr::null()) ? ;
    obj::set_pos(image, 40, 120) ? ;  //  Set image position to bottom left
    image                             //  Return the image as bottom_left_image
},

//  Create the bottom right image
bottom_right_image: {
    let image = img::create(screen, ptr::null()) ? ;
    obj::set_pos(image, 120, 120) ? ;  //  Set image position to bottom right
    image                              //  Return the image as bottom_right_image
},
```

Load the bitmaps...

```rust
//  Load the bitmaps
bitmaps: [
    img::lv_img_dsc_t { data: include_bytes!("../bitmaps/0.bin") as *const u8, header, data_size },
    img::lv_img_dsc_t { data: include_bytes!("../bitmaps/1.bin") as *const u8, header, data_size },
    img::lv_img_dsc_t { data: include_bytes!("../bitmaps/2.bin") as *const u8, header, data_size },
    //  Omitted: Bitmaps 3 to 8
    img::lv_img_dsc_t { data: include_bytes!("../bitmaps/9.bin") as *const u8, header, data_size },
]
```

# WebAssembly Rust

TODO

# Embedded Rust

TODO

# What's Next

TODO

Lemme know if you're keen to help! :-)

In the meantime, please go right ahead to create your own Watch Faces and publish them on crates.io... So that all PineTime Owners can share, learn and enjoy :-)

[Check out my PineTime articles](https://lupyuen.github.io)

[RSS Feed](https://lupyuen.github.io/rss.xml)

_Got a question, comment or suggestion? Create an Issue or submit a Pull Request here..._

[`github.com/lupyuen/pinetime-rust-mynewt/rust/app/src/handdrawn.md`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/handdrawn.md)
