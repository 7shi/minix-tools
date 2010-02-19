.386
.MODEL FLAT
.CODE
EXTERN	__sysuname:NEAR
PUBLIC	_sysuname
ALIGN 2

_sysuname:
	jmp	__sysuname

END
