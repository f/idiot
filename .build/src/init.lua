gpio.mode(4, 1)
gpio.mode(0, 1)
gpio.write(4, 0)
return gpio.write(0, 0)
