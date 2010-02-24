;	outsb() - Output a byte array		Author: Kees J. Bot
;								18 Mar 1996
;	void outsb(U16_t port, void *buf, size_t count);

.386
.MODEL FLAT
.CODE
PUBLIC _outsb
_outsb:
	push	ebp
	mov	ebp, esp
	cld
	push	esi
	mov	edx, 8[ebp]		; port
	mov	esi, 12[ebp]		; buf
	mov	ecx, 16[ebp]		; byte count
   rep	outsb				; output many bytes
	pop	esi
	pop	ebp
	ret

END
