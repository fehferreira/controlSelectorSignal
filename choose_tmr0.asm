
_interrupt_tmr0:

;choose_tmr0.c,15 :: 		void interrupt_tmr0()
;choose_tmr0.c,17 :: 		if(TMR0IF_bit)
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt_tmr00
;choose_tmr0.c,19 :: 		TMR0IF_bit = 0x00;                       //Limpa a flag de interrupção
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;choose_tmr0.c,20 :: 		TMR0H = 0xB1;                            //Reiniciando os contadores (45536)
	MOVLW       177
	MOVWF       TMR0H+0 
;choose_tmr0.c,21 :: 		TMR0L = 0xE0;                            //Reiniciando os contadores (45536)
	MOVLW       224
	MOVWF       TMR0L+0 
;choose_tmr0.c,22 :: 		out_signal = ~out_signal;
	BTG         RD0_bit+0, BitPos(RD0_bit+0) 
;choose_tmr0.c,24 :: 		test_button();
	CALL        _test_button+0, 0
;choose_tmr0.c,26 :: 		}
L_interrupt_tmr00:
;choose_tmr0.c,27 :: 		}
L_end_interrupt_tmr0:
	RETURN      0
; end of _interrupt_tmr0
