.386
.MODEL FLAT
.CODE
EXTERN	__getpprocnr:NEAR
PUBLIC	_getpprocnr
ALIGN 2

_getpprocnr:
	jmp	__getpprocnr

END
