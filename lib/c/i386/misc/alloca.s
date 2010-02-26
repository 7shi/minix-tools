;	alloca() - allocate space on the stack		Author: Kees J. Bot
;								2 Dec 1993
;.sect .text; .sect .rom; .sect .data; .sect .bss
.386
.MODEL FLAT
.CODE
;	.align	16
PUBLIC _alloca
_alloca:
	pop	ecx		; Return address
	pop	eax		; Bytes to allocate
	add	eax, 3
	and	al, 0FCh	; Align
	sub	esp, eax	; Lower stack
	mov	eax, esp	; Return value
	push	eax		; Dummy argument
	jmp	ecx

END
