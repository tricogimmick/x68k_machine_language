****************************************
* PUTCHAR.S
* DOSCALL _GETCHAR サンプル
****************************************
        .include DOSCALL.MAC

        .text
        .even

start:
        * 標準入力から1文字読み込む（エコーバックあり）
        * 入力された文字はD0.lにセットされる
        DOS     _GETCHAR
        * 入力された文字が'q'でなければ start へジャンプ
        cmp.w    #'q', d0
        bne     start
exit:
        * DOSCALL _EXITの呼出
        DOS     _EXIT

