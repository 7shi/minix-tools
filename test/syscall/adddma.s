.386
.MODEL FLAT
.CODE
EXTERN	__adddma:NEAR
PUBLIC	_adddma
ALIGN 2

_adddma:
	jmp	__adddma

END
