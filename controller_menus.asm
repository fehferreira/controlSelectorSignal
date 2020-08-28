
_buttonMenu:

;controller_menus.c,44 :: 		void buttonMenu()                           //Funcao que recebe valor do botao
;controller_menus.c,46 :: 		if(voltar   && !flagb1) flagb1 = 0x01;    //Botao foi apertado? Seta flagb1
	BTFSS       RB4_bit+0, BitPos(RB4_bit+0) 
	GOTO        L_buttonMenu2
	BTFSC       _flagb1+0, BitPos(_flagb1+0) 
	GOTO        L_buttonMenu2
L__buttonMenu76:
	BSF         _flagb1+0, BitPos(_flagb1+0) 
L_buttonMenu2:
;controller_menus.c,47 :: 		if(esquerda && !flagb2) flagb2 = 0x01;    //Botao foi apertado? Seta flagb2
	BTFSS       RB5_bit+0, BitPos(RB5_bit+0) 
	GOTO        L_buttonMenu5
	BTFSC       _flagb2+0, BitPos(_flagb2+0) 
	GOTO        L_buttonMenu5
L__buttonMenu75:
	BSF         _flagb2+0, BitPos(_flagb2+0) 
L_buttonMenu5:
;controller_menus.c,48 :: 		if(direita  && !flagb3) flagb3 = 0x01;    //Botao foi apertado? Seta flagb3
	BTFSS       RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L_buttonMenu8
	BTFSC       _flagb3+0, BitPos(_flagb3+0) 
	GOTO        L_buttonMenu8
L__buttonMenu74:
	BSF         _flagb3+0, BitPos(_flagb3+0) 
L_buttonMenu8:
;controller_menus.c,49 :: 		if(ok       && !flagb4) flagb4 = 0x01;    //Botao foi apertado? Seta flagb4
	BTFSS       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L_buttonMenu11
	BTFSC       _flagb4+0, BitPos(_flagb4+0) 
	GOTO        L_buttonMenu11
L__buttonMenu73:
	BSF         _flagb4+0, BitPos(_flagb4+0) 
L_buttonMenu11:
;controller_menus.c,51 :: 		if(!voltar && flagb1)                     //Botao solto?
	BTFSC       RB4_bit+0, BitPos(RB4_bit+0) 
	GOTO        L_buttonMenu14
	BTFSS       _flagb1+0, BitPos(_flagb1+0) 
	GOTO        L_buttonMenu14
L__buttonMenu72:
;controller_menus.c,53 :: 		if(flaginicio == 0)
	BTFSC       _flaginicio+0, BitPos(_flaginicio+0) 
	GOTO        L_buttonMenu15
;controller_menus.c,55 :: 		flagb1 = 0x00;                          //Limpa flagb1
	BCF         _flagb1+0, BitPos(_flagb1+0) 
;controller_menus.c,56 :: 		flagVoltar = 1;
	BSF         _flagVoltar+0, BitPos(_flagVoltar+0) 
;controller_menus.c,57 :: 		flagConfirma = 1;
	BSF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;controller_menus.c,58 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;controller_menus.c,59 :: 		}
L_buttonMenu15:
;controller_menus.c,60 :: 		}
L_buttonMenu14:
;controller_menus.c,62 :: 		if(!esquerda && flagb2)
	BTFSC       RB5_bit+0, BitPos(RB5_bit+0) 
	GOTO        L_buttonMenu18
	BTFSS       _flagb2+0, BitPos(_flagb2+0) 
	GOTO        L_buttonMenu18
L__buttonMenu71:
;controller_menus.c,64 :: 		if(flaginicio == 0)
	BTFSC       _flaginicio+0, BitPos(_flaginicio+0) 
	GOTO        L_buttonMenu19
;controller_menus.c,66 :: 		flagb2 = 0x00;                          //Limpa flagb2
	BCF         _flagb2+0, BitPos(_flagb2+0) 
;controller_menus.c,67 :: 		if(var_menu <= max_menu && var_menu > min_menu) var_menu --;
	MOVF        _var_menu+0, 0 
	SUBWF       _max_menu+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_buttonMenu22
	MOVF        _var_menu+0, 0 
	SUBWF       _min_menu+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_buttonMenu22
L__buttonMenu70:
	DECF        _var_menu+0, 1 
	GOTO        L_buttonMenu23
