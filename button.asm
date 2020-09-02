
_buttonMenu:

;button.c,24 :: 		void buttonMenu()                           //Funcao que recebe valor do botao
;button.c,26 :: 		if(voltar   && !flagb1) flagb1 = 0x01;    //Botão foi apertado? Seta flagb1
	BTFSS       voltar+0, BitPos(voltar+0) 
	GOTO        L_buttonMenu2
	BTFSC       _flagb1+0, BitPos(_flagb1+0) 
	GOTO        L_buttonMenu2
L__buttonMenu73:
	BSF         _flagb1+0, BitPos(_flagb1+0) 
L_buttonMenu2:
;button.c,27 :: 		if(esquerda && !flagb2) flagb2 = 0x01;    //Botao foi apertado? Seta flagb2
	BTFSS       esquerda+0, BitPos(esquerda+0) 
	GOTO        L_buttonMenu5
	BTFSC       _flagb2+0, BitPos(_flagb2+0) 
	GOTO        L_buttonMenu5
L__buttonMenu72:
	BSF         _flagb2+0, BitPos(_flagb2+0) 
L_buttonMenu5:
;button.c,28 :: 		if(direita  && !flagb3) flagb3 = 0x01;    //Botao foi apertado? Seta flagb3
	BTFSS       direita+0, BitPos(direita+0) 
	GOTO        L_buttonMenu8
	BTFSC       _flagb3+0, BitPos(_flagb3+0) 
	GOTO        L_buttonMenu8
L__buttonMenu71:
	BSF         _flagb3+0, BitPos(_flagb3+0) 
L_buttonMenu8:
;button.c,29 :: 		if(ok       && !flagb4) flagb4 = 0x01;    //Botao foi apertado? Seta flagb4
	BTFSS       ok+0, BitPos(ok+0) 
	GOTO        L_buttonMenu11
	BTFSC       _flagb4+0, BitPos(_flagb4+0) 
	GOTO        L_buttonMenu11
L__buttonMenu70:
	BSF         _flagb4+0, BitPos(_flagb4+0) 
L_buttonMenu11:
;button.c,31 :: 		if(!voltar && flagb1)                     //Botao solto?
	BTFSC       voltar+0, BitPos(voltar+0) 
	GOTO        L_buttonMenu14
	BTFSS       _flagb1+0, BitPos(_flagb1+0) 
	GOTO        L_buttonMenu14
L__buttonMenu69:
;button.c,33 :: 		flagb1 = 0x00;                          //Limpa flagb1
	BCF         _flagb1+0, BitPos(_flagb1+0) 
;button.c,34 :: 		flagVoltar = 1;
	BSF         _flagVoltar+0, BitPos(_flagVoltar+0) 
;button.c,35 :: 		flagConfirma = 1;
	BSF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;button.c,36 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,37 :: 		}
L_buttonMenu14:
;button.c,39 :: 		if(!esquerda && flagb2)
	BTFSC       esquerda+0, BitPos(esquerda+0) 
	GOTO        L_buttonMenu17
	BTFSS       _flagb2+0, BitPos(_flagb2+0) 
	GOTO        L_buttonMenu17
L__buttonMenu68:
;button.c,41 :: 		flagb2 = 0x00;                          //Limpa flagb2
	BCF         _flagb2+0, BitPos(_flagb2+0) 
;button.c,42 :: 		if(var_menu <= max_menu && var_menu > min_menu) var_menu --;
	MOVLW       0
	SUBWF       _max_menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__buttonMenu85
	MOVF        _var_menu+0, 0 
	SUBWF       _max_menu+0, 0 
L__buttonMenu85:
	BTFSS       STATUS+0, 0 
	GOTO        L_buttonMenu20
	MOVLW       0
	SUBWF       _min_menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__buttonMenu86
	MOVF        _var_menu+0, 0 
	SUBWF       _min_menu+0, 0 
L__buttonMenu86:
	BTFSC       STATUS+0, 0 
	GOTO        L_buttonMenu20
L__buttonMenu67:
	DECF        _var_menu+0, 1 
	GOTO        L_buttonMenu21
L_buttonMenu20:
;button.c,43 :: 		else                             var_menu = min_menu;
	MOVF        _min_menu+0, 0 
	MOVWF       _var_menu+0 
