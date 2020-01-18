// Copyright 2019 The xi-editor Authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

use druid::widget::{Align, Button, Column, Label, Padding};
use druid::{AppLauncher, LocalizedString, Widget, WindowDesc};
use mynewt::{sys::console};

pub fn launch() {
    console::print("Rust launch\n"); console::flush();
    //  Build a new window
    let main_window = WindowDesc::new(ui_builder);
    //  Application state is initially 0
    let data = 0_u32;
    //  Launch the window with the initial application state
    AppLauncher::with_window(main_window)
        .use_simple_logger()
        .launch(data)
        .expect("launch failed");
}

/// Build the UI for the window. The application state consists of 1 value: `count` of type `u32`.
fn ui_builder() -> impl Widget<u32> {  //  `u32` is the application state
    console::print("Rust UI builder\n"); console::flush();
    //  Create a line of text based on a counter value
    let text =
        LocalizedString::new("hello-counter")
        .with_arg(
            "count", 
            //  Closure that will fetch the counter value...
            | data: &u32, _env |  //  Closure will receive the application state and environment
                (*data).into()    //  We return the counter value in the application state
        );
    //  Create a label widget to display the text
    let label = Label::new(text);
    //  Create a button widget to increment the counter
    let button = Button::new(
        "increment",  //  Text to be shown
        //  Closure that will be called when button is tapped...
        | _ctx, data, _env |  //  Closure will receive the context, application state and environment
            *data += 1        //  We increment the counter
    );

    //  Create a column for the UI
    let mut col = Column::new();
    //  Add the label widget to the column, centered with padding
    col.add_child(
        Align::centered(
            Padding::new(5.0, label)
        ),
        1.0
    );
    //  Add the button widget to the column, with padding
    col.add_child(
        Padding::new(5.0, button), 
        1.0
    );
    //  Return the column containing the label and button widgets
    col
}