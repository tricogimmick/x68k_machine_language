****************************************
* STRCAT.S
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
    bsr     strcat

    move.l  a1, -(sp)
    DOS     _PRINT          
    addq.l  #4, sp          

    DOS     _EXIT
*
****************************************
* strcat
* concatnate string
* Parameter
* A0 : source string data address
* A1 : destination string data address
****************************************
strcat:
    movem.l a0-a1, -(sp)
strcat1:
    cmp.b   #0, (a1)
    beq     strcat2
    add.l   #1, a1
    bra     strcat1
strcat2:
    move.b  (a0)+, (a1)+    
    bne     strcat2 
    movem.l (sp)+, a0-a1
    rts
*
    .data
    .even
*
src:   
    .dc.b   'ABCD',0
dst:
    .dc.b   '1234',0
    .ds.b   256
*
    .stack
    .even
*
mystack:
    .ds.l   256
mysp:
    .end
