Red/System []

destroy: func[[cdecl]][
  gtk_main_quit
]

demo: context [
	window: as handle! 0
	width: 800
	height: 600

	begin: does [
		gtk_init null null
		window:  gtk_window_new 0
		gtk_widget_set_size_request window width height
		gobj_signal_connect(window "destroy" :destroy null)
	
	]

	end: does [
		gtk_widget_show_all window
		gtk_main
	]
]