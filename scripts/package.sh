#!/usr/bin/env bash
#  Package the repo for release

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

cd ..
set +e
rm pinetime-mynewt-rust.7z
set -e
7z a pinetime-mynewt-rust.7z pinetime-mynewt-rust

set +x  #  Stop echoing all commands.
echo ✅ ◾ ️Done!
