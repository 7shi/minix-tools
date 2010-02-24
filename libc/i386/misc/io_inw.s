;	inw() - Input one word				Author: Kees J. Bot
;								18 Mar 1996
;	unsigned inw(U16_t port);

.386
.MODEL FLAT
.CODE
PUBLIC _inw
_inw:
	push	ebp
	mov	ebp, esp
	mov	edx, 8[ebp]		; port
	xor	eax, eax
    in	ax, dx			; read 1 word
	pop	ebp
	ret

END