L_buttonMenu22:
;controller_menus.c,68 :: 		else                             var_menu = min_menu;
	MOVF        _min_menu+0, 0 
	MOVWF       _var_menu+0 
L_buttonMenu23:
;controller_menus.c,69 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;controller_menus.c,70 :: 		}
L_buttonMenu19:
;controller_menus.c,71 :: 		}
L_buttonMenu18:
;controller_menus.c,73 :: 		if(!direita && flagb3)
	BTFSC       RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L_buttonMenu26
	BTFSS       _flagb3+0, BitPos(_flagb3+0) 
	GOTO        L_buttonMenu26
L__buttonMenu69:
;controller_menus.c,75 :: 		if(flaginicio == 0)
	BTFSC       _flaginicio+0, BitPos(_flaginicio+0) 
	GOTO        L_buttonMenu27
;controller_menus.c,77 :: 		flagb3 = 0x00;                          //Limpa flagb3
	BCF         _flagb3+0, BitPos(_flagb3+0) 
;controller_menus.c,78 :: 		if(var_menu < max_menu && var_menu >= 0) var_menu ++;
	MOVF        _max_menu+0, 0 
	SUBWF       _var_menu+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_buttonMenu30
	MOVLW       0
	SUBWF       _var_menu+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_buttonMenu30
L__buttonMenu68:
	INCF        _var_menu+0, 1 
	GOTO        L_buttonMenu31
L_buttonMenu30:
;controller_menus.c,79 :: 		else                             var_menu = max_menu;
	MOVF        _max_menu+0, 0 
	MOVWF       _var_menu+0 
L_buttonMenu31:
;controller_menus.c,80 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;controller_menus.c,81 :: 		}
L_buttonMenu27:
;controller_menus.c,82 :: 		}
L_buttonMenu26:
;controller_menus.c,84 :: 		if(!ok && flagb4)
	BTFSC       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L_buttonMenu34
	BTFSS       _flagb4+0, BitPos(_flagb4+0) 
	GOTO        L_buttonMenu34
L__buttonMenu67:
;controller_menus.c,86 :: 		if(flaginicio == 1)
	BTFSS       _flaginicio+0, BitPos(_flaginicio+0) 
	GOTO        L_buttonMenu35
;controller_menus.c,88 :: 		flagb4 = 0x00;
	BCF         _flagb4+0, BitPos(_flagb4+0) 
;controller_menus.c,89 :: 		flaginicio = 0;
	BCF         _flaginicio+0, BitPos(_flaginicio+0) 
;controller_menus.c,90 :: 		limpa_lcd = 1;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;controller_menus.c,91 :: 		}else
	GOTO        L_buttonMenu36
L_buttonMenu35:
;controller_menus.c,93 :: 		flagb4 = 0x00;                          //Limpa flagb4
	BCF         _flagb4+0, BitPos(_flagb4+0) 
;controller_menus.c,94 :: 		flagConfirma = 1;
	BSF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;controller_menus.c,95 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;controller_menus.c,96 :: 		}
L_buttonMenu36:
;controller_menus.c,97 :: 		}
L_buttonMenu34:
;controller_menus.c,99 :: 		}
L_end_buttonMenu:
	RETURN      0
; end of _buttonMenu

_controle_menu:

;controller_menus.c,104 :: 		char controle_menu(char var_atual)
;controller_menus.c,106 :: 		if(flagVoltar == 0)
	BTFSC       _flagVoltar+0, BitPos(_flagVoltar+0) 
	GOTO        L_controle_menu37
;controller_menus.c,108 :: 		vetor_menu[pos_menu] = var_atual;
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
;controller_menus.c,109 :: 		pos_menu++;
	INCF        _pos_menu+0, 1 
;controller_menus.c,110 :: 		var_atual = 1;
	MOVLW       1
	MOVWF       FARG_controle_menu_var_atual+0 
;controller_menus.c,111 :: 		}else if(pos_menu > 0)
	GOTO        L_controle_menu38
L_controle_menu37:
	MOVF        _pos_menu+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_controle_menu39
;controller_menus.c,113 :: 		pos_menu--;
	DECF        _pos_menu+0, 1 
;controller_menus.c,114 :: 		var_atual = vetor_menu[pos_menu];
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
;controller_menus.c,115 :: 		}
L_controle_menu39:
L_controle_menu38:
;controller_menus.c,117 :: 		return var_atual;
	MOVF        FARG_controle_menu_var_atual+0, 0 
	MOVWF       R0 
