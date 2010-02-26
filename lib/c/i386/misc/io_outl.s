;	outl() - Output one dword			Author: Kees J. Bot
;								18 Mar 1996
;	void outl(U16_t port, u32_t value);

.386
.MODEL FLAT
.CODE
PUBLIC _outl
_outl:
	push	ebp
	mov	ebp, esp
	mov	edx, 8[ebp]		; port
	mov	eax, 12[ebp]		; value
	out	dx, ax			; output 1 dword
	pop	ebp
	ret

END
