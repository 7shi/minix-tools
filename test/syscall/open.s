.386
.MODEL FLAT
.CODE
EXTERN	__open:NEAR
PUBLIC	_open
ALIGN 2

_open:
	jmp	__open

END
