Red/System[]

#include %../../gtk3.reds
#include %../../include/quick-demo.reds

hello: func[[cdecl] widget [handle!]/local w [integer!] h [integer!]] [
	w: -1 h: -1
	gtk_widget_get_size_request widget :w :h
	print ["Hello World: " w "x" h " vs " gtk_widget_get_allocated_width widget "x" gtk_widget_get_allocated_height widget lf]
]

demo/begin

lay: gtk_layout_new null null
gtk_container_add demo/window lay
button: gtk_button_new_with_label "Hello World"
gtk_widget_set_size_request button 120 40
button2: gtk_button_new_with_label "Hello World2"
gtk_widget_set_size_request button2 120 40
button3: gtk_button_new_with_label "Hello World3"
gtk_widget_set_size_request button3 120 40

gobj_signal_connect(button "clicked" :hello  null)
gobj_signal_connect(button2 "clicked" :hello  null)
gobj_signal_connect(button3 "clicked" :hello  null)

gtk_layout_put lay button 0 0
gtk_layout_put lay button2 130 0
gtk_layout_put lay button3 260 0

demo/end