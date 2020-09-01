
_buttonMenu:

;button.c,26 :: 		void buttonMenu()                           //Funcao que recebe valor do botao
;button.c,28 :: 		if(voltar   && !flagb1) flagb1 = 0x01;    //Botão foi apertado? Seta flagb1
	BTFSS       voltar+0, BitPos(voltar+0) 
	GOTO        L_buttonMenu2
	BTFSC       _flagb1+0, BitPos(_flagb1+0) 
	GOTO        L_buttonMenu2
L__buttonMenu41:
	BSF         _flagb1+0, BitPos(_flagb1+0) 
L_buttonMenu2:
;button.c,29 :: 		if(esquerda && !flagb2) flagb2 = 0x01;    //Botao foi apertado? Seta flagb2
	BTFSS       esquerda+0, BitPos(esquerda+0) 
	GOTO        L_buttonMenu5
	BTFSC       _flagb2+0, BitPos(_flagb2+0) 
	GOTO        L_buttonMenu5
L__buttonMenu40:
	BSF         _flagb2+0, BitPos(_flagb2+0) 
L_buttonMenu5:
;button.c,30 :: 		if(direita  && !flagb3) flagb3 = 0x01;    //Botao foi apertado? Seta flagb3
	BTFSS       direita+0, BitPos(direita+0) 
	GOTO        L_buttonMenu8
	BTFSC       _flagb3+0, BitPos(_flagb3+0) 
	GOTO        L_buttonMenu8
L__buttonMenu39:
	BSF         _flagb3+0, BitPos(_flagb3+0) 
L_buttonMenu8:
;button.c,31 :: 		if(ok       && !flagb4) flagb4 = 0x01;    //Botao foi apertado? Seta flagb4
	BTFSS       ok+0, BitPos(ok+0) 
	GOTO        L_buttonMenu11
	BTFSC       _flagb4+0, BitPos(_flagb4+0) 
	GOTO        L_buttonMenu11
L__buttonMenu38:
	BSF         _flagb4+0, BitPos(_flagb4+0) 
L_buttonMenu11:
;button.c,33 :: 		if(!voltar && flagb1)                     //Botao solto?
	BTFSC       voltar+0, BitPos(voltar+0) 
	GOTO        L_buttonMenu14
	BTFSS       _flagb1+0, BitPos(_flagb1+0) 
	GOTO        L_buttonMenu14
L__buttonMenu37:
;button.c,35 :: 		flagb1 = 0x00;                          //Limpa flagb1
	BCF         _flagb1+0, BitPos(_flagb1+0) 
;button.c,36 :: 		flagVoltar = 1;
	BSF         _flagVoltar+0, BitPos(_flagVoltar+0) 
;button.c,37 :: 		flagConfirma = 1;
	BSF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;button.c,38 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,39 :: 		}
L_buttonMenu14:
;button.c,41 :: 		if(!esquerda && flagb2)
	BTFSC       esquerda+0, BitPos(esquerda+0) 
	GOTO        L_buttonMenu17
	BTFSS       _flagb2+0, BitPos(_flagb2+0) 
	GOTO        L_buttonMenu17
L__buttonMenu36:
;button.c,43 :: 		flagb2 = 0x00;                          //Limpa flagb2
	BCF         _flagb2+0, BitPos(_flagb2+0) 
;button.c,44 :: 		if(var_menu <= max_menu && var_menu > min_menu) var_menu --;
	MOVF        _var_menu+0, 0 
	SUBWF       _max_menu+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_buttonMenu20
	MOVF        _var_menu+0, 0 
	SUBWF       _min_menu+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_buttonMenu20
L__buttonMenu35:
	DECF        _var_menu+0, 1 
	GOTO        L_buttonMenu21
L_buttonMenu20:
;button.c,45 :: 		else                             var_menu = min_menu;
	MOVF        _min_menu+0, 0 
	MOVWF       _var_menu+0 
L_buttonMenu21:
;button.c,46 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,47 :: 		}
L_buttonMenu17:
;button.c,49 :: 		if(!direita && flagb3)
	BTFSC       direita+0, BitPos(direita+0) 
	GOTO        L_buttonMenu24
	BTFSS       _flagb3+0, BitPos(_flagb3+0) 
	GOTO        L_buttonMenu24
L__buttonMenu34:
;button.c,51 :: 		flagb3 = 0x00;                          //Limpa flagb3
	BCF         _flagb3+0, BitPos(_flagb3+0) 
;button.c,52 :: 		if(var_menu < max_menu && var_menu >= 0) var_menu ++;
	MOVF        _max_menu+0, 0 
	SUBWF       _var_menu+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_buttonMenu27
	MOVLW       0
	SUBWF       _var_menu+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_buttonMenu27
L__buttonMenu33:
	INCF        _var_menu+0, 1 
	GOTO        L_buttonMenu28
L_buttonMenu27:
;button.c,53 :: 		else                             var_menu = max_menu;
	MOVF        _max_menu+0, 0 
	MOVWF       _var_menu+0 
L_buttonMenu28:
;button.c,54 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,55 :: 		}
L_buttonMenu24:
;button.c,57 :: 		if(!ok && flagb4)
	BTFSC       ok+0, BitPos(ok+0) 
	GOTO        L_buttonMenu31
	BTFSS       _flagb4+0, BitPos(_flagb4+0) 
	GOTO        L_buttonMenu31
L__buttonMenu32:
;button.c,59 :: 		flagb4 = 0x00;                          //Limpa flagb4
	BCF         _flagb4+0, BitPos(_flagb4+0) 
;button.c,60 :: 		flagConfirma = 1;
	BSF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;button.c,61 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,62 :: 		}
L_buttonMenu31:
;button.c,64 :: 		}
L_end_buttonMenu:
	RETURN      0
; end of _buttonMenu
