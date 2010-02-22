.386
.MODEL FLAT
.CODE
EXTERN	__nanosleep:NEAR
PUBLIC	_nanosleep

_nanosleep:
	jmp	__nanosleep

END
