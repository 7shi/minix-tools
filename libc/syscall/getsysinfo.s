.386
.MODEL FLAT
.CODE
EXTERN	__getsysinfo:NEAR
PUBLIC	_getsysinfo
EXTERN	__getsysinfo_up:NEAR
PUBLIC	_getsysinfo_up
ALIGN 2

_getsysinfo:
	jmp	__getsysinfo
_getsysinfo_up:
	jmp	__getsysinfo_up

END
