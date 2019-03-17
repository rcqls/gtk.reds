Red/System[]

#include %../gtk3.reds
#include %quick-demo.reds
#include %gtk-red-like/widget.reds

; GTKApp:			as handle! 0
; GTKApp-Ctx: 	0
; exit-loop:		0

;;;close-window?:	no
;;;win-array:		declare red-vector!
; win-cnt:		0
; AppMainMenu:	as handle! 0

_widget-id:			1
gtk-layout-id:		2
red-timer-id:		3
css-id:				4
size-id:			5
real-container-id:	6
menu-id:			7
drag-id:			8
face-id:			9


gtk-style-id:	10

group-radio:	as handle! 0
tabs: context [
	nb: 	0
	cur: 	0
]


make-face: func [
	type 	[WidgetType!]
	parent	[WidgetFace!]
	caption	[c-string!]
	offset-x [integer!] offset-y [integer!]
	size-x [integer!] size-y [integer!]
	return: [WidgetFace!]
	/local
		face 	[WidgetFace!]
][
	face: 	as WidgetFace! allocate (size? WidgetFace!)
	face/type: type
	face/caption: caption
	face/offset-x: offset-x face/offset-y: offset-y
	face/size-x: size-x face/size-y: size-y
	face/parent: parent
	face/widget: make-view face parent
	face
]

free-face: func [
	face 	[WidgetFace!]
][
	free as byte-ptr! face
]

