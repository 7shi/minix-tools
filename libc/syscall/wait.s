.386
.MODEL FLAT
.CODE
EXTERN	__wait:NEAR
PUBLIC	_wait
ALIGN 2

_wait:
	jmp	__wait

END
