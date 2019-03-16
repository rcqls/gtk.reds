Red/System[]


font-description-create: func [
	fname 	[c-string!]
	fsize	[integer!]
	fweight	[integer!]
	fstyle	[integer!]
	return:	[handle!]
	/local
		fd		[handle!]
		;css      [c-string!]
][
	fd: pango_font_description_new

	pango_font_description_set_family fd fname
	pango_font_description_set_size fd fsize * PANGO_SCALE

	pango_font_description_set_weight fd fweight
	pango_font_description_set_style fd fstyle
	pango_font_description_set_stretch fd PANGO_STRETCH_NORMAL
	pango_font_description_set_variant fd PANGO_VARIANT_NORMAL
	
	;; DOES NOT WORK AS EXPECTED: 
	;; css: pango_font_description_to_string fd
	;; print ["font description css: " css lf]

	fd
]

make-pango-cairo-font: func [
	dc		[draw-ctx!]
	fname    [c-string!] fsize	 [integer!] 
	color [integer!]
	fweight  [integer!] fstyle   [integer!] underline? [logic!] strike?		[logic!]
	quality  [integer!]
	/local
		cr       [handle!]
][
	cr: dc/raw

	;;;;----- color
	dc/font-color: color 

	;;;------- font description
	dc/font-underline?: underline?
	dc/font-strike?: strike?

	free-pango-cairo-font dc
	dc/font-desc: font-description-create fname fsize fweight fstyle
	dc/font-opts: cairo_font_options_create
	
	dc/layout: make-pango-cairo-layout cr dc/font-desc

	;anti-alias?:
	cairo_font_options_set_antialias dc/font-opts quality
]

pango-styled-text?: func [
	text		[c-string!]
	underline?	[logic!]
	strike?		[logic!]
	return: 	[c-string!]
	/local
		mtext		[c-string!]
		tmp			[c-string!]
][
	mtext: g_strdup_printf ["%s" text]
	if underline? [
		tmp: g_strdup_printf ["<u>%s</u>" mtext]
		g_free as handle! mtext
		mtext: tmp
	]
	if strike? [
		tmp: g_strdup_printf ["<s>%s</s>" mtext]
		g_free as handle! mtext
		mtext: tmp
	]
	mtext
]

pango-cairo-set-text: func [
	dc		[draw-ctx!]
	text	[c-string!]
	/local
		status		[logic!]
		length 		[integer!]
		attrs-ptr	[int-ptr!]
		attrs		[handle!]
		ptext-ptr	[int-ptr!]
		mtext		[c-string!]
		ptext		[c-string!]
		accel		[integer!]  
		error		[handle!]
][
	unless null? dc/layout [
		attrs-ptr: declare int-ptr!
		ptext-ptr: declare int-ptr!
		mtext: pango-styled-text? text dc/font-underline? dc/font-strike?
		;; DEBUG: print ["pango-cairo-set-text mtext: " mtext lf]
		status: pango_parse_markup mtext -1 0 attrs-ptr ptext-ptr null null
		attrs: as handle! attrs-ptr/value
		ptext: as c-string! ptext-ptr/value
		either status [
			pango_layout_set_text dc/layout ptext  -1
			unless null? attrs [pango_layout_set_attributes dc/layout attrs]
			g_free as handle! mtext
			g_free as handle! ptext
		][
			pango_layout_set_text dc/layout text -1
		]
	]
]

pango-layout-context-set-text: func [
	layout	[handle!]
	dc		[draw-ctx!]
	text	[c-string!]
	/local
		status		[logic!]
		length 		[integer!]
		attrs-ptr	[int-ptr!]
		attrs		[handle!]
		ptext-ptr	[int-ptr!]
		mtext		[c-string!]
		ptext		[c-string!]
		accel		[integer!]  
		error		[handle!]
][
	unless null? layout [
		attrs-ptr: declare int-ptr!
		ptext-ptr: declare int-ptr!
		mtext: pango-styled-text? text dc/font-underline? dc/font-strike?
		;; DEBUG: print ["pango-cairo-set-text mtext: " mtext lf]
		status: pango_parse_markup mtext -1 0 attrs-ptr ptext-ptr null null
		attrs: as handle! attrs-ptr/value
		ptext: as c-string! ptext-ptr/value
		either status [
			pango_layout_set_text layout ptext  -1
			unless null? attrs [pango_layout_set_attributes layout attrs]
			g_free as handle! mtext
			g_free as handle! ptext
		][
			pango_layout_set_text layout text -1
		]
	]
]

free-pango-cairo-font: func [
	dc		[draw-ctx!]
][
	unless null? dc/font-desc [
		pango_font_description_free dc/font-desc 
		dc/font-desc: null
	]
	unless null? dc/font-opts [
		cairo_font_options_destroy dc/font-opts
		dc/font-desc: null
	]
	unless null? dc/layout [
		g_object_unref dc/layout
		dc/layout: null
	]
]

make-pango-cairo-layout: func [
	cr		[handle!]
	fd 		[handle!]
	return:	[handle!]
	/local
		layout 	[handle!]
][
	;; DEBUG: print ["make-pango-cairo-layout" lf]
	layout: pango_cairo_create_layout cr 
	unless null? fd [pango_layout_set_font_description layout fd]
	;; DEBUG: print ["make-pango-cairo-layout: " dc/layout lf]
	layout
]