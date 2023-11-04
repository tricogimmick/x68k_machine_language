****************************************
* HELLO.S
****************************************
        .include DOSCALL.MAC
*
		pea		mes
		.dc.w	_PRINT
		addq.l	#4,sp
		.dc.w	_EXIT
mes:	.dc.b	'HELLO WORLD',$d,$a,0

