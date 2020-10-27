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

# Hand-Drawn Watch Face

Let's make a Hand-Drawn Watch Face like the pic above. The Watch Face consists of 4 hand-drawn images that will be a-changin' with the times...

![Watch Face Images](https://lupyuen.github.io/images/handdrawn-labels.png)

We start by zooming to the top left...

_How shall we load the top left image... With the first digit of the hour?_

In 3 steps...

1. We __compute the first digit of the hour__. So if the hour is `23`, the first digit is `2`.

1. We __fetch the hand-drawn bitmap__ for the digit, i.e. `2`

1. We __load the bitmap__ into the top left image

Here's how we do it in Rust: [`src/lib.rs`](https://github.com/lupyuen/handdrawn-watchface/blob/master/src/lib.rs#L147-L154)

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

Yep it looks daunting... These are the 3 hardest lines of code in our Watch Face!

But let's step through each line bit by bit and uncover the mystique of Rust.

_(I promise you... The rest of the code will be much simpler!)_

![First digit of hour](https://lupyuen.github.io/images/handdrawn-labels2.png)

# Compute the hour digit

_Given an hour like `23`, compute the first digit i.e. `2`. How shall we do this in Rust?_

Here's how: [`src/lib.rs`](https://github.com/lupyuen/handdrawn-watchface/blob/master/src/lib.rs#L148)

```rust
//  Compute the first digit of the hour
let digit = state.time.hour / 10;
```

We interpret `state.time.hour` like a nested fairy tale...

> Once upon a time, there was an object named `state`... That contained an object named `time`... That contained a field named `hour`... The current hour of the day (from 0 to 23)

_(We'll learn the backstory of `state` in a while... And objects in Rust are named Structs)_

Here we divide the `hour` by 10 (and truncate the result) to get the first digit. 

So if `hour` is `23`, then `digit` gets set to `2`.

_The Type of `digit` is missing. Is Rust a Typeless Language like JavaScript and Python?_

Rust is a Statically Typed Language like C... All Variables have known Types during compilation. The Rust Compiler infers the Types for us.

Sounds spooky, but the Rust Compiler goes all Sherlock Holmes on our code to deduce our Variable Types...

> I see what you did there... `digit` doesn't have a known type! Hmmm `hour` is a `u8`... 8-bit unsigned integer... After integer division we get another `u8`... So I deduce that `digit` is also `u8`!

To see this Sherlock smartness in action, mouse over `digit` in VSCode...

![Type Inference](https://lupyuen.github.io/images/handdrawn-type.png)

We see that `u8` pops up for `digit`... The Rust Compiler has inferred that `digit` is an 8-bit unsigned integer. (Like `uint8_t` in C)

Now that we have the first digit of the hour, let's fetch the hand-drawn bitmap for the digit.

# Fetch the digit bitmap

We have `digit` set to the first digit of the hour (`0`, `1` or `2`). Here's how we fetch the bitmap for `digit`: [`src/lib.rs`](https://github.com/lupyuen/handdrawn-watchface/blob/master/src/lib.rs#L149-L150)

```rust
//  Fetch the bitmap for the digit as a constant pointer
let bitmap: *const img::lv_img_dsc_t =    
    &self.bitmaps[digit as usize];
```

This looks... Strange. Let's break it down...

_What's `self.bitmaps`?_

`self.bitmaps` is an Array of 10 hand-drawn bitmaps, indexed from 0 to 9...

![Bitmaps in Self](https://lupyuen.github.io/images/handdrawn-bitmaps.png)

_(We'll reveal our `self` later... Hint: We're inside an object!)_

Thus to fetch the bitmap that corresponds to a digit, we do this...

```rust
let bitmap = self.bitmaps[digit];
```

_What's `usize`?_

Rust is extremely uptight about Types... Including the index for our Array `self.bitmaps`.

In Rust, Arrays are indexed by integers of the `usize` Type. (Somewhat like `size_t` in C)

Hence we need to convert (or cast) `digit` as `usize` like so...

```rust
let bitmap = self.bitmaps[digit as usize];
```

_What's with the "`&`"?_

We're not gonna pass around copies of the bitmap. (Because that would be awfully inefficient in a smart watch)

Instead we're passing a __Reference__ to the bitmap. (Somewhat like a Pointer in C)

To get the Reference, we insert "`&`" like so...

```rust
let bitmap = &self.bitmaps[digit as usize];
```

_What about `*const img::lv_img_dsc_t`?_

Remember we set `bitmap` like so...

```rust
let bitmap: *const img::lv_img_dsc_t = ...
```

This means we're casting the `bitmap` Reference to a weird Type...

```rust
*const img::lv_img_dsc_t
```

This is a tough nugget to crack (unlike McNuggets)... But we'll learn its true meaning in a while.

_(Hint: It's a Pointer (yep like C). And no we're not shopping for French luxury goods.)_

# Set the image source

Our story thus far: We have `bitmap` set to the hand-drawn digit (i.e. the first digit of the hour)...

![Bitmap](https://lupyuen.github.io/images/handdrawn-bitmaps2.png)

Here's how we set the Top Left Image on our Watch Face to the bitmap: [`src/lib.rs`](https://github.com/lupyuen/handdrawn-watchface/blob/master/src/lib.rs#L151-L154)

```rust
img::set_src(                //  Set the source...
    self.top_left_image,     //  Of the the top left image...
    bitmap as *const c_void  //  To the digit bitmap
) ? ;                        //  Quit in case of error
```

Let's savour this chunk by chunk ([the old chunky way](https://twitter.com/MisterTechBlog/status/1320230875791945729?s=20))...

_What's `self.top_left_image`?_

We have 4 images inside `self`...

![Images in Self](https://lupyuen.github.io/images/handdrawn-images.png)

So `self.top_left_image` refers to the Top Left Image on our Watch Face.

_Why the studs in `img::set_src`?_

Rust is fussy about keeping things neat, tidy and modular.

"`img::`" refers to the Module named `img`.  When we write...

```rust
img::set_src( ... );
```

It means we're calling the function `set_src` defined in the Module `img`. (Similar to namespaces in C++)

_Are we done yet?_

Let's recap...

1.  We have a function `set_src` (from Module `img`) that will set the bitmap for an image

1.  We have the Top Left image: `self.top_left_image`

1.  We have a Reference to the digit bitmap: `bitmap`

Thus to set the bitmap for the Top Left Image we may write...

```rust
img::set_src(             //  Set the source...
    self.top_left_image,  //  Of the the top left image...
    bitmap                //  To the digit bitmap
) ? ;                     //  What's this???
```

_Why the questionable "`?`" at the end?_

"`?`" is the __Try Operator__ in Rust. It checks for errors.

If `set_src` returns an error, Rust stops executing the current function. And returns the error immediately to the caller.

(This is similar to `try ... catch ... throw` in JavaScript and Python)

_Wait! We haven't covered these two sus chunks with `*const`..._

```rust
//  Cast the bitmap as a constant pointer
let bitmap: *const img::lv_img_dsc_t = ... ;

//  Set the bitmap pointer as the image source
img::set_src( ... , bitmap as *const c_void ) ? ;
```

Yep they look highly sus... Is this really Embedded Rust?

Get ready for the shocking reveal...

# It was C all along

Earlier we saw two highly sus chunks of code: [`src/lib.rs`](https://github.com/lupyuen/handdrawn-watchface/blob/master/src/lib.rs#L149-L154)

![C Pointers](https://lupyuen.github.io/images/handdrawn-c.png)

_What's `*const`?_

`*const` is a __Raw Pointer__ in Rust.

It works like a Pointer in C... It's an address that points to an object in memory.

_We already have References in Rust (via the "`&`" operator). Why do we need Raw Pointers?_

Time to fess up...

1.  `bitmap` is a __Raw Pointer to a C Object__

1.  `set_src` is a __C Function__

😮 _But why??? Can't we do this in Rust instead of C?_

That's the beauty... Rust and C are interoprapereraberble...

Ahem... __Rust and C Functions can call each other!__

Both Rust and C are __low-level languages__. It's perfectly OK to call C Functions from Rust (and the other way around).

That's why some folks are coding in Rust instead of C for creating Embedded Gadgets.

_What C Functions are we calling?_

We're calling C Functions from the open-source [__LVGL Graphics Library__](https://lvgl.io/). It's great for creating Graphical User Interfaces on Embedded Devices with images, text labels, buttons, ...

The LVGL Library is used by many firmware developers to create Watch Faces for PineTime. We're calling the LVGL Library too... But from Rust.

Now our sus code...

```rust
//  Cast the bitmap as a constant pointer
let bitmap: *const img::lv_img_dsc_t = ... ;

//  Set the bitmap pointer as the image source
img::set_src( ... , bitmap as *const c_void ) ? ;
```

Makes more sense when we realise...

1. `img::lv_img_dsc_t` is a __C Struct__ from the LVGL Library 

    [More details](https://docs.lvgl.io/latest/en/html/overview/image.html?highlight=lv_img_dsc_t)

1. `img::set_src` is a __C Function__ from the LVGL Library 

    [More details](https://docs.lvgl.io/latest/en/html/widgets/img.html?highlight=lv_img_set_src#_CPPv414lv_img_set_srcP8lv_obj_tPKv)

Today we won't talk much about casting C Pointers in Rust and passing them to C Functions. More details may be found in _"The Rust Programming Languague"_ book...

[Raw Pointers in Rust](https://doc.rust-lang.org/book/ch19-01-unsafe-rust.html)

# Update the Watch Face

Remember our 3 toughest lines of Rust code... For updating the top left image on our Watch Face?

Let's zoom out and watch how we use them: [`src/lib.rs`](https://github.com/lupyuen/handdrawn-watchface/blob/master/src/lib.rs#L141-L185)

![Update Method](https://lupyuen.github.io/images/handdrawn-method.png)

Now we zoom in to the top... Where we declare the `update` method: [`src/lib.rs`](https://github.com/lupyuen/handdrawn-watchface/blob/master/src/lib.rs#L141-L145)

## Declare the method

![Declare the Update Method](https://lupyuen.github.io/images/handdrawn-method2.png)

In Rust we declare a function (or a method) by writing...

```rust
fn ... -> ... {
```

(Similar to `function` in JavaScript and `def` in Python... But looks more mathematical)

_What's `update`?_

`update` is the method that's called to update the Watch Face every minute.

It accepts 2 parameters...

1.  `&mut self`

    This refers to our Watch Face object and the variables inside: `bitmaps`, `top_left_label`, ...
    
    (Similar to `self` in Python or `this` in JavaScript and C++)

    `&mut` means that the `self` object is passed as a Reference (instead of a copy), and that the `self` object is __Mutable__ (can be modified).

1.  `state: &WatchFaceState`

    This says that `state` is a Reference to a `WatchFaceState`, an object that contains the values that will be rendered to our Watch Face.

    Through this `state`, our caller passes the time of the day as `hour` (0 to 23) and `minute` (0 to 59).

    We have seen `state.hour` earlier... We used it to render the hour of the day.

## Return the result

_What's `MynewtResult` in the declaration above?_

Remember the Try Operator "`?`" for checking errors returned by Rust Functions?

This works only for functions and methods that return the `Result` Type. Thus we follow the Rust error-checking convention and return a kind of `Result` named `MynewtResult`.

(Mynewt refers to the [Apache Mynewt](http://mynewt.apache.org/) embedded operating system that we're running on PineTime)

Here's how we return the result in our `update` method: [`src/lib.rs`](https://github.com/lupyuen/handdrawn-watchface/blob/master/src/lib.rs#L183-L185)

![Return the result](https://lupyuen.github.io/images/handdrawn-method3.png)

`Ok( ... )` tells the caller that the result is OK, no errors.

We write `Ok(())` when we have no result value to return.

(Think of `()` in Rust like `void` in C)

Note that we omit the trailing semicolon "`;`" when returning the result.

FYI: We return errors with `Err( ... )`

## The other images

_We've seen `top_left_image`... What about the other images: `top_right_image`, `bottom_left_image` and `bottom_right_image`?_

![Images in Self](https://lupyuen.github.io/images/handdrawn-images.png)

The code to update the other 3 images looks similar. Check out the rest of the `update` method here: [`src/lib.rs`](https://github.com/lupyuen/handdrawn-watchface/blob/master/src/lib.rs#L156-L181)

Congratulations! We're done with the `update` method... That's half of the Watch Face code!

Now we move on to the `new` method... For creating the Watch Face.

# Create the Watch Face

Our Watch Face has plenty of goodies inside (like a Kinder Surprise)...

1.  `bitmaps`: The hand-drawn bitmaps of the digits 0 to 9

1.  `top_left_image`, `top_right_image`, `bottom_left_image` and `bottom_right_image`: The 4 images on our Watch Face

We have used them earlier but...

_How are they created?_

TODO

## Load the bitmaps

TODO

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

## Create the images

TODO

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

## Wrap them all up

TODO

Create watch face: [`src/lib.rs`](https://github.com/lupyuen/handdrawn-watchface/blob/master/src/lib.rs#L76-L136)

```rust
/// Create the Watch Face
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

You know how some Millennials like to finish off respectfully with _"Ok boomer"?_

It's the same in Rust. We finish off a function and return `watch_face` by writing at the end...

```rust
    //  Return the watch face. No semicolon!
    Ok(watch_face)
}   //  End of function
```

When returning a value from a function, we omit the semicolon after `Ok`. (Because `Ok(boomer);` sounds odd)

# WebAssembly Rust

TODO

# Embedded Rust

TODO

![Your Own Watch Face](https://lupyuen.github.io/images/handdrawn-watchfaces.jpg)

# What's Next

TODO

Lemme know if you're keen to help! :-)

In the meantime, please go right ahead to create your own Watch Faces and publish them on crates.io... So that all PineTime Owners can share, learn and enjoy :-)

[Check out my PineTime articles](https://lupyuen.github.io)

[RSS Feed](https://lupyuen.github.io/rss.xml)

_Got a question, comment or suggestion? Create an Issue or submit a Pull Request here..._

[`github.com/lupyuen/pinetime-rust-mynewt/rust/app/src/handdrawn.md`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/handdrawn.md)
