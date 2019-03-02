Red/System[]

#include %draw_tests_tool.reds

;==== box
draw-test-box: func [
	dc	[draw-ctx!]
][
	OS-draw-fill-pen dc rgba-to-int 255 0 0 128  no no	
	OS-draw-pen dc rgba-to-int 0 255 0 0 no no
	OS2-draw-box dc -1 10.0 10.0 100.0 100.0
]
id-draw-test "box" as integer! :draw-test-box 

;==== triangle
draw-test-triangle: func [
	dc	[draw-ctx!]
][
	OS-draw-fill-pen dc rgba-to-int 0 255 0 128  no no	
	OS-draw-pen dc rgba-to-int 255 0 0 0 no no
	OS2-draw-triangle dc 10.0 10.0 100.0 100.0 50.0 10.0
]
id-draw-test "triangle" as integer! :draw-test-triangle 

;==== line
draw-test-line: func [
	dc	[draw-ctx!]
][
	OS-draw-fill-pen dc rgba-to-int 0 255 0 128  no no	
	OS-draw-pen dc rgba-to-int 255 0 0 0 no no
	OS2-draw-line [dc 10 10 100 100 50 10]
]
id-draw-test "line" as integer! :draw-test-line 

;==== polygon
draw-test-polygon: func [
	dc	[draw-ctx!]
][
	OS-draw-fill-pen dc rgba-to-int 0 255 0 128  no no	
	OS-draw-pen dc rgba-to-int 255 0 0 0 no no
	OS2-draw-polygon [dc 10 10  100 10 100 100 50 150 10 100 ]
]
id-draw-test "polygon" as integer! :draw-test-polygon 

 