Red/System[]

#include %../../gtk3-red-like.reds

hello: func[[cdecl] widget [handle!]/local w [integer!] h [integer!]] [
	w: -1 h: -1
	gtk_widget_get_size_request widget :w :h
	print ["Hello World: " w "x" h " vs " gtk_widget_get_allocated_width widget "x" gtk_widget_get_allocated_height widget lf]
]

size: func[[cdecl] widget [handle!] other [handle!] /local w [integer!] h [integer!]] [
	w: -1 h: -1
	gtk_widget_get_size_request other :w :h
	print ["size requested: " w "x" h " vs allocated: " gtk_widget_get_allocated_width other "x" gtk_widget_get_allocated_height other lf]
]

demo/begin

win: make-face window null "test" 0 0 400 300 
pan: make-face panel win "panel" 100 100 500 200 
but: make-face button pan "Hello World" 0 0 120 40 
but2: make-face button pan "Hello World2" 130 0 120 40 
but3: make-face button pan "Hello World3" 260 0 120 40
tl: make-face text-list pan "text-list" 0 60 60 80
face-data [tl "toto" "titi"]
dl: make-face drop-list pan "drop-list" 100 60 100 30 
gtk_combo_box_set_popup_fixed_width dl/widget yes
face-data [dl "toto" "titi"]
dd: make-face drop-down pan "drop-down" 220 60 100 30 
face-data [dd "toto" "titi"]
gtk_combo_box_set_popup_fixed_width dd/widget yes
btl: make-face button win "tl" 0 0 30 10
gobj_signal_connect(btl/widget "clicked" :size  tl/widget)
bdl: make-face button win "dl" 40 0 30 10
gobj_signal_connect(bdl/widget "clicked" :size  dl/widget)
bdd: make-face button win "dd" 80 0 30 10
gobj_signal_connect(bdd/widget "clicked" :size  dd/widget)


gobj_signal_connect(but/widget "clicked" :hello  null)
gobj_signal_connect(but2/widget "clicked" :hello  null)
gobj_signal_connect(but3/widget "clicked" :hello  null)

demo/end