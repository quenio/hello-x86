.PHONY: clean build run

clean:
	rm -f boot.o
	rm -f boot.bin
	ls -l

build: clean
	as -o boot.o boot.s
	ld \
		-o boot.raw \
		--oformat binary \
		-e init \
		-Ttext 0x7C00 \
		boot.o
	ls -l

run: build
	export DISPLAY=0:
	sudo qemu-system-x86_64 \
		--machine ubuntu,accel=kvm \
		-drive format=raw,file=boot.raw \
		-nographic -curses

