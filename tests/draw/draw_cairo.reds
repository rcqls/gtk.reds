Red/System[]

#include %../../gtk3.reds
#include %../../include/quick-demo.reds

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

demo/begin

gtk_window_set_title  demo/window "Pixbufs"
gtk_window_set_resizable demo/window  no

frame: gdk_pixbuf_new 0 no 8 demo/width demo/height
da:  gtk_drawing_area_new
gobj_signal_connect (da "draw" :draw_cb null)
gtk_container_add demo/window  da

demo/end
