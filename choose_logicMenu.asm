
_desligaSinais:

;choose_logicMenu.c,23 :: 		void desligaSinais()
;choose_logicMenu.c,29 :: 		}
L_end_desligaSinais:
	RETURN      0
; end of _desligaSinais

_logicaMenuPrincipal:

;choose_logicMenu.c,34 :: 		void logicaMenuPrincipal()
;choose_logicMenu.c,37 :: 		max_menu = 2;
	MOVLW       2
	MOVWF       _max_menu+0 
;choose_logicMenu.c,38 :: 		min_menu = 1;
	MOVLW       1
	MOVWF       _min_menu+0 
;choose_logicMenu.c,40 :: 		while(flagConfirma != 1)
L_logicaMenuPrincipal0:
	BTFSC       _flagConfirma+0, BitPos(_flagConfirma+0) 
	GOTO        L_logicaMenuPrincipal1
;choose_logicMenu.c,42 :: 		switch(var_menu)
	GOTO        L_logicaMenuPrincipal2
;choose_logicMenu.c,44 :: 		case 1: menu1();break;
L_logicaMenuPrincipal4:
	CALL        _menu1+0, 0
	GOTO        L_logicaMenuPrincipal3
;choose_logicMenu.c,45 :: 		case 2: menu2();break;
L_logicaMenuPrincipal5:
	CALL        _menu2+0, 0
	GOTO        L_logicaMenuPrincipal3
;choose_logicMenu.c,46 :: 		}
L_logicaMenuPrincipal2:
	MOVF        _var_menu+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_logicaMenuPrincipal4
	MOVF        _var_menu+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_logicaMenuPrincipal5
L_logicaMenuPrincipal3:
;choose_logicMenu.c,47 :: 		}
	GOTO        L_logicaMenuPrincipal0
L_logicaMenuPrincipal1:
;choose_logicMenu.c,48 :: 		flagConfirma = 0;
	BCF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;choose_logicMenu.c,49 :: 		var_menu = controle_menu(var_menu);
	MOVF        _var_menu+0, 0 
	MOVWF       FARG_controle_menu_var_atual+0 
	CALL        _controle_menu+0, 0
	MOVF        R0, 0 
	MOVWF       _var_menu+0 
;choose_logicMenu.c,50 :: 		if(flagVoltar != 1)
	BTFSC       _flagVoltar+0, BitPos(_flagVoltar+0) 
	GOTO        L_logicaMenuPrincipal6
;choose_logicMenu.c,52 :: 		switch(vetor_menu[pos_menu-1])
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
;choose_logicMenu.c,54 :: 		case 1: logicaMenu1();break;
L_logicaMenuPrincipal9:
	CALL        _logicaMenu1+0, 0
	GOTO        L_logicaMenuPrincipal8
;choose_logicMenu.c,55 :: 		case 2: logicaMenu2();break;
L_logicaMenuPrincipal10:
	CALL        _logicaMenu2+0, 0
	GOTO        L_logicaMenuPrincipal8
;choose_logicMenu.c,56 :: 		}
L_logicaMenuPrincipal7:
	MOVFF       FLOC__logicaMenuPrincipal+0, FSR0
	MOVFF       FLOC__logicaMenuPrincipal+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_logicaMenuPrincipal9
	MOVFF       FLOC__logicaMenuPrincipal+0, FSR0
	MOVFF       FLOC__logicaMenuPrincipal+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_logicaMenuPrincipal10
L_logicaMenuPrincipal8:
;choose_logicMenu.c,57 :: 		}
L_logicaMenuPrincipal6:
;choose_logicMenu.c,58 :: 		flagVoltar = 0x00;
	BCF         _flagVoltar+0, BitPos(_flagVoltar+0) 
;choose_logicMenu.c,59 :: 		}
L_end_logicaMenuPrincipal:
	RETURN      0
; end of _logicaMenuPrincipal

_logicaMenu1:

;choose_logicMenu.c,63 :: 		void logicaMenu1()
;choose_logicMenu.c,66 :: 		max_menu = 2;
	MOVLW       2
	MOVWF       _max_menu+0 
;choose_logicMenu.c,67 :: 		min_menu = 1;
	MOVLW       1
	MOVWF       _min_menu+0 
