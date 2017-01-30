export timer_id = -1
export opener = gpio.LOW
export closer = gpio.HIGH

export open_means_close = ->
  opener = gpio.HIGH
  closer = gpio.LOW

export every = (delay, fn)->
  timer_id += 1
  tmr.alarm(timer_id, delay, tmr.ALARM_AUTO, fn)
  timer_id

export wait = (delay, fn)->
  timer_id += 1
  tmr.alarm(timer_id, delay, tmr.ALARM_SINGLE, fn)
  timer_id

export stop = (id)->
  tmr.stop(id)
  timer_id -= 1

export listen = (fn)-> every 50, fn
export on = (pin, fn)-> listen -> fn is_open pin

export second = (unit = 1)-> unit * 1000

export millisecond = (unit)-> unit

export pin = (id, mode = gpio.OUTPUT, pull = gpio.FLOAT)->
  gpio.mode(id, mode, pull)
  id

export button = (id, mode = gpio.INPUT)->
  pin id, mode, gpio.PULLUP

export write     = (id, data)-> gpio.write(id, data)
export read      = (id)-> gpio.read(id)
export open      = (id)-> write(id, opener)
export close     = (id)-> write(id, closer)
export is_open   = (id)-> read(id) == opener
export is_closed = (id)-> read(id) == closer
export toggle    = (pin)->
  if is_closed pin then open pin else close pin

export blink     = (pin, interval = second(1))->
  every interval, -> toggle pin