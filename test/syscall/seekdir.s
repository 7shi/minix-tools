.386
.MODEL FLAT
.CODE
EXTERN	__seekdir:NEAR
PUBLIC	_seekdir
ALIGN 2

_seekdir:
	jmp	__seekdir

END
