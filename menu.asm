
_controle_menu:

;menu.c,33 :: 		char controle_menu(char var_atual)
;menu.c,35 :: 		if(flagVoltar == 0)
	BTFSC       _flagVoltar+0, BitPos(_flagVoltar+0) 
	GOTO        L_controle_menu0
;menu.c,37 :: 		vetor_menu[pos_menu] = var_atual;
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
;menu.c,38 :: 		pos_menu++;
	INCF        _pos_menu+0, 1 
;menu.c,39 :: 		var_atual = 0;
	CLRF        FARG_controle_menu_var_atual+0 
;menu.c,40 :: 		}else if(pos_menu > 0)
	GOTO        L_controle_menu1
L_controle_menu0:
	MOVF        _pos_menu+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_controle_menu2
;menu.c,42 :: 		pos_menu--;
	DECF        _pos_menu+0, 1 
;menu.c,43 :: 		var_atual = vetor_menu[pos_menu];
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
;menu.c,44 :: 		}
L_controle_menu2:
L_controle_menu1:
;menu.c,46 :: 		return var_atual;
	MOVF        FARG_controle_menu_var_atual+0, 0 
	MOVWF       R0 
;menu.c,47 :: 		}
L_end_controle_menu:
	RETURN      0
; end of _controle_menu

_logicaMenuPrincipal:

;menu.c,52 :: 		void logicaMenuPrincipal()
;menu.c,54 :: 		while(flagVoltar != 1)
L_logicaMenuPrincipal3:
	BTFSC       _flagVoltar+0, BitPos(_flagVoltar+0) 
	GOTO        L_logicaMenuPrincipal4
;menu.c,56 :: 		while(flagConfirma != 1)
L_logicaMenuPrincipal5:
	BTFSC       _flagConfirma+0, BitPos(_flagConfirma+0) 
	GOTO        L_logicaMenuPrincipal6
;menu.c,58 :: 		menuPrincipal(var_menu);
	MOVF        _var_menu+0, 0 
	MOVWF       FARG_menuPrincipal_var_menu+0 
	CALL        _menuPrincipal+0, 0
;menu.c,59 :: 		}
	GOTO        L_logicaMenuPrincipal5
L_logicaMenuPrincipal6:
;menu.c,61 :: 		flagConfirma = 0;
	BCF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;menu.c,62 :: 		var_menu = controle_menu(var_menu);
	MOVF        _var_menu+0, 0 
	MOVWF       FARG_controle_menu_var_atual+0 
	CALL        _controle_menu+0, 0
	MOVF        R0, 0 
	MOVWF       _var_menu+0 
;menu.c,64 :: 		switch(vetor_menu[pos_menu-1])
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
;menu.c,66 :: 		case 0: logicaFonica();break;
L_logicaMenuPrincipal9:
	CALL        _logicaFonica+0, 0
	GOTO        L_logicaMenuPrincipal8
;menu.c,67 :: 		case 1: logicaHall();  break;
L_logicaMenuPrincipal10:
	CALL        _logicaHall+0, 0
	GOTO        L_logicaMenuPrincipal8
;menu.c,68 :: 		}
L_logicaMenuPrincipal7:
	MOVFF       FLOC__logicaMenuPrincipal+0, FSR0
	MOVFF       FLOC__logicaMenuPrincipal+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_logicaMenuPrincipal9
	MOVFF       FLOC__logicaMenuPrincipal+0, FSR0
	MOVFF       FLOC__logicaMenuPrincipal+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_logicaMenuPrincipal10
L_logicaMenuPrincipal8:
;menu.c,69 :: 		}
	GOTO        L_logicaMenuPrincipal3
L_logicaMenuPrincipal4:
;menu.c,71 :: 		flagVoltar = 0;
	BCF         _flagVoltar+0, BitPos(_flagVoltar+0) 
;menu.c,72 :: 		}
L_end_logicaMenuPrincipal:
	RETURN      0
; end of _logicaMenuPrincipal

_logicaFonica:

;menu.c,76 :: 		void logicaFonica()
;menu.c,78 :: 		while(flagVoltar != 1)
L_logicaFonica11:
	BTFSC       _flagVoltar+0, BitPos(_flagVoltar+0) 
	GOTO        L_logicaFonica12
;menu.c,81 :: 		var_menu = 60;
	MOVLW       60
	MOVWF       _var_menu+0 
