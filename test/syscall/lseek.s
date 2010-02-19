.386
.MODEL FLAT
.CODE
EXTERN	__lseek:NEAR
PUBLIC	_lseek
ALIGN 2

_lseek:
	jmp	__lseek

END
