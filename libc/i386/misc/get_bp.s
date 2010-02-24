; get_bp.s
;
; return EBP in EAX
;
; Created:	Sep 7, 1992 by Philip Homburg

;.sect .text; .sect .rom; .sect .data; .sect .bss

.386
.MODEL FLAT
.CODE
PUBLIC _get_bp
_get_bp:
	mov	eax, ebp
	ret

END

; $PchId: get_bp.ack.s,v 1.3 1996/02/23 08:30:52 philip Exp $

