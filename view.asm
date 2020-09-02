
_inicioLcd:

;view.c,28 :: 		void inicioLcd()
;view.c,30 :: 		limpaLcd();
	CALL        _limpaLcd+0, 0
;view.c,32 :: 		Lcd_Chr(1,4,'J');
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       74
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;view.c,33 :: 		Lcd_Chr_Cp('C');
	MOVLW       67
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,34 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,35 :: 		Lcd_Chr_Cp('M');
	MOVLW       77
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,36 :: 		Lcd_Chr_Cp('O');
	MOVLW       79
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,37 :: 		Lcd_Chr_Cp('D');
	MOVLW       68
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,38 :: 		Lcd_Chr_Cp('U');
	MOVLW       85
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,39 :: 		Lcd_Chr_Cp('L');
	MOVLW       76
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,40 :: 		Lcd_Chr_Cp('O');
	MOVLW       79
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,41 :: 		Lcd_Chr_Cp('S');
	MOVLW       83
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,43 :: 		Lcd_Chr(2,1,'S');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       83
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;view.c,44 :: 		Lcd_Chr_Cp('I');
	MOVLW       73
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,45 :: 		Lcd_Chr_Cp('M');
	MOVLW       77
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,46 :: 		Lcd_Chr_Cp('U');
	MOVLW       85
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,47 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,48 :: 		Lcd_Chr_Cp('D');
	MOVLW       68
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,49 :: 		Lcd_Chr_Cp('E');
	MOVLW       69
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,50 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,51 :: 		Lcd_Chr_Cp('C');
	MOVLW       67
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,52 :: 		Lcd_Chr_Cp('E');
	MOVLW       69
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,53 :: 		Lcd_Chr_Cp('N');
	MOVLW       78
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,54 :: 		Lcd_Chr_Cp('T');
	MOVLW       84
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,55 :: 		Lcd_Chr_Cp('R');
	MOVLW       82
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,56 :: 		Lcd_Chr_Cp('A');
	MOVLW       65
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,57 :: 		Lcd_Chr_Cp('I');
	MOVLW       73
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,58 :: 		Lcd_Chr_Cp('S');
	MOVLW       83
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,59 :: 		}
L_end_inicioLcd:
	RETURN      0
; end of _inicioLcd

_menuPrincipal:

;view.c,63 :: 		void menuPrincipal(unsigned short var_menu)
;view.c,65 :: 		limpaLcd();
	CALL        _limpaLcd+0, 0
;view.c,68 :: 		max_menu = 1;
	MOVLW       1
	MOVWF       _max_menu+0 
	MOVLW       0
	MOVWF       _max_menu+1 
;view.c,69 :: 		min_menu = 0;
	CLRF        _min_menu+0 
	CLRF        _min_menu+1 
;view.c,71 :: 		Lcd_Chr(1,1,'T');
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       84
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;view.c,72 :: 		Lcd_Chr_Cp('I');
	MOVLW       73
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,73 :: 		Lcd_Chr_Cp('P');
	MOVLW       80
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,74 :: 		Lcd_Chr_Cp('O');
	MOVLW       79
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,75 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,76 :: 		Lcd_Chr_Cp('S');
	MOVLW       83
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,77 :: 		Lcd_Chr_Cp('I');
	MOVLW       73
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,78 :: 		Lcd_Chr_Cp('N');
	MOVLW       78
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,79 :: 		Lcd_Chr_Cp('A');
	MOVLW       65
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,80 :: 		Lcd_Chr_Cp('L');
	MOVLW       76
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,81 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,82 :: 		Lcd_Chr_Cp(':');
	MOVLW       58
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,84 :: 		Lcd_Out(2,1,opcoesSinal[var_menu]);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       4
	MOVWF       R2 
	MOVF        FARG_menuPrincipal_var_menu+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R2, 0 
L__menuPrincipal3:
	BZ          L__menuPrincipal4
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__menuPrincipal3
L__menuPrincipal4:
	MOVLW       _opcoesSinal+0
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_opcoesSinal+0)
	ADDWFC      R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;view.c,85 :: 		}
L_end_menuPrincipal:
	RETURN      0
