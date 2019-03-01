Red/System[]

#include %draw_tests_tool.reds

draw-test-box: func [
	dc	[draw-ctx!]
][
	OS-draw-fill-pen dc rgba-to-int 255 0 0 128  no no	
	OS-draw-pen dc rgba-to-int 0 255 0 0 no no
	OS2-draw-box dc -1 10.0 10.0 100.0 100.0
]

id-draw-test "box" draw-test as integer! :draw-test-box 

draw-test-triangle: func [
	dc	[draw-ctx!]
][
	OS-draw-fill-pen dc rgba-to-int 0 255 0 128  no no	
	OS-draw-pen dc rgba-to-int 255 0 0 0 no no
	OS2-draw-triangle dc 10.0 10.0 100.0 100.0 50.0 10.0
]

id-draw-test "triangle" draw-test as integer! :draw-test-triangle 
