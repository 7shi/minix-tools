.386
.MODEL FLAT
.CODE
EXTERN	__getcwd:NEAR
PUBLIC	_getcwd
ALIGN 2

_getcwd:
	jmp	__getcwd

END
