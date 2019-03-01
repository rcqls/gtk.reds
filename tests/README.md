## Test

### Adding a test

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

First compile `examples/do_draw.reds` for linux (and from macOS for me):
```
red -c -t Linux -o ~/.RedGTK/do_draw  do_draw.reds
```

inside docker (after executing `docker-red`):

```
.RedGTK/do_draw box
```

`box` can then be replaced with any other declared id associated to a draw test function.