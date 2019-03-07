Red/System [
	Title:	"GTK3 imports"
	Author: "Qingtian Xie, RCqls"
	File: 	%gtk.reds
	Tabs: 	4
	Rights: "Copyright (C) 2016 Qingtian Xie. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

#define RED_GTK_APP_ID	"org.red-lang.www"

#define gobj_signal_connect(instance signal handler data) [
	g_signal_connect_data instance signal as-integer handler data null 0
]

#define G_ASCII_DTOSTR_BUF_SIZE	39

RECT_STRUCT: alias struct! [
	left		[integer!]
	top			[integer!]
	right		[integer!]
	bottom		[integer!]
]

tagPOINT: alias struct! [
	x		[integer!]
	y		[integer!]	
]

tagSIZE: alias struct! [
	width	[integer!]
	height	[integer!]
]

tagRECT: alias struct! [
	x		[integer!]
	y		[integer!]	
	width	[integer!]
	height	[integer!]
]

GdkEventKey!: alias struct! [
  type          [integer!]
  window        [int-ptr!]
  send_event    [byte!]
  time          [integer!]
  state         [integer!]
  keyval        [integer!]
  length        [integer!]
  string        [c-string!]
  keycode1      [byte!]
  keycode2		[byte!]
  group			[byte!]
  is_modifier 	[integer!]
]
GdkEventMotion!: alias struct! [
  type 			[integer!]
  window		[int-ptr!]
  send_event	[byte!]
  time 			[integer!]
  x				[float!]
  y				[float!]
  axes			[float-ptr!]
  state			[integer!]
  is_hint1		[byte!] 
  is_hint2		[byte!] 
  device		[int-ptr!]
  x_root		[float!]
  y_root		[float!]
]

GdkEventButton!: alias struct! [
  type 			[integer!]
  window		[int-ptr!]
  send_event	[byte!]
  time 			[integer!]
  x				[float!]
  y				[float!]
  axes			[float-ptr!]
  state			[integer!]
  button		[integer!] 
  device		[int-ptr!]
  x_root		[float!]
  y_root		[float!]
]

GdkEventCrossing!: alias struct! [
  type 			[integer!]
  window		[int-ptr!]
  send_event	[byte!]
  subwindow		[int-ptr!]
  time 			[integer!]
  x				[float!]
  y				[float!]
  x_root		[float!]
  y_root		[float!]
  axes			[float-ptr!]
  state			[integer!]
  is_hint1		[byte!] 
  is_hint2		[byte!] 
  device		[int-ptr!]
  mode			[integer!]
  detail		[integer!]
  focus 		[logic!]
  state 		[integer!]
]

GdkEventConfigure!: alias struct! [
  type			[integer!]
  window		[handle!]
  send_event	[byte!]
  x				[integer!]
  y				[integer!]	
  width			[integer!]
  height		[integer!]
]

#enum GGApplicationFlags! [
  G_APPLICATION_FLAGS_NONE: 0
  G_APPLICATION_IS_SERVICE: 1
  G_APPLICATION_IS_LAUNCHER: 2
  G_APPLICATION_HANDLES_OPEN: 4
  G_APPLICATION_HANDLES_COMMAND_LINE: 8
  G_APPLICATION_SEND_ENVIRONMENT: 16
  G_APPLICATION_NON_UNIQUE: 32
]

#enum GdkModifierType! [
  GDK_SHIFT_MASK: 		1
  GDK_LOCK_MASK: 			2
  GDK_CONTROL_MASK: 	4
  GDK_MOD1_MASK: 			8
  GDK_MOD5_MASK: 			128
  GDK_BUTTON1_MASK: 	256
  GDK_BUTTON2_MASK: 	512
  GDK_BUTTON3_MASK: 	1024
  GDK_BUTTON4_MASK: 	2048
  GDK_BUTTON5_MASK: 	4096
	GDK_SUPER_MASK: 		67108864
  GDK_HYPER_MASK: 		134217728 
  GDK_META_MASK: 			268435456
]
#enum GdkEventType! [
	GDK_NOTHING: -1
	GDK_DELETE
	GDK_DESTROY
	GDK_EXPOSE
	GDK_MOTION_NOTIFY
	GDK_BUTTON_PRESS
	GDK_2BUTTON_PRESS:
	GDK_DOUBLE_BUTTON_PRESS: 5
	GDK_3BUTTON_PRESS:
	GDK_TRIPLE_BUTTON_PRESS: 6
	GDK_BUTTON_RELEASE
	GDK_KEY_PRESS
	GDK_KEY_RELEASE
	GDK_ENTER_NOTIFY
	GDK_LEAVE_NOTIFY
	GDK_FOCUS_CHANGE
	GDK_CONFIGURE
	GDK_MAP
	GDK_UNMAP
	GDK_PROPERTY_NOTIFY
	GDK_SELECTION_CLEAR
	GDK_SELECTION_REQUEST
	GDK_SELECTION_NOTIFY
	GDK_PROXIMITY_IN
	GDK_PROXIMITY_OUT
	GDK_DRAG_ENTER
	GDK_DRAG_LEAVE
	GDK_DRAG_MOTION
	GDK_DRAG_STATUS
	GDK_DROP_START
	GDK_DROP_FINISHED
	GDK_CLIENT_EVENT
	GDK_VISIBILITY_NOTIFY
	GDK_SCROLL: 31
	GDK_WINDOW_STATE
	GDK_SETTING
	GDK_OWNER_CHANGE
	GDK_GRAB_BROKEN
	GDK_DAMAGE
	GDK_TOUCH_BEGIN
	GDK_TOUCH_UPDATE
	GDK_TOUCH_END
	GDK_TOUCH_CANCEL
	GDK_TOUCHPAD_SWIPE
	GDK_TOUCHPAD_PINCH
	GDK_PAD_BUTTON_PRESS
	GDK_PAD_BUTTON_RELEASE
	GDK_PAD_RING
	GDK_PAD_STRIP
	GDK_PAD_GROUP_MODE
	GDK_EVENT_LAST
]

#enum GdkEventMask! [
  GDK_EXPOSURE_MASK:             2
  GDK_POINTER_MOTION_MASK:       4
  GDK_POINTER_MOTION_HINT_MASK:  8
  GDK_BUTTON_MOTION_MASK:        16
  GDK_BUTTON1_MOTION_MASK:       32
  GDK_BUTTON2_MOTION_MASK:       64
  GDK_BUTTON3_MOTION_MASK:       128
  GDK_BUTTON_PRESS_MASK:         256
  GDK_BUTTON_RELEASE_MASK:       512
  GDK_KEY_PRESS_MASK:            1024
  GDK_KEY_RELEASE_MASK:          2048
  GDK_ENTER_NOTIFY_MASK:         4096
  GDK_LEAVE_NOTIFY_MASK:         8192
  GDK_FOCUS_CHANGE_MASK:         16384
  GDK_STRUCTURE_MASK:            32768
  GDK_PROPERTY_CHANGE_MASK:      65536
  GDK_VISIBILITY_NOTIFY_MASK:    131072
  GDK_PROXIMITY_IN_MASK:         262144
  GDK_PROXIMITY_OUT_MASK:        524288
  GDK_SUBSTRUCTURE_MASK:         1048576
  GDK_SCROLL_MASK:               2097152
  GDK_TOUCH_MASK:                4194304
  GDK_SMOOTH_SCROLL_MASK:        8388608
  GDK_TOUCHPAD_GESTURE_MASK:     16777216
  GDK_TABLET_PAD_MASK:           33554432
  ;;GDK_ALL_EVENTS_MASK:           fffffffeh
]

GtkTextIter!: alias struct! [ 
  dummy1  [handle!]
  dummy2  [handle!]
  dummy3 [integer!]
  dummy4 [integer!]
  dummy5 [integer!]
  dummy6 [integer!]
  dummy7 [integer!]
  dummy8 [integer!]
  dummy9  [handle!]
  dummy10  [handle!]
  dummy11 [integer!]
  dummy12 [integer!]
  dummy13 [integer!]
  dummy14  [handle!]
]

#enum GtkFileChooserAction! [
  GTK_FILE_CHOOSER_ACTION_OPEN
  GTK_FILE_CHOOSER_ACTION_SAVE
  GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER
  GTK_FILE_CHOOSER_ACTION_CREATE_FOLDER
]

PangoAttribute!: alias struct! [
	klass		[handle!]
	start		[integer!]
  	end 		[integer!]
]

#enum PangoWrapMode! [
	PANGO_WRAP_WORD
	PANGO_WRAP_CHAR
	PANGO_WRAP_WORD_CHAR
]

#enum PangoEllipsizeMode! [
	PANGO_ELLIPSIZE_NONE
	PANGO_ELLIPSIZE_START
	PANGO_ELLIPSIZE_MIDDLE
	PANGO_ELLIPSIZE_END
]

#enum pango-style! [
  PANGO_STYLE_NORMAL
  PANGO_STYLE_OBLIQUE
  PANGO_STYLE_ITALIC
]

#enum pango-variant! [
  PANGO_VARIANT_NORMAL
  PANGO_VARIANT_SMALL_CAPS
]

