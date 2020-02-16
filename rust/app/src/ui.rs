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

use druid::{
    AppLauncher, Data, EventCtx, LocalizedString, Widget, WindowDesc,
    widget::{
        Align, Button, Column, Label, Padding,
    },
    argvalue::ArgValue,
    env::Env,
};
use mynewt::sys::console;

/// The Application State consists of 1 value: `count` of type `u32` (32-bit unsigned int)
#[derive(Clone, Data, Default)]
struct State {
    /// Counter value in our Application State
    count: u32,
}

/// Launch the UI application
pub fn launch() {
    console::print("Rust launch\n"); console::flush();
    //  Build a new window
    let main_window = WindowDesc::new(ui_builder);
    //  Application state is initially 0
    let state = State::default();
    //  Launch the window with the initial application state
    AppLauncher::with_window(main_window)
        .use_simple_logger()
        .launch(state)
        .expect("launch failed");
}

/// Build the UI for the window
fn ui_builder() -> impl Widget<State> {  //  `State` is the Application State
    console::print("Rust UI builder\n"); console::flush();
    //  Create a line of text based on a counter value
    let text = LocalizedString::new("hello-counter")
        .with_arg("count", on_label_show);  //  Call on_label_show to get label
    //  Create a label widget to display the text
    let label = Label::new(text);
    //  Create a button widget to increment the counter    
    let button = Button::new("UI App", on_button_press);  //  Call on_button_press when pressed

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

///  Callback function that will be called to create the formatted text for the label
fn on_label_show(state: &State, _env: &Env) -> ArgValue {
    //  We return the counter, converted into text
    let count = state.count;  //  Fetch the counter from the application state
    count.into()              //  Convert counter into text
}

///  Callback function that will be called when the button is tapped
fn on_button_press(_ctx: &mut EventCtx<State>, state: &mut State, _env: &Env) {
    //  We increment the counter
    state.count += 1  //  Changes the application state
}

/* To Handle MynewtResult:
///  Callback function that will be called to create the formatted text for the label
type LabelFn = fn(state: &State, env: &Env) -> ArgValue;
type LabelMynewtFn = fn(state: &State, env: &Env) -> MynewtResult<ArgValue>;

///  Callback function that will be called when the button is tapped
type ButtonFn = fn(ctx: &mut EventCtx<State>, state: &mut State, env: &Env);
type ButtonMynewtFn = fn(ctx: &mut EventCtx<State>, state: &mut State, env: &Env) -> MynewtResult<()>;

/// Cast `LabelMynewtFn` to `LabelFn`
impl From<LabelMynewtFn> for LabelFn {
    /// Cast `LabelMynewtFn` to `LabelFn`
    fn from(err: LabelMynewtFn) -> Self {
        on_label_show
    }
}

/// Cast `ButtonMynewtFn` to `ButtonFn`
impl From<ButtonMynewtFn> for ButtonFn {
    /// Cast `ButtonMynewtFn` to `ButtonFn`
    fn from(err: ButtonMynewtFn) -> Self {
        on_button_press
    }
}

/// TODO: Placeholders
fn on_label_show(state: &State, env: &Env) -> ArgValue {
    let result = on_my_label_show(state, env);
    match result {
        Ok(argValue) => argValue,
        Err() => 0  //  TODO
    }
}

/// TODO: Placeholders
fn on_button_press(ctx: &mut EventCtx<State>, state: &mut State, env: &Env) {
    let result = on_my_button_press(ctx, state, env);
    match result {
        Ok() => (),
        Err() => ()  //  TODO
    }
}
*/

/*  Future update for Visual Rust:
    //  Add the label and button widgets to the column, centered with padding (5 pixels)
    col.add([
        pad!(label, 5.0),
        pad!(button, 5.0),
    ]);
*/