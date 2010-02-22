.386
.MODEL FLAT
.CODE
EXTERN	__umask:NEAR
PUBLIC	_umask
ALIGN 2

_umask:
	jmp	__umask

END
