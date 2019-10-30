[de 2hex (cnt)
  (if (<= cnt 15) # if cnt <= 15
    (pack "0" (hex cnt)) # return "0" + hex of cnt
    (hex cnt)] # else return hex of cnt

(load "./pixel.l")
(load "./screen.l")
