.386
.MODEL FLAT
.CODE
EXTERN __write:NEAR
PUBLIC	_write
ALIGN 2

_write:
	jmp	__write

END
