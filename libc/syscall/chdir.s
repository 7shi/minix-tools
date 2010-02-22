.386
.MODEL FLAT
.CODE
EXTERN	__chdir:NEAR
PUBLIC	_chdir
EXTERN	__fchdir:NEAR
PUBLIC	_fchdir
ALIGN 2

_chdir:
	jmp	__chdir
_fchdir:
	jmp	__fchdir

END
