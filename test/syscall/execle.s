.386
.MODEL FLAT
.CODE
EXTERN	__execle:NEAR
PUBLIC	_execle
ALIGN 2

_execle:
	jmp	__execle

END
