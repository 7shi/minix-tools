.386
.MODEL FLAT
.CODE
EXTERN	__fstatfs:NEAR
PUBLIC	_fstatfs
ALIGN 2

_fstatfs:
	jmp	__fstatfs

END
