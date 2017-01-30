print 'STARTING...'
tmr.alarm 0, 1000, tmr.ALARM_SINGLE, ->
  print 'BOOTING...'
  dofile 'bootstrap.lua'
