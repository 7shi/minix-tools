.386
.MODEL FLAT
.CODE
EXTERN	__getpid:NEAR
PUBLIC	_getpid
ALIGN 2

_getpid:
	jmp	__getpid

END
