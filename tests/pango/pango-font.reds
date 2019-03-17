Red/System[]

#include %../../gtk3.reds
#include %../../include/gtk-app.reds

app-font-name: "Consolas 10"

font-sans-10: func[[cdecl] widget [handle!]] [
	try-to-get-font text "Sans 10"
]

font-consolas-10: func[[cdecl] widget [handle!]] [
	try-to-get-font text "Consolas 10"
]

set-app-font: func [
	font-name	[c-string!]
	/local
		settings	[handle!]
][
    
    settings: gtk_settings_get_default

	print ["set font name: " font-name lf]
	strcpy app-font-name  font-name 
	g_object_set [settings "gtk-font-name" app-font-name  null ]

]

set-app-font-old: func [
	w			[handle!]
	font-name	[c-string!]
	/local
		settings	[handle!]
		pfd			[handle!]
		pfont		[handle!]
		pc			[handle!]
][
    
    settings: gtk_settings_get_default

	pfd: pango_font_description_from_string font-name
	pc: gtk_widget_get_pango_context w
	pfont: pango_context_load_font pc pfd

	unless null? pfont [
		print ["set font name: " font-name lf]
	    strcpy app-font-name  font-name 
	    g_object_set [settings "gtk-font-name" app-font-name  null ]
	]
	pango_font_description_free pfd

]

try-to-get-font: func [
	w		  [handle!]
	font-name [c-string!]
	/local
		pfd		[handle!]
		pfont	[handle!]
		pc		[handle!]
		match	[logic!]
][

    match: no

	pfd: pango_font_description_from_string font-name

	pc: gtk_widget_get_pango_context w
	pfont: gdk_pango_context_get ;pango_context_load_font pc pfd 
	match: not null? pfont

	pango_font_description_free pfd
	g_object_unref pc

	print ["match: " match lf]
	if match [set-app-font font-name]

]

gtk/begin

lay: gtk_layout_new null null
gtk_container_add gtk/window lay

text:  gtk_label_new "toto"
but: gtk_button_new_with_label "Sans"
but2: gtk_button_new_with_label "Cons"

gtk_widget_set_size_request text 120 40
gtk_widget_set_size_request but 120 40
gtk_widget_set_size_request but2 120 40
gtk_layout_put lay text 0 0
gtk_layout_put lay but 130 0 
gtk_layout_put lay but2 260 0 

gobj_signal_connect(but "clicked" :font-sans-10 null)
gobj_signal_connect(but2 "clicked" :font-consolas-10 null)




gtk/end