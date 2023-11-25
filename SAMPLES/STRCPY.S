****************************************
* STRCPY.S
****************************************
    .include DOSCALL.MAC
*
    .text
    .even
*
entry:
    lea.l   mysp, sp 
    lea.l   src, a0
    lea.l   dst, a1
    bsr     strcpy

    move.l  a1, -(sp)
    DOS     _PRINT          
    addq.l  #4, sp          

    DOS     _EXIT
*
****************************************
* strcpy
* string copy
* Paramater
* A0 : source string data address
* A1 : destination buffer address
****************************************
strcpy:
    movem.l a0-a1, -(sp)
strcpy1:
    move.b  (a0)+, (a1)+    
    bne     strcpy1 
    movem.l (sp)+, a0-a1
    rts
*
    .data
    .even
*
src:   
    .dc.b   '1234ABCD',0
dst:
    .ds.b   256
*
    .stack
    .even
*
mystack:
    .ds.l   256
mysp:
    .end
