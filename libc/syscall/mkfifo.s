.386
.MODEL FLAT
.CODE
EXTERN	__mkfifo:NEAR
PUBLIC	_mkfifo
ALIGN 2

_mkfifo:
	jmp	__mkfifo

END
