.386
.MODEL FLAT
.CODE
EXTERN	__isatty:NEAR
PUBLIC	_isatty
ALIGN 2

_isatty:
	jmp	__isatty

END
