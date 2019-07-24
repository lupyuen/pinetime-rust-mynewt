::  Install Visual Studio Code Extensions for Windows. %1 is the path of code.exe

::  Install the Task Running Extension which allows us to run tasks by clicking the task in the Task Runner pane.
"%1" --install-extension sanaajani.taskrunnercode --force

::  Install the Cortex Debugger Extension for debugging Blue Pill programs.
"%1" --install-extension marus25.cortex-debug --force

::  Install C++ Intellisense to provide C++ code navigation.
"%1" --install-extension ms-vscode.cpptools --force

::  Install Rust Language Service Extension to provide Rust code navigation.
"%1" --install-extension rust-lang.rust --force

::  Install Better TOML Extension for editing Config.toml in Rust.
"%1" --install-extension bungcip.better-toml --force

echo ✅ ◾ ️Done! Please restart Visual Studio Code to activate the extensions
