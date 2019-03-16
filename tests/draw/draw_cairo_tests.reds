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

;==== circle
draw-test-circle: func [
	dc	[draw-ctx!]
][
	OS-draw-fill-pen dc rgba-to-int 0 255 0 128  no no	
	OS-draw-pen dc rgba-to-int 255 0 0 0 no no
	OS2-draw-circle dc 100 100  30 30 no
]
id-draw-test "circle" as integer! :draw-test-circle 

;==== circle2
draw-test-circle2: func [
	dc	[draw-ctx!]
][
	OS-draw-fill-pen dc rgba-to-int 0 255 0 128  no no	
	OS-draw-pen dc rgba-to-int 255 0 0 0 no no
	OS2-draw-circle dc 100 100  30 20 no
]
id-draw-test "circle2" as integer! :draw-test-circle2 

;==== circle3
draw-test-circle3: func [
	dc	[draw-ctx!]
][
	OS-draw-fill-pen dc rgba-to-int 0 255 0 128  no no	
	OS-draw-pen dc rgba-to-int 255 0 0 0 no no
	OS2-draw-circle dc 100 100  30 20 yes
]
id-draw-test "circle3" as integer! :draw-test-circle3 

;==== ellipse
draw-test-ellipse: func [
	dc	[draw-ctx!]
][
	OS-draw-fill-pen dc rgba-to-int 0 255 0 128  no no	
	OS-draw-pen dc rgba-to-int 255 0 0 0 no no
	OS2-draw-ellipse dc 50 50  50 100
]
id-draw-test "ellipse" as integer! :draw-test-ellipse 

;==== arc
draw-test-arc: func [
	dc	[draw-ctx!]
][
	OS-draw-fill-pen dc rgba-to-int 0 255 0 128  no no	
	OS-draw-pen dc rgba-to-int 255 0 0 0 no no
	OS2-draw-arc dc 100 100 80 80 0 90 yes  
]
id-draw-test "arc" as integer! :draw-test-arc

;==== arc2
draw-test-arc2: func [
	dc	[draw-ctx!]
][
	OS-draw-fill-pen dc rgba-to-int 0 255 0 128  no no	
	OS-draw-pen dc rgba-to-int 255 0 0 0 no no
	OS2-draw-arc dc 200 200 100 100 -90 -60 yes 
]
id-draw-test "arc2" as integer! :draw-test-arc2
;==== text
draw-test-text: func [
	dc	[draw-ctx!]
][
	OS2-draw-font dc "Ariane" 20 
		rgba-to-int 255 0 0 0
		;PANGO_WEIGHT_NORMAL 
		PANGO_WEIGHT_BOLD
		PANGO_STYLE_NORMAL 
		; PANGO_STYLE_ITALIC
		yes yes 
		CAIRO_ANTIALIAS_DEFAULT
	OS2-draw-text dc 50 50 "toto"
]
id-draw-test "text" as integer! :draw-test-text 


;==== shape-arc
; pen yellow
; line-width 3
; shape [
; 	move 10x20
; 	arc 180x20 120 50 0
; 	move 10x70
; 	arc 180x70 120 50 0 sweep
; 	move 220x20
; 	arc 400x20 120 50 0 large
; 	move 480x100
; 	arc 660x100 120 50 0 sweep large
; ]

draw-test-shape-arc: func [
	dc	[draw-ctx!]
][
	OS-draw-pen dc rgba-to-int 255 0 0 0 no no
	OS2-draw-line-width dc 3.0
	OS-draw-shape-beginpath dc
	OS2-draw-shape-moveto dc 60 70 no
	OS2-draw-shape-arc dc 230 70 120 50 0 no no no
	OS2-draw-shape-moveto dc 60 120 no
	OS2-draw-shape-arc dc 230 120 120 50 0 yes no no
	OS2-draw-shape-moveto dc 270 70 no
    OS2-draw-shape-arc dc  450 70 120 50 0 no yes no
	OS2-draw-shape-moveto dc 530 150 no
	OS2-draw-shape-arc dc 710 150 120 50 0 yes yes no
	OS-draw-shape-endpath dc no
]
id-draw-test "shape-arc" as integer! :draw-test-shape-arc 
