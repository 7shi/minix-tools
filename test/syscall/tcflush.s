.386
.MODEL FLAT
.CODE
EXTERN	__tcflush:NEAR
PUBLIC	_tcflush
ALIGN 2

_tcflush:
	jmp	__tcflush

END