L_buttonMenu21:
;button.c,44 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,45 :: 		}
L_buttonMenu17:
;button.c,47 :: 		if(!direita && flagb3)
	BTFSC       direita+0, BitPos(direita+0) 
	GOTO        L_buttonMenu24
	BTFSS       _flagb3+0, BitPos(_flagb3+0) 
	GOTO        L_buttonMenu24
L__buttonMenu66:
;button.c,49 :: 		flagb3 = 0x00;                          //Limpa flagb3
	BCF         _flagb3+0, BitPos(_flagb3+0) 
;button.c,50 :: 		if(var_menu < max_menu && var_menu >= 0) var_menu ++;
	MOVLW       0
	MOVWF       R0 
	MOVF        _max_menu+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__buttonMenu87
	MOVF        _max_menu+0, 0 
	SUBWF       _var_menu+0, 0 
L__buttonMenu87:
	BTFSC       STATUS+0, 0 
	GOTO        L_buttonMenu27
	MOVLW       0
	SUBWF       _var_menu+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_buttonMenu27
L__buttonMenu65:
	INCF        _var_menu+0, 1 
	GOTO        L_buttonMenu28
L_buttonMenu27:
;button.c,51 :: 		else                             var_menu = max_menu;
	MOVF        _max_menu+0, 0 
	MOVWF       _var_menu+0 
L_buttonMenu28:
;button.c,52 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,53 :: 		}
L_buttonMenu24:
;button.c,55 :: 		if(!ok && flagb4)
	BTFSC       ok+0, BitPos(ok+0) 
	GOTO        L_buttonMenu31
	BTFSS       _flagb4+0, BitPos(_flagb4+0) 
	GOTO        L_buttonMenu31
L__buttonMenu64:
;button.c,57 :: 		flagb4 = 0x00;                          //Limpa flagb4
	BCF         _flagb4+0, BitPos(_flagb4+0) 
;button.c,58 :: 		flagConfirma = 1;
	BSF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;button.c,59 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,60 :: 		}
L_buttonMenu31:
;button.c,62 :: 		}
L_end_buttonMenu:
	RETURN      0
; end of _buttonMenu

_buttonRotacao:

;button.c,66 :: 		void buttonRotacao()
;button.c,68 :: 		if(voltar   && !flagb1) flagb1 = 0x01;    //Botão foi apertado? Seta flagb1
	BTFSS       voltar+0, BitPos(voltar+0) 
	GOTO        L_buttonRotacao34
	BTFSC       _flagb1+0, BitPos(_flagb1+0) 
	GOTO        L_buttonRotacao34
L__buttonRotacao83:
	BSF         _flagb1+0, BitPos(_flagb1+0) 
L_buttonRotacao34:
;button.c,69 :: 		if(esquerda && !flagb2) flagb2 = 0x01;    //Botao foi apertado? Seta flagb2
	BTFSS       esquerda+0, BitPos(esquerda+0) 
	GOTO        L_buttonRotacao37
	BTFSC       _flagb2+0, BitPos(_flagb2+0) 
	GOTO        L_buttonRotacao37
L__buttonRotacao82:
	BSF         _flagb2+0, BitPos(_flagb2+0) 
L_buttonRotacao37:
;button.c,70 :: 		if(direita  && !flagb3) flagb3 = 0x01;    //Botao foi apertado? Seta flagb3
	BTFSS       direita+0, BitPos(direita+0) 
	GOTO        L_buttonRotacao40
	BTFSC       _flagb3+0, BitPos(_flagb3+0) 
	GOTO        L_buttonRotacao40
L__buttonRotacao81:
	BSF         _flagb3+0, BitPos(_flagb3+0) 
L_buttonRotacao40:
;button.c,71 :: 		if(ok       && !flagb4) flagb4 = 0x01;    //Botao foi apertado? Seta flagb4
	BTFSS       ok+0, BitPos(ok+0) 
	GOTO        L_buttonRotacao43
	BTFSC       _flagb4+0, BitPos(_flagb4+0) 
	GOTO        L_buttonRotacao43
L__buttonRotacao80:
	BSF         _flagb4+0, BitPos(_flagb4+0) 
L_buttonRotacao43:
;button.c,73 :: 		if(!voltar && flagb1)                     //Botao solto?
	BTFSC       voltar+0, BitPos(voltar+0) 
	GOTO        L_buttonRotacao46
	BTFSS       _flagb1+0, BitPos(_flagb1+0) 
	GOTO        L_buttonRotacao46
L__buttonRotacao79:
;button.c,75 :: 		flagb1 = 0x00;                          //Limpa flagb1
	BCF         _flagb1+0, BitPos(_flagb1+0) 
