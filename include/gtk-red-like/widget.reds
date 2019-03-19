Red/System[]

;;======== Widget Struct =======;;;

#enum WidgetType! [
	window	base panel tab-panel group-box
	button	text field
	area rich-text
	text-list drop-list drop-down
	check radio
	slider progress
	camera
]

WidgetFace!: alias struct! [
	type 	[WidgetType!]
	parent 	[WidgetFace!]
	caption	[c-string!]
	offset-x [integer!] offset-y [integer!]
	size-x [integer!] size-y [integer!]
	show?	  [logic!]
	enabled?  [logic!]
	selected  [integer!]
	widget	  [handle!]
]

;;;======= utility functions ========;;;


#define face-signal(face signal handler) [
	g_signal_connect_data face/widget signal as-integer handler null null 0
]

#define face-signal-data(face signal handler data) [
	g_signal_connect_data face/widget signal as-integer handler data null 0
]

#define face-signal-face-data(face signal handler face-data) [
	g_signal_connect_data face/widget signal as-integer handler face-data/widget null 0
]


; equivalent to store-face-to-obj in red/gtk
face-widget: func [
	widget	[handle!]
	face	[WidgetFace!]
][
	g_object_set_qdata widget face-id as int-ptr! face
]

face-widget?: func [
	widget	[handle!]
	return:	[WidgetFace!]
][
	as WidgetFace! g_object_get_qdata widget face-id
]

;; Change data (also init-combo-box and init-text-list)
face-data: func [
	[variadic]
	count [integer!] list [int-ptr!]
	/local
		face	[WidgetFace!]
		val	 	[c-string!]
		type 	[WidgetType!]
		widget	[handle!]
		label	[handle!]
][
	face: as WidgetFace! RV/h? :count list list: list + 1
	type: face/type widget: face/widget
	case [
		any[type = drop-list type = drop-down][
			gtk_combo_box_text_remove_all widget
			until [
				val: RV/s? :count list list: list + 1
				gtk_combo_box_text_append_text widget val
				zero? count
			]
		]
		type = text-list [
			until [
				val: RV/s? :count list list: list + 1
				label: gtk_label_new val
				;; DEBUG: print ["Add elt: " val lf]
				gtk_widget_set_halign label 1		;-- GTK_ALIGN_START
				gtk_container_add widget label
				zero? count
			]
		]
	]
]

; ; remove-entry: func [
; ; 	[cdecl]
; ; 	widget		[handle!]
; ; 	container	[int-ptr!]
; ; ][
; ; 	gtk_container_remove container widget
; ; ]
