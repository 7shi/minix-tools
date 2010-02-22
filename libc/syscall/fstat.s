.386
.MODEL FLAT
.CODE
EXTERN	__fstat:NEAR
PUBLIC	_fstat
ALIGN 2

_fstat:
	jmp	__fstat

END
