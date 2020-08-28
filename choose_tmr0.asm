
_configTMR0:

;choose_tmr0.c,16 :: 		void configTMR0()
;choose_tmr0.c,18 :: 		T0CON = 0b10001000;                         //Configurando TMR0
	MOVLW       136
	MOVWF       T0CON+0 
;choose_tmr0.c,23 :: 		TMR0H = 0xB1;                               //Iniciando os contadores (45536)
	MOVLW       177
	MOVWF       TMR0H+0 
;choose_tmr0.c,24 :: 		TMR0L = 0xE0;                               //Iniciando os contadores (45536)
	MOVLW       224
	MOVWF       TMR0L+0 
;choose_tmr0.c,25 :: 		TMR0IF_bit = 0x00;                          //Limpando a flag de interrupção
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;choose_tmr0.c,26 :: 		TMR0IP_bit = 0x00;                          //Configurando como interrupção de alta prioridade
	BCF         TMR0IP_bit+0, BitPos(TMR0IP_bit+0) 
;choose_tmr0.c,27 :: 		TMR0IE_bit = 0x01;                          //Habilita interrupção do TMR0
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;choose_tmr0.c,28 :: 		}
L_end_configTMR0:
	RETURN      0
; end of _configTMR0

_interrupt_tmr0:

;choose_tmr0.c,32 :: 		void interrupt_tmr0()
;choose_tmr0.c,34 :: 		if(TMR0IF_bit)
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt_tmr00
;choose_tmr0.c,36 :: 		TMR0IF_bit = 0x00;                       //Limpa a flag de interrupção
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;choose_tmr0.c,37 :: 		TMR0H = 0xB1;                            //Reiniciando os contadores (45536)
	MOVLW       177
	MOVWF       TMR0H+0 
;choose_tmr0.c,38 :: 		TMR0L = 0xE0;                            //Reiniciando os contadores (45536)
	MOVLW       224
	MOVWF       TMR0L+0 
;choose_tmr0.c,39 :: 		out_signal = ~out_signal;
	BTG         RD0_bit+0, BitPos(RD0_bit+0) 
;choose_tmr0.c,41 :: 		buttonMenu();
	CALL        _buttonMenu+0, 0
;choose_tmr0.c,42 :: 		}
L_interrupt_tmr00:
;choose_tmr0.c,43 :: 		}
L_end_interrupt_tmr0:
	RETURN      0
; end of _interrupt_tmr0
