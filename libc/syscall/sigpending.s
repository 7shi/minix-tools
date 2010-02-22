.386
.MODEL FLAT
.CODE
EXTERN	__sigpending:NEAR
PUBLIC	_sigpending
ALIGN 2

_sigpending:
	jmp	__sigpending

END
