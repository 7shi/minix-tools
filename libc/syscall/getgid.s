.386
.MODEL FLAT
.CODE
EXTERN	__getgid:NEAR
PUBLIC	_getgid
ALIGN 2

_getgid:
	jmp	__getgid

END
