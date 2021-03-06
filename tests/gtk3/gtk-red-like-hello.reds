Red/System[]

#include %../../gtk3-red-like.reds

gtk/size 300 300 ; default is 800x600

gtk/begin

; GUI
win: make-face window null "test" 0 0 400 300 
pan: make-face panel win "panel" 100 100 500 200 
but: make-face button pan "<u>Hello World</u>" 0 0 120 40 
css [but _font_size 20 _foreground_color 0 255 0 0 _background_color 0 0 255 0 _underline]
; SIGNAL (Connection)
hello: func[[cdecl] widget [handle!]/local w [integer!] h [integer!]] [
	w: -1 h: -1
	gtk_widget_get_size_request widget :w :h
	print ["Hello World: " w "x" h " vs " gtk_widget_get_allocated_width widget "x" gtk_widget_get_allocated_height widget lf]
]

face-signal(but "clicked" :hello)

gtk/end