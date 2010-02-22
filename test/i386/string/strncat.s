;	strncat()					Author: Kees J. Bot
;								1 Jan 1994
;.sect text; .sect .rom; .sect .data; .sect .bss
.386
.MODEL FLAT

; size_t strncat(char *s1, const char *s2, size_t n)
;	Append string s2 to s1.
;
.CODE
EXTERN __strncat:NEAR
PUBLIC _strncat
	;;.align	16
_strncat:
	mov	edx, 12[esp]	; Maximum length
	jmp	__strncat	; Common code

END
