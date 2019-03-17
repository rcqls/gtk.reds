# gtk.reds

As I think `julia` was clever to have named its package with extension `.jl` which is really easy to find on internet, I do the same for this preliminary package. `gtk.reds` is then a plugin of `gtk` for `red/system`.


## Red-like mode

The red-like mode is useful to debug `red/GTK` branch since the goal is to be the nearest of how red works in the View dialect (not VID one). 

```
Red/System[]

#include %../../gtk3-red-like.reds

hello: func[[cdecl] widget [handle!]/local w [integer!] h [integer!]] [
	w: -1 h: -1
	gtk_widget_get_size_request widget :w :h
	print ["Hello World: " w "x" h " vs " gtk_widget_get_allocated_width widget "x" gtk_widget_get_allocated_height widget lf]
]

gtk/size 300 300 ; default is 800x600

gtk/begin

win: make-face window null "test" 0 0 400 300 
pan: make-face panel win "panel" 100 100 500 200 
but: make-face button pan "Hello World" 0 0 120 40 
 
gobj_signal_connect(but/widget "clicked" :hello  null)

gtk/end
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
