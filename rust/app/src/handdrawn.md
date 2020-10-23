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

If you prefer zero setup, we can build our Embedded Rust and WebAssembly programs __in the Cloud__! (Provided free of change by GitHub Actions and GitHub CI)

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
