.386
.MODEL FLAT
.CODE
EXTERN	__unlink:NEAR
PUBLIC	_unlink
ALIGN 2

_unlink:
	jmp	__unlink

END
