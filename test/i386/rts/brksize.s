.386
.MODEL FLAT
;.sect .text; .sect .rom; .sect .data; .sect .bss
PUBLIC __brksize
.DATA
;.extern endbss, __brksize
;__brksize: .data4 endbss
__brksize DD 0
END