make-view: func [
	face 	[WidgetFace!]
	p-face	[WidgetFace!]
	return: [handle!]
	/local
		; data	  [red-block!]
		; int		  [red-integer!]
		; img		  [red-image!]
		; menu	  [red-block!]
		
		; font	  [red-object!]
		; para	  [red-object!]
		flags	  [integer!]
		bits	  [integer!]
		; rate	  [red-value!]
		sym		  [integer!]
		p-sym	  [integer!]
		len		  [integer!]
		widget	  [handle!]
		_widget	  [handle!]
		winbox	  [handle!]
		buffer	  [handle!]
		container [handle!]
		hMenu	  [handle!]
		value	  [integer!]
		fvalue	  [float!]
		vertical? [logic!]
		caption	  [c-string!]
		; rfvalue	  [red-float!]
		; actors	  [red-object!]
		parent	 [handle!]
][
	parent: either null? p-face[null][p-face/widget]

	_widget: as handle! 0 ; widget version with possible scrollview

	; type:	  as red-word!		values + FACE_OBJ_TYPE
	; str:	  as red-string!	values + FACE_OBJ_TEXT
	; offset:   as red-pair!		values + FACE_OBJ_OFFSET
	; size:	  as red-pair!		values + FACE_OBJ_SIZE
	; show?:	  as red-logic!		values + FACE_OBJ_VISIBLE?
	; enabled?: as red-logic!		values + FACE_OBJ_ENABLED?
	; data:	  as red-block!		values + FACE_OBJ_DATA
	; img:	  as red-image!		values + FACE_OBJ_IMAGE
	; font:	  as red-object!	values + FACE_OBJ_FONT
	; menu:	  as red-block!		values + FACE_OBJ_MENU
	; selected: as red-integer!	values + FACE_OBJ_SELECTED
	; para:	  as red-object!	values + FACE_OBJ_PARA
	; rate: 	  as red-value!		values + FACE_OBJ_RATE

	; bits: 	  get-flags as red-block! values + FACE_OBJ_FLAGS
	; sym: 	  symbol/resolve type/symbol

	; actors: as red-object! values + FACE_OBJ_ACTORS
 
	; if bits and FACET_FLAGS_SCROLLABLE <> 0 [
	; 	flags: flags or WS_HSCROLL or WS_VSCROLL
	; ]

	;;DEBUG: print ["OS-make-view " get-symbol-name sym lf]

	sym: face/type
	caption: face/caption

	case [
		; sym = check [
		; 	widget: gtk_check_button_new_with_label caption
		; 	set-logic-state widget as red-logic! data no
		; 	;@@ No click event for check
		; 	;gobj_signal_connect(widget "clicked" :button-clicked null)
		; 	gobj_signal_connect(widget "toggled" :button-toggled face/ctx)
		; ]
		; sym = radio [
		; 	widget: either null? group-radio [
		; 		;; DEBUG: print ["radio created: " caption lf]
		; 		gtk_radio_button_new_with_label null caption
		; 	][
		; 		;; DEBUG: print ["radio group-radio created: " caption lf]
		; 		gtk_radio_button_new_with_label_from_widget group-radio caption
		; 	]
		; 	set-logic-state widget as red-logic! data no
		; 	;@@ Line below removed because it generates an error and there is no click event for radio 
		; 	gobj_signal_connect(widget "toggled" :button-toggled face/ctx)
		; ]
		sym = button [
			widget: gtk_button_new_with_label caption
			;;; gobj_signal_connect(widget "clicked" :button-clicked null)
			; if TYPE_OF(img) = TYPE_IMAGE [
			; 	change-image widget img sym
			; ]
		]
		sym = base [
			widget: gtk_layout_new null null;gtk_drawing_area_new
			gtk_layout_set_size widget face/size-x face/size-y
			;;; gobj_signal_connect(widget "draw" :base-draw face/ctx)
			gtk_widget_add_events widget GDK_BUTTON_PRESS_MASK or GDK_BUTTON1_MOTION_MASK or GDK_BUTTON_RELEASE_MASK or GDK_KEY_PRESS_MASK or GDK_KEY_RELEASE_MASK
			gtk_widget_set_can_focus widget no
			gtk_widget_set_focus_on_click widget no
			; connect-common-events widget face actors sym 
		]
		; sym = rich-text [
		; 	widget: gtk_layout_new null null;gtk_drawing_area_new
		; 	gtk_layout_set_size widget face/size-x face/size-y
		; 	gobj_signal_connect(widget "draw" :base-draw face/ctx)
		; 	gtk_widget_add_events widget GDK_BUTTON_PRESS_MASK or GDK_BUTTON1_MOTION_MASK or GDK_BUTTON_RELEASE_MASK or GDK_KEY_PRESS_MASK or GDK_KEY_RELEASE_MASK
		; 	gtk_widget_set_can_focus widget yes
		; 	gtk_widget_set_focus_on_click widget yes
		; 	gtk_widget_is_focus widget
		; 	gtk_widget_grab_focus widget
		; 	connect-common-events widget face actors sym 
		; 	;; DEBUG: print ["richtext " widget " face " face " size: " face/size-x "x" face/size-y lf]
		; ]
		sym = window [
			;; DEBUG: print ["win " GTKApp lf]
			;widget: gtk_application_window_new GTKApp
			;win-cnt: win-cnt + 1
			widget: demo/window ;gtk_window_new 0
			;; DEBUG: print ["win1 " widget lf]
			; gtk_application_add_window GTKApp widget
			;; DEBUG: print ["win2 " lf]
			;; DEBUG (temporary code): 
			; main-window: widget
			unless null? caption [gtk_window_set_title widget caption]
			gtk_window_set_default_size widget face/size-x face/size-y
			winbox: gtk_box_new GTK_ORIENTATION_VERTICAL  0
      		gtk_container_add widget winbox
			; if all [						;@@ application menu ?
			; 	null? AppMainMenu
			; 	menu-bar? menu window
			; ][
			; 	AppMainMenu: gtk_menu_bar_new
			; 	;; DEBUG: print ["AppMainMenu " AppMainMenu " creation for window " widget lf]
			; 	build-menu menu AppMainMenu widget
			; 	gtk_box_pack_start winbox  AppMainMenu no yes 0 			
			; ]
			gtk_widget_show winbox
			container: gtk_layout_new null null
			gtk_layout_set_size container face/size-x face/size-y
			gtk_box_pack_start winbox container yes yes 0 			
			g_object_set_qdata widget real-container-id container
			;; DEBUG: print ["window is " widget " real container is " container lf]
			gtk_window_move widget face/offset-x face/offset-y
			;;; gobj_signal_connect(widget "delete-event" :window-delete-event null)
			;BUG (make `vid.red` failing):gtk_widget_add_events widget GDK_STRUCTURE_MASK
			;gobj_signal_connect(widget "configure-event" :window-configure-event null)
			;;; gobj_signal_connect(widget "size-allocate" :window-size-allocate null)
		]
		; sym = slider [
		; 	vertical?: face/size-y > face/size-x
		; 	value: either vertical? [face/size-y][face/size-x]
		; 	widget: gtk_scale_new_with_range vertical? 0.0 as float! value 1.0
		; 	value: get-position-value as red-float! data value
		; 	if vertical? [value: face/size-y - value]
		; 	gtk_range_set_value widget as float! value
		; 	gtk_scale_set_has_origin widget no
		; 	gtk_scale_set_draw_value widget no
		; 	gobj_signal_connect(widget "value-changed" :range-value-changed face/ctx)
		; ]
		sym = text [
			widget: gtk_label_new caption
			_widget: gtk_event_box_new null null
			gtk_container_add _widget widget
			; gobj_signal_connect(_widget "button-press-event" :text-button-press-event widget)
		]
		sym = field [
			widget: gtk_entry_new
			buffer: gtk_entry_get_buffer widget
			unless null? caption [gtk_entry_buffer_set_text buffer caption -1]
			;;; gobj_signal_connect(widget "key-release-event" :field-key-release-event face)
			;Do not work: gobj_signal_connect(widget "key-press-event" :field-key-press-event face/ctx)
			;;; gobj_signal_connect(widget "button-release-event" :field-button-release-event face)
			
			gtk_widget_set_can_focus widget yes
			gtk_widget_is_focus widget
			;This depends on version >= 3.2
			;gtk_widget_set_focus_on_click widget yes
			;;; gobj_signal_connect(widget "move-focus" :field-move-focus face/ctx)
			gtk_entry_set_width_chars widget 0
		]
		; sym = progress [
		; 	widget: gtk_progress_bar_new
		; 	if face/size-y > face/size-x [
		; 		gtk_orientable_set_orientation widget 1
		; 		gtk_progress_bar_set_inverted widget yes
		; 	]
		; 	fvalue: get-fraction-value as red-float! data
		; 	gtk_progress_bar_set_fraction widget fvalue
		; ]
		sym = area [
			widget: gtk_text_view_new
			buffer: gtk_text_view_get_buffer widget
			unless null? caption [gtk_text_buffer_set_text buffer caption -1]
			_widget: gtk_scrolled_window_new null null
			gtk_container_add _widget widget
			; gobj_signal_connect(buffer "changed" :area-changed widget)
			; g_object_set [widget "populate-all" yes null] 
			; gobj_signal_connect(widget "button-press-event" :area-button-press-event face/ctx)
			; gobj_signal_connect(widget "populate-popup" :area-populate-popup face/ctx)
			; gobj_signal_connect(widget "button-release-event" :area-button-release-event face/ctx)
			; gobj_signal_connect(widget "key-press-event" :key-press-event face/ctx)
			; gobj_signal_connect(widget "key-release-event" :key-release-event face/ctx)		
		]
		; sym = group-box [
		; 	widget: gtk_frame_new caption
		; 	gtk_frame_set_shadow_type widget 3
		; 	gtk_frame_set_label_align widget 0.5 0.5; Todo: does not seem to work
		; 	container: gtk_layout_new null null 
		; 	gtk_container_add widget container
		; ]
		sym = panel [
			widget: gtk_layout_new null null
			unless null? caption [
				buffer: gtk_label_new caption
				gtk_container_add widget buffer
			]
			gtk_layout_set_size widget face/size-x face/size-y
			;;; gobj_signal_connect(widget "draw" :base-draw face/ctx)
			gtk_widget_set_focus_on_click widget yes
			gtk_widget_add_events widget GDK_BUTTON_PRESS_MASK or GDK_BUTTON1_MOTION_MASK or GDK_BUTTON_RELEASE_MASK or GDK_KEY_PRESS_MASK or GDK_KEY_RELEASE_MASK or GDK_FOCUS_CHANGE_MASK
			;; value: gtk_widget_get_events widget
			;; DEBUG: print ["panel had focus: " gtk_widget_get_focus_on_click widget  lf "get events: " value  " GDK_BUTTON_PRESS_MASK? " GDK_BUTTON_PRESS_MASK and value lf]
			;if respond-down-event? actors [
				;;; gobj_signal_connect(widget "button-press-event" :mouse-button-press-event face)
				;;; gobj_signal_connect(widget "motion-notify-event" :mouse-motion-notify-event face)
			;]
			;if respond-up-event? actors [
				;;; gobj_signal_connect(widget "button-release-event" :mouse-button-release-event face)
			;]
			;;; gobj_signal_connect(widget "key-press-event" :key-press-event face)
			;;; gobj_signal_connect(widget "key-release-event" :key-release-event face)
		]
		; sym = tab-panel [
		; 	widget: gtk_notebook_new
		; 	tabs/cur: 0
		; 	tabs/nb: block/rs-length? data
		; 	gobj_signal_connect(widget "switch-page" :tab-panel-switch-page face/ctx)
		; ]
		sym = text-list [
			widget: gtk_list_box_new
			; init-text-list widget data
			;gtk_list_box_select_row widget gtk_list_box_get_row_at_index widget 0
			_widget: gtk_scrolled_window_new null null
			; if bits and FACET_FLAGS_NO_BORDER = 0 [
			; 	gtk_scrolled_window_set_shadow_type _widget 3
			; ]
			gtk_container_add _widget widget
			;;; gobj_signal_connect(widget "selected-rows-changed" :text-list-selected-rows-changed face)
			; connect-common-events widget face actors sym 
		]
		any [
			sym = drop-list
			sym = drop-down
		][
			widget: either sym = drop-list [gtk_combo_box_text_new][gtk_combo_box_text_new_with_entry]
			;;;init-combo-box widget data caption sym = drop-list
			if sym = drop-down[gtk_entry_set_width_chars gtk_bin_get_child widget (face/size-x - 20) / 10 ]
			gtk_combo_box_set_active widget 0
			;;;gobj_signal_connect(widget "changed" :combo-selection-changed face/ctx)
		]
		true [
			;-- search in user-defined classes
			;fire [TO_ERROR(script face-type) type]
			print ["ERROR widget creation" lf]
		]
	]

	; parse-common-opts widget face as red-block! values + FACE_OBJ_OPTIONS sym

	; save the previous group-radio state as a global variable
	; group-radio: either sym = radio [widget][as handle! 0] 

	;;DEBUG: print [ "New widget " get-symbol-name sym "->" widget lf]
	
	if all [
		sym <> window
		not null? parent
	][
		p-sym: p-face/type ;get-widget-symbol as handle! parent
		either null? _widget [_widget: widget][g_object_set_qdata widget _widget-id _widget ]
		; TODO: case to replace with either if no more choice
		;; DEBUG: print ["Parent: " get-symbol-name p-sym " _widget" _widget lf]
		case [
			; p-sym = tab-panel [
			; 	container: as handle! parent
			; 	; widget is necessarily a panel and then same as _widget
			; 	data: get-widget-data container
			; 	str:  (as red-string! block/rs-head data) + tabs/cur
			; 	caption: either TYPE_OF(str) = TYPE_STRING [
			; 		len: -1
			; 		unicode/to-utf8 str :len
			; 	][
			; 		"Tab"
			; 	]
			; 	buffer: gtk_label_new caption
			; 	gtk_notebook_append_page container widget buffer
			; 	tabs/cur: tabs/cur + 1
			; 	if tabs/cur = tabs/nb [tabs/cur: 0 tabs/nb: 0]
			; ]
			; ; p-sym = panel [
			; ; 	container:  as handle! parent
			; ; 	;save gtk_fixed container for adjustment since face/size-x and face/size-y are not the real sizes in gtk and need to be updated in a second pass
			; ; 	g_object_set_qdata widget gtk-layout-id container
			; ; 	if sym = text [g_object_set_qdata _widget gtk-layout-id container]
			; ; 	gtk_widget_set_size_request _widget face/size-x face/size-y
			; ; 	gtk_layout_put container _widget face/offset-x face/offset-y
			; ; ]
			true [
				container:  as handle! case [
					p-sym = window [
						g_object_get_qdata parent real-container-id
					]
					any [p-sym = panel p-sym = rich-text p-sym = base] [parent]
					p-sym = group-box [
						buffer: gtk_container_get_children parent 
						;; DEBUG: print ["Parent when not container : " buffer/value lf]
						buffer/value
					]
					true [
						; CAREFULL: NOT SURE THIS WAS USED PROPERLY -> for compilation of gui-console this clearly leads to a bug 
						; buffer: gtk_container_get_children as handle! parent 
						; ;; DEBUG: 
						; print ["Parent when not container : " buffer/value lf]
						; buffer/value

						;; redirect to the layout of the parent
						;; WARNING: (since completedly changed code)
						print ["DEVEL WARNING: <<NORMALLY NOTHING SHOULD GO HERE>>  (ONLY FOR DEVELOPMENT SINCE CODE HAS FULLY CHANGED BUT IMPOSSIBLE TO TEST) " lf]
						g_object_get_qdata parent gtk-layout-id
					]
				]
				;; DEBUG: print ["widget (" get-symbol-name sym "):" widget "[_widget: " _widget "] with parent (" get-symbol-name p-sym ") " as handle! parent " with container (" (get-symbol-name get-widget-symbol container)  ") " container lf]

				;save gtk_layout container for adjustment since face/size-x and face/size-y are not the real sizes in gtk and need to be updated in a second pass
				g_object_set_qdata widget gtk-layout-id container
				if sym = text [g_object_set_qdata _widget gtk-layout-id container]
				gtk_widget_set_size_request _widget face/size-x face/size-y
	
				gtk_layout_put container _widget face/offset-x face/offset-y
			]
		]
	]
	
	; unless any[sym = window sym = area][build-context-menu widget menu]

	; connect-notify-events widget face actors sym

	;-- store the face value in the extra space of the window struct
	; assert TYPE_OF(face) = TYPE_OBJECT					;-- detect corruptions caused by CreateWindow unwanted events
	face-widget widget face
	if sym = text [face-widget _widget face]

	; change-selection widget as red-integer! values + FACE_OBJ_SELECTED sym
	; change-para widget face as red-object! values + FACE_OBJ_PARA font sym

	; unless show?/value [change-visible widget no sym]
	; unless enabled?/value [change-enabled widget no sym]
	
	; make-styles-provider widget
	; 	if sym <> base [
	; 		change-font widget face font sym
	; 	]

	; if TYPE_OF(rate) <> TYPE_NONE [change-rate widget rate]
	; if sym <> base [change-color widget as red-tuple! values + FACE_OBJ_COLOR sym]

	; stack/unwind
	widget
]

