# 🕹 idIoT
Easier NodeMCU Environment

## Overview

idIoT uses *MoonScript* to make coding easier for NodeMCU development.

```moonscript
led = Pin 4

-- Simple Blink
Timer!\every second(1), ->
  with led
    if .is_low then .high! else .low!
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