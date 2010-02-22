.386
.MODEL FLAT
.CODE
EXTERN	__sleep:NEAR
PUBLIC	_sleep
ALIGN 2

_sleep:
	jmp	__sleep

END
