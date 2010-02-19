.386
.MODEL FLAT
.CODE
EXTERN	__setsid:NEAR
PUBLIC	_setsid
ALIGN 2

_setsid:
	jmp	__setsid

END
