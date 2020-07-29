
_impressao:

;choose_view.c,25 :: 		void impressao()
;choose_view.c,29 :: 		Lcd_Chr(1,1,'J');
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       74
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;choose_view.c,30 :: 		Lcd_Chr_Cp('C');
	MOVLW       67
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,31 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,32 :: 		Lcd_Chr_Cp('M');
	MOVLW       77
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,33 :: 		Lcd_Chr_Cp('O');
	MOVLW       79
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,34 :: 		Lcd_Chr_Cp('D');
	MOVLW       68
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,35 :: 		Lcd_Chr_Cp('U');
	MOVLW       85
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,36 :: 		Lcd_Chr_Cp('L');
	MOVLW       76
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,37 :: 		Lcd_Chr_Cp('O');
	MOVLW       79
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,38 :: 		Lcd_Chr_Cp('S');
	MOVLW       83
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,40 :: 		Lcd_Chr(2,1,'P');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       80
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;choose_view.c,41 :: 		Lcd_Chr_Cp('O');
	MOVLW       79
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,42 :: 		Lcd_Chr_Cp('S');
	MOVLW       83
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,43 :: 		Lcd_Chr_Cp(':');
	MOVLW       58
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_view.c,45 :: 		IntToStr(pos_selector,txt);
	MOVF        _pos_selector+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVLW       0
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       impressao_txt_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(impressao_txt_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;choose_view.c,46 :: 		Lcd_Out(2,6,txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       impressao_txt_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(impressao_txt_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;choose_view.c,48 :: 		}
L_end_impressao:
	RETURN      0
; end of _impressao

_limpaLcd:

;choose_view.c,52 :: 		void limpaLcd()
;choose_view.c,54 :: 		if(limpa_lcd)
	BTFSS       _limpa_lcd+0, BitPos(_limpa_lcd+0) 
	GOTO        L_limpaLcd0
;choose_view.c,56 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;choose_view.c,57 :: 		limpa_lcd = 0x00;
	BCF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;choose_view.c,58 :: 		}
L_limpaLcd0:
;choose_view.c,59 :: 		}
L_end_limpaLcd:
	RETURN      0
; end of _limpaLcd
