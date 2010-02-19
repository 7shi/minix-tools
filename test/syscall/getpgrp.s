.386
.MODEL FLAT
.CODE
EXTERN	__getpgrp:NEAR
PUBLIC	_getpgrp
ALIGN 2

_getpgrp:
	jmp	__getpgrp

END
