.386
.MODEL FLAT
.CODE
EXTERN	__times:NEAR
PUBLIC	_times
ALIGN 2

_times:
	jmp	__times

END
