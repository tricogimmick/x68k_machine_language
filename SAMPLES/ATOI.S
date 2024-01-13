****************************************
* ATOI.S
****************************************
    .include DOSCALL.MAC
*
    .text
    .even
*
entry:
    lea.l   mysp, sp 
    lea.l   src, a0
    bsr     atoi

    move.l  d0, d1
    add.l   d1, d0

    lea.l   dst, a0
    bsr     itoa    

    move.l  a0, -(sp)
    DOS     _PRINT          
    addq.l  #4, sp          

    DOS     _EXIT
*
****************************************
* atoi
* string to int
* Parameter
* A0 : input string address 
* d0 : output convert number
****************************************
atoi:
    movem.l d1/a0, -(sp)
    move.l  #0, d0
    move.l  #0, d1
atoi1:
    move.b  (a0)+, d1
    beq     atoi2
    sub.b   #'0', d1
    mulu.w  #10, d0
    add.l   d1, d0
    bra     atoi1
atoi2:
    movem.l (sp)+, d1/a0
    rts

*
****************************************
* itoa
* int to string
* Parameter
* D0 : input number 
* A0 : output string buffer address
****************************************
itoa:
    movem.l d0/a0, -(sp)
itoa1:
    divu.w  #10, d0
    swap.w  d0
    add.w   #'0', d0
    move.b  d0, (a0)+
    clr.w   d0
    swap.w  d0
    bne     itoa1

    move.b  #0, (a0)
    movem.l (sp)+, d0/a0
    bsr     strrev
    rts

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
    .dc.b   '123',0
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
