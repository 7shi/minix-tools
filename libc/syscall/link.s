.386
.MODEL FLAT
.CODE
EXTERN	__link:NEAR
PUBLIC	_link
ALIGN 2

_link:
	jmp	__link

END
