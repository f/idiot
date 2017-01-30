require 'idiot'

led = pin 4
every second(1), ->
  if is_high led then low led else high led