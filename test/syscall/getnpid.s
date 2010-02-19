.386
.MODEL FLAT
.CODE
EXTERN	__getnpid:NEAR
PUBLIC	_getnpid
ALIGN 2

_getnpid:
	jmp	__getnpid

END
