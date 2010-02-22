.386
.MODEL FLAT
.CODE
EXTERN	__readlink:NEAR
PUBLIC	_readlink
ALIGN 2

_readlink:
	jmp	__readlink

END
