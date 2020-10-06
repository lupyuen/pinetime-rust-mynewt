::  Windows script to build Rust application hosted on Mynewt OS

set mynewt_build_app=nrf52_my_sensor
set rust_build_target=thumbv7em-none-eabihf
set launch_config=launch-nrf52.json

@echo ----- Building Rust app and Mynewt OS for %rust_build_target% / %mynewt_build_app%...

::  Rust build profile: debug or release
@set rust_build_profile=debug
::  @set rust_build_profile=release

::  Add toolchain to PATH.
::  @set PATH=%PATH%;%cd%\xPack\RISC-V Embedded GCC\8.2.0-3.1\bin

::  Location of the compiled ROM image.  We will remove this to force relinking the Rust app with Mynewt OS.
@set app_build=%cd%\bin\targets\%mynewt_build_app%\app\apps\my_sensor_app\my_sensor_app.elf

::  Location of the compiled Rust app and external libraries.  The Rust compiler generates a *.rlib archive for the Rust app and each external Rust library here.
@set rust_build_dir=%cd%\target\%rust_build_target%\%rust_build_profile%

::  Location of the libs\rust_app stub library built by Mynewt.  We will replace this stub by the Rust app and external libraries.
@set rust_app_dir=%cd%\bin\targets\%mynewt_build_app%\app\libs\rust_app
@set rust_app_dest=%rust_app_dir%\libs_rust_app.a

::  Location of the libs\rust_libcore stub library built by Mynewt.  We will replace this stub by the Rust core library libcore.
@set rust_libcore_dir=%cd%\bin\targets\%mynewt_build_app%\app\libs\rust_libcore
@set rust_libcore_dest=%rust_libcore_dir%\libs_rust_libcore.a

::  Rust build options
@set rust_build_options=--target %rust_build_target%
@if %rust_build_profile%==release (
    ::  Build for release
    set rust_build_options=--release %rust_build_options%
::  ) else (
    ::  Build for debug: No change in options
)

::  Set build commands for the architecture
@if %rust_build_target%==riscv32imac-unknown-none-elf (
    ::  RISC-V build commands
    set ar_cmd=riscv-none-embed-ar
    set readelf_cmd=riscv-none-embed-readelf
    set objdump_cmd=riscv-none-embed-objdump
) else (
    ::  Arm build commands
    set ar_cmd=arm-none-eabi-ar
    set readelf_cmd=arm-none-eabi-readelf
    set objdump_cmd=arm-none-eabi-objdump
)

@copy /y .vscode\%launch_config% .vscode\launch.json >nul:

::  If this is the very first build, do the Mynewt build to generate the rust_app and rust_libcore stubs.  This build will not link successfully but it's OK.
@if not exist %rust_app_dest% (
    @echo ----- Build Mynewt stubs for Rust app and Rust libcore (ignore error)
    newt\newt.exe build %mynewt_build_app%
)

::  Delete the compiled ROM image to force the Mynewt build to relink the Rust app with Mynewt OS.
@if exist %app_build% (
    @del %app_build%
    @if errorlevel 1 goto :EOF
)

::  Delete the compiled Rust app to force the Rust build to relink the Rust app.  Sometimes there are multiple copies of the compiled app, this deletes all copies.
@for %%f in (%rust_build_dir%\libapp.a) do @del %%f

::  Expand Rust macros for troubleshooting: logs/libmynewt-expanded.rs and libapp-expanded.rs
::  @pushd rust\mynewt && cargo rustc %rust_build_options% -- -Z unstable-options --pretty expanded > ..\..\logs\libmynewt-expanded.rs && popd
::  @pushd rust\app    && cargo rustc %rust_build_options% -- -Z unstable-options --pretty expanded > ..\..\logs\libapp-expanded.rs    && popd

::  Build the Rust app in "src" folder.
@echo ----- Build Rust app
cargo build %rust_build_options%
@if errorlevel 1 goto :EOF

::  Export the metadata for the Rust build.
@cargo metadata --format-version 1 >logs\libapp.json
@if errorlevel 1 goto :EOF

::  Create rustlib, the library that contains the compiled Rust app and its dependencies (except libcore).  Create in temp folder named "tmprustlib"
@echo ----- Consolidate Rust app and crates
@if exist tmprustlib (
    @rd /q /s tmprustlib
    @if errorlevel 1 goto :EOF
)
@if not exist tmprustlib (
    @mkdir tmprustlib
    @if errorlevel 1 goto :EOF
)
@pushd tmprustlib
@if errorlevel 1 goto :EOF

