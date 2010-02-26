;	index()						Author: Kees J. Bot
;								2 Jan 1994
;.sect text; .sect .rom; .sect .data; .sect .bss
.386
.MODEL FLAT

; char *index(const char *s, int c)
;	Look for a character in a string.  Has suffered from a hostile
;	takeover by strchr().
;
.CODE
EXTERN _strchr:NEAR
PUBLIC _index
	;.align	16
_index:
	jmp	_strchr

END
