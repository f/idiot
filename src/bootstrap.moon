require 'idiot'

led = pin 0
buzzer = pin 1
beep = -> close pin 1, for: seconds(1)

every second!, -> toggle pin 4

on button(5), (pressed)->
  if pressed
    beep and open led
  else
    beep and close led
