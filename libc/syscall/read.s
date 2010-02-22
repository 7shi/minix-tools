.386
.MODEL FLAT
.CODE
EXTERN	__read:NEAR
PUBLIC	_read
ALIGN 2

_read:
	jmp	__read

END
