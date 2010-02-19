.386
.MODEL FLAT
.CODE
EXTERN	__readdir:NEAR
PUBLIC	_readdir
ALIGN 2

_readdir:
	jmp	__readdir

END
