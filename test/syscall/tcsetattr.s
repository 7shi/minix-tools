.386
.MODEL FLAT
.CODE
EXTERN	__tcsetattr:NEAR
PUBLIC	_tcsetattr
ALIGN 2

_tcsetattr:
	jmp	__tcsetattr

END
