(class +Pixel)

(dm T (x y r g b)
  (unless x (quit "no x given or x is NIL"))
  (unless y (quit "no y given or y is NIL"))
  (unless r (quit "no r given or r is NIL"))
  (unless g (quit "no g given or g is NIL"))
  (unless b (quit "no b given or b is NIL"))

  (var px x)
  (var py y)
  (var pr r)
  (var pg g)
  (var pb b)

  (=: pkt (pack "PX " x " " y " " (2hex r) (2hex g) (2hex b))))

(dm toPacketData> ()
  (: pkt))
