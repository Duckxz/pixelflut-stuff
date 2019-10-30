import format from string

require 'common'

class Pixel
  new: (x,y,r,g,b) =>
    if not x
      error "no x position passed to pixel.Pixel"
    elseif not y
      error "no y position passed to pixel.Pixel"
    elseif not r
      error "no red passed to pixel.Pixel"
    elseif not g
      error "no green passed to pixel.Pixel"
    elseif not b
      error "no blue passed to pixel.Pixel"

    @x = x
    @y = y
    @r = r
    @g = g
    @b = b
    @rgb = format("%2x%2x%2x",r,g,b)\gsub " ","0"
    @packet_data = format("PX %d %d %s",x,y,@rgb)

  print: =>
    print format "x: %d y: %d rgb: %2x%2x%2x (r: %d g: %d b: %d)",@x,@y,@r,@g,@b

  toPacketData: =>
    return @packet_data


{
  :Pixel
}
    
