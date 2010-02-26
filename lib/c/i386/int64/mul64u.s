;	mul64u() - unsigned long by unsigned multiply giving 64 bit result
;							Author: Kees J. Bot
;								7 Dec 1995
.386
.MODEL FLAT
.CODE
PUBLIC _mul64u

_mul64u:			; u64_t mul64u(unsigned long i, unsigned j);
	mov	ecx, 4[esp]
	mov	eax, 8[esp]
	mul	dword ptr 12[esp]
	mov	[ecx], eax
	mov	4[ecx], edx
	mov	eax, ecx
	ret

END

;
; $PchId: mul64u.ack.s,v 1.2 1996/04/11 18:59:57 philip Exp $
