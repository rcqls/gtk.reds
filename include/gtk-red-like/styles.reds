Red/System[]

add-to-string: func [
	string  [c-string!]
	format  [c-string!]
	value   [handle!]
	return: [c-string!]
	/local
		temp [c-string!]
][
	temp: g_strdup_printf [format string value]
	g_free as handle! string
	temp
]

to-css-rgba: func [
	r		[integer!]
	g		[integer!]
	b		[integer!]
	a		[integer!]								;-- needs to be a valid color tuple
	return:	[c-string!]									;-- rgba(r, g, b, a) format - Should be cleaned with g_free
	/local
		rgba	[c-string!]
		aa		[float!]
 		alpha	[c-string!]
][
	aa: (as-float 255 - a) / 255.0
	alpha: as c-string! allocate G_ASCII_DTOSTR_BUF_SIZE
	g_ascii_dtostr alpha G_ASCII_DTOSTR_BUF_SIZE aa

	rgba: g_strdup_printf ["rgba(%d, %d, %d, %s)" r g b alpha]
	free as byte-ptr! alpha
	rgba
]

#define GTK_STYLE_PROVIDER_PRIORITY_APPLICATION 600

make-styles-provider: func [
	widget	[handle!]
	/local
		style	 [handle!]
		provider [handle!]
][
	provider:	gtk_css_provider_new
	style:		gtk_widget_get_style_context widget

	gtk_style_context_add_provider style provider GTK_STYLE_PROVIDER_PRIORITY_APPLICATION

	g_object_set_qdata widget gtk-style-id provider
]

get-styles-provider: func [
	widget  [handle!]
	return: [handle!]
][
	g_object_get_qdata widget gtk-style-id
]

#enum CssStyle! [
	_font_name _font_size
	_bold _italic _underline _strike
	_foreground_color _background_color
]

css: func [
	[variadic]
	count [integer!] list [int-ptr!]
	/local
		face		[WidgetFace!]
		widget		[handle!]
		name		[c-string!]
		css			[c-string!]
		rgba		[c-string!]
		val			[integer!]
		r	 		[integer!]
		g			[integer!]
		b			[integer!]
		a			[integer!]
		provider 	[handle!]
][
	face: as WidgetFace! RV/h? :count list list: list + 1
	widget: face/widget
	provider: get-styles-provider widget
	css:	g_strdup_printf ["* {"]
	until [
		val: RV/i? :count list list: list + 1
		case [
			val = _font_name [
				name: RV/s? :count list list: list + 1
				css: g_strdup_printf [{%s font-family: "%s";} css name]
			]
			val = _font_size [
				val: RV/i? :count list list: list + 1
				css: add-to-string css "%s font-size: %dpt;" as handle! val
			]
			val = _bold      [css: g_strdup_printf ["%s font-weight: bold; " css]]
			val = _italic    [css: g_strdup_printf ["%s font-style: italic;" css]]
			val = _underline [css: g_strdup_printf ["%s text-decoration: underline;" css]]
			val = _strike    [css: g_strdup_printf ["%s text-decoration: line-through;" css]]
			val = _foreground_color [
				r:  RV/i? :count list list: list + 1
				g:  RV/i? :count list list: list + 1
				b:  RV/i? :count list list: list + 1
				a:  RV/i? :count list list: list + 1
				rgba: to-css-rgba r g b a
				css: add-to-string css "%s color: %s;" as handle! rgba
				g_free as handle! rgba
			]
			val = _background_color [
				r:  RV/i? :count list list: list + 1
				g:  RV/i? :count list list: list + 1
				b:  RV/i? :count list list: list + 1
				a:  RV/i? :count list list: list + 1
				rgba: to-css-rgba r g b a
				css: add-to-string css "%s background: %s;" as handle! rgba
				g_free as handle! rgba
			]
		]
		zero? count
	]

	css: add-to-string css "%s}" null

	;; DEBUG: print ["css-styles -> css: " css lf]
	
	gtk_css_provider_load_from_data provider css -1 null
]