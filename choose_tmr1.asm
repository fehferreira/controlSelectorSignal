
_configTMR1:

;choose_tmr1.c,16 :: 		void configTMR1()
;choose_tmr1.c,18 :: 		T0CON = 0b10001000;                         //Configurando TMR0
	MOVLW       136
	MOVWF       T0CON+0 
;choose_tmr1.c,23 :: 		TMR0H = 0xB1;                               //Iniciando os contadores (45536)
	MOVLW       177
	MOVWF       TMR0H+0 
;choose_tmr1.c,24 :: 		TMR0L = 0xE0;                               //Iniciando os contadores (45536)
	MOVLW       224
	MOVWF       TMR0L+0 
;choose_tmr1.c,25 :: 		TMR0IF_bit = 0x00;                          //Limpando a flag de interrupção
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;choose_tmr1.c,26 :: 		TMR0IP_bit = 0x01;                          //Configurando como interrupção de alta prioridade
	BSF         TMR0IP_bit+0, BitPos(TMR0IP_bit+0) 
;choose_tmr1.c,27 :: 		TMR0IE_bit = 0x01;                          //Habilita interrupção do TMR0
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;choose_tmr1.c,28 :: 		}
L_end_configTMR1:
	RETURN      0
; end of _configTMR1

_interrupt_tmr1:

;choose_tmr1.c,32 :: 		void interrupt_tmr1()
;choose_tmr1.c,34 :: 		if(TMR1IF_bit)
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_interrupt_tmr10
;choose_tmr1.c,36 :: 		TMR1IF_bit = 0x00;                       //Limpa a flag de interrupção
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;choose_tmr1.c,37 :: 		TMR1H = 0xB1;                            //Reiniciando os contadores (45536)
	MOVLW       177
	MOVWF       TMR1H+0 
;choose_tmr1.c,38 :: 		TMR1L = 0xE0;                            //Reiniciando os contadores (45536)
	MOVLW       224
	MOVWF       TMR1L+0 
;choose_tmr1.c,39 :: 		out_signal = ~out_signal;
	BTG         RD0_bit+0, BitPos(RD0_bit+0) 
;choose_tmr1.c,41 :: 		}
L_interrupt_tmr10:
;choose_tmr1.c,42 :: 		}
L_end_interrupt_tmr1:
	RETURN      0
; end of _interrupt_tmr1
