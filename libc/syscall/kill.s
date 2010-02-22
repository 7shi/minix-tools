.386
.MODEL FLAT
.CODE
EXTERN	__kill:NEAR
PUBLIC	_kill
ALIGN 2

_kill:
	jmp	__kill

END
