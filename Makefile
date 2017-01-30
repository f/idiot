default: clean build upload

clean:
	@echo "Cleaning old build..."
	@rm -rf ./.build
	@mkdir -p ./.build

build:
	@echo "Building..."
	@~/.luarocks/bin/moonc -t ./.build ./src/
	@echo "Installing EventsEmitter..."
	@cp ./node_modules/lua-eventemitter/events_simplified.lua ./.build/src/events.lua

upload:
	@./node_modules/.bin/esp file remove init.lua
	@./node_modules/.bin/esp info chip
	@for f in ./.build/src/*.lua; do echo "Uploading $$f..."; ./node_modules/.bin/esp file write "$$f"; done
	@./node_modules/.bin/esp restart

reset:
	@./node_modules/.bin/esp port set /dev/cu.SLAB_USBtoUART
	@./node_modules/.bin/esp flash ./firmware.bin
	@echo "Please replug the NodeMCU in 10 seconds..."
	@sleep 10
	@echo "Formatting NodeMCU..."
	@./node_modules/.bin/esp fs format
	@./node_modules/.bin/esp fs info

force_stop:
	@./node_modules/.bin/esp run "file.remove('init.lua'); node.restart()"

format:
	@./node_modules/.bin/esp fs format

install:
	brew install lua
	luarocks install moonscript --local
	npm install

