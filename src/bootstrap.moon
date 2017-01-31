require 'idiot'

-- buzzer
buzzer = pin 1
beep = -> close buzzer, for: seconds(1)

-- setting timer
every second!, -> toggle pin 4

-- controlling button
led = pin 0
on button(5), (pressed)->
  if pressed
    beep and open led
  else
    beep and close led
