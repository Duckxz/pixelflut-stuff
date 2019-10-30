(class +Screen)

(dm T (ip port)
  (unless ip (quit "no ip or hostname given"))
  (unless port (quit "no port given"))

  (=: screen_connection (connect ip port))
  (unless (: screen_connection) (quit "could not establish connection to this address" ip))
  
  (=: scip ip)
  (=: scport port))

[dm draw> (pixel)
  (when (isa '+Pixel pixel)
    (out (: screen_connection) (prinl (send 'toPacketData> pixel)]

[dm close> ()
  (unless (: screen_connection) (prinl "cannot close screen connection, already closed or not open"))
  (unless (This) (when (: screen_connection) (close (: screen_connection)]