;controller_menus.c,118 :: 		}
L_end_controle_menu:
	RETURN      0
; end of _controle_menu

_desligaSinais:

;controller_menus.c,124 :: 		void desligaSinais()
;controller_menus.c,130 :: 		}
L_end_desligaSinais:
	RETURN      0
; end of _desligaSinais

_logicaMenuPrincipal:

;controller_menus.c,135 :: 		void logicaMenuPrincipal()
;controller_menus.c,138 :: 		max_menu = 2;
	MOVLW       2
	MOVWF       _max_menu+0 
;controller_menus.c,139 :: 		min_menu = 1;
	MOVLW       1
	MOVWF       _min_menu+0 
;controller_menus.c,141 :: 		while(flagConfirma != 1)
L_logicaMenuPrincipal40:
	BTFSC       _flagConfirma+0, BitPos(_flagConfirma+0) 
	GOTO        L_logicaMenuPrincipal41
;controller_menus.c,143 :: 		switch(var_menu)
	GOTO        L_logicaMenuPrincipal42
;controller_menus.c,145 :: 		case 1: menu1();break;
L_logicaMenuPrincipal44:
	CALL        _menu1+0, 0
	GOTO        L_logicaMenuPrincipal43
;controller_menus.c,146 :: 		case 2: menu2();break;
L_logicaMenuPrincipal45:
	CALL        _menu2+0, 0
	GOTO        L_logicaMenuPrincipal43
;controller_menus.c,147 :: 		}
L_logicaMenuPrincipal42:
	MOVF        _var_menu+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_logicaMenuPrincipal44
	MOVF        _var_menu+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_logicaMenuPrincipal45
L_logicaMenuPrincipal43:
;controller_menus.c,148 :: 		}
	GOTO        L_logicaMenuPrincipal40
L_logicaMenuPrincipal41:
;controller_menus.c,149 :: 		flagConfirma = 0;
	BCF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;controller_menus.c,150 :: 		var_menu = controle_menu(var_menu);
	MOVF        _var_menu+0, 0 
	MOVWF       FARG_controle_menu_var_atual+0 
	CALL        _controle_menu+0, 0
	MOVF        R0, 0 
	MOVWF       _var_menu+0 
;controller_menus.c,151 :: 		if(flagVoltar != 1)
	BTFSC       _flagVoltar+0, BitPos(_flagVoltar+0) 
	GOTO        L_logicaMenuPrincipal46
;controller_menus.c,153 :: 		switch(vetor_menu[pos_menu-1])
	DECF        _pos_menu+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       _vetor_menu+0
	ADDWF       R0, 0 
	MOVWF       FLOC__logicaMenuPrincipal+0 
	MOVLW       hi_addr(_vetor_menu+0)
	ADDWFC      R1, 0 
	MOVWF       FLOC__logicaMenuPrincipal+1 
	GOTO        L_logicaMenuPrincipal47
;controller_menus.c,155 :: 		case 1: logicaMenu1();break;
L_logicaMenuPrincipal49:
	CALL        _logicaMenu1+0, 0
	GOTO        L_logicaMenuPrincipal48
;controller_menus.c,156 :: 		case 2: logicaMenu2();break;
L_logicaMenuPrincipal50:
	CALL        _logicaMenu2+0, 0
	GOTO        L_logicaMenuPrincipal48
;controller_menus.c,157 :: 		}
L_logicaMenuPrincipal47:
	MOVFF       FLOC__logicaMenuPrincipal+0, FSR0
	MOVFF       FLOC__logicaMenuPrincipal+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_logicaMenuPrincipal49
	MOVFF       FLOC__logicaMenuPrincipal+0, FSR0
	MOVFF       FLOC__logicaMenuPrincipal+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_logicaMenuPrincipal50
L_logicaMenuPrincipal48:
;controller_menus.c,158 :: 		}
L_logicaMenuPrincipal46:
;controller_menus.c,159 :: 		flagVoltar = 0x00;
	BCF         _flagVoltar+0, BitPos(_flagVoltar+0) 
;controller_menus.c,160 :: 		}
L_end_logicaMenuPrincipal:
	RETURN      0
; end of _logicaMenuPrincipal

_logicaMenu1:

