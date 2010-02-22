.386
.MODEL FLAT
.CODE
EXTERN	__execvp:NEAR
PUBLIC	_execvp
ALIGN 2

_execvp:
	jmp	__execvp

END
