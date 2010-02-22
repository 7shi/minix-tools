.386
.MODEL FLAT
.CODE
EXTERN	__execlp:NEAR
PUBLIC	_execlp
ALIGN 2

_execlp:
	jmp	__execlp

END
