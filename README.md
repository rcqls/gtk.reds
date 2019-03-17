# gtk.reds

As I think `julia` was clever to have named its package with extension `.jl` which is really easy to find on internet, I do the same for this preliminary package. `gtk.reds` is then a plugin of `gtk` for `red/system`.

## (View) red-like mode

The (view) red-like mode is useful to debug `red/GTK` branch since the goal is to be the nearest of how red works in the View dialect (not the VID one). 

The following code (see `tests/gtk3/gtk-red-like-hello.reds`)

```
Red/System[]

#include %../../gtk3-red-like.reds

gtk/size 300 300 ; default is 800x600

gtk/begin

; GUI
win: make-face window null "test" 0 0 400 300 
pan: make-face panel win "panel" 100 100 500 200 
but: make-face button pan "Hello World" 0 0 120 40 

; SIGNAL (Connection)
hello: func[[cdecl] widget [handle!]/local w [integer!] h [integer!]] [
	w: -1 h: -1
	gtk_widget_get_size_request widget :w :h
	print ["Hello World: " w "x" h " vs " gtk_widget_get_allocated_width widget "x" gtk_widget_get_allocated_height widget lf]
]

face-signal(but "clicked" :hello  null)

gtk/end
```

## Gtk mode

The following `examples/hello.reds` file expresses the `gtk.reds` plugin following the regular gtk mode. It is clearly more verbose than the previous red-like mode. However, it is not limited to the red-view spirit.

```
Red/System[]

#include %../gtk3.reds

hello: func[[cdecl]] [
	print ["Hello World" lf]
]

destroy: func[[cdecl]][
  gtk_main_quit
]

window: as handle! 0
button: as handle! 0

gtk_init null null 

window:  gtk_window_new 0
gobj_signal_connect(window "destroy" :destroy null)
; gtk_container_border_width (GTK_CONTAINER (window), 10);

button: gtk_button_new_with_label "Hello World"

  gobj_signal_connect(button "clicked" :hello  null)
  ;gtk_signal_connect_object (GTK_OBJECT (button) "clicked",
  ;			     GTK_SIGNAL_FUNC (gtk_widget_destroy),
  ;			     GTK_OBJECT (window))
  gtk_container_add window button
  gtk_widget_show button

  gtk_widget_show window

  gtk_main
```




## How to use it

### simple use case

```
red -c examples/hello.reds
```

### devel use case

```
gtk-reds tests/gtk3/gtk-red-like-hello.reds
```

to cross-compile (for Linux) and copy the binary file in `~/Github/gtk-reds/bin/`

## Powerfull red/system

As `red/system` offers natively what other languages call `ffi`, it is very simple to create a red/system plugin. Actually, this one is nothing else than the two main files in the `red/red:GTK` branch used to connect gtk library to `red`.

## Cross-compilation

More simple than the following ?
```
red -t Linux -c examples/hello.reds
```
Just specify your architecture with the `-t` option.


## Comments

`red` from now requires i386 architecture. Also to mention that on `macOS`, I can't find a gtk libray for x86. However for Windows, Linux, RPI... this library is available and then this plugin is fully useable.
