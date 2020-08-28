
_buttonMenu:

;choose_button.c,37 :: 		void buttonMenu()                           //Funcao que recebe valor do botao
;choose_button.c,39 :: 		if(voltar   && !flagb1) flagb1 = 0x01;    //Botao foi apertado? Seta flagb1
	BTFSS       RB4_bit+0, BitPos(RB4_bit+0) 
	GOTO        L_buttonMenu2
	BTFSC       _flagb1+0, BitPos(_flagb1+0) 
	GOTO        L_buttonMenu2
L__buttonMenu49:
	BSF         _flagb1+0, BitPos(_flagb1+0) 
L_buttonMenu2:
;choose_button.c,40 :: 		if(esquerda && !flagb2) flagb2 = 0x01;    //Botao foi apertado? Seta flagb2
	BTFSS       RB5_bit+0, BitPos(RB5_bit+0) 
	GOTO        L_buttonMenu5
	BTFSC       _flagb2+0, BitPos(_flagb2+0) 
	GOTO        L_buttonMenu5
L__buttonMenu48:
	BSF         _flagb2+0, BitPos(_flagb2+0) 
L_buttonMenu5:
;choose_button.c,41 :: 		if(direita  && !flagb3) flagb3 = 0x01;    //Botao foi apertado? Seta flagb3
	BTFSS       RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L_buttonMenu8
	BTFSC       _flagb3+0, BitPos(_flagb3+0) 
	GOTO        L_buttonMenu8
L__buttonMenu47:
	BSF         _flagb3+0, BitPos(_flagb3+0) 
L_buttonMenu8:
;choose_button.c,42 :: 		if(ok       && !flagb4) flagb4 = 0x01;    //Botao foi apertado? Seta flagb4
	BTFSS       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L_buttonMenu11
	BTFSC       _flagb4+0, BitPos(_flagb4+0) 
	GOTO        L_buttonMenu11
L__buttonMenu46:
	BSF         _flagb4+0, BitPos(_flagb4+0) 
L_buttonMenu11:
;choose_button.c,44 :: 		if(!voltar && flagb1)                     //Botao solto?
	BTFSC       RB4_bit+0, BitPos(RB4_bit+0) 
	GOTO        L_buttonMenu14
	BTFSS       _flagb1+0, BitPos(_flagb1+0) 
	GOTO        L_buttonMenu14
L__buttonMenu45:
;choose_button.c,46 :: 		if(flaginicio == 0)
	BTFSC       _flaginicio+0, BitPos(_flaginicio+0) 
	GOTO        L_buttonMenu15
;choose_button.c,48 :: 		flagb1 = 0x00;                          //Limpa flagb1
	BCF         _flagb1+0, BitPos(_flagb1+0) 
;choose_button.c,49 :: 		flagVoltar = 1;
	BSF         _flagVoltar+0, BitPos(_flagVoltar+0) 
;choose_button.c,50 :: 		flagConfirma = 1;
	BSF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;choose_button.c,51 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;choose_button.c,52 :: 		}
L_buttonMenu15:
;choose_button.c,53 :: 		}
L_buttonMenu14:
;choose_button.c,55 :: 		if(!esquerda && flagb2)
	BTFSC       RB5_bit+0, BitPos(RB5_bit+0) 
	GOTO        L_buttonMenu18
	BTFSS       _flagb2+0, BitPos(_flagb2+0) 
	GOTO        L_buttonMenu18
L__buttonMenu44:
;choose_button.c,57 :: 		if(flaginicio == 0)
	BTFSC       _flaginicio+0, BitPos(_flaginicio+0) 
	GOTO        L_buttonMenu19
;choose_button.c,59 :: 		flagb2 = 0x00;                          //Limpa flagb2
	BCF         _flagb2+0, BitPos(_flagb2+0) 
;choose_button.c,60 :: 		if(var_menu <= max_menu && var_menu > min_menu) var_menu --;
	MOVF        _var_menu+0, 0 
	SUBWF       _max_menu+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_buttonMenu22
	MOVF        _var_menu+0, 0 
	SUBWF       _min_menu+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_buttonMenu22
L__buttonMenu43:
	DECF        _var_menu+0, 1 
	GOTO        L_buttonMenu23
L_buttonMenu22:
;choose_button.c,61 :: 		else                             var_menu = min_menu;
	MOVF        _min_menu+0, 0 
	MOVWF       _var_menu+0 
