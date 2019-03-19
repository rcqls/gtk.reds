Red/System[]

#include %../../gtk3-red-like.reds

gtk/begin

win: make-face window null "test" 0 0 400 300 
pan: make-face panel win "panel" 100 100 500 200 
but: make-face button pan "Hello World" 0 0 120 40 
but2: make-face button pan "Hello World2" 130 0 100 40 
but3: make-face button pan "Hello World3" 260 0 120 40
tl: make-face text-list pan "text-list" 0 60 60 80
face-data [tl "toto" "titi"]
css [tl _font_size 20 _foreground_color 0 255 0 0 _background_color 0 0 255 0]
dl: make-face drop-list pan "drop-list" 100 60 100 30
face-data [dl "toto" "titi"]
dd: make-face drop-down pan "drop-down" 220 60 100 30 
face-data [dd "toto" "titi"]
a: make-face area pan "area" 340 60 100 150
css [a _font_size 20 _foreground_color 0 255 0 0 _background_color 0 0 255 0]

btl: make-face button win "tl" 0 0 30 10
bdl: make-face button win "dl" 40 0 30 10
bdd: make-face button win "dd" 80 0 30 10
ba: make-face button win "a" 120 0 30 10



face-signal-face-data(btl "clicked" :face-size tl)
face-signal-face-data(bdl "clicked" :face-size  dl)
face-signal-face-data(bdd "clicked" :face-size  dd)
face-signal-face-data(ba "clicked" :face-size  a)

hello: func[[cdecl] widget [handle!]/local w [integer!] h [integer!]] [
	w: -1 h: -1
	gtk_widget_get_size_request widget :w :h
	print ["Hello World: " w "x" h " vs " gtk_widget_get_allocated_width widget "x" gtk_widget_get_allocated_height widget lf]
]

face-signal(but "clicked" :hello)
face-signal(but2 "clicked" :hello)
face-signal(but3 "clicked" :hello)

gtk/end