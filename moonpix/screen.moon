import sleep,socket from require 'common'

class Screen
  new: (ip, port) =>
    @ip = ip
    @port = port
    @_screen_socket = socket.tcp()
    @_screen_socket\settimeout 10
    if ip and port
      assert @_screen_socket\connect(ip,port)
    elseif ip and not port or not ip and port
      error "called screen.Screen.new without ip or port"

  draw: (pixel) =>
    if not pixel
      error "no pixel passed to screen.Screen.draw"
      return

    print pixel\toPacketData!
    @_screen_socket\send pixel\toPacketData!.."\0\n"

  getSize: =>
    error "this function is broken/WIP, use is turned off"
    
    split = {}
    dosplit = (tok) ->
      table.insert(split,tok)
      return

    print "requesting screen size..."
    @_screen_socket\send "SIZE\0\n"
    data,error = assert @_screen_socket\receive("*a")
    if error
      print error
    print "raw received: #{data}"
    data:gsub("[^%s]+",dosplit)

class VloedScreen
  new: =>
    error "WIP"

{
  :Screen,
  :VloedScreen,
}
