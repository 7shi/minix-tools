.386
.MODEL FLAT
.CODE
EXTERN	__fork:NEAR
PUBLIC	_fork
ALIGN 2

_fork:
	jmp	__fork

END
