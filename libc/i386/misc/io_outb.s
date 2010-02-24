;	outb() - Output one byte			Author: Kees J. Bot
;								18 Mar 1996
;	void outb(U16_t port, U8_t value);

.386
.MODEL FLAT
.CODE
PUBLIC _outb
_outb:
	push	ebp
	mov	ebp, esp
	mov	edx, 8[ebp]		; port
	mov	eax, 12[ebp]		; value
	out	dx, al			; output 1 byte
	pop	ebp
	ret

END
