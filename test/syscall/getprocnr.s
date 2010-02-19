.386
.MODEL FLAT
.CODE
EXTERN	__getprocnr:NEAR
PUBLIC	_getprocnr
ALIGN 2

_getprocnr:
	jmp	__getprocnr

END
