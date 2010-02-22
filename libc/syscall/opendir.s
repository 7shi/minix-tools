.386
.MODEL FLAT
.CODE
EXTERN	__opendir:NEAR
PUBLIC	_opendir
ALIGN 2

_opendir:
	jmp	__opendir

END
