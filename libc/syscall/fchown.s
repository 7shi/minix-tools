.386
.MODEL FLAT
.CODE
EXTERN	__fchown:NEAR
PUBLIC	_fchown
ALIGN 2

_fchown:
	jmp	__fchown

END
