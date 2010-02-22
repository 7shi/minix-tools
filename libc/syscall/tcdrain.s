.386
.MODEL FLAT
.CODE
EXTERN	__tcdrain:NEAR
PUBLIC	_tcdrain
ALIGN 2

_tcdrain:
	jmp	__tcdrain

END
