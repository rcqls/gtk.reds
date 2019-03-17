Red/System[]

face-size: func[[cdecl] widget [handle!] other [handle!] /local w [integer!] h [integer!]] [
	w: -1 h: -1
	gtk_widget_get_size_request other :w :h
	print ["face size requested: " w "x" h " vs allocated: " gtk_widget_get_allocated_width other "x" gtk_widget_get_allocated_height other lf]
]