.386
.MODEL FLAT
.CODE
EXTERN	__getsigset:NEAR
PUBLIC	_getsigset
ALIGN 2

_getsigset:
	jmp	__getsigset

END
