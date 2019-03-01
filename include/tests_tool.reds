Red/System[]
;; This was proposed by @9214 on Red/GTK room

test-draw!: alias function! [
    dc	[draw-ctx!]
]

call-draw-test: func [
    test-ptr [int-ptr!]
	dc		 [draw-ctx!]
    /local
        test-draw [test-draw!]
][
    test-draw: as test-draw! test-ptr
    test-draw dc
]

