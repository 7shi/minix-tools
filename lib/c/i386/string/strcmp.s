;	strcmp()					Author: Kees J. Bot
;								1 Jan 1994
;.sect text; .sect .rom; .sect .data; .sect .bss
.386
.MODEL FLAT

; int strcmp(const char *s1, const char *s2)
;	Compare two strings.
;
.CODE
EXTERN __strncmp:NEAR
PUBLIC _strcmp
	;.align	16
_strcmp:
	mov	ecx, -1		; Unlimited length
	jmp	__strncmp	; Common code

END
