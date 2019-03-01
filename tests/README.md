## Test

The goal is here to provide some tools very similar of the `gtk3/draw.reds` used in the `red/GTK` branch. The compilation time is 1 seconde when it lasts  1 minute for compiling `console-view.red`. This make easier to develop the `red/GTK` branch. 

### Adding a test for draw dialect (with cairo) 

Inside `tests/draw_cairo_tests.reds`, add the test function and declare it as follows for the particular case of "box":

```
;==== box
draw-test-box: func [
	dc	[draw-ctx!]
][
	OS-draw-fill-pen dc rgba-to-int 255 0 0 128  no no	
	OS-draw-pen dc rgba-to-int 0 255 0 0 no no
	OS2-draw-box dc -1 10.0 10.0 100.0 100.0
]
id-draw-test "box" as integer! :draw-test-box 
```

### Use it 

First compile `tests/draw_cairo.reds` for linux (and from macOS for me):
```
red -c -t Linux -o ~/.RedGTK/draw_cairo  draw_cairo.reds
```

inside docker (after executing `docker-red`):

```
.RedGTK/draw_cairo box
```

`box` can then be replaced with any other declared id associated to a draw test function.