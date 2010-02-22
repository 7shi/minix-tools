.386
.MODEL FLAT
.CODE
EXTERN	__sigsuspend:NEAR
PUBLIC	_sigsuspend
ALIGN 2

_sigsuspend:
	jmp	__sigsuspend

END
