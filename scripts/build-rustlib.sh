#!/usr/bin/env bash
#  Build Rust library mylib with macros expanded
set -x -e

#  Extract this module into its own file.
extract_module=send_coap

#  Rust build profile: debug or release
#  rust_build_profile=debug
rust_build_profile=release

cortex_m=`ls target/thumbv7m-none-eabi/$rust_build_profile/deps/libcortex_m-*.rlib | head -1`
cstr_core=`ls target/thumbv7m-none-eabi/$rust_build_profile/deps/libcstr_core-*.rlib | head -1`
cty=`ls target/thumbv7m-none-eabi/$rust_build_profile/deps/libcty-*.rlib | head -1`
memchr=`ls target/thumbv7m-none-eabi/$rust_build_profile/deps/libmemchr-*.rlib | head -1`

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
--out-dir target/thumbv7m-none-eabi/$rust_build_profile/deps \
--target thumbv7m-none-eabi \
-C incremental=target/thumbv7m-none-eabi/$rust_build_profile/incremental \
-L dependency=target/thumbv7m-none-eabi/$rust_build_profile/deps \
-L dependency=target/$rust_build_profile/deps \
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
