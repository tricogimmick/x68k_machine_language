****************************************
* STRCMP.S
****************************************
    .include DOSCALL.MAC
*
    .text
    .even
*
entry:
    lea.l   mysp, sp 
step1:
    lea.l   str1, a0
    lea.l   str2, a1
    bsr     cmpproc
step2:
    lea.l   str1, a0
    lea.l   str3, a1
    bsr     cmpproc
step3:
    lea.l   str1, a0
    lea.l   str4, a1
    bsr     cmpproc

    DOS     _EXIT

cmpproc:
    move.l  a0, -(sp)
    DOS     _PRINT
    addq.l  #4, sp
    move.w  #',', -(sp)
    DOS     _PUTCHAR    
    addq.l  #2, sp 
    move.l  a1, -(sp)
    DOS     _PRINT
    addq.l  #4, sp

    bsr     strcmp
    bne     unmatch

    pea     matchmsg
    DOS     _PRINT
    addq.l  #4, sp
    rts
unmatch:
    pea     unmatchmsg
    DOS     _PRINT
    addq.l  #4, sp
    rts
*
****************************************
* strcmp
* string compare
* Parameter
* A0 : string1 address
* A1 : string2 address
****************************************
strcmp:
    movem.l a0-a1, -(sp)
strcmp1:
    tst.b   (a1)
    beq     strcmp2
    cmp.b   (a0)+,(a1)+
    beq     strcmp1
    bra     strcmp3
strcmp2:
    cmp.b   (a0)+,(a1)+
strcmp3:
    movem.l (sp)+, a0-a1
    rts
*
    .data
    .even
*
str1:   
    .dc.b   'ABCDEFG',0
str2:
    .dc.b   'ABCDEFG',0
str3:
    .dc.b   'ABCDE',0
str4:
    .dc.b   'ABCDEFGH',0
matchmsg:
    .dc.b   ' -> MATCH',$d,$a,0
unmatchmsg:
    .dc.b   ' -> UNMATCH',$d,$a,0
*
    .stack
    .even
*
mystack:
    .ds.l   256
mysp:
    .end
