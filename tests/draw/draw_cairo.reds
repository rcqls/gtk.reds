Red/System[]

#include %../../gtk3.reds
#include %../../include/gtk-app.reds

#include %draw_cairo_tests.reds

do-draw: func [
   dc   [draw-ctx!]
   /local
      color   [integer!]
      cr      [handle!]
][
  cr: dc/raw
  
  draw-test?  dc id-draw-test?

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

gtk/begin

gtk_window_set_title  gtk/window "Pixbufs"
gtk_window_set_resizable gtk/window  no

frame: gdk_pixbuf_new 0 no 8 gtk/width gtk/height
da:  gtk_drawing_area_new
gobj_signal_connect (da "draw" :draw_cb null)
gtk_container_add gtk/window  da

gtk/end
