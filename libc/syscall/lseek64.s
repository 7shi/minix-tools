.386
.MODEL FLAT
.CODE
EXTERN	__lseek64:NEAR
PUBLIC	_lseek64
ALIGN 2

_lseek64:
	jmp	__lseek64

END
