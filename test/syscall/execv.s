.386
.MODEL FLAT
.CODE
EXTERN	__execv:NEAR
PUBLIC	_execv
ALIGN 2

_execv:
	jmp	__execv

END
