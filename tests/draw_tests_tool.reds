Red/System[]

#include %../include/tests_tool.reds

;============= Draw Tests Tools ===============
nbmax-tests-draw: 100 nb-tests-draw: -1
tests-draw: as int-ptr! allocate (size? integer!) * nbmax-tests-draw

draw-test: func [
	test 	[integer!]
	return:	[integer!]
	/local 
		tests [int-ptr!]
		ids	  [int-ptr!]
][
	nb-tests-draw: nb-tests-draw + 1 
	tests: tests-draw + nb-tests-draw
	tests/value: test
	nb-tests-draw
]

draw-test?: func [dc [draw-ctx!] ind [integer!] /local test [int-ptr!]][
	test: tests-draw + ind
	call-draw-test as int-ptr! test/value dc
]