;choose_logicMenu.c,70 :: 		seletorSignal(fonica);
	CLRF        FARG_seletorSignal_signalSeletor+0 
	CALL        _seletorSignal+0, 0
;choose_logicMenu.c,75 :: 		while(flagVoltar != 1)
L_logicaMenu111:
	BTFSC       _flagVoltar+0, BitPos(_flagVoltar+0) 
	GOTO        L_logicaMenu112
;choose_logicMenu.c,77 :: 		while(flagConfirma != 1)
L_logicaMenu113:
	BTFSC       _flagConfirma+0, BitPos(_flagConfirma+0) 
	GOTO        L_logicaMenu114
;choose_logicMenu.c,82 :: 		}
L_logicaMenu115:
;choose_logicMenu.c,83 :: 		}
	GOTO        L_logicaMenu113
L_logicaMenu114:
;choose_logicMenu.c,84 :: 		flagConfirma = 0;
	BCF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;choose_logicMenu.c,85 :: 		var_menu = controle_menu(var_menu);
	MOVF        _var_menu+0, 0 
	MOVWF       FARG_controle_menu_var_atual+0 
	CALL        _controle_menu+0, 0
	MOVF        R0, 0 
	MOVWF       _var_menu+0 
;choose_logicMenu.c,86 :: 		if(flagVoltar != 1)
	BTFSC       _flagVoltar+0, BitPos(_flagVoltar+0) 
	GOTO        L_logicaMenu117
;choose_logicMenu.c,91 :: 		}
L_logicaMenu118:
;choose_logicMenu.c,92 :: 		}
L_logicaMenu117:
;choose_logicMenu.c,93 :: 		}
	GOTO        L_logicaMenu111
L_logicaMenu112:
;choose_logicMenu.c,94 :: 		flagVoltar = 0;
	BCF         _flagVoltar+0, BitPos(_flagVoltar+0) 
;choose_logicMenu.c,95 :: 		}
L_end_logicaMenu1:
	RETURN      0
; end of _logicaMenu1

_logicaMenu2:

;choose_logicMenu.c,99 :: 		void logicaMenu2()
;choose_logicMenu.c,102 :: 		max_menu = 1;
	MOVLW       1
	MOVWF       _max_menu+0 
;choose_logicMenu.c,103 :: 		min_menu = 1;
	MOVLW       1
	MOVWF       _min_menu+0 
;choose_logicMenu.c,106 :: 		seletorSignal(hall);
	MOVLW       1
	MOVWF       FARG_seletorSignal_signalSeletor+0 
	CALL        _seletorSignal+0, 0
;choose_logicMenu.c,111 :: 		while(flagVoltar != 1)
L_logicaMenu220:
	BTFSC       _flagVoltar+0, BitPos(_flagVoltar+0) 
	GOTO        L_logicaMenu221
;choose_logicMenu.c,113 :: 		while(flagConfirma != 1)
L_logicaMenu222:
	BTFSC       _flagConfirma+0, BitPos(_flagConfirma+0) 
	GOTO        L_logicaMenu223
;choose_logicMenu.c,119 :: 		}
L_logicaMenu224:
;choose_logicMenu.c,120 :: 		}
	GOTO        L_logicaMenu222
L_logicaMenu223:
;choose_logicMenu.c,121 :: 		flagConfirma = 0;
	BCF         _flagConfirma+0, BitPos(_flagConfirma+0) 
;choose_logicMenu.c,122 :: 		var_menu = controle_menu(var_menu);
	MOVF        _var_menu+0, 0 
	MOVWF       FARG_controle_menu_var_atual+0 
	CALL        _controle_menu+0, 0
	MOVF        R0, 0 
	MOVWF       _var_menu+0 
;choose_logicMenu.c,123 :: 		if(flagVoltar != 1)
	BTFSC       _flagVoltar+0, BitPos(_flagVoltar+0) 
	GOTO        L_logicaMenu226
;choose_logicMenu.c,128 :: 		}
L_logicaMenu226:
;choose_logicMenu.c,129 :: 		}
	GOTO        L_logicaMenu220
L_logicaMenu221:
;choose_logicMenu.c,130 :: 		flagVoltar = 0;
	BCF         _flagVoltar+0, BitPos(_flagVoltar+0) 
;choose_logicMenu.c,131 :: 		}
L_end_logicaMenu2:
	RETURN      0
; end of _logicaMenu2
