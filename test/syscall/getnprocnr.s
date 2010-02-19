.386
.MODEL FLAT
.CODE
EXTERN	__getnprocnr:NEAR
PUBLIC	_getnprocnr
ALIGN 2

_getnprocnr:
	jmp	__getnprocnr

END