; end of _menuPrincipal

_limpaLcd:

;view.c,89 :: 		void limpaLcd()
;view.c,91 :: 		if(limpa_lcd)
	BTFSS       _limpa_lcd+0, BitPos(_limpa_lcd+0) 
	GOTO        L_limpaLcd0
;view.c,93 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;view.c,94 :: 		limpa_lcd = 0x00;
	BCF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;view.c,95 :: 		}
L_limpaLcd0:
;view.c,96 :: 		}
L_end_limpaLcd:
	RETURN      0
; end of _limpaLcd

_escolhaDentes:

;view.c,100 :: 		void escolhaDentes(unsigned short var_menu)
;view.c,102 :: 		limpaLcd();
	CALL        _limpaLcd+0, 0
;view.c,105 :: 		max_menu = 150;
	MOVLW       150
	MOVWF       _max_menu+0 
	MOVLW       0
	MOVWF       _max_menu+1 
;view.c,106 :: 		min_menu = 0;
	CLRF        _min_menu+0 
	CLRF        _min_menu+1 
;view.c,108 :: 		Lcd_Chr(1,1,'Q');
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       81
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;view.c,109 :: 		Lcd_Chr_Cp('U');
	MOVLW       85
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,110 :: 		Lcd_Chr_Cp('A');
	MOVLW       65
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,111 :: 		Lcd_Chr_Cp('N');
	MOVLW       78
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,112 :: 		Lcd_Chr_Cp('T');
	MOVLW       84
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,113 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,114 :: 		Lcd_Chr_Cp('D');
	MOVLW       68
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,115 :: 		Lcd_Chr_Cp('E');
	MOVLW       69
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,116 :: 		Lcd_Chr_Cp('N');
	MOVLW       78
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,117 :: 		Lcd_Chr_Cp('T');
	MOVLW       84
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,118 :: 		Lcd_Chr_Cp('E');
	MOVLW       69
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,119 :: 		Lcd_Chr_Cp('S');
	MOVLW       83
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,120 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,121 :: 		Lcd_Chr_Cp(':');
	MOVLW       58
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,123 :: 		ByteToStr(var_menu,txt);
	MOVF        FARG_escolhaDentes_var_menu+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _txt+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;view.c,124 :: 		Lcd_Out(2,2,txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;view.c,125 :: 		}
L_end_escolhaDentes:
	RETURN      0
; end of _escolhaDentes

_escolhaEspacos:

;view.c,129 :: 		void escolhaEspacos(unsigned short var_menu)
;view.c,131 :: 		limpaLcd();
	CALL        _limpaLcd+0, 0
;view.c,134 :: 		max_menu = 150;
	MOVLW       150
	MOVWF       _max_menu+0 
	MOVLW       0
	MOVWF       _max_menu+1 
;view.c,135 :: 		min_menu = 0;
	CLRF        _min_menu+0 
	CLRF        _min_menu+1 
;view.c,137 :: 		Lcd_Chr(1,1,'Q');
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       81
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;view.c,138 :: 		Lcd_Chr_Cp('U');
	MOVLW       85
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,139 :: 		Lcd_Chr_Cp('A');
	MOVLW       65
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,140 :: 		Lcd_Chr_Cp('N');
	MOVLW       78
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,141 :: 		Lcd_Chr_Cp('T');
	MOVLW       84
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,142 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,143 :: 		Lcd_Chr_Cp('E');
	MOVLW       69
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,144 :: 		Lcd_Chr_Cp('S');
	MOVLW       83
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,145 :: 		Lcd_Chr_Cp('P');
	MOVLW       80
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,146 :: 		Lcd_Chr_Cp('A');
	MOVLW       65
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,147 :: 		Lcd_Chr_Cp('C');
	MOVLW       67
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,148 :: 		Lcd_Chr_Cp('O');
	MOVLW       79
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,149 :: 		Lcd_Chr_Cp('S');
	MOVLW       83
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,150 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,151 :: 		Lcd_Chr_Cp(':');
	MOVLW       58
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,153 :: 		ByteToStr(var_menu,txt);
	MOVF        FARG_escolhaEspacos_var_menu+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _txt+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;view.c,154 :: 		Lcd_Out(2,2,txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;view.c,155 :: 		}
