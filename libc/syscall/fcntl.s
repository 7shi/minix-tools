.386
.MODEL FLAT
.CODE
EXTERN	__fcntl:NEAR
PUBLIC	_fcntl
ALIGN 2

_fcntl:
	jmp	__fcntl

END
