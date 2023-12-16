****************************************
* STRREV.S
****************************************
    .include DOSCALL.MAC
*
    .text
    .even
*
entry:
    lea.l   mysp, sp 
    lea.l   src, a0
    bsr     strrev

    move.l  a0, -(sp)
    DOS     _PRINT          
    addq.l  #4, sp          

    DOS     _EXIT
*
****************************************
* strrev
* string creverse
* Parameter
* A0 : string data address
****************************************
strrev:
    movem.l d0/a0-a1, -(sp)
    move.l  a0, a1
strrev1:
    tst.b   (a1)
    beq     strrev2
    add.l   #1, a1
    bra     strrev1
strrev2:
    move.b  -(a1), d0
    move.b  (a0), (a1)
    move.b  d0, (a0)+
    cmp.l   a0, a1
    bhi     strrev2
    movem.l (sp)+, d0/a0-a1
    rts
*
    .data
    .even
*
src:   
    .dc.b   '1234567890',0
*
    .stack
    .even
*
mystack:
    .ds.l   256
mysp:
    .end