L_end_escolhaEspacos:
	RETURN      0
; end of _escolhaEspacos

_sinalFonica:

;view.c,159 :: 		void sinalFonica()
;view.c,161 :: 		limpaLcd();
	CALL        _limpaLcd+0, 0
;view.c,163 :: 		Lcd_Chr(1,1,'S');
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       83
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;view.c,164 :: 		Lcd_Chr_Cp('I');
	MOVLW       73
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,165 :: 		Lcd_Chr_Cp('N');
	MOVLW       78
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,166 :: 		Lcd_Chr_Cp('A');
	MOVLW       65
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,167 :: 		Lcd_Chr_Cp('L');
	MOVLW       76
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,168 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,169 :: 		Lcd_Chr_Cp('F');
	MOVLW       70
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,170 :: 		Lcd_Chr_Cp('O');
	MOVLW       79
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,171 :: 		Lcd_Chr_Cp('N');
	MOVLW       78
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,172 :: 		Lcd_Chr_Cp('I');
	MOVLW       73
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,173 :: 		Lcd_Chr_Cp('C');
	MOVLW       67
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,174 :: 		Lcd_Chr_Cp('A');
	MOVLW       65
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,175 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,176 :: 		Lcd_Chr_Cp(':');
	MOVLW       58
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,178 :: 		Lcd_Chr(2,16,'%');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       16
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       37
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;view.c,180 :: 		ByteToStr(dentes,txt);
	MOVF        _dentes+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _txt+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;view.c,181 :: 		Lcd_Out(2,1,Ltrim(txt));
	MOVLW       _txt+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;view.c,183 :: 		Lcd_Chr(2,3,'-');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       45
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;view.c,185 :: 		ByteToStr(espacos,txt);
	MOVF        _espacos+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _txt+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;view.c,186 :: 		Lcd_Out(2,4,Ltrim(txt));
	MOVLW       _txt+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;view.c,188 :: 		ByteToStr(valor_tmr1,txt2);
	MOVF        _valor_tmr1+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _txt2+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_txt2+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;view.c,189 :: 		Lcd_Out(2,13,Ltrim(txt2));
	MOVLW       _txt2+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_txt2+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       13
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;view.c,191 :: 		}
L_end_sinalFonica:
	RETURN      0
; end of _sinalFonica

_sinalHall:

;view.c,195 :: 		void sinalHall()
;view.c,197 :: 		limpaLcd();
	CALL        _limpaLcd+0, 0
;view.c,199 :: 		dentes = 2;
	MOVLW       2
	MOVWF       _dentes+0 
;view.c,200 :: 		espacos = 1;
	MOVLW       1
	MOVWF       _espacos+0 
;view.c,202 :: 		Lcd_Chr(1,1,'S');
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       83
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;view.c,203 :: 		Lcd_Chr_Cp('I');
	MOVLW       73
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,204 :: 		Lcd_Chr_Cp('N');
	MOVLW       78
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,205 :: 		Lcd_Chr_Cp('A');
	MOVLW       65
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,206 :: 		Lcd_Chr_Cp('L');
	MOVLW       76
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,207 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,208 :: 		Lcd_Chr_Cp('H');
	MOVLW       72
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,209 :: 		Lcd_Chr_Cp('A');
	MOVLW       65
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,210 :: 		Lcd_Chr_Cp('L');
	MOVLW       76
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,211 :: 		Lcd_Chr_Cp('L');
	MOVLW       76
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,212 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,213 :: 		Lcd_Chr_Cp(':');
	MOVLW       58
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;view.c,215 :: 		Lcd_Chr(2,16,'%');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       16
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       37
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;view.c,217 :: 		ByteToStr(valor_tmr1,txt2);
	MOVF        _valor_tmr1+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _txt2+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_txt2+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;view.c,218 :: 		Lcd_Out(2,13,Ltrim(txt2));
	MOVLW       _txt2+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_txt2+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       13
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;view.c,219 :: 		}
L_end_sinalHall:
	RETURN      0
; end of _sinalHall