::  Extract the object (*.o) files in the compiled Rust output (*.rlib).
@for %%f in (%rust_build_dir%\libapp.a) do @%ar_cmd% x %%f
@if errorlevel 1 goto :EOF

::  Archive the object (*.o) files into rustlib.a.
::  @echo "%ar_cmd% r rustlib.a *.o"
@%ar_cmd% r rustlib.a *.o >nul:
@if errorlevel 1 goto :EOF

::  Overwrite libs_rust_app.a in the Mynewt build by rustlib.a.  libs_rust_app.a was originally created from libs\rust_app.
@if not exist %rust_app_dir% (
    @mkdir -p %rust_app_dir%
    @if errorlevel 1 goto :EOF
)
copy %cd%\rustlib.a %rust_app_dest% >nul:
@if errorlevel 1 goto :EOF

::  Update the timestamp on libs_rust_app.a so that Mynewt build won't overwrite the Rust app we have copied.
@%ar_cmd% s %rust_app_dest%
@if errorlevel 1 goto :EOF

::  Dump the ELF and disassembly for the compiled Rust application and libraries (except libcore)
@%objdump_cmd% -t -S            --line-numbers --wide rustlib.a >..\logs\rustlib.S 2>&1
@%objdump_cmd% -t -S --demangle --line-numbers --wide rustlib.a >..\logs\rustlib-demangle.S 2>&1

::  Return to the parent directory.
@popd

::  Copy Rust libcore to libs_rust_libcore.a, which is originally generated by libs\rust_libcore.
@echo ----- Copy Rust libcore
::  Get the Rust compiler sysroot e.g. C:\Users\guppy\.rustup\toolchains\nightly-x86_64-pc-windows-msvc
@for /f %%l in ('rustc --print sysroot --target %rust_build_target%') do @set rust_sysroot=%%l
::  Copy libcore to the Mynewt build folder.
@if not exist %rust_libcore_dir% (
    @mkdir %rust_libcore_dir%
    @if errorlevel 1 goto :EOF
)
@if exist %rust_libcore_dest% (
    @del %rust_libcore_dest%
    @if errorlevel 1 goto :EOF
)
::  Get the Rust compiler sysroot e.g. C:\Users\guppy\.rustup\toolchains\nightly-x86_64-pc-windows-msvc\lib\rustlib\thumbv7m-none-eabi\lib\libcore-6ea1de1c8a090cbc.rlib
::  Overwrite our custom libs_rust_libcore.a to inject Rust libcore into the build.
@for %%f in (%rust_sysroot%\lib\rustlib\%rust_build_target%\lib\libcore-*.rlib) do copy %%f %rust_libcore_dest% >nul:
@if errorlevel 1 goto :EOF

::  Update the timestamp on libs_rust_libcore.a so that Mynewt build won't overwrite the Rust libcore we have copied.
@%ar_cmd% s %rust_libcore_dest%
@if errorlevel 1 goto :EOF

::  Dump the ELF and disassembly for the compiled Rust application.
@%readelf_cmd% -a --wide target\%rust_build_target%\%rust_build_profile%\libapp.rlib >logs\libapp.elf 2>&1
@%objdump_cmd% -t -S            --line-numbers --wide target\%rust_build_target%\%rust_build_profile%\libapp.rlib >logs\libapp.S 2>&1
@%objdump_cmd% -t -S --demangle --line-numbers --wide target\%rust_build_target%\%rust_build_profile%\libapp.rlib >logs\libapp-demangle.S 2>&1

::  Run the Mynewt build, which will link with the Rust app, Rust libraries and libcore.
::  For verbose build: newt build -v -p %mynewt_build_app%
@echo ----- Build Mynewt and link with Rust app
newt\newt.exe build %mynewt_build_app%
@if errorlevel 1 goto :EOF

::  Display the image size.
newt\newt.exe size -v %mynewt_build_app%
@if errorlevel 1 goto :EOF

::  Create the image
scripts\nrf52\image-app.cmd

::  Copy the disassembly and linker map to the logs folder.
@copy bin\targets\%mynewt_build_app%\app\apps\my_sensor_app\my_sensor_app.elf.lst logs >nul:
@copy bin\targets\%mynewt_build_app%\app\apps\my_sensor_app\my_sensor_app.elf.map logs >nul:
