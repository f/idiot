export every = (delay, fn)->
  tmr.alarm(0, delay, fn)

export second = (unit)-> unit * 1000

export millisecond = (unit)-> unit

export pin = (id, mode = 1)->
  gpio.mode(id, mode)
  id

export write    = (id, data)-> gpio.write(id, data)
export read     = (id)-> gpio.read(id, data)
export high     = (id)-> write(id, gpio.HIGH)
export low      = (id)-> write(id, gpio.LOW)
export is_high  = (id)-> read(id) == gpio.HIGH
export is_low   = (id)-> read(id) == gpio.LOW