Red/System[]

#include %draw_tests_tool.reds

;;;; Test 

draw-test-simple: func [
	dc	[draw-ctx!]
][
	OS-draw-fill-pen dc rgba-to-int 255 0 0 128  no no	
	OS-draw-pen dc rgba-to-int 0 255 0 0 no no
	CR-draw-box dc -1 10.0 10.0 100.0 100.0
]

id-draw-simple: draw-test as integer! :draw-test-simple 

draw-test-simple2: func [
	dc	[draw-ctx!]
][
	OS-draw-fill-pen dc rgba-to-int 0 255 0 128  no no	
	OS-draw-pen dc rgba-to-int 255 0 0 0 no no
	CR-draw-box dc -1 10.0 10.0 100.0 100.0
]

id-draw-simple2: draw-test as integer! :draw-test-simple2 
