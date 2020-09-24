boot.bin : boot.asm
	nasm -f bin -o boot.bin boot.asm

start : boot.bin
	qemu-system-x86_64 boot.bin
