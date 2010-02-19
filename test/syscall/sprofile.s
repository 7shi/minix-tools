.386
.MODEL FLAT
.CODE
EXTERN	__sprofile:NEAR
PUBLIC	_sprofile
ALIGN 2

_sprofile:
	jmp	__sprofile

END
