.386
.MODEL FLAT
.CODE
EXTERN	__close:NEAR
PUBLIC	_close
ALIGN 2

_close:
	jmp	__close

END
