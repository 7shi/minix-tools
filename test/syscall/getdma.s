.386
.MODEL FLAT
.CODE
EXTERN	__getdma:NEAR
PUBLIC	_getdma
ALIGN 2

_getdma:
	jmp	__getdma

END
