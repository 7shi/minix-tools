.386
.MODEL FLAT
.CODE
EXTERN	__rmdir:NEAR
PUBLIC	_rmdir
ALIGN 2

_rmdir:
	jmp	__rmdir

END
