;	strcat()					Author: Kees J. Bot
;								1 Jan 1994
;.sect text; .sect .rom; .sect .data; .sect .bss
.386
.MODEL FLAT

; char *strcat(char *s1, const char *s2)
;	Append string s2 to s1.
;
.CODE
EXTERN __strncat:NEAR
PUBLIC _strcat
	;.align	16
_strcat:
	mov	edx, -1		; Unlimited length
	jmp	__strncat	; Common code

END
