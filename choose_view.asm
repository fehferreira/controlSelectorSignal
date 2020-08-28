
_inicioLcd:

;choose_view.c,31 :: 		void inicioLcd()
;choose_view.c,33 :: 		limpaLcd();
	CALL        _limpaLcd+0, 0
;choose_view.c,35 :: 		Lcd_Chr(1,4,'J');
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       74
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;choose_view.c,36 :: 		Lcd_Chr_Cp('C');
	MOVLW       67
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,37 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,38 :: 		Lcd_Chr_Cp('M');
	MOVLW       77
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,39 :: 		Lcd_Chr_Cp('O');
	MOVLW       79
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,40 :: 		Lcd_Chr_Cp('D');
	MOVLW       68
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,41 :: 		Lcd_Chr_Cp('U');
	MOVLW       85
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,42 :: 		Lcd_Chr_Cp('L');
	MOVLW       76
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,43 :: 		Lcd_Chr_Cp('O');
	MOVLW       79
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,44 :: 		Lcd_Chr_Cp('S');
	MOVLW       83
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,46 :: 		Lcd_Chr(2,1,'S');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       83
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;choose_view.c,47 :: 		Lcd_Chr_Cp('I');
	MOVLW       73
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,48 :: 		Lcd_Chr_Cp('M');
	MOVLW       77
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,49 :: 		Lcd_Chr_Cp('U');
	MOVLW       85
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,50 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,51 :: 		Lcd_Chr_Cp('D');
	MOVLW       68
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,52 :: 		Lcd_Chr_Cp('E');
	MOVLW       69
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,53 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,54 :: 		Lcd_Chr_Cp('C');
	MOVLW       67
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,55 :: 		Lcd_Chr_Cp('E');
	MOVLW       69
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,56 :: 		Lcd_Chr_Cp('N');
	MOVLW       78
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,57 :: 		Lcd_Chr_Cp('T');
	MOVLW       84
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,58 :: 		Lcd_Chr_Cp('R');
	MOVLW       82
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,59 :: 		Lcd_Chr_Cp('A');
	MOVLW       65
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,60 :: 		Lcd_Chr_Cp('I');
	MOVLW       73
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,61 :: 		Lcd_Chr_Cp('S');
	MOVLW       83
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,62 :: 		}
L_end_inicioLcd:
	RETURN      0
; end of _inicioLcd

_limpaLcd:

;choose_view.c,66 :: 		void limpaLcd()
;choose_view.c,68 :: 		if(limpa_lcd)
	BTFSS       _limpa_lcd+0, BitPos(_limpa_lcd+0) 
	GOTO        L_limpaLcd0
;choose_view.c,70 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;choose_view.c,71 :: 		limpa_lcd = 0x00;
	BCF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;choose_view.c,72 :: 		}
L_limpaLcd0:
;choose_view.c,73 :: 		}
L_end_limpaLcd:
	RETURN      0
; end of _limpaLcd

_menu1:

;choose_view.c,77 :: 		void menu1()
;choose_view.c,79 :: 		limpaLcd();
	CALL        _limpaLcd+0, 0
;choose_view.c,80 :: 		Lcd_Chr(1,1,'S');
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       83
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;choose_view.c,81 :: 		Lcd_Chr_Cp('I');
	MOVLW       73
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,82 :: 		Lcd_Chr_Cp('N');
	MOVLW       78
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,83 :: 		Lcd_Chr_Cp('A');
	MOVLW       65
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,84 :: 		Lcd_Chr_Cp('L');
	MOVLW       76
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,85 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,86 :: 		Lcd_Chr_Cp('R');
	MOVLW       82
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,87 :: 		Lcd_Chr_Cp('O');
	MOVLW       79
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,88 :: 		Lcd_Chr_Cp('T');
	MOVLW       84
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,89 :: 		Lcd_Chr_Cp('A');
	MOVLW       65
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,90 :: 		Lcd_Chr_Cp('C');
	MOVLW       67
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,91 :: 		Lcd_Chr_Cp('A');
	MOVLW       65
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,92 :: 		Lcd_Chr_Cp('O');
	MOVLW       79
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,94 :: 		Lcd_Chr(2,1,'I');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       73
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;choose_view.c,95 :: 		Lcd_Chr_Cp('N');
	MOVLW       78
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,96 :: 		Lcd_Chr_Cp('D');
	MOVLW       68
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,97 :: 		Lcd_Chr_Cp('U');
	MOVLW       85
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,98 :: 		Lcd_Chr_Cp('C');
	MOVLW       67
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,99 :: 		Lcd_Chr_Cp('A');
	MOVLW       65
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,100 :: 		Lcd_Chr_Cp('O');
	MOVLW       79
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,101 :: 		Lcd_Chr_Cp(':');
	MOVLW       58
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,103 :: 		Lcd_Chr(2,11,'-');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       11
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       45
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;choose_view.c,104 :: 		Lcd_Chr_Cp('>');
	MOVLW       62
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,105 :: 		}
L_end_menu1:
	RETURN      0
; end of _menu1

_menu2:

;choose_view.c,109 :: 		void menu2()
;choose_view.c,111 :: 		limpaLcd();
	CALL        _limpaLcd+0, 0
;choose_view.c,112 :: 		Lcd_Chr(1,1,'S');
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       83
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;choose_view.c,113 :: 		Lcd_Chr_Cp('I');
	MOVLW       73
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,114 :: 		Lcd_Chr_Cp('N');
	MOVLW       78
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,115 :: 		Lcd_Chr_Cp('A');
	MOVLW       65
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,116 :: 		Lcd_Chr_Cp('L');
	MOVLW       76
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,117 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,118 :: 		Lcd_Chr_Cp('R');
	MOVLW       82
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,119 :: 		Lcd_Chr_Cp('O');
	MOVLW       79
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,120 :: 		Lcd_Chr_Cp('T');
	MOVLW       84
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,121 :: 		Lcd_Chr_Cp('A');
	MOVLW       65
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,122 :: 		Lcd_Chr_Cp('C');
	MOVLW       67
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,123 :: 		Lcd_Chr_Cp('A');
	MOVLW       65
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,124 :: 		Lcd_Chr_Cp('O');
	MOVLW       79
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,126 :: 		Lcd_Chr(2,1,'H');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       72
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;choose_view.c,127 :: 		Lcd_Chr_Cp('A');
	MOVLW       65
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,128 :: 		Lcd_Chr_Cp('L');
	MOVLW       76
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,129 :: 		Lcd_Chr_Cp('L');
	MOVLW       76
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,130 :: 		Lcd_Chr_Cp(':');
	MOVLW       58
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,132 :: 		Lcd_Chr(2,11,'-');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       11
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       45
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;choose_view.c,133 :: 		Lcd_Chr_Cp('>');
	MOVLW       62
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,134 :: 		}
L_end_menu2:
	RETURN      0
; end of _menu2
