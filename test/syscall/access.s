.386
.MODEL FLAT
.CODE
EXTERN	__access:NEAR
PUBLIC	_access
ALIGN 2

_access:
	jmp	__access

END
