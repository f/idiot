# 🕹 idIoT
Easier NodeMCU Environment

```
git clone http://github.com/f/idiot.git
cd idiot
make install
```

## Firmware

### Enabled Modules
`cjson` `cron` `encoder` `enduser_setup` `file` `gpio`
`mdns` `net` `node` `tmr` `uart` `websocket` `wifi`

To bundle more modules, please use [https://nodemcu-build.com](NodeMCU Builder).

_Please replace `firmware.bin` with if you build custom firmware._

### Install Firmware

Run following command to install new firmware.
```
make reset
```

## License

MIT