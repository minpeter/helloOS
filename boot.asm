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

disk_read:
	mov ax, 0x1000	;Es:BX 1000:0000
	mov es, ax
	mov bx, 0
	
	mov ah, 2	;디스크에 있는 데이터를 es:bx의 주소로
	mov dl, 0	;드라이브 = 0, A:드라이브
	mov ch, 0	;0번째 실린더
	mov dh, 0	;헤드는 0
	mov cl, 2	;2번째 섹터부터 읽기 시작한다.
	mov al, 1	;1섹터를 읽을 것이다.
	int 13h	;Read
	
	jc disk_read
	
	jmp 0x1000:0000

msgBack db '`', 0xF0
times 510-($-$$) db 0
dw 0xAA55
