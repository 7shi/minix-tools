.386
.MODEL FLAT
.CODE
EXTERN	__lstat:NEAR
PUBLIC	_lstat
ALIGN 2

_lstat:
	jmp	__lstat

END
