.386
.MODEL FLAT
.CODE
EXTERN	__dup2:NEAR
PUBLIC	_dup2
ALIGN 2

_dup2:
	jmp	__dup2

END