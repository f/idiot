# 🕹 idIoT
Easier NodeMCU + ESP8266 Environment

## Overview

idIoT uses **MoonScript** to make coding easier for NodeMCU development.

Writing a blinking LED is **THAT** easy:
```moonscript
every second!, -> toggle pin 4
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

To bundle more modules, please use [NodeMCU Builder](https://nodemcu-build.com).

**_Please replace `firmware/firmware.bin` with if you build custom firmware._**

### Install Firmware

Run following command to install new firmware.

```bash
make reset
```

## API

Idiot has simplified API to take control of your board.

### Timer

#### `every delay, function`

```moonscript
every second!, -> toggle pin 4
```

#### `wait delay, function`

```moonscript
wait second!, -> open pin 4
```

### `second`

```moonscript
second! -- 1 second
second(0.5) -- half second
second 2 -- 2 seconds
```

## License

MIT
