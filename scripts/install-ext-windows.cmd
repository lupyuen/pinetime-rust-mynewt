::  Install Visual Studio Code Extensions for Windows.

::  Install the Task Running Extension which allows us to run tasks by clicking the task in the Task Runner pane.
call code --install-extension sanaajani.taskrunnercode --force

::  Install the Cortex Debugger Extension for debugging Blue Pill programs.
call code --install-extension marus25.cortex-debug --force

::  Install C++ Intellisense to provide C++ code navigation.
call code --install-extension ms-vscode.cpptools --force

::  Install Rust Language Service Extension to provide Rust code navigation.
call code --install-extension rust-lang.rust --force

::  Install Better TOML Extension for editing Config.toml in Rust.
call code --install-extension bungcip.better-toml --force

echo ✅ ◾ ️Done! Please restart Visual Studio Code to activate the extensions
