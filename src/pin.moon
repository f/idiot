class Pin
  new: (pin)=>
    gpio.mode(pin, 1)
    @pin = pin
  
  on: => gpio.write(@pin, 0)
  off: => gpio.write(@pin, 1)