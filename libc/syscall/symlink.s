.386
.MODEL FLAT
.CODE
EXTERN	__symlink:NEAR
PUBLIC	_symlink
ALIGN 2

_symlink:
	jmp	__symlink

END
