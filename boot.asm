[org 0]
[bits 16]
	jmp 0x07C0:start

start:
	mov ax, cs
	mov ds, ax

	mov ax, 0xB800
	mov es, ax
	mov di, 0
	mov ax, word [msgBack]
	mov cx, 0x7FF

paint:
	mov word [es:di], ax
	add di, 2
	dec cx
	jnz paint

	mov edi, 0
	mov byte [es:edi], 'H'
	inc edi
	mov byte [es:edi], 0x06
	inc edi
	mov byte [es:edi], 'E'
	inc edi
	mov byte [es:edi], 0x06
	inc edi
	mov byte [es:edi], 'L'
	inc edi
	mov byte [es:edi], 0x06
	inc edi
	mov byte [es:edi], 'L'
	inc edi
	mov byte [es:edi], 0x06
	inc edi
	mov byte [es:edi], 'O'
	inc edi
	mov byte [es:edi], 0x06
	inc edi
	mov byte [es:edi], ' '
	inc edi
	mov byte [es:edi], 0x06
	inc edi
	mov byte [es:edi], 'W'
	inc edi
	mov byte [es:edi], 0x06
	inc edi
	mov byte [es:edi], 'O'
	inc edi
	mov byte [es:edi], 0x06
	inc edi
	mov byte [es:edi], 'R'
	inc edi
	mov byte [es:edi], 0x06
	inc edi
	mov byte [es:edi], 'L'
	inc edi
	mov byte [es:edi], 0x06
	inc edi
	mov byte [es:edi], 'D'
	inc edi
	mov byte [es:edi], 0x06

	jmp $

msgBack db '.', 0xE7
times 510-($-$$) db 0
dw 0xAA55
