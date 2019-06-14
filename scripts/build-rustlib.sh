#!/usr/bin/env bash
#  Build Rust library mylib with macros expanded

#  Extract this module into its own file.
extract_module=send_coap

set -x -e
cortex_m=`ls target/thumbv7m-none-eabi/debug/deps/libcortex_m-*.rlib | head -1`
cstr_core=`ls target/thumbv7m-none-eabi/debug/deps/libcstr_core-*.rlib | head -1`
cty=`ls target/thumbv7m-none-eabi/debug/deps/libcty-*.rlib | head -1`
memchr=`ls target/thumbv7m-none-eabi/debug/deps/libmemchr-*.rlib | head -1`

#  Compile with macros expanded.
set +e  #  Ignore errors
rustc \
--edition=2018 \
--crate-name mylib src/lib.rs \
--color always \
--crate-type lib \
--emit=dep-info,metadata,link \
-C panic=abort \
-C debuginfo=2 \
-C metadata=ac95891f38e7979c \
-C extra-filename=-ac95891f38e7979c \
--out-dir target/thumbv7m-none-eabi/debug/deps \
--target thumbv7m-none-eabi \
-C incremental=target/thumbv7m-none-eabi/debug/incremental \
-L dependency=target/thumbv7m-none-eabi/debug/deps \
-L dependency=target/debug/deps \
--extern cortex_m=$cortex_m \
--extern cstr_core=$cstr_core \
--extern cty=$cty \
--extern memchr=$memchr \
-C link-arg=-Tlink.x \
-Z unstable-options --pretty expanded \
> logs/libmylib-expanded.rs
set -e  #  Stop on errors

set +x ; echo ; echo "----- Expanded macros to logs/libmylib-expanded.rs" ; set -x

#  Extract the module into its own file.
sed "1,/^mod $extract_module/ d" <logs/libmylib-expanded.rs >logs/$extract_module-expanded.rs

set +x ; echo ; echo "----- Extracted module $extract_module to logs/$extract_module-expanded.rs" ; set -x
