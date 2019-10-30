socket = require 'socket'
import image from require 'imlib2'

sleep = (secs) ->
  endt = os.time() + secs
  while true
    if os.time() == endt
      break
  return

{
  :sleep,
  :socket,
  :image,
}
