.386
.MODEL FLAT
.CODE
EXTERN	__truncate:NEAR
EXTERN	__ftruncate:NEAR
PUBLIC	_truncate
PUBLIC	_ftruncate
ALIGN 2

_truncate:
	jmp	__truncate

ALIGN 2
_ftruncate:
	jmp	__ftruncate

END
