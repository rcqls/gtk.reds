Red/System[]

#include %../../gtk3.reds
#include %../../include/quick-demo.reds
#include %../../include/widgets.reds

hello: func[[cdecl] widget [handle!]/local w [integer!] h [integer!]] [
	w: -1 h: -1
	gtk_widget_get_size_request widget :w :h
	print ["Hello World: " w "x" h " vs " gtk_widget_get_allocated_width widget "x" gtk_widget_get_allocated_height widget lf]
]

demo/begin

win: new-face window null "test" 0 0 400 300 yes yes 0
pan: new-face panel win "panel" 100 100 500 200 yes yes 0
but: new-face button pan "Hello World" 0 0 120 40 yes yes 0
but2: new-face button pan "Hello World2" 130 0 120 40 yes yes 0
but3: new-face button pan "Hello World3" 260 0 120 40 yes yes 0

gobj_signal_connect(but/widget "clicked" :hello  null)
gobj_signal_connect(but2/widget "clicked" :hello  null)
gobj_signal_connect(but3/widget "clicked" :hello  null)

demo/end