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

    OpenGL ES is optimised for Embedded Devices. It's used by many mobile and console games today.

1. To render OpenGL ES graphics, we need to get the __OpenGL ES Context__ and __Window Surface__ from Wayland

Before calling `render_display()`, we fetch the OpenGL Window Surface from Wayland like so: [`pinephone-mir/egl.c`](https://github.com/lupyuen/pinephone-mir/blob/master/egl.c#L167-L189)

```c
/// Dimensions of the OpenGL region to be rendered
static int WIDTH  = 480;
static int HEIGHT = 360;

static struct wl_egl_window *egl_window;  //  Wayland EGL Window
static EGLSurface egl_surface;            //  EGL Surface

//  Create the EGL Window and render OpenGL graphics
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

Thus in the code above, we take a Wayland Surface `surface` and transform it into an EGL Window `egl_window`...

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
eglMakeCurrent(egl_display, egl_surface,
    egl_surface, egl_context);

//  Render the display
render_display();

//  Swap the display buffers to make the display visible
eglSwapBuffers(egl_display, egl_surface);
```

Here's how we create a Wayland Region for OpenGL rendering: [`pinephone-mir/egl.c`](https://github.com/lupyuen/pinephone-mir/blob/master/egl.c#L103-L112)

```c
static struct wl_region *region;  //  Wayland Region

//  Create the Wayland Region for rendering OpenGL graphics
static void create_opaque_region(void) {
    //  Create a Wayland Region
    region = wl_compositor_create_region(compositor);
    assert(region != NULL);  //  Failed to create EGL Region

    //  Set the dimensions of the Wayland Region
    wl_region_add(region, 0, 0, WIDTH, HEIGHT);

    //  Add the Region to the Wayland Surface
    wl_surface_set_opaque_region(surface, region);
}
```

To learn more about EGL, check out ["Programming Wayland Clients"](https://jan.newmarch.name/Wayland/EGL/)

The Wayland EGL code in this article was adapted from that document.

# Get EGL Context from Wayland

Earlier in `create_window()` we called an __EGL Context__ `egl_context` to render OpenGL graphics.

Here's how we get the EGL Context: [`pinephone-mir/egl.c`](https://github.com/lupyuen/pinephone-mir/blob/master/egl.c#L113-L165)

```c
/// Wayland EGL Interfaces for OpenGL Rendering
static EGLDisplay egl_display;  //  EGL Display
static EGLConfig  egl_conf;     //  EGL Configuration
static EGLContext egl_context;  //  EGL Context

//  Create the EGL Context for rendering OpenGL graphics
static void init_egl(void) {
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

    //  Get the EGL Configurations
    EGLint count, n;
    eglGetConfigs(egl_display, NULL, 0, &count);
    EGLConfig *configs = calloc(count, sizeof *configs);
    eglChooseConfig(egl_display, config_attribs,
        configs, count, &n);

    //  Choose the first EGL Configuration
    for (int i = 0; i < n; i++) {
        EGLint size;
        eglGetConfigAttrib(egl_display, configs[i], EGL_BUFFER_SIZE, &size);
        eglGetConfigAttrib(egl_display, configs[i], EGL_RED_SIZE, &size);
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

[More about EGL](https://jan.newmarch.name/Wayland/EGL/)

The above code in `init_egl()` creates the EGL Context. 

We call `init_egl()` in our Main Function like so: [`pinephone-mir/egl.c`](https://github.com/lupyuen/pinephone-mir/blob/master/egl.c#L64-L98)

```c
/// Wayland Interfaces
static struct wl_surface       *surface;       //  Wayland Surface
static struct wl_shell_surface *shell_surface; //  Wayland Shell Surface

/// Connect to Wayland Compositor and render OpenGL graphics
int main(int argc, char **argv) {
    //  Get interfaces for Wayland Compositor and Wayland Shell
    get_server_references();
    assert(display != NULL);     //  Failed to get Wayland Display
    assert(compositor != NULL);  //  Failed to get Wayland Compositor
    assert(shell != NULL);       //  Failed to get Wayland Shell

    //  Create a Wayland Surface for rendering our app
    surface = wl_compositor_create_surface(compositor);
    assert(surface != NULL);  //  Failed to create Wayland Surface

    //  Get the Wayland Shell Surface for rendering our app window
    shell_surface = wl_shell_get_shell_surface(shell, surface);
    assert(shell_surface != NULL);

    //  Set the Shell Surface as top level
    wl_shell_surface_set_toplevel(shell_surface);

    //  Create the Wayland Region for rendering OpenGL graphics
    create_opaque_region();

    //  Create the EGL Context for rendering OpenGL graphics
    init_egl();

    //  Create the EGL Window and render OpenGL graphics
    create_window();

    //  Handle all Wayland Events in the Event Loop
    while (wl_display_dispatch(display) != -1) {}

    //  Disconnect from the Wayland Display
    wl_display_disconnect(display);
    return 0;
}
```

The `main()` function in all Wayland apps follow the same steps...

1.  Fetch the __Wayland Compositor__ and __Wayland Shell__ from the __Wayland Registry__...

    ```c
    //  Get interfaces for Wayland Compositor and Wayland Shell
    get_server_references();
    ```

    We'll talk about `get_server_references()` and the Wayland Registry in a while.

1.  Every Wayland App needs a __Wayland Surface__ (screen buffer) for displaying the app...

    ```c
    //  Create a Wayland Surface for rendering our app
    surface = wl_compositor_create_surface(compositor);
    ```

1.  Create a __Wayland Shell Surface__ (app window) for rendering our app...

    ```c
    //  Get the Wayland Shell Surface for rendering our app window
    shell_surface = wl_shell_get_shell_surface(shell, surface);
    ```

1.  Set the Shell Surface as the __Top Level__ window for our app...

    ```c
    //  Set the Shell Surface as top level
    wl_shell_surface_set_toplevel(shell_surface);
    ```

1.  This part is specific to OpenGL apps...

    Earlier we have seen `create_opaque_region()`, `init_egl()` and `create_window()`. We call them to create the Wayland Region, EGL Context and EGL Window, and to render the OpenGL graphics.

    ```c
    //  Create the Wayland Region for rendering OpenGL graphics
    create_opaque_region();
    //  Create the EGL Context for rendering OpenGL graphics
    init_egl();
    //  Create the EGL Window and render OpenGL graphics
    create_window();
    ```

1.  Every Wayland App needs an __Event Loop__ for handling Wayland Events...

    ```c
    //  Handle all Wayland Events in the Event Loop
    while (wl_display_dispatch(display) != -1) {}
    ```

1.  When our app terminates, we disconnect the Wayland Display...

    ```c
    //  Disconnect from the Wayland Display
    wl_display_disconnect(display);
    ```

Now let's build and test the app on our Linux development machine. (We'll run it on PinePhone later)

# Build and Test Wayland App

Now that we have created a [simple Wayland app](https://github.com/lupyuen/pinephone-mir/blob/master/egl.c) that renders OpenGL graphics... Let's build it!

Building a Wayland app is refreshingly simple (if you're used to GDK, Qt and SDL).

Here'a how we build the Wayland app in [`egl.c`](https://github.com/lupyuen/pinephone-mir/blob/master/egl.c) on a Linux machine (that has Wayland, MESA EGL and OpenGL ES2 libraries installed)...

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

This produces the executable app `egl`. Run the `egl` app on our Linux machine like so...

```bash
# Install Weston Wayland Compositor...
# For Arch Linux and Manjaro:
sudo pacman -S weston

# For Other Distros:
# Check https://github.com/wayland-project/weston

# Start the Weston Wayland Compositor on our computer with the PinePhone screen dimensions
weston --width=720 --height=1398 &

# Run the Wayland EGL app
./egl
```

This uses the [__Weston Compositor__](https://github.com/wayland-project/weston), the reference implementation of the Wayland Compositor that runs on X11.

We'll see this Inception-like window within a window...

![EGL App running with Wayland Weston Compositor on Pinebook Pro](https://lupyuen.github.io/images/wayland-westonegl.png)

We learn in a while how to build and run the app on PinePhone.

# Fetch Wayland Interfaces

Earlier we used the Wayland Compositor and the Wayland Shell in our app...

1. __Wayland Compositor__ (`compositor`): Manages the screen buffer used by apps

1. __Wayland Shell__ (`shell`): Manages the app windows

Here's how we fetch the two interfaces from Wayland: [`pinephone-mir/egl.c`](https://github.com/lupyuen/pinephone-mir/blob/master/egl.c#L194-L251)

```c
/// Wayland Interfaces
static struct wl_display       *display;       //  Wayland Display
static struct wl_compositor    *compositor;    //  Wayland Compositor
static struct wl_shell         *shell;         //  Wayland Shell

/// Connect to Wayland Service and fetch the interfaces for Wayland Compositor and Wayland Shell
static void get_server_references(void) {
    //  Connect to the Wayland Service
    display = wl_display_connect(NULL);
    if (display == NULL) {
        fprintf(stderr, "Failed to connect to display\n");
        exit(1);
    }

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
```

What happens inside `get_server_references()`?

1.  The Wayland Compositor runs as a Linux Service that listens on a [Linux Socket File](https://en.wikipedia.org/wiki/Unix_file_types#Socket): `/run/user/32011/wayland-0` for PinePhone on Ubuntu Touch.

    We connect to the __Wayland Service__ like so...

    ```c
    //  Connect to the Wayland Service
    display = wl_display_connect(NULL);
    ```

    Remember that all functions named `wl_...` come from the Wayland Library.

1.  To work with the Wayland Service, we fetch the Interfaces for the Wayland Compositor and Wayland Shell.

    __Wayland Interfaces__ are defined in the __Wayland Registry__...

    ```c
    //  Get the Wayland Registry
    struct wl_registry *registry = wl_display_get_registry(display);
    ```

1.  To fetch the Compositor and Shell from the Wayland Registry, we add a __Registry Listener__ (more about this later)...

    ```c
    //  Add Registry Callbacks to handle interfaces returned by Wayland Service
    wl_registry_add_listener(registry, &registry_listener, NULL);
    ```

1.  Now we __dispatch the Registry Listener request__ to the Wayland Service. (Remember that the Wayland Service operates on Linux Socket Messages)

    ```c
    //  Wait for Registry Callbacks to fetch Wayland Interfaces
    wl_display_dispatch(display);
    wl_display_roundtrip(display);
    ```

And we'll get the `compositor` and `shell` objects populated from the Wayland Registry!

If you're curious, the Registry Listener works like this: [`pinephone-mir/egl.c`](https://github.com/lupyuen/pinephone-mir/blob/master/egl.c#L194-L251)

```c
/// Callbacks for interfaces returned by Wayland Service
static const struct wl_registry_listener registry_listener = {
    global_registry_handler,
    global_registry_remover
};

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
```

`global_registry_handler()` is the Callback Function that will be triggered for every interface in the Wayland Registry. 

The Wayland Service for Ubuntu Touch `unity-system-compositor` returns a whole bunch of interesting Wayland Interfaces (like `qt_windowmanager`). 

But today we'll bind to the Compositor Interface named `wl_compositor` and Shell Interface named `wl_shell`.

And that's how we render a yellow rectangle with Wayland and OpenGL!

Let's move on to something more interesting: Rendering a simple bitmap texture...

![Rendering a simple bitmap texture with Wayland and OpenGL on PinePhone](https://lupyuen.github.io/images/wayland-egl2.jpg)

_Rendering a simple bitmap texture with Wayland and OpenGL on PinePhone_

# Render OpenGL Bitmap Texture with Wayland

The four boxes we see above are rendered from a magnified __2-pixel by 2-pixel bitmap__: [`pinephone-mir/texture.c`](https://github.com/lupyuen/pinephone-mir/blob/master/texture.c#L30-L64)

```c
// 2x2 Image, 3 bytes per pixel (R, G, B)
GLubyte pixels[4 * 3] = {
    255, 0, 0,  // Red
    0, 255, 0,  // Green
    0, 0, 255,  // Blue
    255, 255, 0 // Yellow
};
```

We render the bitmap by creating an __OpenGL Texture__: [`pinephone-mir/texture.c`](https://github.com/lupyuen/pinephone-mir/blob/master/texture.c#L30-L64)

```c
// Create a simple 2x2 texture image with four different colors
GLuint CreateSimpleTexture2D() {
    // Texture object handle
    GLuint textureId;

    // 2x2 Image, 3 bytes per pixel (R, G, B)
    GLubyte pixels[4 * 3] = {
        255, 0, 0,  // Red
        0, 255, 0,  // Green
        0, 0, 255,  // Blue
        255, 255, 0 // Yellow
    };

    // Use tightly packed data
    glPixelStorei(GL_UNPACK_ALIGNMENT, 1);

    // Generate a texture object
    glGenTextures(1, &textureId);

    // Bind the texture object
    glBindTexture(GL_TEXTURE_2D, textureId);

    // Load the texture
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, 2, 2, 0, GL_RGB, GL_UNSIGNED_BYTE, pixels);

    // Set the filtering mode
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    return textureId;
}
```

(Not the most efficient way to render a bitmap... But let's try this and test drive PinePhone's GPU!)

This is the usual way we create an OpenGL Texture, as explained in ["OpenGL® ES 3.0 Programming Guide"](http://www.opengles-book.com/).

Here comes the tricky part... Before rendering the OpenGL Texture, we need to program the __GPU Shaders__ on PinePhone with a C-like language: [`pinephone-mir/texture.c`](https://github.com/lupyuen/pinephone-mir/blob/master/texture.c#L66-L93)

```c
// Initialize the shader and program object
int Init(ESContext *esContext) {
    esContext->userData = malloc(sizeof(UserData));
    UserData *userData = esContext->userData;
    GLbyte vShaderStr[] =
        "attribute vec4 a_position;   \n"
        "attribute vec2 a_texCoord;   \n"
        "varying vec2 v_texCoord;     \n"
        "void main()                  \n"
        "{                            \n"
        "   gl_Position = a_position; \n"
        "   v_texCoord = a_texCoord;  \n"
        "}                            \n";

    GLbyte fShaderStr[] =
        "precision mediump float;                            \n"
        "varying vec2 v_texCoord;                            \n"
        "uniform sampler2D s_texture;                        \n"
        "void main()                                         \n"
        "{                                                   \n"
        "  gl_FragColor = texture2D( s_texture, v_texCoord );\n"
        "}                                                   \n";

    // Load the shaders and get a linked program object
    userData->programObject = esLoadProgram(vShaderStr, fShaderStr);
    ...
```

(Yep a C program within a C program... Inception!)

`esLoadProgram()` is defined in [`pinephone-mir/shader.c`](https://github.com/lupyuen/pinephone-mir/blob/master/shader.c)

We're now talking to PinePhone's GPU, which is so low-level that it understand only Triangles, not Rectangles.

Hence to render the OpenGL Texture, we map the Rectangular Texture onto two Triangles and render them: [`pinephone-mir/texture.c`](https://github.com/lupyuen/pinephone-mir/blob/master/texture.c#L109-L130)

```c
// Draw a triangle using the shader pair created in Init()
void Draw(ESContext *esContext) {
    GLfloat vVertices[] = {
        -0.5f,   0.5f,  0.0f,  // Position 0
         0.0f,   0.0f,         // TexCoord 0
        -0.5f,  -0.5f,  0.0f,  // Position 1
         0.0f,   1.0f,         // TexCoord 1
         0.5f,  -0.5f,  0.0f,  // Position 2
         1.0f,   1.0f,         // TexCoord 2
         0.5f,   0.5f,  0.0f,  // Position 3
         1.0f,   0.0f          // TexCoord 3
    };
    GLushort indices[] = {
        0, 1, 2,  //  First Triangle
        0, 2, 3   //  Second Triangle
    };
    ...
    //  Draw the 6 vertices as 2 triangles
    glDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_SHORT, indices);
}
```

(Yes the math is starting to hurt... But that's the end of it!)

Finally we connect the above code to render the four colour boxes on PinePhone, thanks to Wayland and OpenGL: [pinephone-mir/egl2.c](https://github.com/lupyuen/pinephone-mir/blob/master/egl2.c#L51-L67)

```c
/// Render the OpenGL ES2 display
static void render_display() {
    //  Create the texture context
    static ESContext esContext;
    esInitContext ( &esContext );
    esContext.width  = WIDTH;
    esContext.height = HEIGHT;

    //  Draw the texture
    Init(&esContext);
    Draw(&esContext);

    //  Render now
    glFlush();
}
```

And that's [our Wayland App](https://github.com/lupyuen/pinephone-mir/blob/master/egl2.c) that renders a simple OpenGL Bitmap Texture!

The OpenGL Texture code in this article was adapted from ["OpenGL® ES 2.0 Programming Guide"](https://github.com/danginsburg/opengles-book-samples)

Let's head on towards greatness and something really useful: Graphical User Interfaces...

![Button rendered with LVGL and Wayland on PinePhone](https://lupyuen.github.io/images/wayland-button.jpg)

_Button rendered with LVGL and Wayland on PinePhone_

# LVGL Toolkit for Graphical User Interfaces

Now that we can render bitmaps on PinePhone, let's think...

_How would we render a simple Graphical User Interface (GUI) on PinePhone, like the button above?_

Why don't we use a simple GUI Toolkit like [__LVGL__](https://lvgl.io/)? (Formerly LittleVGL)

Here's how we call the LVGL library to render that button: [`lvgl-wayland/wayland/lvgl.c`](https://github.com/lupyuen/lvgl-wayland/blob/master/wayland/lvgl.c#L54-L64)

```c
#include "../lvgl.h"

/// Render a Button Widget and a Label Widget
static void render_widgets(void) {
    lv_obj_t * btn = lv_btn_create(lv_scr_act(), NULL);     //  Add a button the current screen
    lv_obj_set_pos(btn, 10, 10);                            //  Set its position
    lv_obj_set_size(btn, 120, 50);                          //  Set its size

    lv_obj_t * label = lv_label_create(btn, NULL);          //  Add a label to the button
    lv_label_set_text(label, "Button");                     //  Set the labels text
}
```

_Easy peasy!_

LVGL is a simple C toolkit designed for Embedded Devices, so it needs __very little memory and processing power__.  LVGL is __self-contained__... Fonts and icons are bundled into the LVGL library.

It's used on [__PineTime Smart Watch__](https://github.com/JF002/Pinetime) to render watch faces.

_LVGL doesn't run on Wayland yet... But we'll fix that!_

Remember how we rendered a simple 2-pixel by 2-pixel bitmap by creating an OpenGL Texture with `CreateSimpleTexture2D()`?

Let's extend that bitmap to cover the entire PinePhone screen: 720 pixels by 1398 pixels.

And we create the OpenGL Texture for the entire PinePhone screen like so: [`lvgl-wayland/wayland/texture.c`](https://github.com/lupyuen/lvgl-wayland/blob/master/wayland/texture.c#L38-L72)

```c
///  PinePhone Screen Resolution, defined in lv_conf.h
#define LV_HOR_RES_MAX          (720)
#define LV_VER_RES_MAX          (1398)
#define LV_SCALE_RES            1

///  Screen buffer 
#define BYTES_PER_PIXEL 3
GLubyte pixels[LV_HOR_RES_MAX * LV_VER_RES_MAX * BYTES_PER_PIXEL];

/// Create an OpenGL Texture for the screen buffer
GLuint CreateTexture(void) {
    GLuint texId;
    glGenTextures ( 1, &texId );
    glBindTexture ( GL_TEXTURE_2D, texId );

    glTexImage2D (
        GL_TEXTURE_2D, 
        0,  //  Level
        GL_RGB, 
        LV_HOR_RES_MAX,  //  Width
        LV_VER_RES_MAX,  //  Height 
        0,  //  Format 
        GL_RGB, 
        GL_UNSIGNED_BYTE, 
        pixels 
    );
    glTexParameteri ( GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR );
    glTexParameteri ( GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR );
    glTexParameteri ( GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE );
    glTexParameteri ( GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE );
    return texId;
}
```

`pixels` is the screen buffer that will contain the pixels for our rendered UI controls, like our button.

We'll tell LVGL to render into `pixels` like so: [`lvgl-wayland/wayland/texture.c`](https://github.com/lupyuen/lvgl-wayland/blob/master/wayland/texture.c#L38-L72)

```c
/// Set the colour of a pixel in the screen buffer
void put_px(uint16_t x, uint16_t y, uint8_t r, uint8_t g, uint8_t b, uint8_t a) {
    assert(x >= 0); assert(x < LV_HOR_RES_MAX);
    assert(y >= 0); assert(y < LV_VER_RES_MAX);
    int i = (y * LV_HOR_RES_MAX * BYTES_PER_PIXEL) + (x * BYTES_PER_PIXEL);
    pixels[i++] = r;  //  Red
    pixels[i++] = g;  //  Green
    pixels[i++] = b;  //  Blue
}
```

(Simplistic, not efficient though)

We'll render the OpenGL Texture the same way as before: [`lvgl-wayland/wayland/lvgl.c`](https://github.com/lupyuen/lvgl-wayland/blob/master/wayland/lvgl.c#L65-L93)

```c
/// Render the OpenGL ES2 display
static void render_display() {
    //  This part is new...

    //  Init the LVGL display
    lv_init();
    lv_port_disp_init();

    //  Create the LVGL widgets: Button and label
    render_widgets();

    //  Render the LVGL widgets
    lv_task_handler();

    //  This part is the same as before...

    //  Create the texture context
    static ESContext esContext;
    esInitContext ( &esContext );
    esContext.width  = WIDTH;
    esContext.height = HEIGHT;

    //   Draw the texture
    Init(&esContext);
    Draw(&esContext);

    //  Render now
    glFlush();
}
```

But now we have injected the calls to the LVGL library...

1. [__`lv_init()`__](https://docs.lvgl.io/latest/en/html/widgets/obj.html?highlight=lv_init#_CPPv47lv_initv): Initialise the LVGL library

1. [__`lv_port_disp_init()`__](https://github.com/lupyuen/lvgl-wayland/blob/72b0273d6c609ecb51142ee400f545116ca0ecd9/wayland/lv_port_disp.c#L48-L126): Initialise our display

1. [__`render_widgets()`__](https://github.com/lupyuen/lvgl-wayland/blob/master/wayland/lvgl.c#L54-L64): Calls the LVGL library to create two UI controls: a Button and a Label

1. [__`lv_task_handler()`__](https://docs.lvgl.io/latest/en/html/porting/task-handler.html?highlight=lv_task_handler): Let LVGL render the UI controls into our screen buffer

Now let's tweak the LVGL library to render UI controls into our screen buffer `pixels`

# Port LVGL to Wayland

Porting LVGL to Wayland and Ubuntu Touch is straightforward.

According to the [LVGL Porting Doc](https://docs.lvgl.io/latest/en/html/porting/display.html), we need to code a Flush Callback Function `disp_flush()` that will be called by LVGL to render UI controls to the screen buffer.

Here's our implementation for Wayland: [`lvgl-wayland/wayland/lv_port_disp.c`](https://github.com/lupyuen/lvgl-wayland/blob/master/wayland/lv_port_disp.c#L142-L167)

```c
//  Flush the content of the internal buffer to the specific area on the display
//  You can use DMA or any hardware acceleration to do this operation in the background but
//  'lv_disp_flush_ready()' has to be called when finished.
static void disp_flush(lv_disp_drv_t * disp_drv, const lv_area_t * area, lv_color_t * color_p) {
    //  The most simple case (but also the slowest) to put all pixels to the screen one-by-one
    for(int32_t y = area->y1; y <= area->y2; y++) {
        for(int32_t x = area->x1; x <= area->x2; x++) {
            //  Put a pixel to the screen buffer
            put_px(x, y, 
                color_p->ch.red, 
                color_p->ch.green, 
                color_p->ch.blue, 
                0xff);
            color_p++;
        }
    }
    //  Inform the graphics library that we are ready with the flushing
    lv_disp_flush_ready(disp_drv);
}
```

We've seen earlier that `put_px()` draws pixels in the simplest way possible.  Eventually we should use PinePhone's GPU for rendering LVGL controls, by implementing the [LVGL GPU Callbacks](https://docs.lvgl.io/latest/en/html/porting/display.html#display-driver).

Light and Dark Themes are provided by LVGL. To select the default theme just edit [`lvgl-wayland/lv_conf.h`](https://github.com/lupyuen/lvgl-wayland/blob/master/lv_conf.h#L444-L446)

Here's Dark Theme...

```c
//  For Dark Theme...
#define LV_THEME_DEFAULT_FLAG LV_THEME_MATERIAL_FLAG_DARK
```

![LVGL Dark Theme with Wayland on PinePhone](https://lupyuen.github.io/images/wayland-dark.jpg)

And Light Theme...

```c
//  For Light Theme...
#define LV_THEME_DEFAULT_FLAG LV_THEME_MATERIAL_FLAG_LIGHT
```

![LVGL Light Theme with Wayland on PinePhone](https://lupyuen.github.io/images/wayland-light.jpg)

The screens above were rendered by updating one line in [`lvgl-wayland/wayland/lvgl.c`](https://github.com/lupyuen/lvgl-wayland/blob/master/wayland/lvgl.c#L65-L76)...

```c
/// Render the OpenGL ES2 display
static void render_display() {
    //  Init the LVGL display
    lv_init();
    lv_port_disp_init();

    //  Create the LVGL widgets
    lv_demo_widgets();  //  Previously render_widgets()
```

`lv_demo_widgets()` comes from [`lvgl-wayland/demo/lv_demo_widgets.c`](https://github.com/lupyuen/lvgl-wayland/blob/master/demo/lv_demo_widgets.c)

_What about Touch Input in LVGL for Ubuntu Touch?_

We haven't handled Touch Input yet... Lemme know if you're keen to help!

_Do we really have to code LVGL Apps for PinePhone in C?_

Rust is supported too! 

We may write LVGL Apps for PinePhone in Rust by calling the [__`lvgl-rs` Rust Wrapper for LVGL__](https://github.com/rafaelcaricio/lvgl-rs) by [__Rafael Carício__](https://github.com/rafaelcaricio).

(Fun Fact: `lvgl-rs` was [originally created](https://lupyuen.github.io/PineTime-apps/articles/watch_face) for PineTime Smart Watch... Today it's used by [Rust on PlayStation Portable](https://twitter.com/rafaelcaricio/status/1271886471260184577?s=20) too!)

![Size of LVGL Demo App on PinePhone with Ubuntu Touch](https://lupyuen.github.io/images/wayland-size.jpg)

_How small is LVGL on PinePhone with Ubuntu Touch?_

__1.5 MB__ for the Light / Dark Theme LVGL Demo App above.

Not that big, considering that the font, icons and debugging symbols are bundled inside.

_How does LVGL compare with Qt, GTK and SDL on PinePhone with Ubuntu Touch?_

Qt is the only officially supported App Toolkit on Ubuntu Touch. 

GTK and SDL are supposed to work on Wayland... But I couldn't get them to work on Ubuntu Touch. 

(Probably because legacy X11 compatibility is missing from Ubuntu Touch, i.e. XWayland)

I applaud the maintainers of X11, Qt, GTK and SDL because every new release needs to support so many legacy features. Kudos!

But what if we could start from scratch, drop the legacy stuff, and build a simpler UI toolkit for Wayland?

_LVGL is the experiment that we're undertaking today!_

# Build LVGL on PinePhone with Ubuntu Touch

Follow these steps to build LVGL on PinePhone over SSH.

(If we haven't enabled SSH on PinePhone, check the "Configure SSH on PinePhone" instructions below)

Connect to PinePhone over SSH and enter these commands...

```bash
# Make system folders writeable before installing any packages
sudo mount -o remount,rw /

# Install dev tools and GLES2 library
sudo apt install gcc gdb git make libgles2-mesa-dev

# Download the source code
cd ~
git clone https://github.com/lupyuen/lvgl-wayland
cd lvgl-wayland

# Build the app
make
```

This creates the executable `~/lvgl-wayland/wayland/lvgl`

_Can we just run `lvgl` from the Terminal Command Line?_

Nope! Because Wayland and Ubuntu Touch are super-secure, thanks to [__AppArmor__](https://en.wikipedia.org/wiki/AppArmor#:~:text=AppArmor%20(%22Application%20Armor%22),execute%20files%20on%20matching%20paths.).

But there's a way to trick AppArmor into allowing `lvgl` to be launched (since we are Superuser). 

Read on to learn how...

![Fighting AppArmor Security... Permission Denied!](https://lupyuen.github.io/images/wayland-apparmor.jpg)

_Fighting AppArmor Security... Permission Denied!_

# Inject LVGL into File Manager App

For rapid testing (and to work around AppArmor), we shall replace the __File Manager__ app by our `lvgl` app because __File Manager has no AppArmor restrictions__ (Unconfined).

(More about AppArmor in a while)

Connect to PinePhone over SSH and enter these commands...

```bash
# Make system folders writeable and go to File Manager Click Package folder
sudo mount -o remount,rw /
cd /usr/share/click/preinstalled/.click/users/@all/com.ubuntu.filemanager

# Back up the desktop file. Restore this desktop file to go back to the normal File Manager
sudo cp com.ubuntu.filemanager.desktop com.ubuntu.filemanager.desktop.old

# Edit the desktop file
sudo nano com.ubuntu.filemanager.desktop 
```

We're now altering the behaviour of File Manager, by tampering with the [__Click Package__](https://click.readthedocs.io/en/latest/) settings for File Manager.

(Why are we tampering with a Click Package? We'll learn in a while)

Change the `Exec` line from...

```
Exec=filemanager
```

To...

```
Exec=./run.sh
```

Save and exit `nano`

We have modded the File Manager icon so that it now launches `run.sh` instead of the usual `filemanager` executable.

(It's like switching the executable for a Windows Explorer Shortcut)

We'll be installing `run.sh` later with a script: [`lvgl.sh`](https://github.com/lupyuen/lvgl-wayland/blob/master/wayland/lvgl.sh)

In the meantime, check that [`run.sh`](https://github.com/lupyuen/lvgl-wayland/blob/master/wayland/run.sh) (located at `~/lvgl-wayland/wayland`) contains the following...

```bash
# Log Wayland messages
export WAYLAND_DEBUG=1

# Run lvgl app
./lvgl
```

If we see this...

```bash
# Debug lvgl app
gdb \
    -ex="r" \
    -ex="bt" \
    -ex="frame" \
    --args ./lvgl
```

It means that the `lvgl` app will be started with the `gdb` debugger.

If it crashes with a bad C pointer, the `gdb` debugger will show a helpful stack trace.

And this...

```bash
# Run lvgl app with strace
./strace \
   -s 1024 \
   ./lvgl
```

Is for tracing the `lvgl` app with `strace`. It shows __everything__ done by the app.

[Check out this `strace` log for the File Manager on Ubuntu Touch](https://github.com/lupyuen/pinephone-mir/blob/090630777782a5f4b283af84c747b9ad6c703e22/logs/filemanager-strace.log#L724)

# Run LVGL on PinePhone with Ubuntu Touch

Finally we're ready to run our `lvgl` app! 

Connect to PinePhone over SSH and enter these commands...

```bash
cd ~/lvgl-wayland
./wayland/lvgl.sh
```

The script [`lvgl.sh`](https://github.com/lupyuen/lvgl-wayland/blob/master/wayland/lvgl.sh) copies [`run.sh`](https://github.com/lupyuen/lvgl-wayland/blob/master/wayland/run.sh) from `~/lvgl-wayland/wayland` to the Click Package Folder for File Manager...

```
/usr/share/click/preinstalled/.click/users/@all/com.ubuntu.filemanager
```

In a few seconds we'll see the message...

```
*** Tap on File Manager icon on PinePhone
```

Go ahead and tap the File Manager icon on PinePhone. 

Our LVGL App shall run instead of the File Manager.

In the SSH console, press `Ctrl-C` to stop the log display.

The log file for the app is located at...

```
/home/phablet/.cache/upstart/application-click-com.ubuntu.filemanager_filemanager_0.7.5.log
```

The log for the Wayland Compositor `unity-system-compositor` may be useful for troubleshooting...

```
/home/phablet/.cache/upstart/unity8.log
```

Copy the log files to our machine like this...

```bash
scp -i ~/.ssh/pinephone_rsa phablet@192.168.1.160:/home/phablet/.cache/upstart/application-click-com.ubuntu.filemanager_filemanager_0.7.5.log .
scp -i ~/.ssh/pinephone_rsa phablet@192.168.1.160:/home/phablet/.cache/upstart/unity8.log .
```

# Overcome AppArmor Security on Ubuntu Touch

TODO

https://github.com/lupyuen/lvgl-wayland/wayland/lvgl.sh

```bash
# Kill the app if it's already running
pkill lvgl

# Make system folders writeable
sudo mount -o remount,rw /

# Copy app to File Manager folder
cd wayland
sudo cp lvgl /usr/share/click/preinstalled/.click/users/@all/com.ubuntu.filemanager
sudo chown clickpkg:clickpkg /usr/share/click/preinstalled/.click/users/@all/com.ubuntu.filemanager/lvgl
ls -l /usr/share/click/preinstalled/.click/users/@all/com.ubuntu.filemanager/lvgl

# Copy run script to File Manager folder
# TODO: Check that run.sh contains "./lvgl"
sudo cp run.sh /usr/share/click/preinstalled/.click/users/@all/com.ubuntu.filemanager

# Start the File Manager
echo "*** Tap on File Manager icon on PinePhone"

# Monitor the log file
echo >/home/phablet/.cache/upstart/application-click-com.ubuntu.filemanager_filemanager_0.7.5.log
tail -f /home/phablet/.cache/upstart/application-click-com.ubuntu.filemanager_filemanager_0.7.5.log

# Press Ctrl-C to stop. To kill the app:
# pkill lvgl
```

# Configure SSH on PinePhone

__First Thing__ to do when we get our new PinePhone: __Remove the Battery Insulation Sticker!__

(Can't believe I missed that!)

__Second Thing__: Protect the SSH Service on PinePhone with __SSH Keys__. And start the SSH Service only when necessary.

Here's how...

## Generate SSH Keys

1.  On our Computer (not PinePhone), open a Command Prompt. Enter this (and fill in our email)...

    ```bash
    ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
    ```

1.  When prompted...

    ```
    Enter a file in which to save the key
    ```
    
    Press `Enter`. This stores the new SSH Key in the `.ssh` folder in our Home Directory.

1.  When prompted...

    ```
    Enter a file in which to save the key
    ```
    
    Enter...
    
    ```
    pinephone_rsa
    ```

    We'll create an SSH Key Pair named `pinephone_rsa` (Private Key) and `pinephone_rsa.pub` (Public Key)

1.  When prompted...

    ```
    Enter passphrase
    ```
    
    Press `Enter`. We won't need a passphrase unless our PinePhone needs to be super-secure.

This creates an SSH Key Pair in the `.ssh` folder in our Home Directory...

- `pinephone_rsa` contains the Private Key. Never give the Private Key to others!

- `pinephone_rsa.pub` contains the Public Key. We'll copy this to PinePhone now.

([Adapted from this doc](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key
))

## Install SSH Keys

1.  Copy `pinephone_rsa.pub` from the `.ssh` folder in our Home Directory to a MicroSD Card.

1.  Insert the MicroSD Card into PinePhone. Copy `pinephone_rsa.pub` to our Home Directory on PinePhone.

    (Check the section "Copy Files from MicroSD Card on PinePhone" below)

1.  Tap the Terminal icon on PinePhone. Enter...

    ```bash
    # Go to home directory
    cd

    # If .ssh folder doesn't exist, create it
    mkdir .ssh
    chmod 700 .ssh

    # Set public key as the authorized key
    cp pinephone_rsa.pub .ssh/authorized_keys
    chmod 600 .ssh/authorized_keys

    # Show the SSH files
    ls -la ~/.ssh
    ```

    We should see this...

    ```
    drwx------  2 phablet phablet 4096 Jul  7 20:06 .
    drwxr-xr-x 28 phablet phablet 4096 Jul 24 11:38 ..
    -rw-------  1 phablet phablet  743 Jul  7 20:08 authorized_keys
    ```

    Check that the permissions (`rw`) and owner (`phablet`) are correct.

## Start SSH Service

To start the SSH Service on PinePhone, open the Terminal app.

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

(Or download the file from [`lvgl-wayland/a`](https://github.com/lupyuen/lvgl-wayland/blob/master/a) and copy via a MicroSD Card. Check the next section for instructions.)

When we're ready do coding on PinePhone, enter this at the Terminal command line...

```bash
. a 
```

(There's a space between "`.`" and "`a`")

The script starts the SSH Service and displays the IP address for PinePhone...

![Starting SSH Service on PinePhone](https://lupyuen.github.io/images/wayland-ssh.jpg)

From our Computer, we'll connect to PinePhone at the IP adddress indicated by `inet addr`, say `192.168.1.160`...

```bash
ssh -i ~/.ssh/pinephone_rsa phablet@192.168.1.160
```

And that's how we access PinePhone via SSH!

When we press PinePhone's power button to switch off PinePhone, we'll see ths amusing message from olden times...

![Powering off PinePhone](https://lupyuen.github.io/images/wayland-halt.jpg)

If typing on a touch keyboard is not your thing, try copying the files from a MicroSD card...

![MicroSD Card in PinePhone](https://lupyuen.github.io/images/wayland-sd.jpg)

# Copy Files from MicroSD Card on PinePhone

It's useful to transfer files to PinePhone via MicroSD Card, like SSH Keys and the SSH Script `a` above.

(Sadly PinePhone on Ubuntu Touch doesn't allow receiving files over Bluetooth)

The MicroSD card on PinePhone doesn't appear in the File Manager unless we mount it.

Tap the Terminal icon on PinePhone and enter the following...

```bash
ls -l /dev/disk/by-label
```

We should see something like this...

```
lrwxrwxrwx 1 root root 15 Jul 23 22:24 BOOT_MNJRO -> ../../mmcblk0p1
lrwxrwxrwx 1 root root 15 Jul 23 22:24 cache -> ../../mmcblk2p8
lrwxrwxrwx 1 root root 15 Jul 23 22:24 ROOT_MNJRO -> ../../mmcblk0p2
lrwxrwxrwx 1 root root 16 Jul 23 22:24 userdata -> ../../mmcblk2p10
```

These are the Partition Labels on our MicroSD Card. 

Let's say we wish to mount the MicroSD Card partition `ROOT_MNJRO`, which links to `/dev/mmcblk0p2`...

```bash
mkdir /tmp/sdcard
sudo mount /dev/mmcblk0p2 /tmp/sdcard
ls -l /tmp/sdcard
```

(If we don't see our Patition Label, try mounting the numbered partitions anyway: `/dev/mmcblk0p1`, `p2`, `p3`, ...)

We should see the contents of our MicroSD Card.

The MicroSD Card will now appear in File Manager as `/tmp/sdcard`, ready for us to copy the files.

Or just copy files from the Command Line like so...

```bash
cp /tmp/sdcard/a ~
```

When we're done, unmount our MicroSD Card...

```bash
sudo umount /tmp/sdcard
```

![PinePhone Wayland App tested on Pinebook Pro](https://lupyuen.github.io/images/wayland-weston.png)

# Build and Test PinePhone Wayland Apps on Pinebook Pro

Here's how we can build and test PinePhone Wayland Apps on Pinebook Pro...

```bash
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
