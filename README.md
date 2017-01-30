# 🕹 idIoT
Easier NodeMCU Environment

## Overview

idIoT uses *MoonScript* to make coding easier for NodeMCU development.

```moonscript
-- simple blinking
led = pin 4
button = pin 5

blink = every second(1), ->
  if is_high led then low led else high led

on button,
  pressed: ->
    stop blink
    high led
  released: -> start blink
```

## Install

```bash
git clone http://github.com/f/idiot.git
cd idiot
make install
```

## Firmware

### Enabled Modules
`cjson` `cron` `encoder` `enduser_setup` `file` `gpio`
`mdns` `net` `node` `tmr` `uart` `websocket` `wifi`

To bundle more modules, please use [https://nodemcu-build.com](NodeMCU Builder).

_Please replace `firmware/firmware.bin` with if you build custom firmware._

### Install Firmware

Run following command to install new firmware.

```bash
make reset
```

## License

MIT