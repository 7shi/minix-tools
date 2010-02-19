.386
.MODEL FLAT
.CODE
EXTERN	__mapdriver:NEAR
PUBLIC	_mapdriver
ALIGN 2

_mapdriver:
	jmp	__mapdriver

END