#enum pango-underline! [
	PANGO_UNDERLINE_NONE
	PANGO_UNDERLINE_SINGLE
	PANGO_UNDERLINE_DOUBLE
	PANGO_UNDERLINE_LOW
	PANGO_UNDERLINE_ERROR
]

#enum pango-weight! [
  PANGO_WEIGHT_THIN: 100
  PANGO_WEIGHT_ULTRALIGHT: 200
  PANGO_WEIGHT_LIGHT: 300
  PANGO_WEIGHT_SEMILIGHT: 350
  PANGO_WEIGHT_BOOK: 380
  PANGO_WEIGHT_NORMAL: 400
  PANGO_WEIGHT_MEDIUM: 500
  PANGO_WEIGHT_SEMIBOLD: 600
  PANGO_WEIGHT_BOLD: 700
  PANGO_WEIGHT_ULTRABOLD: 800
  PANGO_WEIGHT_HEAVY: 900
  PANGO_WEIGHT_ULTRAHEAVY: 1000
]

#enum pango-stretch! [
  PANGO_STRETCH_ULTRA_CONDENSED
  PANGO_STRETCH_EXTRA_CONDENSED
  PANGO_STRETCH_CONDENSED
  PANGO_STRETCH_SEMI_CONDENSED
  PANGO_STRETCH_NORMAL
  PANGO_STRETCH_SEMI_EXPANDED
  PANGO_STRETCH_EXPANDED
  PANGO_STRETCH_EXTRA_EXPANDED
  PANGO_STRETCH_ULTRA_EXPANDED
]

#enum pango-font-mask! [
  PANGO_FONT_MASK_FAMILY: 1
  PANGO_FONT_MASK_STYLE: 2
  PANGO_FONT_MASK_VARIANT: 4
  PANGO_FONT_MASK_WEIGHT: 8
  PANGO_FONT_MASK_STRETCH: 16
  PANGO_FONT_MASK_SIZE: 32
  PANGO_FONT_MASK_GRAVITY: 64
]

#enum PangoAlignment! [
	PANGO_ALIGN_LEFT
	PANGO_ALIGN_CENTER
	PANGO_ALIGN_RIGHT
]

#define PANGO_SCALE 1024
#define PANGO_SCALE_XX_SMALL 0.5787037037037
#define PANGO_SCALE_X_SMALL  0.6444444444444
#define PANGO_SCALE_SMALL    0.8333333333333
#define PANGO_SCALE_MEDIUM   1.0
#define PANGO_SCALE_LARGE    1.2
#define PANGO_SCALE_X_LARGE  1.4399999999999
#define PANGO_SCALE_XX_LARGE 1.728

#enum cairo_font_slant_t! [
	CAIRO_FONT_SLANT_NORMAL
	CAIRO_FONT_SLANT_ITALIC
	CAIRO_FONT_SLANT_OBLIQUE
]

#enum cairo_font_weight_t! [
	CAIRO_FONT_WEIGHT_NORMAL
 	CAIRO_FONT_WEIGHT_BOLD
]

#enum cairo_antialias_t! [
    CAIRO_ANTIALIAS_DEFAULT
    CAIRO_ANTIALIAS_NONE
    CAIRO_ANTIALIAS_GRAY
    CAIRO_ANTIALIAS_SUBPIXEL
		CAIRO_ANTIALIAS_FAST
		CAIRO_ANTIALIAS_GOOD
		CAIRO_ANTIALIAS_BEST
]

cairo_matrix_t!: alias struct! [
    xx		[float!]
		yx		[float!]
    xy		[float!]
		yy		[float!]
    x0		[float!]
		y0		[float!]
]

; @@ cairo structures to remove if pango_cairo is enough to draw text on cairo
; cairo_text_extents_t!: alias struct! [ 
;  	x_bearing	[float!]
;  	y_bearing	[float!]
;  	width			[float!]
;  	height		[float!]
;  	x_advance	[float!]
;  	y_advance	[float!]
; ]

cairo_font_extents_t!: alias struct! [
	ascent			[float!]
	descent			[float!]
	height			[float!]
	max_x_advance	[float!]
	max_y_advance	[float!]
]

#enum cairo_format_t! [
	CAIRO_FORMAT_INVALID
	CAIRO_FORMAT_ARGB32
	CAIRO_FORMAT_RGB24
	CAIRO_FORMAT_A8
	CAIRO_FORMAT_A1
	CAIRO_FORMAT_RGB16_565
	CAIRO_FORMAT_RGB30
]

GString!: alias struct! [
	str 			[c-string!]
	len				[integer!]
	allocated_len 	[integer!]
]

GList!: alias struct! [
  data 		[int-ptr!]
  next 		[GList!]
  prev 		[GList!]
]

#enum GtkPackDirection! [
	GTK_PACK_DIRECTION_LTR
	GTK_PACK_DIRECTION_RTL
	GTK_PACK_DIRECTION_TTB
	GTK_PACK_DIRECTION_BTT
]

#enum GtkOrientation! [
	GTK_ORIENTATION_HORIZONTAL
  GTK_ORIENTATION_VERTICAL
]

#either OS = 'Windows [
	;#define LIBGOBJECT-file "libgobject-2.0-0.dll"
	;#define LIBGLIB-file	"libglib-2.0-0.dll"
	;#define LIBGIO-file		"libgio-2.0-0.dll"
	;#define LIBGDK-file		"libgdk-3-0.dll"
	#define LIBGTK-file		"libgtk-3-0.dll"
	;#define LIBCAIRO-file	"libcairo-2.dll"
][
	;#define LIBGOBJECT-file "libgobject-2.0.so.0"
	;#define LIBGLIB-file	"libglib-2.0.so.0"
	;#define LIBGIO-file		"libgio-2.0.so.0"
	;#define LIBGDK-file		"libgdk-3.so.0"
	#define LIBGTK-file		"libgtk-3.so.0"
	;#define LIBCAIRO-file	"libcairo.so"
]