;button.c,76 :: 		flagVoltar = 1;
	BSF         _flagVoltar+0, BitPos(_flagVoltar+0) 
;button.c,77 :: 		flagConfirma = 1;
	BSF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;button.c,78 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,79 :: 		}
L_buttonRotacao46:
;button.c,81 :: 		if(!esquerda && flagb2)
	BTFSC       esquerda+0, BitPos(esquerda+0) 
	GOTO        L_buttonRotacao49
	BTFSS       _flagb2+0, BitPos(_flagb2+0) 
	GOTO        L_buttonRotacao49
L__buttonRotacao78:
;button.c,83 :: 		flagb2 = 0x00;                          //Limpa flagb2
	BCF         _flagb2+0, BitPos(_flagb2+0) 
;button.c,84 :: 		if(contT == 60055 || contT <= 60110)  contT = 60055;
	MOVF        _contT+1, 0 
	XORLW       234
	BTFSS       STATUS+0, 2 
	GOTO        L__buttonRotacao89
	MOVLW       151
	XORWF       _contT+0, 0 
L__buttonRotacao89:
	BTFSC       STATUS+0, 2 
	GOTO        L__buttonRotacao77
	MOVF        _contT+1, 0 
	SUBLW       234
	BTFSS       STATUS+0, 2 
	GOTO        L__buttonRotacao90
	MOVF        _contT+0, 0 
	SUBLW       206
L__buttonRotacao90:
	BTFSC       STATUS+0, 0 
	GOTO        L__buttonRotacao77
	GOTO        L_buttonRotacao52
L__buttonRotacao77:
	MOVLW       151
	MOVWF       _contT+0 
	MOVLW       234
	MOVWF       _contT+1 
	GOTO        L_buttonRotacao53
L_buttonRotacao52:
;button.c,85 :: 		else            contT -= 55;
	MOVLW       55
	SUBWF       _contT+0, 1 
	MOVLW       0
	SUBWFB      _contT+1, 1 
L_buttonRotacao53:
;button.c,86 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,87 :: 		}
L_buttonRotacao49:
;button.c,89 :: 		if(!direita && flagb3)
	BTFSC       direita+0, BitPos(direita+0) 
	GOTO        L_buttonRotacao56
	BTFSS       _flagb3+0, BitPos(_flagb3+0) 
	GOTO        L_buttonRotacao56
L__buttonRotacao76:
;button.c,91 :: 		flagb3 = 0x00;                          //Limpa flagb3
	BCF         _flagb3+0, BitPos(_flagb3+0) 
;button.c,92 :: 		if(contT == 65535 || contT >= 65480)  contT = 65535;
	MOVF        _contT+1, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L__buttonRotacao91
	MOVLW       255
	XORWF       _contT+0, 0 
L__buttonRotacao91:
	BTFSC       STATUS+0, 2 
	GOTO        L__buttonRotacao75
	MOVLW       255
	SUBWF       _contT+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__buttonRotacao92
	MOVLW       200
	SUBWF       _contT+0, 0 
L__buttonRotacao92:
	BTFSC       STATUS+0, 0 
	GOTO        L__buttonRotacao75
	GOTO        L_buttonRotacao59
L__buttonRotacao75:
	MOVLW       255
	MOVWF       _contT+0 
	MOVLW       255
	MOVWF       _contT+1 
	GOTO        L_buttonRotacao60
L_buttonRotacao59:
;button.c,93 :: 		else              contT += 55;
	MOVLW       55
	ADDWF       _contT+0, 1 
	MOVLW       0
	ADDWFC      _contT+1, 1 
L_buttonRotacao60:
;button.c,94 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,95 :: 		}
L_buttonRotacao56:
;button.c,97 :: 		if(!ok && flagb4)
	BTFSC       ok+0, BitPos(ok+0) 
	GOTO        L_buttonRotacao63
	BTFSS       _flagb4+0, BitPos(_flagb4+0) 
	GOTO        L_buttonRotacao63
L__buttonRotacao74:
;button.c,99 :: 		flagb4 = 0x00;                          //Limpa flagb4
	BCF         _flagb4+0, BitPos(_flagb4+0) 
;button.c,100 :: 		flagConfirma = 1;
	BSF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;button.c,101 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;button.c,102 :: 		}
L_buttonRotacao63:
;button.c,103 :: 		}
L_end_buttonRotacao:
	RETURN      0
; end of _buttonRotacao
