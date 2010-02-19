.386
.MODEL FLAT
.CODE
EXTERN	__chmod:NEAR
PUBLIC	_chmod
ALIGN 2

_chmod:
	jmp	__chmod

END
