.386
.MODEL FLAT
.CODE
EXTERN	__waitpid:NEAR
PUBLIC	_waitpid
ALIGN 2

_waitpid:
	jmp	__waitpid

END
