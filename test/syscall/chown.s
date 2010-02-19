.386
.MODEL FLAT
.CODE
EXTERN	__chown:NEAR
PUBLIC	_chown
ALIGN 2

_chown:
	jmp	__chown

END
