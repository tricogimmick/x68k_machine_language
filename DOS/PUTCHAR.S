****************************************
* PUTCHAR.S
* DOSCALL _PUTCHAR サンプル
****************************************
            .include DOSCALL.MAC

            .text
            .even

    start:
            * 表示する文字をスタックに積んで,_PUTCHARをコールする
            move.w  #'A', -(sp)
            DOS     _PUTCHAR
            addq.l  #2, sp
            * DOSCALL _EXITの呼出
            DOS     _EXIT

