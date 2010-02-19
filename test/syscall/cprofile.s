.386
.MODEL FLAT
.CODE
EXTERN	__cprofile:NEAR
PUBLIC	_cprofile
ALIGN 2

_cprofile:
	jmp	__cprofile

END
