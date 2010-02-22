.386
.MODEL FLAT
.CODE
EXTERN	__sigismember:NEAR
PUBLIC	_sigismember
ALIGN 2

_sigismember:
	jmp	__sigismember

END
