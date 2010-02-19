.386
.MODEL FLAT
.CODE
EXTERN	__fchmod:NEAR
PUBLIC	_fchmod
ALIGN 2

_fchmod:
	jmp	__fchmod

END
