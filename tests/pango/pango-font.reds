Red/System[]

#include %../../gtk3.reds
#include %../../include/quick-demo.reds

app-font-name: "Consolas 10"

set-app-font: func [
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
	pfont: pango_context_load_font pc pfd 
	match: not null? pfont

	pango_font_description_free pfd
	g_object_unref pc

	if match [set-app-font w font-name]

]

demo/begin



demo/end