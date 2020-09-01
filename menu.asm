
_controle_menu:

;menu.c,27 :: 		char controle_menu(char var_atual)
;menu.c,29 :: 		if(flagVoltar == 0)
	BTFSC       _flagVoltar+0, BitPos(_flagVoltar+0) 
	GOTO        L_controle_menu0
;menu.c,31 :: 		vetor_menu[pos_menu] = var_atual;
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
;menu.c,32 :: 		pos_menu++;
	INCF        _pos_menu+0, 1 
;menu.c,33 :: 		var_atual = 0;
	CLRF        FARG_controle_menu_var_atual+0 
;menu.c,34 :: 		}else if(pos_menu > 0)
	GOTO        L_controle_menu1
L_controle_menu0:
	MOVF        _pos_menu+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_controle_menu2
;menu.c,36 :: 		pos_menu--;
	DECF        _pos_menu+0, 1 
;menu.c,37 :: 		var_atual = vetor_menu[pos_menu];
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
;menu.c,38 :: 		}
L_controle_menu2:
L_controle_menu1:
;menu.c,40 :: 		return var_atual;
	MOVF        FARG_controle_menu_var_atual+0, 0 
	MOVWF       R0 
;menu.c,41 :: 		}
L_end_controle_menu:
	RETURN      0
; end of _controle_menu

_logicaMenuPrincipal:

;menu.c,46 :: 		void logicaMenuPrincipal()
;menu.c,48 :: 		while(flagVoltar != 1)
L_logicaMenuPrincipal3:
	BTFSC       _flagVoltar+0, BitPos(_flagVoltar+0) 
	GOTO        L_logicaMenuPrincipal4
;menu.c,50 :: 		while(flagConfirma != 1)
L_logicaMenuPrincipal5:
	BTFSC       _flagConfirma+0, BitPos(_flagConfirma+0) 
	GOTO        L_logicaMenuPrincipal6
;menu.c,52 :: 		menuPrincipal(var_menu);
	MOVF        _var_menu+0, 0 
	MOVWF       FARG_menuPrincipal_var_menu+0 
	CALL        _menuPrincipal+0, 0
;menu.c,53 :: 		}
	GOTO        L_logicaMenuPrincipal5
L_logicaMenuPrincipal6:
;menu.c,55 :: 		flagConfirma = 0;
	BCF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;menu.c,56 :: 		var_menu = controle_menu(var_menu);
	MOVF        _var_menu+0, 0 
	MOVWF       FARG_controle_menu_var_atual+0 
	CALL        _controle_menu+0, 0
	MOVF        R0, 0 
	MOVWF       _var_menu+0 
;menu.c,58 :: 		switch(vetor_menu[pos_menu-1])
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
	GOTO        L_logicaMenuPrincipal7
;menu.c,60 :: 		case 0: logicaFonica();break;
L_logicaMenuPrincipal9:
	CALL        _logicaFonica+0, 0
	GOTO        L_logicaMenuPrincipal8
;menu.c,61 :: 		}
L_logicaMenuPrincipal7:
	MOVFF       FLOC__logicaMenuPrincipal+0, FSR0
	MOVFF       FLOC__logicaMenuPrincipal+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_logicaMenuPrincipal9
L_logicaMenuPrincipal8:
;menu.c,62 :: 		}
	GOTO        L_logicaMenuPrincipal3
L_logicaMenuPrincipal4:
;menu.c,64 :: 		flagVoltar = 0;
	BCF         _flagVoltar+0, BitPos(_flagVoltar+0) 
;menu.c,65 :: 		}
L_end_logicaMenuPrincipal:
	RETURN      0
; end of _logicaMenuPrincipal

_logicaFonica:

;menu.c,69 :: 		void logicaFonica()
;menu.c,73 :: 		while(flagVoltar != 1)
L_logicaFonica10:
	BTFSC       _flagVoltar+0, BitPos(_flagVoltar+0) 
	GOTO        L_logicaFonica11
;menu.c,75 :: 		var_menu = 60;
	MOVLW       60
	MOVWF       _var_menu+0 
;menu.c,77 :: 		while(flagConfirma != 1)
L_logicaFonica12:
	BTFSC       _flagConfirma+0, BitPos(_flagConfirma+0) 
	GOTO        L_logicaFonica13
;menu.c,79 :: 		escolhaDentes(var_menu);
	MOVF        _var_menu+0, 0 
	MOVWF       FARG_escolhaDentes_var_menu+0 
	CALL        _escolhaDentes+0, 0
;menu.c,80 :: 		}
	GOTO        L_logicaFonica12
L_logicaFonica13:
;menu.c,81 :: 		flagConfirma = 0;
	BCF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;menu.c,82 :: 		dentes = var_menu;
	MOVF        _var_menu+0, 0 
	MOVWF       logicaFonica_dentes_L0+0 
;menu.c,83 :: 		var_menu = 0;
	CLRF        _var_menu+0 
;menu.c,85 :: 		while(flagConfirma != 1)
L_logicaFonica14:
	BTFSC       _flagConfirma+0, BitPos(_flagConfirma+0) 
	GOTO        L_logicaFonica15
;menu.c,87 :: 		escolhaEspacos(var_menu);
	MOVF        _var_menu+0, 0 
	MOVWF       FARG_escolhaEspacos_var_menu+0 
	CALL        _escolhaEspacos+0, 0
;menu.c,88 :: 		}
	GOTO        L_logicaFonica14
L_logicaFonica15:
;menu.c,89 :: 		flagConfirma = 0;
	BCF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;menu.c,90 :: 		espacos = var_menu;
	MOVF        _var_menu+0, 0 
	MOVWF       logicaFonica_espacos_L0+0 
;menu.c,91 :: 		var_menu = 0;
	CLRF        _var_menu+0 
;menu.c,93 :: 		while(flagConfirma != 1)
L_logicaFonica16:
	BTFSC       _flagConfirma+0, BitPos(_flagConfirma+0) 
	GOTO        L_logicaFonica17
;menu.c,95 :: 		sinalFonica(dentes,espacos);
	MOVF        logicaFonica_dentes_L0+0, 0 
	MOVWF       FARG_sinalFonica_dentes+0 
	MOVF        logicaFonica_espacos_L0+0, 0 
	MOVWF       FARG_sinalFonica_espacos+0 
	CALL        _sinalFonica+0, 0
;menu.c,96 :: 		}
	GOTO        L_logicaFonica16
L_logicaFonica17:
;menu.c,97 :: 		flagConfirma = 0;
	BCF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;menu.c,98 :: 		var_menu = controle_menu(var_menu);
	MOVF        _var_menu+0, 0 
	MOVWF       FARG_controle_menu_var_atual+0 
	CALL        _controle_menu+0, 0
	MOVF        R0, 0 
	MOVWF       _var_menu+0 
;menu.c,100 :: 		if(flagVoltar != 1)
	BTFSC       _flagVoltar+0, BitPos(_flagVoltar+0) 
	GOTO        L_logicaFonica18
;menu.c,106 :: 		}
L_logicaFonica18:
;menu.c,107 :: 		}
	GOTO        L_logicaFonica10
L_logicaFonica11:
;menu.c,108 :: 		flagVoltar = 0;
	BCF         _flagVoltar+0, BitPos(_flagVoltar+0) 
;menu.c,109 :: 		}
L_end_logicaFonica:
	RETURN      0
; end of _logicaFonica
