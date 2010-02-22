.386
.MODEL FLAT
.CODE
EXTERN	__sigprocmask:NEAR
PUBLIC	_sigprocmask
ALIGN 2

_sigprocmask:
	jmp	__sigprocmask

END
