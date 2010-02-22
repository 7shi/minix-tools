.386
.MODEL FLAT
.CODE
EXTERN	__alarm:NEAR
PUBLIC	_alarm
ALIGN 2

_alarm:
	jmp	__alarm

END
