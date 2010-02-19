.386
.MODEL FLAT
.CODE
EXTERN	__tcsendbreak:NEAR
PUBLIC	_tcsendbreak
ALIGN 2

_tcsendbreak:
	jmp	__tcsendbreak

END
