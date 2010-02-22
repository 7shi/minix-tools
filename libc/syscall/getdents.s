.386
.MODEL FLAT
.CODE
EXTERN	__getdents:NEAR
PUBLIC	_getdents
ALIGN 2

_getdents:
	jmp	__getdents

END