;controller_menus.c,164 :: 		void logicaMenu1()
;controller_menus.c,167 :: 		max_menu = 2;
	MOVLW       2
	MOVWF       _max_menu+0 
;controller_menus.c,168 :: 		min_menu = 1;
	MOVLW       1
	MOVWF       _min_menu+0 
;controller_menus.c,171 :: 		seletorSignal(fonica);
	CLRF        FARG_seletorSignal_signalSeletor+0 
	CALL        _seletorSignal+0, 0
;controller_menus.c,176 :: 		while(flagVoltar != 1)
L_logicaMenu151:
	BTFSC       _flagVoltar+0, BitPos(_flagVoltar+0) 
	GOTO        L_logicaMenu152
;controller_menus.c,178 :: 		while(flagConfirma != 1)
L_logicaMenu153:
	BTFSC       _flagConfirma+0, BitPos(_flagConfirma+0) 
	GOTO        L_logicaMenu154
;controller_menus.c,183 :: 		}
L_logicaMenu155:
;controller_menus.c,184 :: 		}
	GOTO        L_logicaMenu153
L_logicaMenu154:
;controller_menus.c,185 :: 		flagConfirma = 0;
	BCF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;controller_menus.c,186 :: 		var_menu = controle_menu(var_menu);
	MOVF        _var_menu+0, 0 
	MOVWF       FARG_controle_menu_var_atual+0 
	CALL        _controle_menu+0, 0
	MOVF        R0, 0 
	MOVWF       _var_menu+0 
;controller_menus.c,187 :: 		if(flagVoltar != 1)
	BTFSC       _flagVoltar+0, BitPos(_flagVoltar+0) 
	GOTO        L_logicaMenu157
;controller_menus.c,192 :: 		}
L_logicaMenu158:
;controller_menus.c,193 :: 		}
L_logicaMenu157:
;controller_menus.c,194 :: 		}
	GOTO        L_logicaMenu151
L_logicaMenu152:
;controller_menus.c,195 :: 		flagVoltar = 0;
	BCF         _flagVoltar+0, BitPos(_flagVoltar+0) 
;controller_menus.c,196 :: 		}
L_end_logicaMenu1:
	RETURN      0
; end of _logicaMenu1

_logicaMenu2:

;controller_menus.c,200 :: 		void logicaMenu2()
;controller_menus.c,203 :: 		max_menu = 1;
	MOVLW       1
	MOVWF       _max_menu+0 
;controller_menus.c,204 :: 		min_menu = 1;
	MOVLW       1
	MOVWF       _min_menu+0 
;controller_menus.c,207 :: 		seletorSignal(hall);
	MOVLW       1
	MOVWF       FARG_seletorSignal_signalSeletor+0 
	CALL        _seletorSignal+0, 0
;controller_menus.c,212 :: 		while(flagVoltar != 1)
L_logicaMenu260:
	BTFSC       _flagVoltar+0, BitPos(_flagVoltar+0) 
	GOTO        L_logicaMenu261
;controller_menus.c,214 :: 		while(flagConfirma != 1)
L_logicaMenu262:
	BTFSC       _flagConfirma+0, BitPos(_flagConfirma+0) 
	GOTO        L_logicaMenu263
;controller_menus.c,220 :: 		}
L_logicaMenu264:
;controller_menus.c,221 :: 		}
	GOTO        L_logicaMenu262
L_logicaMenu263:
;controller_menus.c,222 :: 		flagConfirma = 0;
	BCF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;controller_menus.c,223 :: 		var_menu = controle_menu(var_menu);
	MOVF        _var_menu+0, 0 
	MOVWF       FARG_controle_menu_var_atual+0 
	CALL        _controle_menu+0, 0
	MOVF        R0, 0 
	MOVWF       _var_menu+0 
;controller_menus.c,224 :: 		if(flagVoltar != 1)
	BTFSC       _flagVoltar+0, BitPos(_flagVoltar+0) 
	GOTO        L_logicaMenu266
;controller_menus.c,229 :: 		}
L_logicaMenu266:
;controller_menus.c,230 :: 		}
	GOTO        L_logicaMenu260
L_logicaMenu261:
;controller_menus.c,231 :: 		flagVoltar = 0;
	BCF         _flagVoltar+0, BitPos(_flagVoltar+0) 
;controller_menus.c,232 :: 		}
L_end_logicaMenu2:
	RETURN      0
; end of _logicaMenu2
