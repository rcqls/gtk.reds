Red/System[]

#include %../../gtk3.reds

hello: func[[cdecl] widget [handle!]/local w [integer!] h [integer!]] [
	w: -1 h: -1
	gtk_widget_get_size_request widget :w :h
	print ["Hello World: " w "x" h " vs " gtk_widget_get_allocated_width widget "x" gtk_widget_get_allocated_height widget lf]
	
]

destroy: func[[cdecl]][
  gtk_main_quit
]

window: as handle! 0
button: as handle! 0

gtk_init null null 

window:  gtk_window_new 0
gobj_signal_connect(window "destroy" :destroy null)
; gtk_container_border_width (GTK_CONTAINER (window), 10);

lay: gtk_layout_new null null
gtk_container_add window lay
button: gtk_button_new_with_label "Hello World"
gtk_widget_set_size_request button 120 40
button2: gtk_button_new_with_label "Hello World2"
gtk_widget_set_size_request button2 120 40
button3: gtk_button_new_with_label "Hello World3"
gtk_widget_set_size_request button3 120 40

  gobj_signal_connect(button "clicked" :hello  null)
  gobj_signal_connect(button2 "clicked" :hello  null)
  gobj_signal_connect(button3 "clicked" :hello  null)
  ;gtk_signal_connect_object (GTK_OBJECT (button) "clicked",
  ;			     GTK_SIGNAL_FUNC (gtk_widget_destroy),
  ;			     GTK_OBJECT (window))
  gtk_layout_put lay button 0 0
  gtk_layout_put lay button2 120 0
  gtk_layout_put lay button3 240 0

  gtk_widget_show_all window

  gtk_main