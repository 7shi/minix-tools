;	outsl() - Output a dword array		Author: Kees J. Bot
;								18 Mar 1996
;	void outsl(U16_t port, void *buf, size_t count);

.386
.MODEL FLAT
.CODE
PUBLIC _outsl
_outsl:
	push	ebp
	mov	ebp, esp
	cld
	push	esi
	mov	edx, 8[ebp]		; port
	mov	esi, 12[ebp]		; buf
	mov	ecx, 16[ebp]		; byte count
	shr	ecx, 2			; dword count
   rep	outsd				; output many dwords
	pop	esi
	pop	ebp
	ret

END
