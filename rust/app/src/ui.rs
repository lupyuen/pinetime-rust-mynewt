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
    //  Create a button widget labelled "increment" to increment the counter
    //  Call on_button_press when pressed
    let button = Button::new("increment", on_button_press);

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

/*  Future update for Visual Rust:
    //  Add the label and button widgets to the column, centered with padding (5 pixels)
    col.add([
        pad!(label, 5.0),
        pad!(button, 5.0),
    ]);
*/

/*
<xml xmlns="http://www.w3.org/1999/xhtml">
  <variables>
    <variable type="" id="mQ/]ot*@*I$hCHerd)Qp">count</variable>
  </variables>
  <block type="on_start" id="/#!!Quw;xx~*kEf.T!,5" x="63" y="37">
    <statement name="STMTS">
      <block type="variables_set" id="CP$4kQNW*^oThdx]%4Xg">
        <field name="VAR" id="mQ/]ot*@*I$hCHerd)Qp" variabletype="">count</field>
        <value name="VALUE">
          <block type="math_number" id="i6fG5z9;FL42h{WK^TzD">
            <field name="NUM">0</field>
          </block>
        </value>
      </block>
    </statement>
  </block>
  <block type="app" id="eRLnZ_Te.^:tJ0FyDL/1" x="62" y="188">
    <mutation items="3"></mutation>
    <value name="ADD0">
      <block type="label" id="DH@$20QRAWK`V4v=z+(#">
        <field name="NAME">my_label</field>
        <field name="PADDING">5</field>
      </block>
    </value>
    <value name="ADD1">
      <block type="button" id="EJgEa}x:M*Rg45ZI)R^%">
        <field name="NAME">my_button</field>
        <field name="PADDING">5</field>
      </block>
    </value>
  </block>
  <block type="on_label_show" id="#~GhsC^=TV$ncR8Qr^_%" x="62" y="338">
    <field name="NAME">my_label</field>
  </block>
  <block type="variables_get" id="C(rju}N`}M/A%i/g=s*b" x="113" y="362">
    <field name="VAR" id="mQ/]ot*@*I$hCHerd)Qp" variabletype="">count</field>
  </block>
  <block type="on_button_press" id="wsA6Lf+*s3SlaC.%DCxe" x="63" y="463">
    <field name="NAME">my_button</field>
    <statement name="NAME">
      <block type="variables_set" id="yK6x[R]EOnHu/[#SS@H0">
        <field name="VAR" id="mQ/]ot*@*I$hCHerd)Qp" variabletype="">count</field>
        <value name="VALUE">
          <block type="math_arithmetic" id="(.X]NW{SO=nI|4+]8@o|">
            <field name="OP">ADD</field>
            <value name="A">
              <shadow type="math_number" id="iZ+(Vd=H._YROPci~.7g">
                <field name="NUM">1</field>
              </shadow>
              <block type="variables_get" id="!BV+h8;zf0$od{fzmLXa">
                <field name="VAR" id="mQ/]ot*@*I$hCHerd)Qp" variabletype="">count</field>
              </block>
            </value>
            <value name="B">
              <shadow type="math_number" id="-K#y+!e]?Azs7{Ho}t66">
                <field name="NUM">1</field>
              </shadow>
            </value>
          </block>
        </value>
      </block>
    </statement>
  </block>
</xml>
*/