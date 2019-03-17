# gtk.reds

As I think `julia` was clever to have named its package with extension `.jl` which is really easy to find on internet, I do the same for this preliminary package. `gtk.reds` is then a plugin of `gtk` for `red/system`.


## How to use it

```
red -c examples/hello.reds
```

or

```
gtk-reds tests/gtk3/gtk-red-like-tests.reds
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
