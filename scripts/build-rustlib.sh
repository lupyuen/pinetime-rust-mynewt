#!/usr/bin/env bash
#  Build Rust library mylib with macros expanded
set -x -e

#  Extract this module into its own file.
extract_module=send_coap

#  Rust build profile: debug or release
#  rust_build_profile=debug
rust_build_profile=release

#  Rust build options
if [ "$rust_build_profile" == 'release' ]; then
    # Build for release
    rust_build_options=--release 
else
    # Build for debug
    rust_build_options= 
fi

set +e  #  Ignore errors

#  Compile the Rust code with expanded macros.
cargo rustc -v $rust_build_options \
    -- -Z unstable-options --pretty expanded \
    > logs/libapp-expanded.rs

set -e  #  Stop on errors

set +x ; echo ; echo "----- Expanded macros to logs/libapp-expanded.rs" ; set -x

#  Extract the module into its own file.
sed "1,/^mod $extract_module/ d" <logs/libapp-expanded.rs >logs/$extract_module-expanded.rs

set +x ; echo ; echo "----- Extracted module $extract_module to logs/$extract_module-expanded.rs" ; set -x
