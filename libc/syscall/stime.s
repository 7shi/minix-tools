.386
.MODEL FLAT
.CODE
EXTERN	__stime:NEAR
PUBLIC	_stime
ALIGN 2

_stime:
	jmp	__stime

END