#import [
	LIBGTK-file cdecl [
	;; LIBGOBJECT-file cdecl [
		g_object_set_qdata: "g_object_set_qdata" [
			object		[int-ptr!]
			quark		[integer!]
			data		[int-ptr!]
		]
		g_object_get_qdata: "g_object_get_qdata" [
			object		[int-ptr!]
			quark		[integer!]
			return:		[int-ptr!]
		]
		g_object_set: "g_object_set" [
			[variadic]
		]
		g_object_get: "g_object_get" [
			[variadic]
		]
		g_signal_connect_data: "g_signal_connect_data" [
			instance	[int-ptr!]
			signal		[c-string!]
			handler		[integer!]
			data		[int-ptr!]
			notify		[int-ptr!]
			flags		[integer!]
			return:		[integer!]
		]
		g_signal_emit_by_name: "g_signal_emit_by_name" [
			instance	[int-ptr!]
			signal		[c-string!]
		]
		g_object_ref: "g_object_ref" [
			object		[int-ptr!]
			return:		[int-ptr!]
		]
		g_object_ref_sink: "g_object_ref_sink" [
			object		[int-ptr!]
			return:		[int-ptr!]
		]
		g_object_unref: "g_object_unref" [
			object		[int-ptr!]
		]
		g_source_remove: "g_source_remove" [
			timer		[integer!]
			return:		[logic!]
		]
		g_timeout_add: "g_timeout_add" [
			ts 			[integer!]
			handler		[integer!]
			data		[int-ptr!]
			return: 	[integer!]
		]
	;; ]
	;; LIBGDK-file cdecl [
		gdk_screen_width: "gdk_screen_width" [
			return:		[integer!]
		]
		gdk_screen_height: "gdk_screen_height" [
			return:		[integer!]
		]
		gdk_screen_get_default: "gdk_screen_get_default" [
			return:		[handle!]
		]
		gdk_keymap_get_default: "gdk_keymap_get_default" [
			return: 	[handle!]
		]
		gdk_keyval_name: "gdk_keyval_name" [
			code		[integer!]
			return:		[c-string!]
		]
		gdk_keyval_to_upper: "gdk_keyval_to_upper" [
			code		[integer!]
			return:		[integer!]
		]
		gdk_atom_intern_static_string: "gdk_atom_intern_static_string" [
			name 		[c-string!]
			return:		[handle!]
		]
	;; ]
	;; LIBGLIB-file cdecl [
		g_quark_from_string: "g_quark_from_string" [
			string		[c-string!]
			return:		[integer!]
		]
		g_main_context_default: "g_main_context_default" [
			return:		[integer!]
		]
		g_main_context_acquire: "g_main_context_acquire" [
			context		[integer!]
			return:		[logic!]
		]
		g_main_context_release: "g_main_context_release" [
			context		[integer!]
		]
		g_main_context_iteration: "g_main_context_iteration" [
			context		[integer!]
			block?		[logic!]
			return:		[logic!]
		]
		g_main_context_pending: "g_main_context_pending" [
			context		[integer!]
			return: 	[logic!]
		]
		g_main_context_is_owner: "g_main_context_is_owner" [
			context		[integer!]
			return: 	[logic!]
		]
		g_main_current_source: "g_main_current_source" [
			return:		[handle!]
		]
		g_list_length: "g_list_length" [
			list			[int-ptr!]
			return:		[integer!]
		]
		g_list_nth_data: "g_list_nth_data" [
			list		[handle!]
			nth 		[integer!]
			return:		[handle!]
		]
		g_list_append: "g_list_append" [
			list		[handle!]
			data		[handle!]
			return: 	[handle!]
		]
		g_list_prepend: "g_list_prepend" [
			list		[handle!]
			data		[handle!]
			return: 	[handle!]
		]
		g_list_first: "g_list_first" [
			list		[handle!]
			return: 	[handle!]
		]
		g_list_last: "g_list_last" [
			list		[handle!]
			return: 	[handle!]
		]
		g_list_delete_link: "g_list_delete_link" [
			list		[handle!]
			link		[handle!]
			return: 	[handle!]
		]
		g_list_insert_sorted: "g_list_insert_sorted" [
			list			[handle!]
			data			[handle!]
			comp-func	[integer!]
			return: 	[handle!]
		]
		g_ascii_dtostr: "g_ascii_dtostr" [
			buffer		[c-string!]
			buf_len		[integer!]
			d			[float!]
			return:		[c-string!]
		]
		g_strdup_printf: "g_strdup_printf" [
			[variadic]
			return:		[c-string!]
		]
		g_strdup: "g_strdup" [
			str		[c-string!]
			return:	[c-string!]
		]
		g_strndup: "g_strndup"[
			str		[c-string!]
			n		[integer!]
			return:	[c-string!]
		]
		g_strconcat: "g_strconcat" [
			[variadic]
			return:	[c-string!]
		]
		g_strcmp0: "g_strcmp0" [
			str			[c-string!]
			str2		[c-string!]
			return: [integer!]
		]
		g_free: "g_free" [
			ptr		[handle!]
		]
		g_string_new: "g_string_new" [
			return:		[GString!]
		]
		g_string_sized_new: "g_string_sized_new" [
			dfl_size 	[integer!]
			return:		[GString!]
		]
		g_string_append: "g_string_append" [
			str		[GString!]
			text	[c-string!]
			return: [GString!]
		]
		g_string_assign: "g_string_assign" [
			str		[GString!]
			text	[c-string!]
			return: [GString!]
		]
		g_string_append_len: "g_string_append_len" [
			str		[GString!]
			text	[c-string!]
			len 	[integer!]
			return: [GString!]
		]
		g_string_free: "g_string_free" [
			str		[GString!]
			free	[logic!]
			return:	[c-string!]
		]
	;; ]
	;; LIBGIO-file cdecl [
		g_application_register: "g_application_register" [
			application [handle!]
			cancellable [int-ptr!]
			error		[int-ptr!]
			return:		[logic!]
		]
		g_application_activate: "g_application_activate" [
			app			[handle!]
		]
		g_application_id_is_valid: "g_application_id_is_valid" [
			id			[c-string!]
			return: 	[logic!]
		]
		g_settings_sync: "g_settings_sync" []
	;; ]
	;; LIBGTK-file cdecl [
		gtk_get_major_version: "gtk_get_major_version" [
			return: 		[integer!]
		]
		gtk_get_minor_version: "gtk_get_minor_version" [
			return: 		[integer!]
		]
		gtk_get_micro_version: "gtk_get_micro_version" [
			return: 		[integer!]
		]
		gdk_cursor_new_from_pixbuf: "gdk_cursor_new_from_pixbuf" [
			display			[handle!]
			pixbuf			[handle!]
			x						[integer!]
			y						[integer!]
			return:			[handle!]
		]
		gdk_cursor_new_from_name: "gdk_cursor_new_from_name" [
			display			[handle!]
			name				[c-string!]
			return:			[handle!]
		]
		gtk_get_current_event_time: "gtk_get_current_event_time" [
			return:			[integer!]
		]
		gtk_get_current_event_state: "gtk_get_current_event_state" [
			state				[int-ptr!]
		]
		gtk_get_current_event: "gtk_get_current_event" [
			return:			[handle!]
		]
		gtk_get_current_event_device: "gtk_get_current_event_device" [
			return: 		[handle!]
		]
		gtk_get_event_widget: "gtk_get_event_widget" [
			event				[handle!]
			return:			[handle!]
		]
		gdk_window_get_display: "gdk_window_get_display" [
			window			[handle!]
			return: 		[handle!]
		]
		gdk_window_get_device_position: "gdk_window_get_device_position" [
			window			[handle!]
 			device			[handle!]
   		x						[int-ptr!]
			y						[int-ptr!]
 			mask				[handle!]
			return:			[handle!]
		]
		gtk_application_new: "gtk_application_new" [
			app-id		[c-string!]
			flags		[integer!]
			return:		[handle!]
		]
		gtk_application_get_windows: "gtk_application_get_windows" [
			app			[handle!]
			return:		[int-ptr!]
		]
		gtk_application_get_active_window: "gtk_application_get_active_window" [
			app			[handle!]
			return:		[handle!]
		]
		gtk_application_window_new: "gtk_application_window_new" [
			app			[handle!]
			return:		[handle!]
		]
		gtk_application_add_window: "gtk_application_add_window" [
			app			[handle!]
			window		[handle!]
		]
		gtk_application_remove_window: "gtk_application_remove_window" [
			app			[handle!]
			window		[handle!]
		]
		gtk_menu_bar_new: "gtk_menu_bar_new" [
			return:		[handle!]
		]
		gtk_menu_bar_set_pack_direction: "gtk_menu_bar_set_pack_direction" [
			menubar		[handle!]
			dir				[GtkPackDirection!]
		]
		gtk_menu_bar_set_child_pack_direction: "gtk_menu_bar_set_child_pack_direction" [
			menubar		[handle!]
			dir				[GtkPackDirection!]
		]
		gtk_menu_new: "gtk_menu_new" [
			return:		[handle!]
		]
		gtk_menu_popup_at_pointer: "gtk_menu_popup_at_pointer" [
			menu			[handle!]
			event			[handle!]
		]
		gtk_menu_shell_append: "gtk_menu_shell_append" [
			menu			[handle!]
			item		[handle!]
		]
		gtk_menu_shell_prepend: "gtk_menu_shell_prepend" [
			menu			[handle!]
			item			[handle!]
		]
		gtk_menu_shell_insert: "gtk_menu_shell_insert" [
			menu			[handle!]
			item			[handle!]
			pos				[integer!]
		]
		gtk_menu_shell_select_item: "gtk_menu_shell_select_item" [
			menu			[handle!]
			item			[handle!]
		]
		gtk_menu_shell_select_first: "gtk_menu_shell_select_first" [
			menu			[handle!]
			sensitive	[logic!]
		]
		gtk_menu_shell_deselect: "gtk_menu_shell_deselect" [
			menu			[handle!]
		]
		gtk_menu_shell_activate_item: "gtk_menu_shell_activate_item" [
			menu			[handle!]
			item			[handle!]
			force			[integer!]
		]
		gtk_menu_shell_cancel: "gtk_menu_shell_cancel" [
			menu			[handle!]
		]
		gtk_menu_shell_set_take_focus: "gtk_menu_shell_set_take_focus" [
			menu			[handle!]
			focus			[integer!]
		]
		gtk_menu_shell_get_take_focus: "gtk_menu_shell_get_take_focus" [
			menu			[handle!]
			return:		[integer!]
		]
		gtk_menu_shell_get_selected_item: "gtk_menu_shell_get_selected_item" [
			menu			[handle!]
			return:		[handle!]
		]
		gtk_menu_shell_get_parent_shell: "gtk_menu_shell_get_parent_shell" [
			menu			[handle!]
			return:		[handle!]
		]
		gtk_menu_item_new: "gtk_menu_item_new" [
			return:		[handle!]
		]
		gtk_menu_item_new_with_label: "gtk_menu_item_new_with_label" [
			label			[c-string!]
			return:		[handle!]
		]
		gtk_menu_item_new_with_mnemonic: "gtk_menu_item_new_with_mnemonic" [
			label			[c-string!]
			return:		[handle!]
		]
		gtk_menu_item_get_label: "gtk_menu_item_get_label" [
			item			[handle!]
			return: 	[c-string!]
		]
		gtk_menu_item_set_label: "gtk_menu_item_set_label" [
			item			[handle!]
			label 	[c-string!]
		]
		gtk_menu_item_get_use_underline: "gtk_menu_item_get_use_underline" [
			item			[handle!]
			return: 	[logic!]
		]
		gtk_menu_item_set_use_underline: "gtk_menu_item_set_use_underline" [
			item			[handle!]
			setting 	[logic!]
		]
		gtk_menu_item_set_submenu: "gtk_menu_item_set_submenu" [
			item			[handle!]
			submenu		[handle!]
		]
		gtk_menu_item_get_submenu: "gtk_menu_item_get_submenu" [
			item			[handle!]
			return:		[handle!]
		]
		gtk_menu_item_select: "gtk_menu_item_select" [
			item			[handle!]
		]
		gtk_menu_item_deselect: "gtk_menu_item_deselect" [
			item			[handle!]
		]
		gtk_menu_item_activate: "gtk_menu_item_activate" [
			item			[handle!]
		]
		gtk_separator_menu_item_new: "gtk_separator_menu_item_new" [
			return: 	[handle!]
		]
		gtk_file_chooser_dialog_new: "gtk_file_chooser_dialog_new" [
			[variadic]
			return:		[handle!]
		]
		gtk_dialog_run: "gtk_dialog_run" [
			widget 		[handle!]
			return:		[integer!]
		]
		gtk_file_chooser_get_filename: "gtk_file_chooser_get_filename" [
			widget 		[handle!]
			return:		[c-string!]
		]
		; gtk_file_chooser_native_new: "gtk_file_chooser_native_new" [
		; 	[variadic]
		; 	return:		[handle!]
		; ]
		; gtk_native_dialog_run: "gtk_native_dialog_run" [
		; 	widget 		[handle!]
		; 	return:		[integer!]
		; ]
		gtk_font_chooser_dialog_new: "gtk_font_chooser_dialog_new" [
			title 		[c-string!]
			win 		[handle!]
			return: 	[handle!]
		]
		gtk_font_chooser_get_font_desc: "gtk_font_chooser_get_font_desc" [
			font-sel 	[handle!]
			return: 	[handle!]
		]
		gtk_init: "gtk_init" [
			argc		[int-ptr!]
			argv		[handle!]
		]
		gtk_main: "gtk_main" []
		gtk_main_quit: "gtk_main_quit" []
		gtk_main_iteration: "gtk_main_iteration" [
			return: 	[logic!]
		]
		gtk_events_pending: "gtk_events_pending" [
			return: 	[logic!]
		]
		gtk_window_new: "gtk_window_new" [
			type		[integer!]
			return:		[handle!]
		]
		gtk_window_set_title: "gtk_window_set_title" [
			window		[handle!]
			title		[c-string!]
		]
		gtk_window_set_default_size: "gtk_window_set_default_size" [
			window		[handle!]
			width		[integer!]
			height		[integer!]
		]
		gtk_window_set_resizable: "gtk_window_set_resizable" [
			window		[handle!]
			mode			[logic!]
		]
		gtk_window_move: "gtk_window_move" [
			window		[handle!]
			x			[integer!]
			y			[integer!]
		]
		gtk_window_present: "gtk_window_present" [
			window		[handle!]
		]
		gtk_window_is_active: "gtk_window_is_active" [
			window		[handle!]
			return:		[logic!]
		]
		gtk_window_set_modal: "gtk_window_set_modal" [
			window		[handle!]
			setting		[logic!]
		]
		gtk_window_set_transient_for: "gtk_window_set_transient_for" [
			window		[handle!]
			parent		[handle!]
		]
		gtk_window_iconify: "gtk_window_iconify" [
			window		[handle!]
		]
		gtk_window_close: "gtk_window_close" [
			window		[handle!]
		]
		gtk_window_set_destroy_with_parent: "gtk_window_set_destroy_with_parent" [
			window		[handle!]
			setting		[logic!]
		]
		gtk_window_get_size: "gtk_window_get_size" [
			window		[handle!]
			width		[handle!]
			height		[handle!]
		]
		gtk_propagate_event: "gtk_propagate_event" [
			widget		[handle!]
			event			[handle!]
		]
		gtk_widget_register_window: "gtk_widget_register_window" [
			widget		[handle!]
			window		[handle!]
		]
		gtk_widget_unregister_window: "gtk_widget_unregister_window" [
			widget		[handle!]
			window		[handle!]
		]
		gtk_widget_queue_draw: "gtk_widget_queue_draw" [
			widget		[handle!]
		]
		gtk_widget_queue_resize: "gtk_widget_queue_resize" [
			widget		[handle!]
		]
		gtk_widget_queue_resize_no_redraw: "gtk_widget_queue_resize_no_redraw" [
			widget		[handle!]
		]
		gtk_widget_queue_allocate: "gtk_widget_queue_allocate" [
			widget		[handle!]
		]
		gtk_widget_show_all: "gtk_widget_show_all" [
			widget		[handle!]
		]
		gtk_widget_hide: "gtk_widget_hide" [
			widget		[handle!]
		]
		gtk_widget_show: "gtk_widget_show" [
			widget		[handle!]
		]
		gtk_widget_set_halign: "gtk_widget_set_halign" [
			widget		[handle!]
			type		[integer!]
		]
		gtk_widget_set_visible: "gtk_widget_set_visible" [
			widget		[handle!]
			state 		[logic!]
		]
		gtk_widget_set_sensitive: "gtk_widget_set_sensitive" [
			widget		[handle!]
			state 		[logic!]
		]
		gtk_widget_grab_focus: "gtk_widget_grab_focus" [
			widget		[handle!]
		]
		gtk_widget_set_size_request: "gtk_widget_set_size_request" [
			widget		[handle!]
			width		[integer!]
			height		[integer!]
		]
		gtk_widget_get_size_request: "gtk_widget_get_size_request" [
			widget		[handle!]
			width		[int-ptr!]
			height		[int-ptr!]
		]
		gtk_widget_size_allocate: "gtk_widget_size_allocate" [
			widget		[handle!]
			alloc		[handle!]
		]
		gtk_widget_compute_expand: "gtk_widget_compute_expand" [
			widget		[handle!]
			direction	[integer!]
			return: 	[logic!]
		]
		gtk_widget_get_allocation: "gtk_widget_get_allocation" [
			widget		[handle!]
			alloc		[handle!]
		]
		gtk_widget_get_allocated_width: "gtk_widget_get_allocated_width" [
			widget		[handle!]
			return: 	[integer!]
		]
		gtk_widget_get_allocated_height: "gtk_widget_get_allocated_height" [
			widget		[handle!]
			return: 	[integer!]
		]
		gtk_widget_set_can_focus: "gtk_widget_set_can_focus" [
			widget		[handle!]
			focus		[logic!]
		]
		gtk_widget_set_focus_on_click: "gtk_widget_set_focus_on_click" [
			widget		[handle!]
			focus		[logic!]
		]
		gtk_widget_get_focus_on_click: "gtk_widget_get_focus_on_click" [
			widget		[handle!]
			return:		[logic!]
		]
		gtk_widget_destroy: "gtk_widget_destroy" [
			widget 	[handle!]
		]
		gtk_widget_create_pango_layout: "gtk_widget_create_pango_layout" [
			widget 	[handle!]
			text	[c-string!]
			return:	[handle!]
		]
		gtk_widget_create_pango_context: "gtk_widget_create_pango_context" [
			widget 	[handle!]
			return: [handle!]
		]
		gtk_widget_add_events: "gtk_widget_add_events" [
			widget 	[handle!]
			mask 		[integer!]
		]
		gtk_widget_get_events: "gtk_widget_get_events" [
			widget 	[handle!]
			return: [integer!]
		]
		gtk_widget_override_font: "gtk_widget_override_font" [
			widget	[handle!]
			fd		[handle!] 
		]
		gtk_widget_override_color: "gtk_widget_override_color" [
			widget	[handle!]
			state	[integer!]
			color	[handle!] 
		]
		gtk_container_add: "gtk_container_add" [
			container	[handle!]
			widget		[handle!]
		]
		gtk_container_get_children: "gtk_container_get_children" [
			container	[handle!]
			return:		[int-ptr!]
		]
		gtk_container_foreach: "gtk_container_foreach" [
			container	[handle!]
			handler		[integer!]
			data		[int-ptr!]
		]
		gtk_container_remove: "gtk_container_remove" [
			container	[handle!]
			widget		[handle!]
		]
		gtk_frame_new: "gtk_frame_new" [
			label		[c-string!]
			return: 	[handle!]
		]
		gtk_frame_set_label: "gtk_frame_set_label" [
			frame		[handle!]
			label		[c-string!]
		]
		gtk_frame_set_label_align: "gtk_frame_set_label_align" [
			frame		[handle!]
			xalign		[float!]
			yalign		[float!]
		]
		gtk_frame_set_shadow_type: "gtk_frame_set_shadow_type" [
			frame		[handle!]
			shadow		[integer!]
		]
		gtk_box_new: "gtk_box_new" [
			orient		[GtkOrientation!]
			spacing		[integer!]
			return:		[handle!]
		]
		gtk_box_pack_start: "gtk_box_pack_start" [
			box				[handle!]
			widget		[handle!]
			expand		[logic!]
			fill			[logic!]
			padding		[integer!]
		]
		gtk_fixed_new: "gtk_fixed_new" [
			return:		[handle!]
		]
		gtk_fixed_put: "gtk_fixed_put" [
			fixed			[handle!]
			widget		[handle!]
			x					[integer!]
			y					[integer!]
		]
		gtk_fixed_move: "gtk_fixed_move" [
			fixed			[handle!]
			widget		[handle!]
			x					[integer!]
			y					[integer!]
		]
		gtk_layout_new: "gtk_layout_new" [
			hadj			[handle!]
			vadj			[handle!]
			return:		[handle!]
		]
		gtk_layout_put: "gtk_layout_put" [
			layout		[handle!]
			widget		[handle!]
			x					[integer!]
			y					[integer!]
		]
		gtk_layout_move: "gtk_layout_move" [
			layout		[handle!]
			widget		[handle!]
			x					[integer!]
			y					[integer!]
		]
		gtk_layout_set_size: "gtk_layout_set_size" [
			layout		[handle!]
			w					[integer!]
			h					[integer!]
		]
		gtk_layout_get_size: "gtk_layout_get_size" [
			layout		[handle!]
			w					[int-ptr!]
			h					[int-ptr!]
		]
		gtk_bin_get_child: "gtk_bin_get_child" [
			bin			[handle!]
			return:		[handle!]
		]
		gtk_list_box_new: "gtk_list_box_new" [
			return:		[handle!]
		]
		gtk_list_box_select_row: "gtk_list_box_select_row" [
			listbox		[handle!]
			row			[handle!]
		]
		gtk_list_box_get_selected_row: "gtk_list_box_get_selected_row" [
			listbox		[handle!]
			return:		[handle!]
		]
		gtk_list_box_get_row_at_index: "gtk_list_box_get_row_at_index" [
			listbox		[handle!]
			index		[integer!]
			return:		[handle!]
		]
		gtk_list_box_row_get_index: "gtk_list_box_row_get_index" [
			row			[handle!]
			return:		[integer!]
		]
		gtk_scrolled_window_new: "gtk_scrolled_window_new" [
			hadj		[handle!]
			vadj		[handle!]
			return:		[handle!]
		]
		gtk_scrolled_window_set_shadow_type: "gtk_scrolled_window_set_shadow_type" [
			hwnd		[handle!]
			type		[integer!]
		]
		gtk_button_new_with_label: "gtk_button_new_with_label" [
			label		[c-string!]
			return:		[handle!]
		]
		gtk_button_set_label: "gtk_button_set_label" [
			button		[handle!]
			label		[c-string!]
		]
		gtk_button_set_image: "gtk_button_set_image" [
			button 		[handle!]
			image 		[handle!]
		]
		gtk_check_button_new_with_label: "gtk_check_button_new_with_label" [
			label		[c-string!]
			return:		[handle!]
		]
		gtk_radio_button_new_with_label: "gtk_radio_button_new_with_label" [
			group		[handle!]
			label		[c-string!]
			return:		[handle!]
		]
		gtk_radio_button_new_with_label_from_widget: "gtk_radio_button_new_with_label_from_widget" [
			group		[handle!]
			label		[c-string!]
			return:		[handle!]
		]
		gtk_toggle_button_get_active: "gtk_toggle_button_get_active" [
			button		[handle!]
			return:		[logic!]
		]
		gtk_toggle_button_get_inconsistent: "gtk_toggle_button_get_inconsistent" [
			button		[handle!]
			return:		[logic!]
		]
		gtk_toggle_button_set_inconsistent: "gtk_toggle_button_get_inconsistent" [
			button		[handle!]
			inconsist?	[logic!]
		]
		gtk_toggle_button_set_active: "gtk_toggle_button_set_active" [
			button		[handle!]
			active?		[logic!]
		]
		gtk_toggle_button_toggled: "gtk_toggle_button_toggled" [
			button		[handle!]
		]
		gtk_radio_button_get_group: "gtk_radio_button_get_group" [
			radio 		[handle!]
			return:		[handle!]
		]
		gtk_drawing_area_new: "gtk_drawing_area_new" [
			return:		[handle!]
		]
		gtk_image_new_from_pixbuf: "gtk_image_new_from_pixbuf" [
			pixbuf 		[handle!]
			return: 	[handle!]
		]
		gtk_image_new_from_file: "gtk_image_new_from_file" [
			filename 	[c-string!]
			return: 	[handle!]
		]
		gtk_label_new: "gtk_label_new" [
			label		[c-string!]
			return:		[handle!]
		]
		gtk_label_get_text: "gtk_label_get_text" [
			widget		[handle!]
			return:		[c-string!]
		]
		gtk_label_set_text: "gtk_label_set_text" [
			widget		[handle!]
			label		[c-string!]
		]
		gtk_event_box_new: "gtk_event_box_new" [
			return: 	[handle!]
		]
		gtk_entry_new: "gtk_entry_new" [
			return:		[handle!]
		]
		gtk_entry_set_width_chars: "gtk_entry_set_width_chars" [
			entry		[handle!]
			nchars		[integer!]
		]
		gtk_entry_get_buffer: "gtk_entry_get_buffer" [
			entry		[handle!]
			return:		[handle!]
		]
		gtk_entry_get_text: "gtk_entry_get_text" [
			buffer		[handle!]
			return: 	[c-string!]
		]
		gtk_entry_set_text: "gtk_entry_set_text" [
			buffer		[handle!]
			text		[c-string!]
		]
		gtk_entry_buffer_set_text: "gtk_entry_buffer_set_text" [
			buffer		[handle!]
			text		[c-string!]
			len			[integer!]
		]
		gtk_editable_select_region: "gtk_editable_select_region" [
			entry		[handle!]
			start		[integer!]
			end			[integer!]
		]
		gtk_editable_get_selection_bounds: "gtk_editable_get_selection_bounds" [
			entry		[handle!]
			start		[int-ptr!]
			end			[int-ptr!]
			return: [logic!]
		]

		gtk_scale_new_with_range: "gtk_scale_new_with_range" [
			vertical?	[logic!]
			min			[float!]
			max			[float!]
			step		[float!]
			return:		[handle!]
		]
		gtk_scale_set_draw_value: "gtk_scale_set_draw_value" [
			scale		[handle!]
			draw?		[logic!]
		]
		gtk_scale_set_has_origin: "gtk_scale_set_has_origin" [
			scale		[handle!]
			origin?		[logic!]
		]
		gtk_range_set_value: "gtk_range_set_value" [
			range		[handle!]
			value		[float!]
		]
		gtk_range_get_value: "gtk_range_get_value" [
			range		[handle!]
			return:		[float!]
		]
		gtk_progress_bar_new: "gtk_progress_bar_new" [
			return:		[handle!]
		]
		gtk_progress_bar_set_fraction: "gtk_progress_bar_set_fraction" [
			progress	[handle!]
			val			[float!]
		]
		gtk_progress_bar_get_fraction: "gtk_progress_bar_get_fraction" [
			progress	[handle!]
			return:		[float!]
		]
		gtk_progress_bar_set_inverted: "gtk_progress_bar_set_inverted" [
			progress 	[handle!]
			inv 		[logic!]
		]
		gtk_orientable_set_orientation: "gtk_orientable_set_orientation" [
			widget 		[handle!]
			orient		[integer!]
		]
		gtk_text_view_new: "gtk_text_view_new" [
			return:		[handle!]
		]
		gtk_text_view_get_buffer: "gtk_text_view_get_buffer" [
			view		[handle!]
			return:		[handle!]
		]
		gtk_text_buffer_set_text: "gtk_text_buffer_set_text" [
			buffer		[handle!]
			text		[c-string!]
			len			[integer!]
		]
		gtk_text_buffer_get_text: "gtk_text_buffer_get_text" [
			buffer		[handle!]
			start		[handle!]
			end			[handle!]
			exclude		[logic!]
			return:		[c-string!]
		]
		gtk_text_buffer_get_bounds: "gtk_text_buffer_get_bounds" [
			buffer		[handle!]
			start		[handle!]
			end			[handle!]
		]
		gtk_text_buffer_get_selection_bounds: "gtk_text_buffer_get_selection_bounds" [
			buffer		[handle!]
			start		[handle!]
			end			[handle!]
			return: [logic!]
		]
		gtk_text_buffer_select_range: "gtk_text_buffer_select_range" [
			buffer	[handle!]
			ins			[handle!]
			bound		[handle!]
		]
		gtk_text_buffer_create_tag: "gtk_text_buffer_create_tag" [
			[variadic]
			return: 	[handle!]
		]
		gtk_text_iter_get_offset: "gtk_text_iter_get_offset" [
			iter		[handle!]
			return:	[integer!]
		]
		gtk_text_iter_set_offset: "gtk_text_iter_set_offset" [
			iter		[handle!]
			offset	[integer!]
		]
		gtk_text_iter_get_line: "gtk_text_iter_get_line" [
			iter		[handle!]
			return:	[integer!]
		]
		gtk_combo_box_text_new: "gtk_combo_box_text_new" [
			return:		[handle!]
		]
		gtk_combo_box_text_new_with_entry: "gtk_combo_box_text_new_with_entry"  [
			return:		[handle!]
		]
		gtk_combo_box_text_append_text: "gtk_combo_box_text_append_text" [
			combo		[handle!]
			item 		[c-string!]
		]
		gtk_combo_box_text_remove_all: "gtk_combo_box_text_remove_all" [
			combo		[handle!]
		]
		gtk_combo_box_get_active: "gtk_combo_box_get_active" [
			combo		[handle!]
			return: 	[integer!]
		]
		gtk_combo_box_set_active: "gtk_combo_box_set_active" [
			combo		[handle!]
			item		[integer!]
		]
		gtk_combo_box_text_get_active_text: "gtk_combo_box_text_get_active_text"  [
			combo		[handle!]
			return:		[c-string!]
		]
		gtk_notebook_new: "gtk_notebook_new" [
			return:		[handle!]
		]
		gtk_notebook_append_page: "gtk_notebook_append_page" [
			nb			[handle!]
			pane		[handle!]
			label		[handle!]
			return: 	[integer!]
		]
		gtk_notebook_get_current_page: "gtk_notebook_get_current_page" [
			nb			[handle!]
			return: 	[integer!]
		]

		gtk_notebook_set_current_page: "gtk_notebook_set_current_page" [
			nb			[handle!]
			index 		[integer!]
		]

		gtk_notebook_get_nth_page: "gtk_notebook_get_nth_page" [
			nb			[handle!]
			index	 	[integer!]
			return: 	[handle!]
		]
		gtk_notebook_get_tab_label_text: "gtk_notebook_get_tab_label_text" [
			nb			[handle!]
			page		[handle!]
			return:		[c-string!]
		]
		gtk_notebook_get_n_pages: "gtk_notebook_get_n_pages" [
			nb			[handle!]
			return: 	[integer!]	
		]
		gtk_css_provider_new: "gtk_css_provider_new" [
			return:		[handle!]
		]
		gtk_css_provider_load_from_data: "gtk_css_provider_load_from_data" [
			provider	[handle!]
			data		[c-string!]
			length		[integer!]
			error		[handle!]
		]
		gtk_style_context_add_provider: "gtk_style_context_add_provider" [
			context		[handle!]
			provider	[handle!]
			priority	[integer!]
		]
		gtk_style_context_add_provider_for_screen: "gtk_style_context_add_provider_for_screen" [
			screen		[handle!]
			provider	[handle!]
			priority	[integer!]
		]
		gtk_style_context_add_class: "gtk_style_context_add_class" [
			context		[handle!]
			class		[c-string!]
		]
		gtk_style_context_to_string: "gtk_style_context_to_string" [
			context		[handle!]
			type		[integer!]
			return:		[c-string!]
		]
		gtk_style_context_get: "gtk_style_context_get" [
			[variadic]
		]
		gtk_style_context_get_font: "gtk_style_context_get_font" [
			context		[handle!]
			type		[integer!]
			return:		[handle!]
		]
		gtk_widget_get_style_context: "gtk_widget_get_style_context" [
			widget		[handle!]
			return:		[handle!]
		]
		pango_layout_new: "pango_layout_new" [
			context		[handle!]
			return:		[handle!]
		]
		pango_layout_copy: "pango_layout_copy" [
			context		[handle!]
			return: 	[handle!]
		]
		pango_layout_get_context: "pango_layout_get_context" [
			layout		[handle!]
			return: 	[handle!]
		]
   	pango_layout_set_text: "pango_layout_set_text" [
			layout		[handle!]
			text		[c-string!]
			len			[integer!]
		]
		pango_layout_set_markup: "pango_layout_set_markup" [
			layout	[handle!]
			markup	[c-string!]
			len			[integer!]
		]
		pango_layout_set_markup_with_accel: "pango_layout_set_markup_with_accel" [
			layout			[handle!]
			markup			[c-string!]
			len					[integer!]
			accel_mark	[integer!]
			accel_char	[int-ptr!]
		] 
   	pango_layout_set_font_description: "pango_layout_set_font_description" [
			layout		[handle!]
			fontdesc	[handle!]
		]
   	pango_layout_get_pixel_size: "pango_layout_get_pixel_size" [
			layout		[handle!]
			width		[int-ptr!]
			height		[int-ptr!]
		]
		pango_layout_get_line: "pango_layout_get_line" [
			layout		[handle!]
			line		[integer!]
			return:		[handle!]
		]
		pango_layout_get_line_readonly: "pango_layout_get_line_readonly" [
			layout		[handle!]
			line		[integer!]
			return:		[handle!]
		]
		pango_layout_get_character_count: "pango_layout_get_character_count" [
			layout		[handle!]
			return:		[integer!]
		]
		pango_layout_is_wrapped: "pango_layout_is_wrapped" [
			layout		[handle!]
			return:		[logic!]
		]
		pango_layout_set_wrap: "pango_layout_set_wrap" [
			layout		[handle!]
			mode			[PangoWrapMode!]
		]
		pango_layout_get_wrap: "pango_layout_get_wrap" [
			layout		[handle!]
			return:		[PangoWrapMode!]
		]
		pango_layout_is_ellipsized: "pango_layout_is_ellipsized" [
			layout		[handle!]
			return:		[logic!]
		]
		pango_layout_set_ellipsize: "pango_layout_set_ellipsize" [
			layout		[handle!]
			mode			[PangoEllipsizeMode!]
		]
		pango_layout_get_ellipsize: "pango_layout_get_ellipsize" [
			layout		[handle!]
			return:		[PangoEllipsizeMode!]
		]
		pango_layout_get_indent: "pango_layout_get_indent" [
			layout		[handle!]
			return:		[integer!]
		]
		pango_layout_set_indent: "pango_layout_set_indent" [
			layout		[handle!]
			indent		[integer!]
		]
		pango_layout_get_spacing: "pango_layout_get_spacing" [
			layout		[handle!]
			return:		[integer!]
		]
		pango_layout_set_spacing: "pango_layout_set_spacing" [
			layout		[handle!]
			spacing		[integer!]
		]
		pango_layout_get_justify: "pango_layout_get_justify" [
			layout		[handle!]
			return:		[logic!]
		]
		pango_layout_set_justify: "pango_layout_set_justify" [
			layout		[handle!]
			justify		[logic!]
		]
		pango_layout_set_alignment: "pango_layout_set_alignment" [
			layout		[handle!]
			align			[PangoAlignment!]
		]
		pango_layout_get_alignment: "pango_layout_get_alignment" [
			layout		[handle!]
			return:		[PangoAlignment!]
		]
		pango_layout_set_width: "pango_layout_set_width" [
			layout		[handle!]
			width			[integer!]
		]
		pango_layout_get_width: "pango_layout_get_width" [
			layout		[handle!]
			return:		[integer!]
		]
		pango_layout_set_height: "pango_layout_set_height" [
			layout		[handle!]
			height			[integer!]
		]
		pango_layout_get_height: "pango_layout_get_height" [
			layout		[handle!]
			return:		[integer!]
		]
    pango_layout_get_size: "pango_layout_get_size" [
			 layout		[handle!]
			 width		[int-ptr!]
			 height		[int-ptr!]
		]
		pango_layout_set_attributes: "pango_layout_set_attributes" [
			layout		[handle!]
			attrs		[handle!]
		]
		pango_layout_get_iter: "pango_layout_get_iter" [
			layout		[handle!]
			return: 	[handle!]
		]
		pango_layout_iter_get_baseline: "pango_layout_iter_get_baseline" [
			iter			[handle!]
			return:		[integer!]
		]
		pango_layout_get_extents: "pango_layout_get_extents" [
			layout		[handle!]
			irect			[tagRECT]
			lrect			[tagRECT]
		]
		pango_layout_get_pixel_extents: "pango_layout_get_pixel_extents" [
			layout		[handle!]
			irect			[tagRECT]
			lrect			[tagRECT]
		]
		pango_layout_index_to_pos: "pango_layout_index_to_pos" [
			layout		[handle!]
			index			[integer!]
			pos				[tagRECT]
		]
		pango_layout_index_to_line_x: "pango_layout_index_to_line_x" [
			layout		[handle!]
			index			[integer!]
			trailing	[integer!]
			line			[int-ptr!]
			x-pos			[int-ptr!]
		]
		pango_layout_xy_to_index: "pango_layout_xy_to_index" [
			layout		[handle!]
			x					[integer!]
			y					[integer!]
			index			[int-ptr!]
			trailing	[int-ptr!]
			return:		[logic!]
		]
		pango_layout_get_cursor_pos: "pango_layout_get_cursor_pos" [
			layout		[handle!]
			index			[integer!]
			spos			[tagRECT]
			wpos			[tagRECT]
		]
		pango_layout_move_cursor_visually: "pango_layout_move_cursor_visually" [
			layout		[handle!]
			strong		[logic!]
			old_ind		[integer!]
			old_trail	[integer!]
			direct		[integer!]
			new_ind		[int-ptr!]
			new_trail	[int-ptr!]
		]
		pango_layout_get_line_count: "pango_layout_get_line_count" [
			layout		[handle!]
			return:		[integer!]
		]
		pango_layout_line_get_pixel_extents: "pango_layout_line_get_pixel_extents" [
			line			[handle!]
			irect			[tagRECT]
			lrect			[tagRECT]
		]


		pango_font_description_new: "pango_font_description_new" [
			return: 	[handle!]
		]
		pango_font_description_free: "pango_font_description_free" [
			fontdesc 	[handle!]
		]
		pango_font_description_from_string: "pango_font_description_from_string" [
			str			[c-string!]
			return:		[handle!]
		]
		pango_font_description_to_string: "pango_font_description_from_string" [
			fontdesc	[handle!]
			return:		[c-string!]
		]
		pango_font_description_set_family: "pango_font_description_set_family" [
			fontdesc 	[handle!]
			name		[c-string!]
		]
		pango_font_description_get_family: "pango_font_description_get_family" [
			fontdesc 	[handle!]
			return:		[c-string!]
		]
		pango_font_description_set_size: "pango_font_description_set_size" [
			fontdesc 	[handle!]
			size		[integer!]
		]
		pango_font_description_get_size: "pango_font_description_get_size" [
			fontdesc 	[handle!]
			return:		[integer!]
		]
		pango_font_description_set_weight: "pango_font_description_set_weight" [
			fontdesc 	[handle!]
			weight		[integer!]
		]
		pango_font_description_get_weight: "pango_font_description_get_weight" [
			fontdesc 	[handle!]
			return:		[integer!]
		]
		pango_font_description_set_style: "pango_font_description_set_style" [
			fontdesc 	[handle!]
			style		[integer!]
		]
		pango_font_description_get_style: "pango_font_description_get_style"  [
			fontdesc 	[handle!]
			return:		[integer!]
		]
		pango_font_description_set_stretch: "pango_font_description_set_stretch" [
			fontdesc 	[handle!]
			stretch		[integer!]
		]
		pango_font_description_get_stretch: "pango_font_description_get_stretch" [
			fontdesc 	[handle!]
			return:		[integer!]
		]
		pango_font_description_set_variant: "pango_font_description_set_variant" [
			fontdesc 	[handle!]
			variant		[integer!]
		]
		pango_font_description_get_variant: "pango_font_description_get_variant" [
			fontdesc 	[handle!]
			return:		[integer!]
		]
		gdk_pango_context_get: "gdk_pango_context_get" [
			return:		[handle!]
		]

		gdk_pango_context_get_for_screen: "gdk_pango_context_get_for_screen" [
			screen		[handle!]
			return:		[handle!]
		]

		

		gtk_widget_get_pango_context: "gtk_widget_get_pango_context" [
			return:		[handle!]
		]
		
		gtk_settings_get_default: "gtk_settings_get_default" [
			return: 	[handle!]
		]

	;; LIBCAIRO-file cdecl [
		cairo_create: "cairo_create" [
			surf			[handle!]
			return:		[handle!]
		]

		cairo_destroy: "cairo_destroy" [
			cr			[handle!]
		]

		cairo_clip: "cairo_clip" [
			cr			[handle!]
		]

		cairo_line_to: "cairo_line_to" [
			cr			[handle!]
			x				[float!]
			y				[float!]
		]

		cairo_rel_line_to: "cairo_rel_line_to" [
			cr			[handle!]
			dx			[float!]
			dy			[float!]
		]

		cairo_curve_to: "cairo_curve_to" [
			cr			[handle!]
			x1			[float!]
			y1			[float!]
			x2			[float!]
			y2			[float!]
			x3			[float!]
			y3			[float!]
		]

		cairo_rel_curve_to: "cairo_curve_to" [
			cr			[handle!]
			dx1			[float!]
			dy1			[float!]
			dx2			[float!]
			dy2			[float!]
			dx3			[float!]
			dy3			[float!]
		]

		cairo_move_to: "cairo_move_to" [
			cr			[handle!]
			x			[float!]
			y			[float!]
		]

		cairo_rel_move_to: "cairo_rel_move_to" [
			cr			[handle!]
			dx			[float!]
			dy			[float!]
		]

		cairo_arc: "cairo_arc" [
			cr			[handle!]
			xc			[float!]
			yc			[float!]
			radius		[float!]
			angle1		[float!]
			angle2		[float!]
		]
		cairo_arc_negative: "cairo_arc_negative" [
			cr			[handle!]
			xc			[float!]
			yc			[float!]
			radius		[float!]
			angle1		[float!]
			angle2		[float!]
		]
		cairo_rectangle: "cairo_rectangle" [
			cr			[handle!]
			x			[float!]
			y			[float!]
			w			[float!]
			h			[float!]
		]
		cairo_new_path: "cairo_new_path" [
			cr			[handle!]
		]
		cairo_new_sub_path: "cairo_new_sub_path" [
			cr			[handle!]
		]
		cairo_close_path: "cairo_close_path" [
			cr			[handle!]
		]
		cairo_get_current_point: "cairo_get_current_point" [
			cr			[handle!]
			x			[float-ptr!]
			y			[float-ptr!]
		]
		cairo_has_current_point: "cairo_has_current_point" [
			cr			[handle!]
			return:		[integer!]
		]
		cairo_stroke: "cairo_stroke" [
			cr			[handle!]
		]
		cairo_fill: "cairo_fill" [
			cr			[handle!]
		]
		cairo_fill_preserve: "cairo_fill_preserve" [
			cr			[handle!]
		]
		cairo_paint: "cairo_paint" [
			cr			[handle!]
		]
		cairo_save: "cairo_save" [
			cr			[handle!]
		]
		cairo_scale: "cairo_scale" [
			cr			[handle!]
			x			[float!]
			y			[float!]
		]
		cairo_translate: "cairo_translate" [
			cr			[handle!]
			x			[float!]
			y			[float!]
		]
		cairo_toy_font_face_create: "cairo_toy_font_face_create" [
			family		[c-string!]
			slant		[integer!]
			weight		[integer!]
			return:		[handle!]
		]
		cairo_restore: "cairo_restore" [
			cr			[handle!]
		]
		cairo_set_source_rgba: "cairo_set_source_rgba" [
			cr			[handle!]
			red			[float!]
			green		[float!]
			blue		[float!]
			alpha		[float!]
		]
		cairo_set_line_cap: "cairo_set_line_cap" [
			cr			[handle!]
			line_cap	[integer!]
		]
		cairo_set_line_width: "cairo_set_line_width" [
			cr			[handle!]
			width		[float!]
		]
		cairo_set_line_join: "cairo_set_line_join" [
			cr			[handle!]
			line_join	[integer!]
		]
		cairo_set_source: "cairo_set_source" [
			cr			[handle!]
			source		[handle!]
		]
		cairo_set_source_surface: "cairo_set_source_surface" [
			cr			[handle!]
			surface		[handle!]
			x			[float!]
			y			[float!]
		]
		cairo_set_font_face: "cairo_set_font_face" [
			cr			[handle!]
			font_face	[handle!]
		]
		cairo_set_font_size: "cairo_set_font_size" [
			cr			[handle!]
			size		[float!]
		]
		cairo_show_text: "cairo_show_text" [
			cr          [handle!]
			utf8		[c-string!]
		]
		cairo_get_source: "cairo_get_source" [
			cr			[handle!]
			return:		[handle!]
		]
		cairo_set_antialias: "cairo_set_antialias" [
			cr			[handle!]
			antialias	[integer!]
		]
		cairo_pattern_create_linear: "cairo_pattern_create_linear" [
			x0			[float!]
			y0			[float!]
			x1			[float!]
			y1			[float!]
			return:		[handle!]
		]
		cairo_pattern_create_radial: "cairo_pattern_create_radial" [
			cx0			[float!]
			cy0			[float!]
			radius0		[float!]
			cx1			[float!]
			cy1			[float!]
			radius1		[float!]
			return:		[handle!]
		]
		cairo_pattern_add_color_stop_rgba: "cairo_pattern_add_color_stop_rgba" [
			pattern		[handle!]
			offset		[float!]
			red			[float!]
			green		[float!]
			blue		[float!]
			alpha		[float!]
		]
		cairo_pattern_destroy: "cairo_pattern_destroy" [
			pattern		[handle!]
		]
		cairo_rotate: "cairo_rotate" [
			cr			[handle!]
			angle 		[float!]
		]
		cairo_identity_matrix: "cairo_identity_matrix" [
			cr			[handle!]
		]
		cairo_stroke_preserve: "cairo_stroke_preserve" [
			cr			[handle!]
		]
		cairo_get_matrix: "cairo_get_matrix" [
			cr			[handle!]
			mat			[cairo_matrix_t!]
		]
		cairo_set_matrix: "cairo_set_matrix" [
			cr			[handle!]
			mat			[cairo_matrix_t!]
		]
		cairo_transform: "cairo_transform" [
			cr			[handle!]
			mat			[cairo_matrix_t!]
		]
		; Related to draw text with cairo (no succes for base widget) replaced by pango_cairo
		cairo_select_font_face: "cairo_select_font_face" [
			cr			[handle!]
			family		[c-string!]
			slant		[integer!]
			weight		[integer!]
		]
		; cairo_set_font_size: "cairo_set_font_size" [
		; 	cr			[handle!]
		; 	size		[integer!]
		; ]
		;
		cairo_font_extents: "cairo_font_extents" [
			cr			[handle!]
			extents		[cairo_font_extents_t!]
		]
		; cairo_show_text: "cairo_show_text" [
		; 	cr			[handle!]
		; 	text 		[c-string!]
		; ]
		cairo_image_surface_create: "cairo_image_surface_create" [
			format		[cairo_format_t!]
			width			[integer!]
			height		[integer!]
			return:		[handle!]	
		]
		cairo_image_surface_create_for_data: "cairo_image_surface_create_for_data" [
			data			[byte-ptr!]
			format		[cairo_format_t!]
			width			[integer!]
			height		[integer!]
			stride		[integer!]
			return:		[handle!]
		]
		cairo_surface_finish: "cairo_surface_finish" [
			surf			[handle!]
		]
		cairo_surface_destroy: "cairo_surface_destroy" [
			surf			[handle!]
		]
		cairo_image_surface_get_data: "cairo_image_surface_get_data" [
			surf			[handle!]
			return:		[byte-ptr!]
		]
		cairo_surface_flush: "cairo_surface_flush" [
			surf			[handle!]
		]
		cairo_surface_mark_dirty: "cairo_surface_mark_dirty" [
			surf			[handle!]
		]
		cairo_format_stride_for_width: "cairo_format_stride_for_width" [
			format		[cairo_format_t!]
			width			[integer!]
			return: 	[integer!]
		]
		gdk_cairo_set_source_pixbuf: "gdk_cairo_set_source_pixbuf" [
			cr 			[handle!]
			pixbuf 	[handle!]
			x 			[integer!]
			y 			[integer!]
		]
		gdk_pixbuf_new: "gdk_pixbuf_new" [
			colorsp 	[integer!]
			alpha 		[logic!]
			bits 		[integer!]
			width 		[integer!]
			height 		[integer!]
			return: 	[handle!]
		]
		gdk_pixbuf_copy: "gdk_pixbuf_copy" [
			pixbuf 		[handle!]
			return: 	[handle!]
		]
		gdk_pixbuf_scale: "gdk_pixbuf_scale" [
			src			[handle!]
			dest		[handle!]
			dest_x		[integer!]
			dest_y		[integer!]
			dest_width	[integer!]
			dest_height	[integer!]
			offset_x	[float!]
			offset_y	[float!]
			scale_x		[float!]
			scale_y		[float!]
			interp_type	[integer!]
		]
		gdk_pixbuf_scale_simple: "gdk_pixbuf_scale_simple"  [
			src			[handle!]
			dest_width	[integer!]
			dest_height	[integer!]
			interp_type	[integer!]
			return: 	[handle!]
		]
		gdk_pixbuf_get_from_surface: "gdk_pixbuf_get_from_surface" [
			surf			[handle!]
			src_x			[integer!]
			src_y			[integer!]
			width			[integer!]
			height		[integer!]
			return:		[handle!]
		]
		gdk_pixbuf_get_from_window: "gdk_pixbuf_get_from_window" [
			window		[handle!]
			src_x			[integer!]
			src_y			[integer!]
			width			[integer!]
			height		[integer!]
			return:		[handle!]
		]
		gdk_pixbuf_get_n_channels: "gdk_pixbuf_get_n_channels" [
			pixbuf		[handle!]
			return: 	[integer!]
		]

		;; Useless since already called inside pango_cairo_create_context
		; pango_cairo_font_map_get_default: "pango_cairo_font_map_get_default" [
		; 	return: 	[handle!]
		; ]

		pango_cairo_create_context: "pango_cairo_create_context" [
			cr 			[handle!]
			return: 	[handle!]
		]
		pango_cairo_create_layout: "pango_cairo_create_layout" [
			cr 			[handle!]
			return: 	[handle!]
		]
		pango_cairo_update_layout: "pango_cairo_update_layout" [
			cr 			[handle!]
			layout 		[handle!]
		]
		pango_cairo_show_layout: "pango_cairo_show_layout" [
			cr 			[handle!]
			layout 		[handle!]
		]
		pango_cairo_show_layout_line: "pango_cairo_show_layout_line" [
			cr 			[handle!]
			layout_line [handle!]
		]
		pango_cairo_context_set_font_options: "pango_cairo_context_set_font_options" [
			cr 			[handle!]
			opts		[handle!]
		]
		pango_context_load_font: "pango_context_load_font" [
			context		[handle!]
			fd				[handle!]
			return: 	[handle!]
		]
		pango_font_map_create_context: "pango_font_map_create_context" [
			fontmap		[handle!]
			return:		[handle!]
		]
		pango_parse_markup: "pango_parse_markup" [
			markup_text		[c-string!]
            length 			[integer!]
            accel_marker	[integer!] 	;gunichar=guint32
            attr_list		[handle!] 	;[pointer! [handle!]]
            text			[handle!] 	;[pointer! [c-string!]]
            accel_char		[integer!] 	;gunichar=gunit32
            error			[handle!]
			return: 		[logic!]
		]
		pango_attr_list_new: "pango_attr_list_new" [
			return: 	[handle!]
		]
 		pango_attr_list_ref: "pango_attr_list_ref" [
			 attrs 		[handle!]
			 return: 	[handle!]
		 ]
 		pango_attr_list_unref: "pango_attr_list_unref" [
			 attrs 		[handle!]
		 ]
		pango_attr_list_copy: "pango_attr_list_copy" [
			attrs 		[handle!]
			return: 	[handle!]
		 ]
		pango_attr_list_insert: "pango_attr_list_insert" [
			attrs 		[handle!]
			attr 		[PangoAttribute!]
		]
		pango_attr_list_change: "pango_attr_list_change" [
			attrs 		[handle!]
			attr 		[PangoAttribute!]
		]
		pango_attr_list_insert_before: "pango_attr_list_insert_before" [
			attrs 		[handle!]
			attr 		[PangoAttribute!]
		] 
		pango_attr_list_splice: "pango_attr_list_splice" [
			attrs 		[handle!]
			attrs2 		[handle!]
			pos			[integer!]
			len			[integer!]
		]

		pango_attribute_equal: "pango_attribute_equal" [
			attr 		[handle!]
			attr2 		[handle!]
			return:		[logic!]
		]
		pango_attribute_destroy: "pango_attribute_destroy" [
			attr		[PangoAttribute!]
		]
		;; font description attributes
		pango_attr_family_new: "pango_attr_family_new" [
			name		[c-string!]
			return: 	[PangoAttribute!]
		]
		pango_attr_style_new: "pango_attr_style_new" [
			style		[integer!]
			return: 	[PangoAttribute!]
		]
		pango_attr_variant_new: "pango_attr_variant_new" [
			variant		[integer!]
			return: 	[PangoAttribute!]
		]
		pango_attr_stretch_new: "pango_attr_stretch_new" [
			stretch		[integer!]
			return: 	[PangoAttribute!]
		]
		pango_attr_weight_new: "pango_attr_weight_new" [
			weight		[integer!]
			return: 	[PangoAttribute!]
		]
		pango_attr_size_new: "pango_attr_size_new" [
			size		[integer!]
			return: 	[PangoAttribute!]
		]
		pango_attr_size_new_absolute: "pango_attr_size_new_absolute" [
			size		[integer!]
			return: 	[PangoAttribute!]
		]
		pango_attr_font_desc_new: "pango_attr_font_desc_new" [
			font-desc	[handle!]
			return: 	[PangoAttribute!]
		]
		;; Color attributes
		pango_attr_foreground_new: "pango_attr_foreground_new" [
			r			[integer!]
			g			[integer!]
			b			[integer!]
			return: 	[PangoAttribute!]
		]
		pango_attr_background_new: "pango_attr_background_new" [
			r			[integer!]
			g			[integer!]
			b			[integer!]
			return: 	[PangoAttribute!]
		]
		;; styles attributes
		pango_attr_strikethrough_new: "pango_attr_strikethrough_new" [
			ok			[logic!]
			return: 	[PangoAttribute!]
		]
		pango_attr_strikethrough_color_new: "pango_attr_strikethrough_color_new" [
			r			[integer!]
			g			[integer!]
			b			[integer!]
			return: 	[PangoAttribute!]
		]
		pango_attr_underline_new: "pango_attr_underline_new" [
			ok			[integer!]
			return: 	[PangoAttribute!]
		]
		pango_attr_underline_color_new: "pango_attr_underline_color_new" [
			r			[integer!]
			g			[integer!]
			b			[integer!]
			return: 	[PangoAttribute!]
		]
		pango_attr_shape_new: "pango_attr_shape_new" [
			ink-rect	 [handle!]
			logical-rect [handle!]
			return: 	 [PangoAttribute!]
		]
		;; size attributes
		pango_attr_scale_new: "pango_attr_scale_new" [
			scale		[float!]
			return: 	[PangoAttribute!]
		]
		pango_attr_rise_new: "pango_attr_rise_new" [
			rise		[integer!]
			return: 	[PangoAttribute!]
		]
		pango_attr_letter_spacing_new: "pango_attr_letter_spacing_new" [
			spacing		[integer!]
			return: 	[PangoAttribute!]
		]
		pango_attr_gravity_new: "pango_attr_gravity_new" [
			gravity		[integer!]
			return: 	[PangoAttribute!]
		]
		pango_attr_gravity_hint_new: "pango_attr_gravity_hint_new" [
			hint		[integer!]
			return: 	[PangoAttribute!]
		]
		pango_attr_font_features_new: "pango_attr_font_features_new" [
			features	[c-string!]
			return: 	[PangoAttribute!]
		]
		pango_attr_foreground_alpha_new: "pango_attr_foreground_alpha_new" [
			alpha		[integer!]
			return: 	[PangoAttribute!]
		]
		pango_attr_background_alpha_new: "pango_attr_background_alpha_new" [
			alpha		[integer!]
			return: 	[PangoAttribute!]
		]


		cairo_font_options_create: "cairo_font_options_create" [
			return: 	[handle!]
		]
		cairo_font_options_destroy: "cairo_font_options_destroy" [
			return: 	[handle!]
		]
		cairo_font_options_set_antialias: "cairo_font_options_set_antialias" [
			cfo			[handle!]
            antialias	[cairo_antialias_t!]
		]
	]
]
