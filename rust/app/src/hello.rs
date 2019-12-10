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

#![no_std]  ////
use druid::widget::{Align, Button, Column, Label, Padding};
use druid::{AppLauncher, LocalizedString, Widget, WindowDesc};

pub fn launch() {
    //  Build a new window
    let main_window = WindowDesc::new(ui_builder);
    let data = 0_u32;
    //  Launch the window
    AppLauncher::with_window(main_window)
        .use_simple_logger()
        .launch(data)
        .expect("launch failed");
}

/// Build the UI for the window. The window state consists of 1 value: `count` of type `u32`.
fn ui_builder() -> impl Widget<u32> {  //  `u32` is the window state
    //  Create a line of text based on a counter value
    let text =
        LocalizedString::new("hello-counter")
        .with_arg(
            "count", 
            |data: &u32, _env| (*data).into()
        );
    //  Create a label widget to display the text
    let label = Label::new(text);
    //  Create a button widget to increment the counter
    //  let button = Button::<u32>::new( ////
    let button = Button::new(
        "increment", 
        |_ctx, data, _env| *data += 1
    );

    //  Create a column for the UI
    let mut col = Column::new();
    //  Add the label and button widgets to the column
    //  col.add_child(label, 1.0); ////
    col.add_child(
        Align::centered(
            Padding::new(5.0, label)
        ),
        1.0
    );
    col.add_child(
        Padding::new(5.0, button), 
        1.0
    );
    col
}
