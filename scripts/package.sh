#!/usr/bin/env bash
#  Package the repo for release

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

cd ..
set +e
rm pinetime-rust-mynewt.7z
set -e
7z a pinetime-rust-mynewt.7z pinetime-rust-mynewt

set +x  #  Stop echoing all commands.
echo ✅ ◾ ️Done!