L_buttonMenu23:
;choose_button.c,62 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;choose_button.c,63 :: 		}
L_buttonMenu19:
;choose_button.c,64 :: 		}
L_buttonMenu18:
;choose_button.c,66 :: 		if(!direita && flagb3)
	BTFSC       RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L_buttonMenu26
	BTFSS       _flagb3+0, BitPos(_flagb3+0) 
	GOTO        L_buttonMenu26
L__buttonMenu42:
;choose_button.c,68 :: 		if(flaginicio == 0)
	BTFSC       _flaginicio+0, BitPos(_flaginicio+0) 
	GOTO        L_buttonMenu27
;choose_button.c,70 :: 		flagb3 = 0x00;                          //Limpa flagb3
	BCF         _flagb3+0, BitPos(_flagb3+0) 
;choose_button.c,71 :: 		if(var_menu < max_menu && var_menu >= 0) var_menu ++;
	MOVF        _max_menu+0, 0 
	SUBWF       _var_menu+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_buttonMenu30
	MOVLW       0
	SUBWF       _var_menu+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_buttonMenu30
L__buttonMenu41:
	INCF        _var_menu+0, 1 
	GOTO        L_buttonMenu31
L_buttonMenu30:
;choose_button.c,72 :: 		else                             var_menu = max_menu;
	MOVF        _max_menu+0, 0 
	MOVWF       _var_menu+0 
L_buttonMenu31:
;choose_button.c,73 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;choose_button.c,74 :: 		}
L_buttonMenu27:
;choose_button.c,75 :: 		}
L_buttonMenu26:
;choose_button.c,77 :: 		if(!ok && flagb4)
	BTFSC       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L_buttonMenu34
	BTFSS       _flagb4+0, BitPos(_flagb4+0) 
	GOTO        L_buttonMenu34
L__buttonMenu40:
;choose_button.c,79 :: 		if(flaginicio == 1)
	BTFSS       _flaginicio+0, BitPos(_flaginicio+0) 
	GOTO        L_buttonMenu35
;choose_button.c,81 :: 		flagb4 = 0x00;
	BCF         _flagb4+0, BitPos(_flagb4+0) 
;choose_button.c,82 :: 		flaginicio = 0;
	BCF         _flaginicio+0, BitPos(_flaginicio+0) 
;choose_button.c,83 :: 		limpa_lcd = 1;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;choose_button.c,84 :: 		}else
	GOTO        L_buttonMenu36
L_buttonMenu35:
;choose_button.c,86 :: 		flagb4 = 0x00;                          //Limpa flagb4
	BCF         _flagb4+0, BitPos(_flagb4+0) 
;choose_button.c,87 :: 		flagConfirma = 1;
	BSF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;choose_button.c,88 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;choose_button.c,89 :: 		}
L_buttonMenu36:
;choose_button.c,90 :: 		}
L_buttonMenu34:
;choose_button.c,92 :: 		}
L_end_buttonMenu:
	RETURN      0
; end of _buttonMenu

_controle_menu:

;choose_button.c,97 :: 		char controle_menu(char var_atual)
;choose_button.c,99 :: 		if(flagVoltar == 0)
	BTFSC       _flagVoltar+0, BitPos(_flagVoltar+0) 
	GOTO        L_controle_menu37
;choose_button.c,101 :: 		vetor_menu[pos_menu] = var_atual;
	MOVLW       _vetor_menu+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_vetor_menu+0)
	MOVWF       FSR1H 
	MOVF        _pos_menu+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVF        FARG_controle_menu_var_atual+0, 0 
	MOVWF       POSTINC1+0 
;choose_button.c,102 :: 		pos_menu++;
	INCF        _pos_menu+0, 1 
;choose_button.c,103 :: 		var_atual = 1;
	MOVLW       1
	MOVWF       FARG_controle_menu_var_atual+0 
;choose_button.c,104 :: 		}else if(pos_menu > 0)
	GOTO        L_controle_menu38
L_controle_menu37:
	MOVF        _pos_menu+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_controle_menu39
;choose_button.c,106 :: 		pos_menu--;
	DECF        _pos_menu+0, 1 
;choose_button.c,107 :: 		var_atual = vetor_menu[pos_menu];
	MOVLW       _vetor_menu+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_vetor_menu+0)
	MOVWF       FSR0H 
	MOVF        _pos_menu+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_controle_menu_var_atual+0 
;choose_button.c,108 :: 		}
L_controle_menu39:
L_controle_menu38:
;choose_button.c,110 :: 		return var_atual;
	MOVF        FARG_controle_menu_var_atual+0, 0 
	MOVWF       R0 
;choose_button.c,111 :: 		}
L_end_controle_menu:
	RETURN      0
; end of _controle_menu
