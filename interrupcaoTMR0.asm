
_interruptTMR0:

;interrupcaoTMR0.c,17 :: 		void interruptTMR0()
;interrupcaoTMR0.c,19 :: 		if(TMR0IF_bit)                           //Houve interrupçao externa?
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interruptTMR00
;interrupcaoTMR0.c,21 :: 		TMR0IF_bit = 0x00;                     //Limpa flag da interrupçao
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;interrupcaoTMR0.c,22 :: 		TMR0H = 0xB1;                          //Reinicializa TMR0H
	MOVLW       177
	MOVWF       TMR0H+0 
;interrupcaoTMR0.c,23 :: 		TMR0L = 0xE0;                          //Reinicializa TMR0L
	MOVLW       224
	MOVWF       TMR0L+0 
;interrupcaoTMR0.c,25 :: 		if(flagRotacao || flagHall) buttonRotacao();
	BTFSC       _flagRotacao+0, BitPos(_flagRotacao+0) 
	GOTO        L__interruptTMR05
	BTFSC       _flagHall+0, BitPos(_flagHall+0) 
	GOTO        L__interruptTMR05
	GOTO        L_interruptTMR03
L__interruptTMR05:
	CALL        _buttonRotacao+0, 0
	GOTO        L_interruptTMR04
L_interruptTMR03:
;interrupcaoTMR0.c,26 :: 		else                        buttonMenu();
	CALL        _buttonMenu+0, 0
L_interruptTMR04:
;interrupcaoTMR0.c,27 :: 		}
L_interruptTMR00:
;interrupcaoTMR0.c,28 :: 		}
L_end_interruptTMR0:
	RETURN      0
; end of _interruptTMR0

_configInterruptTMR0:

;interrupcaoTMR0.c,32 :: 		void configInterruptTMR0()
;interrupcaoTMR0.c,34 :: 		T0CON = 0b10001000;                     //Configurando TIMER0
	MOVLW       136
	MOVWF       T0CON+0 
;interrupcaoTMR0.c,39 :: 		TMR0H = 0xB1;                           //Inicializa o counter High do TIMER0
	MOVLW       177
	MOVWF       TMR0H+0 
;interrupcaoTMR0.c,40 :: 		TMR0L = 0xE0;                           //Inicializa o counter LOW do TIMER0
	MOVLW       224
	MOVWF       TMR0L+0 
;interrupcaoTMR0.c,41 :: 		TMR0IE_bit = 0x01;                      //Habilita interrupção do TIMER0
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;interrupcaoTMR0.c,42 :: 		TMR0IP_bit = 0x00;                      //Configura TMR0 como baixa prioridade.
	BCF         TMR0IP_bit+0, BitPos(TMR0IP_bit+0) 
;interrupcaoTMR0.c,43 :: 		}
L_end_configInterruptTMR0:
	RETURN      0
; end of _configInterruptTMR0

_ligarTMR0:

;interrupcaoTMR0.c,47 :: 		void ligarTMR0()
;interrupcaoTMR0.c,49 :: 		TMR0ON_bit = 1;
	BSF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;interrupcaoTMR0.c,50 :: 		}
L_end_ligarTMR0:
	RETURN      0
; end of _ligarTMR0

_desligaTMR0:

;interrupcaoTMR0.c,54 :: 		void desligaTMR0()
;interrupcaoTMR0.c,56 :: 		TMR0ON_bit = 0;
	BCF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;interrupcaoTMR0.c,57 :: 		}
L_end_desligaTMR0:
	RETURN      0
; end of _desligaTMR0
