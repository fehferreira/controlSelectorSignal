
_seletorSignal:

;choose_seletor.c,20 :: 		void seletorSignal(unsigned short signalSeletor)
;choose_seletor.c,24 :: 		reset_selector = 0x01;
	BSF         RB1_bit+0, BitPos(RB1_bit+0) 
;choose_seletor.c,25 :: 		reset_selector = 0x00;
	BCF         RB1_bit+0, BitPos(RB1_bit+0) 
;choose_seletor.c,26 :: 		for(i = 0 ; i != signalSeletor ; i++)
	CLRF        R1 
L_seletorSignal0:
	MOVF        R1, 0 
	XORWF       FARG_seletorSignal_signalSeletor+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_seletorSignal1
;choose_seletor.c,28 :: 		selector = 0x01;
	BSF         RB0_bit+0, BitPos(RB0_bit+0) 
;choose_seletor.c,29 :: 		selector = 0x00;
	BCF         RB0_bit+0, BitPos(RB0_bit+0) 
;choose_seletor.c,26 :: 		for(i = 0 ; i != signalSeletor ; i++)
	INCF        R1, 1 
;choose_seletor.c,30 :: 		}
	GOTO        L_seletorSignal0
L_seletorSignal1:
;choose_seletor.c,31 :: 		}
L_end_seletorSignal:
	RETURN      0
; end of _seletorSignal
