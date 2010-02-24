;	outw() - Output one word			Author: Kees J. Bot
;								18 Mar 1996
;	void outw(U16_t port, U16_t value);

.386
.MODEL FLAT
.CODE
PUBLIC _outw
_outw:
	push	ebp
	mov	ebp, esp
	mov	edx, 8[ebp]		; port
	mov	eax, 12[ebp]		; value
    out	dx, ax			; output 1 word
	pop	ebp
	ret

END
