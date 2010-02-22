.386
.MODEL FLAT
.CODE
EXTERN	__rename:NEAR
PUBLIC	_rename
ALIGN 2

_rename:
	jmp	__rename

END
