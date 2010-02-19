.386
.MODEL FLAT
.CODE
EXTERN	__pipe:NEAR
PUBLIC	_pipe
ALIGN 2

_pipe:
	jmp	__pipe

END
