Red/System[]

#include %../gtk3.reds

do-draw: func [
  cr    [handle!]
][
  0
]

draw_cb: func [
        [cdecl]
        widget  [handle!]
        cr      [handle!]
        data    [handle!]
        return: [logic!]
][
  gdk_cairo_set_source_pixbuf cr frame  0  0

  do-draw cr 

  cairo_paint cr
  yes
]

destroy: func[[cdecl]][
  gtk_main_quit
]

window: as handle! 0
frame: as handle! 0
width: 800 height: 600

gtk_init null null
window: gtk_window_new 0
gtk_window_set_title  window "Pixbufs"
gtk_window_set_resizable window  no
gobj_signal_connect (window "destroy" :destroy null)

gtk_widget_set_size_request window width height
frame: gdk_pixbuf_new 0 no 8 width  height
da:  gtk_drawing_area_new
gobj_signal_connect (da "draw" :draw_cb null)
gtk_container_add window  da

gtk_widget_show_all window
gtk_main
