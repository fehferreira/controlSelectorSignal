
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
;interrupcaoTMR0.c,25 :: 		buttonMenu();
	CALL        _buttonMenu+0, 0
;interrupcaoTMR0.c,26 :: 		}
L_interruptTMR00:
;interrupcaoTMR0.c,27 :: 		}
L_end_interruptTMR0:
	RETURN      0
; end of _interruptTMR0

_configInterruptTMR0:

;interrupcaoTMR0.c,31 :: 		void configInterruptTMR0()
;interrupcaoTMR0.c,33 :: 		T0CON = 0b10001000;                     //Configurando TIMER0
	MOVLW       136
	MOVWF       T0CON+0 
;interrupcaoTMR0.c,38 :: 		TMR0H = 0xB1;                           //Inicializa o counter High do TIMER0
	MOVLW       177
	MOVWF       TMR0H+0 
;interrupcaoTMR0.c,39 :: 		TMR0L = 0xE0;                           //Inicializa o counter LOW do TIMER0
	MOVLW       224
	MOVWF       TMR0L+0 
;interrupcaoTMR0.c,40 :: 		TMR0IE_bit = 0x01;                      //Habilita interrupção do TIMER0
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;interrupcaoTMR0.c,41 :: 		TMR0IP_bit = 0x00;                      //Configura TMR0 como baixa prioridade.
	BCF         TMR0IP_bit+0, BitPos(TMR0IP_bit+0) 
;interrupcaoTMR0.c,42 :: 		}
L_end_configInterruptTMR0:
	RETURN      0
; end of _configInterruptTMR0
