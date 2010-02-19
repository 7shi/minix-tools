.386
.MODEL FLAT
.CODE
EXTERN	__getuid:NEAR
PUBLIC	_getuid
ALIGN 2

_getuid:
	jmp	__getuid

END
