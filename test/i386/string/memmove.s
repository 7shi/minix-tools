;	memmove()					Author: Kees J. Bot
;								2 Jan 1994
;.sect text; .sect .rom; .sect .data; .sect .bss
.386
.MODEL FLAT

; void *memmove(void *s1, const void *s2, size_t n)
;	Copy a chunk of memory.  Handle overlap.
;
.CODE
EXTERN __memmove:NEAR
PUBLIC _memmove
	;.align	16
_memmove:
	jmp	__memmove	; Call common code

END
