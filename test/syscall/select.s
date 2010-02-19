.386
.MODEL FLAT
.CODE
EXTERN	__select:NEAR
PUBLIC	_select
ALIGN 2

_select:
	jmp	__select

END
