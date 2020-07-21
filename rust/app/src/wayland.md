# Wayland and LVGL on PinePhone with Ubuntu Touch

![Work-in-progress LVGL GUI Framework ported to Wayland EGL on PinePhone with Ubuntu Touch](https://lupyuen.github.io/images/wayland-title.jpg)

_Work-in-progress LVGL GUI Framework ported to Wayland EGL on PinePhone with Ubuntu Touch_

__We ❤️ &nbsp; Old Underwear...__

They feel comfy, they fit our contours. Nevermind the holes and the old stains 🤢

__X11 is like Old Underwear.__ It's been around for 30 years... Yet we still use it inspite of its feature gaps and wonky quirks.

__PinePhone on Ubuntu Touch feels like... New Underwear.__

It runs Linux but it has none of the legacy X11 code. Because it's optimised for a great mobile experience with __Wayland.__

But New Underwear feels uncomfortable. So today we'll learn Wayland and understand how apps are built with Wayland.

Hopefully someday we'll move on to newer, simpler app frameworks (like [LVGL](https://lvgl.io/) and Flutter) as we discard our Old Underwear: X11, SDL, GTK, Qt, ...

The source code for this article may be found here...

- [`github.com/lupyuen/lvgl-wayland`](https://github.com/lupyuen/lvgl-wayland)

- [`github.com/lupyuen/pinephone-mir`](https://github.com/lupyuen/pinephone-mir)

# How X11 works

[X11](https://en.wikipedia.org/wiki/X_Window_System) is the Graphical Display Service that runs on most Linux desktops and notebooks.

Let's hunt for the X11 Service on Pinebook Pro...

![X11 Service on Pinebook Pro](https://lupyuen.github.io/images/wayland-pinebook.png)

That's the X11 Service... A __2.2 MB__ executable named __`Xorg`__. 

The X11 Service controls the rendering of Linux apps (as well as the keyboard and mouse input) like this...

![X11 Architecture](https://lupyuen.github.io/images/wayland-x11.png)

(Adapted from ["Wayland Architecture"](https://wayland.freedesktop.org/architecture.html))

1. At the top we have the Linux programs running on our Linux machine: __Terminal, Editor, Web Browser__.

    Each program renders its graphical display and transmits the raw graphics to the X11 Service (via a local TCP socket).

1. X11 Service forwards the rendered graphics to the [__Window Manager / Compositor__](https://en.wikipedia.org/wiki/Compositing_window_manager).

    The Window Manager / Compositor is provided by the __Desktop Environment__: Xfce, KDE, Gnome, ...

1. The Window Manager / Compositor wraps the rendered graphics into Display Windows and __"decorates"__ them with scrollbars, title bar and minimise / maximise / close buttons.

    The Window Manager / Compositor then draws the Display Windows into a __Screen Buffer__ according to their screen coordinates.

1. The Screen Buffer is rendered to our screen by the X11 Service, talking to the __Linux Display Driver__.

1. Any __keyboard and mouse input__ is captured by the X11 Service, and forwarded to the programs.

_Why is X11 so complex? So many hops?_

Because X11 was designed for Distributed Computing Systems.

Here's how I used (abused?) X11R4 at [UIUC Systems Research Group](http://srg.cs.illinois.edu/) way back in 1990 (30 years ago!)...

![Distributed X11 System](https://lupyuen.github.io/images/wayland-uiuc.png)

Thankfully things are a lot simpler now, lemme explain...

# Wayland on Ubuntu Touch

_Do we need overlapping or tiled windows on PinePhone?_

_Do we need to need to decorate PinePhone windows with a title bar and minimise / maximise / close buttons?_

_Do we even need any windows on PinePhone?_

No! Because each PinePhone app takes control of the entire screen!

PinePhone uses a simpler Graphical Display Service: the [__Wayland Compositor__](https://en.wikipedia.org/wiki/Wayland_(display_server_protocol)#Wayland_compositors).

Let's hunt for the Wayland Compositor on PinePhone...

![Wayland Compositor on PinePhone](https://lupyuen.github.io/images/wayland-compositor.png)

That's the Wayland Compositor... A __262 KB__ executable named `unity-system-compositor`. 

_Compare that with the 2.2 MB X11 Server on Pinebook Pro!_

Here's how the Wayland Compositor controls apps and touchscreen input on PinePhone with Ubuntu Touch...

![Wayland Architecture](https://lupyuen.github.io/images/wayland-arch.png)

(Adapted from ["Wayland Architecture"](https://wayland.freedesktop.org/architecture.html) and ["EGL API"](https://en.wikipedia.org/wiki/EGL_(API)))

1. At the top we have the apps running on our phone: __Terminal, Editor, Web Browser__.

    Since each app runs fullscreen, only the active app will be rendered.

    When then app starts, it queries the __Wayland Compositor__ for the graphical display interfaces available. (They talk via a [Linux socket file](https://en.wikipedia.org/wiki/Unix_file_types#Socket): `/run/user/32011/wayland-0`)

1. Wayland Compositor returns the [__EGL Interface__](https://en.wikipedia.org/wiki/EGL_(API)) to the app.

1. App calls the EGL Interface to [__render OpenGL graphics__](https://en.wikipedia.org/wiki/OpenGL) directly to the __Linux Display Driver__.

1. Linux Display Driver forwards the OpenGL rendering commands to the [__GPU to update the screen__](https://en.wikipedia.org/wiki/Graphics_processing_unit).

1. Any __touchscreen input__ is captured by the Wayland Compositor, and forwarded to the active app.

Wayland looks so much simpler and faster than X11!

_Wayland is designed for OpenGL and GPUs?_

Yes! And I lied about Wayland being New Underwear... Wayland is not really that New!

Wayland was first released in 2008 ([11 years ago](https://en.wikipedia.org/wiki/Wayland_(display_server_protocol)))... Yet it was designed around OpenGL and GPUs, the same tech that powers our beautiful games today. ([And websites too](https://youtu.be/DNBk9hnPkTY))

Read on to learn how to render our own OpenGL graphics with Wayland and Ubuntu Touch on PinePhone...

![Rendering a yellow rectangle with Wayland and OpenGL on PinePhone](https://lupyuen.github.io/images/wayland-egl.jpg)

_Rendering a yellow rectangle with Wayland and OpenGL on PinePhone_

# Render OpenGL Graphics with Wayland

Here's the function that calls OpenGL to render the yellow box above: [`pinephone-mir/egl.c`](https://github.com/lupyuen/pinephone-mir/blob/master/egl.c#L44-L60)

```c
/// Render the OpenGL ES2 display
static void render_display() {
    puts("Rendering display...");

    //  Fill the rectangular region with yellow
    glClearColor(
        1.0,  //  Red
        1.0,  //  Green
        0.0,  //  Blue
        1.0   //  Alpha
    );
    glClear(GL_COLOR_BUFFER_BIT);

    // Render now
    glFlush();
}
```

`render_display()` looks exactly like normal OpenGL, and it works on PinePhone with Wayland! (Thanks to Ubuntu Touch)

Two things to note...

1. PinePhone supports a popular subset of OpenGL, known as [__OpenGL for Embedded Systems__](https://en.wikipedia.org/wiki/OpenGL_ES) Version 2.0.

    OpenGL ES is optimised for Embedded Devices. OpenGL ES is used by many mobile and console games today.

1. To render OpenGL ES graphics, we need to get the OpenGL ES Context and Window Surface from Wayland

Before calling `render_display()`, we fetch the OpenGL Window Surface from Wayland like so: [`pinephone-mir/egl.c`](https://github.com/lupyuen/pinephone-mir/blob/master/egl.c#L167-L189)

```c
static struct wl_egl_window *egl_window;  //  Wayland EGL Window
static EGLSurface egl_surface;            //  EGL Surface

/// Create the OpenGL window and render it
static void create_window(void) {
    //  Create an EGL Window from a Wayland Surface 
    egl_window = wl_egl_window_create(surface, WIDTH, HEIGHT);
    assert(egl_window != EGL_NO_SURFACE);  //  Failed to create OpenGL Window

    //  Create an OpenGL Window Surface for rendering
    egl_surface = eglCreateWindowSurface(egl_display, egl_conf,
        egl_window, NULL);
    assert(egl_surface != NULL);  //  Failed to create OpenGL Window Surface

    //  Set the current rendering surface
    EGLBoolean madeCurrent = eglMakeCurrent(egl_display, egl_surface,
        egl_surface, egl_context);
    assert(madeCurrent);  //  Failed to set rendering surface

    //  Render the display
    render_display();

    //  Swap the display buffers to make the display visible
    EGLBoolean swappedBuffers = eglSwapBuffers(egl_display, egl_surface);
    assert(swappedBuffers);  //  Failed to swap display buffers
}
```

Functions named `wl_egl_...` are provided by the Wayland EGL Interface.  Functions named `egl...` come from the cross-platform [Mesa 3D Graphics Library](https://docs.mesa3d.org/egl.html#:~:text=The%20main%20library%20(%20libEGL%20)%20is,directly%20dispatched%20to%20the%20drivers.).

_EGL vs OpenGL... What's the difference?_

In Wayland, EGL is the Enabler for OpenGL. 

Wayland only understands EGL and it will gladly hand us EGL objects... But it's up to us to transform EGL into OpenGL for rendering.

In the code above, we take a Wayland Surface `surface` and transform it into an EGL Window `egl_window`...

```c
    //  Create an EGL Window from a Wayland Surface 
    egl_window = wl_egl_window_create(surface, WIDTH, HEIGHT);
```

Then we create an OpenGL Window Surface `egl_surface` from that EGL Window...

```c
    //  Create an OpenGL Window Surface for rendering
    egl_surface = eglCreateWindowSurface(egl_display, egl_conf,
        egl_window, NULL);
```

And we begin the OpenGL rendering...

```c
    //  Set the current rendering surface
    EGLBoolean madeCurrent = eglMakeCurrent(egl_display, egl_surface,
        egl_surface, egl_context);

    //  Render the display
    render_display();

    //  Swap the display buffers to make the display visible
    eglSwapBuffers(egl_display, egl_surface);
```

TODO

[`pinephone-mir/egl.c`](https://github.com/lupyuen/pinephone-mir/blob/master/egl.c#L103-L112)

```c
static struct wl_region *region;  //  Wayland Region

/// Create an opaque region for OpenGL rendering
static void create_opaque_region(void) {
    puts("Creating opaque region...");

    region = wl_compositor_create_region(compositor);
    assert(region != NULL);  //  Failed to create EGL Region

    wl_region_add(region, 0, 0, WIDTH, HEIGHT);
    wl_surface_set_opaque_region(surface, region);
}
```

Here's how we get the OpenGL Context...

[`pinephone-mir/egl.c`](https://github.com/lupyuen/pinephone-mir/blob/master/egl.c#L113-L165)

```c
/// Wayland EGL Interfaces for OpenGL Rendering
static EGLDisplay egl_display;  //  EGL Display
static EGLConfig  egl_conf;     //  EGL Configuration
static EGLContext egl_context;  //  EGL Context

/// Init the EGL Interface
static void init_egl(void) {
    puts("Init EGL...");

    //  Attributes for our EGL Display
    EGLint config_attribs[] = {
        EGL_SURFACE_TYPE,    EGL_WINDOW_BIT,
        EGL_RED_SIZE,        8,
        EGL_GREEN_SIZE,      8,
        EGL_BLUE_SIZE,       8,
        EGL_RENDERABLE_TYPE, EGL_OPENGL_ES2_BIT,
        EGL_NONE
    };
    static const EGLint context_attribs[] = {
        EGL_CONTEXT_CLIENT_VERSION, 2,
        EGL_NONE
    };

    //  Get the EGL Display
    egl_display = eglGetDisplay((EGLNativeDisplayType) display);
    assert(egl_display != EGL_NO_DISPLAY);  //  Failed to get EGL Display

    //  Init the EGL Display
    EGLint major, minor;
    EGLBoolean egl_init = eglInitialize(egl_display, &major, &minor);
    assert(egl_init);  //  Failed to init EGL Display
    printf("EGL major: %d, minor %d\n", major, minor);

    //  Get the EGL Configurations
    EGLint count, n;
    eglGetConfigs(egl_display, NULL, 0, &count);
    printf("EGL has %d configs\n", count);
    EGLConfig *configs = calloc(count, sizeof *configs);
    eglChooseConfig(egl_display, config_attribs,
        configs, count, &n);

    //  Choose the first EGL Configuration
    for (int i = 0; i < n; i++) {
        EGLint size;
        eglGetConfigAttrib(egl_display, configs[i], EGL_BUFFER_SIZE, &size);
        printf("Buffer size for config %d is %d\n", i, size);
        eglGetConfigAttrib(egl_display, configs[i], EGL_RED_SIZE, &size);
        printf("Red size for config %d is %d\n", i, size);
        egl_conf = configs[i];
        break;
    }
    assert(egl_conf != NULL);  //  Failed to get EGL Configuration

    //  Create the EGL Context based on the EGL Display and Configuration
    egl_context = eglCreateContext(egl_display, egl_conf,
        EGL_NO_CONTEXT, context_attribs);
    assert(egl_context != NULL);  //  Failed to create EGL Context
}
```

To learn more about EGL, check out ["Programming Wayland Clients"](https://jan.newmarch.name/Wayland/EGL/)

[`pinephone-mir/egl.c`](https://github.com/lupyuen/pinephone-mir/blob/master/egl.c#L64-L98)

```c
/// Wayland Interfaces
static struct wl_surface       *surface;       //  Wayland Surface
static struct wl_shell_surface *shell_surface; //  Wayland Shell Surface

/// Connect to Wayland Compositor and render OpenGL graphics
int main(int argc, char **argv) {
    //  Get interfaces for Wayland Compositor and Wayland Shell
    get_server_references();
    assert(compositor != NULL);  //  Failed to get Wayland Compositor
    assert(shell != NULL);       //  Failed to get Wayland Shell

    //  Create a Wayland Surface for rendering
    surface = wl_compositor_create_surface(compositor);
    assert(surface != NULL);  //  Failed to create Wayland Surface

    //  Get the Wayland Shell Surface for rendering
    shell_surface = wl_shell_get_shell_surface(shell, surface);
    assert(shell_surface != NULL);

    //  Set the Shell Surface as top level
    wl_shell_surface_set_toplevel(shell_surface);

    //  Create an opaque region for rendering
    create_opaque_region();

    //  Init Wayland EGL
    init_egl();

    //  Create the OpenGL Window and render OpenGL graphics
    create_window();

    //  Handle all Wayland Events in the Event Loop
    while (wl_display_dispatch(display) != -1) {}

    //  Disconnect from the Wayland Display
    wl_display_disconnect(display);
    puts("Disconnected from display");
    return 0;
}
```

Building a Wayland app is refreshingly simple (if you're used to GDK, Qt and SDL).

Here'a how we build the app in `egl.c` on a Linux machine (that has the Wayland, EGL and OpenGL ES2 libraries installed)...

```bash
# Build the Wayland EGL app
gcc \
    -g \
    -o egl \
    egl.c \
    -Wl,-Map=egl.map \
    -L/usr/lib/aarch64-linux-gnu/mesa-egl \
    -lwayland-client \
    -lwayland-server \
    -lwayland-egl \
    -lEGL \
    -lGLESv2
```

```bash
# Start the Weston Wayland Compositor on our computer with the PinePhone screen dimensions
weston --width=720 --height=1398 &

# Run the Wayland EGL app
./egl
```

And we'll see this...

![EGL App running with Wayland Weston Compositor on Pinebook Pro](https://lupyuen.github.io/images/wayland-westonegl.png)

We learn in a while how to build and run the app on PinePhone.

The Wayland EGL code in this article was adapted from https://jan.newmarch.name/Wayland/EGL/ 

# Fetch Wayland Interfaces

[`pinephone-mir/egl.c`](https://github.com/lupyuen/pinephone-mir/blob/master/egl.c#L194-L251
)

```c
/// Wayland Interfaces
static struct wl_display       *display;       //  Wayland Display
static struct wl_compositor    *compositor;    //  Wayland Compositor
static struct wl_shell         *shell;         //  Wayland Shell

/// Callbacks for interfaces returned by Wayland Service
static const struct wl_registry_listener registry_listener = {
    global_registry_handler,
    global_registry_remover
};

/// Connect to Wayland Service and fetch the interfaces for Wayland Compositor and Wayland Shell
static void get_server_references(void) {
    puts("Getting server references...");
    display = wl_display_connect(NULL);
    if (display == NULL) {
        fprintf(stderr, "Failed to connect to display\n");
        exit(1);
    }
    puts("Connected to display");

    //  Get the Wayland Registry
    struct wl_registry *registry = wl_display_get_registry(display);
    assert(registry != NULL);  //  Failed to get Wayland Registry

    //  Add Registry Callbacks to handle interfaces returned by Wayland Service
    wl_registry_add_listener(registry, &registry_listener, NULL);

    //  Wait for Registry Callbacks to fetch Wayland Interfaces
    wl_display_dispatch(display);
    wl_display_roundtrip(display);

    //  We should have received interfaces for Wayland Compositor and Wayland Shell
    assert(compositor != NULL);  //  Failed to get Wayland Compositor
    assert(shell != NULL);       //  Failed to get Wayland Shell
}

/// Callback for interfaces returned by Wayland Service
static void global_registry_handler(void *data, struct wl_registry *registry, uint32_t id,
    const char *interface, uint32_t version) {
    printf("Got interface %s id %d\n", interface, id);

    if (strcmp(interface, "wl_compositor") == 0) {
        //  Bind to Wayland Compositor Interface
        compositor = wl_registry_bind(registry, id,
            &wl_compositor_interface,   //  Interface Type
            1);                         //  Interface Version
    } else if (strcmp(interface, "wl_shell") == 0){
        //  Bind to Wayland Shell Interface
        shell = wl_registry_bind(registry, id,
            &wl_shell_interface,        //  Interface Type
            1);                         //  Interface Version
    }
}

/// Callback for removed interfaces
static void global_registry_remover(void *data, struct wl_registry *registry, uint32_t id) {
    printf("Removed interface id %d\n", id);
}
```

Now let's render a simple texture with Wayland and OpenGL...

![Rendering a simple texture with Wayland and OpenGL on PinePhone](https://lupyuen.github.io/images/wayland-egl2.jpg)

_Rendering a simple texture with Wayland and OpenGL on PinePhone_

# Render OpenGL Texture with Wayland

TODO

The OpenGL Texture code in this article was adapted from https://github.com/danginsburg/opengles-book-samples

# Port LVGL to Wayland

TODO

SDL, GTK, Qt are complex because they handle X11 legacy stuff

SDL and GTK will work on Wayland... but needs X11 compatibilty!

I applaud the maintainers of x11, gtk, qt, sdl because every new release needs to support so many legacy features. Kudos!

What if we could start from scratch, drop the legacy stuff, and build a ui toolkit for Wayland and opengl?

Lvgl is that experiment that we're undertaking today

Rust wrapper for lvgl

# Overcome AppArmor Security on Ubuntu Touch

TODO

Why AppArmor?

# Start SSH on PinePhone

To start SSH on PinePhone, open the Terminal app.

Create a file named `a`...

```bash
nano a
```

Type this script into the `a` file...

```bash
#!/bin/sh
# Script to start SSH service and show IP address

# Start SSH service
sudo service ssh start

# Show IP address
ifconfig | \
    grep -v "127.0.0.1" | \
    grep "inet addr:"

# Ping repeatedly to keep WiFi alive
ping google.com
```

Save the file and exit `nano`.

TODO: How to install the script on PinePhone via SD card or Bluetooth

When we're ready do coding on PinePhone, enter this at the command line...

```bash
. a 
```

(There's a space between "`.`" and "`a`")

The script starts the SSH Service and displays the IP address for PinePhone...

![Starting SSH Service on PinePhone](https://lupyuen.github.io/images/wayland-ssh.jpg)

We'll connect to PinePhone at the IP adddress indicated by `inet addr`. 

Tap on `Ctrl-C` to stop the `ping`.

TODO: How to install SSH key on PinePhone via SD card or Bluetooth

When we press PinePhone's power button to switch off PinePhone, we'll see ths amusing message from olden times...

![Powering off PinePhone](https://lupyuen.github.io/images/wayland-halt.jpg)

# Build LVGL on PinePhone

TODO

# Run LVGL on PinePhone

TODO

Mir Server Log may be found on PinePhone here...

```
/home/phablet/.cache/upstart/unity8.log
```

Copy the log to our machine like this...

```bash
scp -i ~/.ssh/pinebook_rsa phablet@192.168.1.10:/home/phablet/.cache/upstart/u
```

![PinePhone Wayland App tested on Pinebook Pro](https://lupyuen.github.io/images/wayland-weston.png)

# Build and Test PinePhone Wayland Apps on Pinebook Pro

Here's how we can build and test PinePhone Wayland Apps on Pinebook Pro...

```bash
# Create a symbolic link for the OpenGL ES2 shared library that will be used for the Wayland build
sudo mkdir -p /usr/lib/aarch64-linux-gnu/mesa-egl/
sudo ln -s /usr/lib/libGLESv2.so /usr/lib/aarch64-linux-gnu/mesa-egl/libGLESv2.so.2

# Build the Wayland executable
make

# Start the Weston Wayland Compositor on Pinebook Pro with the PinePhone screen dimensions
weston --width=720 --height=1398 &

# Run the Wayland executable
wayland/lvgl
```

# Wayland Gotchas

TODO

GPU on X11:

https://qoto.org/@lupyuen/104541068127168291

GNOME and GTK on Wayland:

https://mastodon.social/@ebassi/104511735257435944

UBports on Mir:

https://twitter.com/UBports/status/1282935946711904257?s=09

https://twitter.com/UBports/status/1282934927806398464?s=09

https://twitter.com/UBports/status/1282936886311428096?s=09

Wayland on Xfce:

https://twitter.com/XfceNation/status/1284842929895301120?s=09

https://twitter.com/XfceNation/status/1284854254092513285?s=09

Mir / Lomiri / Unity8's complicated history:

https://www.phoronix.com/scan.php?page=news_item&px=Mir-2019-Kicking

https://www.phoronix.com/scan.php?page=news_item&px=Unity-8-Renamed-To-Lomiri

# What I like about Ubuntu Touch on PinePhone

TODO

AppArmor is good, because iOS and Android have similar apps security

Read-only file system is good (system files are read-only by default, user files are read-write). Helps to prevent security holes. (Even PineTime has a read-only Flash ROM)

Why is Qt supported on Ubuntu Touch and not GTK? Because building a Linux mobile app requires mobile-friendly widgets.

I think Qt has more mobile-friendly widgets, even through the internal plumbing is way too complicated.

When I get GTK running on Ubuntu Touch, I will face the same problem with widgets. And I have to make GTK widgets look and feel consistent with Qt / Ubuntu Touch widgets.

Older kernel base in Ubuntu Touch... I don't do kernel hacking much so it doesn't matter to me.

I think for mobiles we only need to support a few common chipsets, so an older kernel is probably fine.

That explains why Raspberry Pi 4 isn't supported by Ubuntu Touch... The hardware is just too new.

The issues I'm struggling with now... Wayland, GTK3, ... are actually really old stuff. Updating the kernel won't help.

Ubuntu Touch is pure Wayland, none of the legacy X11 stuff. Xwayland is not even there (unless you use the Libertine containers ugh).

The pure Wayland environment causes GTK to break, because GTK assumes some minimal X11 support (i.e. Xwayland).

So Ubuntu Touch is not really that bad for PinePhone... It's just painful for building non-Qt apps. 🙂

# Further Reading

_["Flutter State Management with Bloc for PineTime Companion App"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/bloc)_

_["Convert Go to Flutter and Dart for PineTime Companion App"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/companion)_

_["Your First Bluetooth Low Energy App with Flutter"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/flutter)_

_["Your First GTK App with Go and VSCodium"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/gotk3)_

_["MCUBoot Bootloader for PineTime Smart Watch (nRF52)"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/mcuboot)_

_["Firmware Update over Bluetooth Low Energy on PineTime Smart Watch"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfu)_

_["Wireless Firmware Update In Action on PineTime Smart Watch (nRF52)"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfutest)_

[Check out the other PineTime articles](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/README.md)

[RSS Feed](https://lupyuen.github.io/rss.xml)
