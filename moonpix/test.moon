import Pixel from require 'pixel'
import Screen from require 'screen'
import image from require 'common'

s = Screen("127.0.0.1",1337)
math.randomseed(os.time())

infiniteRandomLine = ->
  while true
    for i = 50,300
      p = Pixel(i,i,math.random(1,255),math.random(1,255),math.random(1,255))
      s\draw p

drawInputImage = ->
  io.write "input image: "
  io.flush!
  image,error = image.load io.read!
  if error
    print error
    return

  w,h = image\get_width!, image\get_height!

  for x = 1,w
    for y = 1,h
      color = image\get_pixel x,y
      r,g,b = color.red,color.green,color.blue
      p = Pixel(x,y,r,g,b)
      s\draw p
