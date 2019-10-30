(load "./lib.l")

(setq s (new '(+Screen) "localhost" 1337))
(while (time)
  (for x 600
    (for y 800
      (seed (time))
      (setq p (new '(+Pixel) x y (rand 1 255) (rand 1 255) (rand 1 255)))
      (send 'draw> s p)))))

(bye)

