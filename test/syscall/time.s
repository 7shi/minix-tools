.386
.MODEL FLAT
.CODE
EXTERN	__time:NEAR
PUBLIC	_time
ALIGN 2

_time:
	jmp	__time

END
