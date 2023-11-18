****************************************
* LOOP.S
****************************************
        .include DOSCALL.MAC
*
        move.w  #1, d1
loop:
        move.w  d1, d2
        add.w   #'0', d2
        move.w  d2, -(sp)
        DOS  _PUTCHAR
        addq.l #2, sp   

		pea		crlf
		DOS	_PRINT
		addq.l	#4, sp

        add.w  #1, d1
        cmp.w  #6, d1
        bne     loop

		.dc.w	_EXIT
crlf:	.dc.b	$d,$a,0

