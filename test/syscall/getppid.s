.386
.MODEL FLAT
.CODE
EXTERN	__getppid:NEAR
PUBLIC	_getppid
ALIGN 2

_getppid:
	jmp	__getppid

END
