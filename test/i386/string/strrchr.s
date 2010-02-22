;	strrchr()					Author: Kees J. Bot
;								2 Jan 1994
;.sect text; .sect .rom; .sect .data; .sect .bss
.386
.MODEL FLAT

; char *strrchr(const char *s, int c)
;	Look for the last occurrence a character in a string.
;
.CODE
PUBLIC _strrchr
	;;.align	16
_strrchr:
	push	ebp
	mov	ebp, esp
	push	edi
	mov	edi, 8[ebp]	; edi = string
	mov	ecx, -1
	xor	al, al
	cld
	repne scasb			; Look for the end of the string
	not	ecx		; -1 - ecx = Length of the string + null
	dec	edi		; Put edi back on the zero byte
	mov	al, 12[ebp]	; The character to look for
	std			; Downwards search
	repne scasb
	cld			; Direction bit back to default
	jne	failure
	lea	eax, 1[edi]	; Found it
	pop	edi
	pop	ebp
	ret
failure:xor	eax, eax	; Not there
	pop	edi
	pop	ebp
	ret

END
