;	strchr()					Author: Kees J. Bot
;								1 Jan 1994
;.sect text; .sect .rom; .sect .data; .sect .bss
.386
.MODEL FLAT

; char *strchr(const char *s, int c)
;	Look for a character in a string.
;
.CODE
PUBLIC _strchr
	;.align	16
_strchr:
	push	ebp
	mov	ebp, esp
	push	edi
	cld
	mov	edi, 8[ebp]	; edi = string
	mov	edx, 16		; Look at small chunks of the string
next:	shl	edx, 1		; Chunks become bigger each time
	mov	ecx, edx
	xor	al, al		; Look for the zero at the end
	repne scasb
	pushf			; Remember the flags
	sub	ecx, edx
	neg	ecx		; Some or all of the chunk
	sub	edi, ecx	; Step back
	mov	al, 12[ebp]	; The character to look for
	repne scasb
	je	found
	popf			; Did we find the end of string earlier?
	jne	next		; No, try again
	xor	eax, eax	; Return NULL
	pop	edi
	pop	ebp
	ret
found:	pop	eax		; Get rid of those flags
	lea	eax, [edi-1]	; Address of byte found
	pop	edi
	pop	ebp
	ret

END
