.386
.MODEL FLAT
.CODE
EXTERN	__tcgetattr:NEAR
PUBLIC	_tcgetattr
ALIGN 2

_tcgetattr:
	jmp	__tcgetattr

END