;menu.c,82 :: 		while(flagConfirma != 1)
L_logicaFonica13:
	BTFSC       _flagConfirma+0, BitPos(_flagConfirma+0) 
	GOTO        L_logicaFonica14
;menu.c,84 :: 		escolhaDentes(var_menu);
	MOVF        _var_menu+0, 0 
	MOVWF       FARG_escolhaDentes_var_menu+0 
	CALL        _escolhaDentes+0, 0
;menu.c,85 :: 		}
	GOTO        L_logicaFonica13
L_logicaFonica14:
;menu.c,86 :: 		flagConfirma = 0;
	BCF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;menu.c,87 :: 		dentes = var_menu;
	MOVF        _var_menu+0, 0 
	MOVWF       _dentes+0 
;menu.c,88 :: 		var_menu = 0;
	CLRF        _var_menu+0 
;menu.c,90 :: 		while(flagConfirma != 1)
L_logicaFonica15:
	BTFSC       _flagConfirma+0, BitPos(_flagConfirma+0) 
	GOTO        L_logicaFonica16
;menu.c,92 :: 		escolhaEspacos(var_menu);
	MOVF        _var_menu+0, 0 
	MOVWF       FARG_escolhaEspacos_var_menu+0 
	CALL        _escolhaEspacos+0, 0
;menu.c,93 :: 		}
	GOTO        L_logicaFonica15
L_logicaFonica16:
;menu.c,94 :: 		flagConfirma = 0;
	BCF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;menu.c,95 :: 		espacos = var_menu;
	MOVF        _var_menu+0, 0 
	MOVWF       _espacos+0 
;menu.c,96 :: 		var_menu = 0;
	CLRF        _var_menu+0 
;menu.c,98 :: 		flagRotacao = 1;
	BSF         _flagRotacao+0, BitPos(_flagRotacao+0) 
;menu.c,99 :: 		ligarTMR1();
	CALL        _ligarTMR1+0, 0
;menu.c,101 :: 		while(flagConfirma != 1)
L_logicaFonica17:
	BTFSC       _flagConfirma+0, BitPos(_flagConfirma+0) 
	GOTO        L_logicaFonica18
;menu.c,103 :: 		sinalFonica();
	CALL        _sinalFonica+0, 0
;menu.c,104 :: 		}
	GOTO        L_logicaFonica17
L_logicaFonica18:
;menu.c,106 :: 		flagRotacao = 0;
	BCF         _flagRotacao+0, BitPos(_flagRotacao+0) 
;menu.c,107 :: 		flagConfirma = 0;
	BCF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;menu.c,108 :: 		desligaTMR1();
	CALL        _desligaTMR1+0, 0
;menu.c,109 :: 		}
	GOTO        L_logicaFonica11
L_logicaFonica12:
;menu.c,110 :: 		flagVoltar = 0;
	BCF         _flagVoltar+0, BitPos(_flagVoltar+0) 
;menu.c,111 :: 		}
L_end_logicaFonica:
	RETURN      0
; end of _logicaFonica

_logicaHall:

;menu.c,115 :: 		void logicaHall()
;menu.c,117 :: 		while(flagVoltar != 1)
L_logicaHall19:
	BTFSC       _flagVoltar+0, BitPos(_flagVoltar+0) 
	GOTO        L_logicaHall20
;menu.c,119 :: 		ligarTMR1();
	CALL        _ligarTMR1+0, 0
;menu.c,120 :: 		flagHall = 1;
	BSF         _flagHall+0, BitPos(_flagHall+0) 
;menu.c,122 :: 		while(flagConfirma != 1)
L_logicaHall21:
	BTFSC       _flagConfirma+0, BitPos(_flagConfirma+0) 
	GOTO        L_logicaHall22
;menu.c,124 :: 		sinalHall();
	CALL        _sinalHall+0, 0
;menu.c,125 :: 		}
	GOTO        L_logicaHall21
L_logicaHall22:
;menu.c,127 :: 		flagHall = 0;
	BCF         _flagHall+0, BitPos(_flagHall+0) 
;menu.c,128 :: 		flagConfirma = 0;
	BCF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;menu.c,129 :: 		desligaTMR1();
	CALL        _desligaTMR1+0, 0
;menu.c,130 :: 		}
	GOTO        L_logicaHall19
L_logicaHall20:
;menu.c,131 :: 		flagVoltar = 0;
	BCF         _flagVoltar+0, BitPos(_flagVoltar+0) 
;menu.c,132 :: 		}
L_end_logicaHall:
	RETURN      0
; end of _logicaHall
