;	rindex()					Author: Kees J. Bot
;								2 Jan 1994
;.sect text; .sect .rom; .sect .data; .sect .bss
.386
.MODEL FLAT

; char *rindex(const char *s, int c)
;	Look for the last occurrence a character in a string.  Has suffered
;	from a hostile takeover by strrchr().
;
.CODE
EXTERN _strrchr:NEAR
PUBLIC _rindex
	;.align	16
_rindex:
	jmp	_strrchr

END
