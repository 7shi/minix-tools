.386
.MODEL FLAT
.CODE
EXTERN	__pause:NEAR
PUBLIC	_pause
ALIGN 2

_pause:
	jmp	__pause

END
