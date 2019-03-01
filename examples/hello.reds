Red/System[]

#include %../gtk3.reds

hello: func[[cdecl]] [
	print ["Hello World" lf]
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

button: gtk_button_new_with_label "Hello World"

  gobj_signal_connect(button "clicked" :hello  null)
  ;gtk_signal_connect_object (GTK_OBJECT (button) "clicked",
  ;			     GTK_SIGNAL_FUNC (gtk_widget_destroy),
  ;			     GTK_OBJECT (window))
  gtk_container_add window button
  gtk_widget_show button

  gtk_widget_show window

  gtk_main