Red/System[]

#include %../gtk3.reds

do-draw: func [
   dc   [draw-ctx!]
   /local
      color   [integer!]
      cr      [handle!]
][
  cr: dc/raw
  OS-draw-fill-pen dc rgba-to-int 255 0 0 128  no no
  OS-draw-pen dc rgba-to-int 0 255 0 0 no no
  CR-draw-box dc -1 10.0 10.0 100.0 100.0

  ;cairo_set_source_rgba dc/raw 1.0 0.0 0.0 0.5
  ; set-source-color cr rgba-to-int 255 0 0 128
  ; cairo_paint cr
  ; cairo_set_source_rgba dc/raw 0.0 1.0 0.0 1.0
  ; cairo_rectangle dc/raw  10.0 10.0 100.0 100.0
  ; cairo_stroke dc/raw
]

draw_cb: func [
        [cdecl]
        widget  [handle!]
        cr      [handle!]
        data    [handle!]
        return: [logic!]
        /local
          DC    [draw-ctx! value]
][
  draw-begin :DC cr no no
  gdk_cairo_set_source_pixbuf cr frame  0  0

  do-draw :DC 

  draw-end :DC null no no no
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
