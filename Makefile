boot.bin : boot.asm
	nasm -f bin -o boot.bin boot.asm
