#!/usr/bin/env bash
#  Install Visual Studio Code Extensions for Ubuntu Linux.  Based on https://code.visualstudio.com/docs/setup/mac

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

#  Install the Task Running Extension which allows us to run tasks by clicking the task in the Task Runner pane.
code --install-extension sanaajani.taskrunnercode --force

#  Install the Cortex Debugger Extension for debugging Blue Pill programs.
code --install-extension marus25.cortex-debug --force

#  Install C++ Intellisense to provide C++ code navigation.
code --install-extension ms-vscode.cpptools --force

#  Install Rust Language Service Extension to provide Rust code navigation.
code --install-extension rust-lang.rust --force

#  Install Better TOML Extension for editing Config.toml in Rust.
code --install-extension bungcip.better-toml --force

set +x  #  Stop echoing all commands.
echo ✅ ◾ ️Done! Please restart Visual Studio Code to activate the extensions
