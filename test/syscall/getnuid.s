.386
.MODEL FLAT
.CODE
EXTERN	__getnuid:NEAR
PUBLIC	_getnuid
ALIGN 2

_getnuid:
	jmp	__getnuid

END
