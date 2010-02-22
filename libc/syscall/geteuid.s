.386
.MODEL FLAT
.CODE
EXTERN	__geteuid:NEAR
PUBLIC	_geteuid
ALIGN 2

_geteuid:
	jmp	__geteuid

END
