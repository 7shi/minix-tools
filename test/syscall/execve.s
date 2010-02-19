.386
.MODEL FLAT
.CODE
EXTERN	__execve:NEAR
PUBLIC	_execve
ALIGN 2

_execve:
	jmp	__execve

END
