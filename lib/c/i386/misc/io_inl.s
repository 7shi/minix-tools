;	inl() - Input one dword				Author: Kees J. Bot
;								18 Mar 1996
;	unsigned inl(U16_t port);

.386
.MODEL FLAT
.CODE
PUBLIC _inl
_inl:
	push	ebp
	mov	ebp, esp
	mov	edx, 8[ebp]		; port
	in	eax, dx			; read 1 dword
	pop	ebp
	ret

END
