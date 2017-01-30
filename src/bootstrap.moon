require 'idiot'

led = pin 0

on button(5), (pressed)->
  if pressed
    open led
  else
    close led
