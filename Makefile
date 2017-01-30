default: clean build upload

clean:
	@echo "Cleaning old build..."
	@rm -rf ./.build
	@mkdir -p ./.build

build:
	@echo "Building..."
	@echo "Installing idIoT framework..."
	@cp ./lib/idiot.moon ./src/idiot.moon
	@$$HOME/.luarocks/bin/moonc -t ./.build ./src/
	@rm ./src/idiot.moon

upload:
	@./node_modules/.bin/esp file remove init.lua
	@./node_modules/.bin/esp info chip
	@for f in ./.build/src/*.lua; do echo "Uploading $$f..."; ./node_modules/.bin/esp file write "$$f"; done
	@./node_modules/.bin/esp restart

reset:
	@./node_modules/.bin/esp port set /dev/cu.SLAB_USBtoUART
	@./node_modules/.bin/esp flash ./firmware/firmware.bin
	@echo "Please replug the NodeMCU in 10 seconds..."
	@sleep 10
	@echo "Formatting NodeMCU..."
	@./node_modules/.bin/esp fs format
	@./node_modules/.bin/esp fs info

reset_simple:
	@./node_modules/.bin/esp port set /dev/cu.SLAB_USBtoUART
	@./node_modules/.bin/esp flash ./firmware/firmware-simple.bin
	@echo "Please replug the NodeMCU in 10 seconds..."
	@sleep 10
	@echo "Formatting NodeMCU with base modules..."
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

