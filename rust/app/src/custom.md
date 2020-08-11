# Your Very Own PineTime Firmware... Built by GitLab and GitHub

![Your Very Own PineTime Firmware](https://lupyuen.github.io/images/custom-title.jpg)

TODO

Programming the firmware of our gadgets (like [__PineTime Smart Watch__](https://wiki.pine64.org/index.php/PineTime)) has always been cumbersome...

Today we'll learn [__GitHub Actions__](https://github.com/features/actions) for building [__InfiniTime Firmware__](https://github.com/JF002/Pinetime) for [__PineTime Smart Watch__](https://wiki.pine64.org/index.php/PineTime) in the GitHub Cloud.

![PineTime Logo Loader](https://lupyuen.github.io/images/logo-loader.jpg)

# Logo Loader

TODO

We'll explain the GitLab version: https://gitlab.com/lupyuen/pinetime-logo-loader/-/blob/master/.gitlab-ci.yml

If you're on GitHub, there is a similar GitHub version: https://github.com/lupyuen/pinetime-logo-loader/blob/master/.github/workflows/main.yml

```yaml
# GitLab CI to build Rust+Mynewt Firmware for PineTime Smart Watch
# Based on https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/.github/workflows/main.yml

# Official language image. Look for the different tagged releases at: https://hub.docker.com/r/library/rust/tags/
image: "rust:latest"
```

```yaml
build:
  stage: build
```

```yaml
  # Checkout

  variables:
    # Clone submodules recursively
    GIT_SUBMODULE_STRATEGY: recursive
```

```yaml
  # Download and Cache Dependencies

  before_script:
    # Show files
    - set ; pwd ; ls -l
```

```yaml
    # Install Go
    - pushd /tmp    
    - wget -qO- https://golang.org/dl/go1.14.7.linux-amd64.tar.gz | tar -xz
    - popd
    - export PATH=$PATH:/tmp/go/bin
    - go version
```

```yaml
    # Install newt
    - source scripts/install-version.sh
    - pushd /tmp
    - git clone --branch $mynewt_version https://github.com/apache/mynewt-newt/
    - cd mynewt-newt/
    - ./build.sh
```

```yaml
    - popd
    - export PATH=$PATH:/tmp/mynewt-newt/newt
    - newt version
```

```yaml
    # Download Mynewt source files
    # Ignore Error: Error updating "mcuboot": error: The following untracked working tree files would be overwritten by checkout:
    # ext/mbedtls/include/mbedtls/check_config.h
    # ext/mbedtls/include/mbedtls/config.h
    - export PATH=$PATH:/tmp/mynewt-newt/newt
    - newt install -v -f || ls -l repos
```

```yaml
    #  Overwrite MCUBoot with newer version
    - source scripts/install-version.sh
    - pushd repos
    - rm -rf mcuboot
    - git clone --branch $mcuboot_version https://github.com/JuulLabs-OSS/mcuboot
    - popd
```

```yaml
    # Install Rust Target thumbv7em-none-eabihf
    - rustup default nightly
    - rustup target add thumbv7em-none-eabihf
```

```yaml
    # Install Embedded Arm Toolchain arm-none-eabi-gcc
    - pushd /tmp
    - wget -qO- https://developer.arm.com/-/media/Files/downloads/gnu-rm/8-2019q3/RC1.1/gcc-arm-none-eabi-8-2019-q3-update-linux.tar.bz2 | tar -xj
    - popd
    - export PATH=$PATH:/tmp/gcc-arm-none-eabi-8-2019-q3-update/bin
    - arm-none-eabi-gcc --version
```

```yaml
    # Convert Logo

    # Convert Logo from PNG to C
    # Run pinetime-graphic in the temp folder to avoid Cargo.toml and .cargo conflicts
    - cp -r pinetime-graphic /tmp
```

```yaml
    - cp pinetime-graphic.png /tmp/pinetime-graphic
```

```yaml
    # Convert the graphic from PNG to C 
    - pushd /tmp/pinetime-graphic
    - rustup default nightly
    - export RUST_BACKTRACE=1
```

```yaml
    - export TERM=vt100
```

```yaml
    - cargo run -q pinetime-graphic.png >$CI_PROJECT_DIR/apps/my_sensor_app/src/write_graphic.inc
    - popd
```

```yaml
  # Build Rust+Mynewt Application Firmware

  script:
    # Set PATH
    - export PATH=$PATH:/tmp/go/bin:/tmp/mynewt-newt/newt:/tmp/gcc-arm-none-eabi-8-2019-q3-update/bin
```

```yaml
    # Build Application Firmware
    - ./scripts/build-app.sh
```

```yaml
    # Create Application Firmware Image
    - ./scripts/nrf52/image-app.sh
```
    
```yaml
    # Copy the Application Firmware Image to top level for uploading
    - cp bin/targets/nrf52_my_sensor/app/apps/my_sensor_app/my_sensor_app.img .
```

```yaml
  # Upload Application Firmware

  artifacts:
    paths:
      # Application Firmware Image for flashing
      - my_sensor_app.img
```

```yaml
      # Other Application Firmware Outputs
      - bin/targets/nrf52_my_sensor/app/apps/my_sensor_app/my_sensor_app.*
```

# Custom Firmware

TODO

Rust in the cloud

GitLab Web IDE

Languages

Loadable Apps: WebAssembly, Sandbox, wasp-os

Security

apt / npm style repos

Optimisation

Updates

# What's Next?

TODO

We have a lot to do, please chat with us if you're keen to help...

[PineTime Chatroom on Discord / Matrix / Telegram / IRC](https://wiki.pine64.org/index.php/PineTime#Community)

And remember to enjoy your PineTime :-)

[Check out my RSS Feed](https://lupyuen.github.io/rss.xml)
