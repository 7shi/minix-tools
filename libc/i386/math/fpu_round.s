;	fpu_rndint() - round integer	Author: Erik van der Kouwe
;	                            	17 Dec 2009
.386
.MODEL FLAT
.CODE
PUBLIC _fpu_rndint
PUBLIC _fpu_remainder

; void fpu_rndint(double *value)
_fpu_rndint:
	; move the value onto the floating point stack
	mov	eax,	4[esp]
	fld	dword ptr [eax]

	; round it (beware of precision exception;)
	frndint

	; store the result
	fstp	dword ptr [eax]
	ret

; void fpu_remainder(double *x, double y)
_fpu_remainder:
	; move the values onto the floating point stack
	fld	dword ptr 8[esp]
	mov	edx,	4[esp]
	fld	dword ptr [edx]

	; compute remainder, multiple iterations may be needed
_1:	fprem1
	fnstsw	ax	
	sahf
	jp	_1

	; store the result and pop the divisor
	fstp	dword ptr [edx]
	fstp	st
	ret

END
