.386
.MODEL FLAT
.CODE
EXTERN	__deldma:NEAR
PUBLIC	_deldma
ALIGN 2

_deldma:
	jmp	__deldma

END
