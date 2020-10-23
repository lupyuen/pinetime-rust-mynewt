# Draw your own PineTime Watch Face... From WebAssembly to Embedded Rust

![PineTime Smart Watch with Hand-Drawn Watch Face](https://lupyuen.github.io/images/handdrawn-title.png)

_We can build Watch Faces for [PineTime Smart Watch](https://wiki.pine64.org/index.php/PineTime) in C... Right?_

# Rust Watch Face

TODO

https://github.com/lupyuen/handdrawn-watchface/blob/master/src/lib.rs#L142-L150

```rust
//  Update the top left image with the first digit of the hour
let digit = state.time.hour / 10;             //  Compute the first digit of the hour
let bitmap: *mut img::lv_img_dsc_t =          //  Fetch the bitmap for the digit...
    &mut self.bitmaps[digit as usize];        //  As a mutable reference
img::set_src(                                 //  Set the source...
    self.top_left_image,                      //  Of the the top left image...
    bitmap as *const c_void                   //  To the bitmap digit
) ? ;
```

# WebAssembly Rust

TODO

# Embedded Rust

TODO

# What's Next

Lemme know if you're keen to help! :-)

In the meantime, please go right ahead to create your own Watch Faces and publish them on crates.io... So that all PineTime Owners can share, learn and enjoy :-)

[Check out my PineTime articles](https://lupyuen.github.io)

[RSS Feed](https://lupyuen.github.io/rss.xml)

_Got a question, comment or suggestion? Create an Issue or submit a Pull Request here..._

[`github.com/lupyuen/pinetime-rust-mynewt/rust/app/src/handdrawn.md`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/handdrawn.md)
