.386
.MODEL FLAT
.CODE
EXTERN	__sigemptyset:NEAR
PUBLIC	_sigemptyset
ALIGN 2

_sigemptyset:
	jmp	__sigemptyset

END
