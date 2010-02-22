.386
.MODEL FLAT
.CODE
EXTERN	__mount:NEAR
PUBLIC	_mount
ALIGN 2

_mount:
	jmp	__mount

END
