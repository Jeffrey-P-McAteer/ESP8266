
# Add installed SDK to PATH
export PATH := /opt/esp-open-sdk/xtensa-lx106-elf/bin:$(PATH)

CC = xtensa-lx106-elf-gcc
CFLAGS = -I. -mlongcalls
LDLIBS = -nostdlib -Wl,--start-group -lmain -lnet80211 -lwpa -llwip -lpp -lphy -lc -Wl,--end-group -lgcc
LDFLAGS = -Teagle.app.v6.ld

main-0x00000.bin: main
	esptool elf2image $^

main: main.o

main.o: main.c

flash: main-0x00000.bin
	bash -c "if [[ ! -r /dev/ttyUSB0 ]] ; then sudo chmod a+rw /dev/ttyUSB0 ; fi"
	esptool write_flash 0 main-0x00000.bin 0x10000 main-0x10000.bin

clean:
	rm -f main main.o main-0x00000.bin main-0x10000.bin


.installed-esp-open-sdk:
	sudo rm /usr/bin/python || true
	sudo ln -s /usr/bin/python2 /usr/bin/python
	# Install wants python to mean python2
	yay -S esp-open-sdk esptool
	# switch it back
	sudo rm /usr/bin/python || true
	sudo ln -s /usr/bin/python3 /usr/bin/python
	touch .installed-esp-open-sdk


