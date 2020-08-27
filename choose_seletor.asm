
_incrementoSignal:

;choose_seletor.c,26 :: 		void incrementoSignal()
;choose_seletor.c,28 :: 		selector = 0x01;
	BSF         RB0_bit+0, BitPos(RB0_bit+0) 
;choose_seletor.c,29 :: 		selector = 0x00;
	BCF         RB0_bit+0, BitPos(RB0_bit+0) 
;choose_seletor.c,30 :: 		}
L_end_incrementoSignal:
	RETURN      0
; end of _incrementoSignal

_decrementoSignal:

;choose_seletor.c,33 :: 		void decrementoSignal()
;choose_seletor.c,37 :: 		selector = 0x01;
	BSF         RB0_bit+0, BitPos(RB0_bit+0) 
;choose_seletor.c,38 :: 		reset_selector = 0x01;
	BSF         RB1_bit+0, BitPos(RB1_bit+0) 
;choose_seletor.c,39 :: 		reset_selector = 0x00;
	BCF         RB1_bit+0, BitPos(RB1_bit+0) 
;choose_seletor.c,40 :: 		for(i = 0 ; i != pos_selector ; i++)
	CLRF        R1 
L_decrementoSignal0:
	MOVF        R1, 0 
	XORWF       _pos_selector+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_decrementoSignal1
;choose_seletor.c,42 :: 		selector = 0x01;
	BSF         RB0_bit+0, BitPos(RB0_bit+0) 
;choose_seletor.c,43 :: 		selector = 0x00;
	BCF         RB0_bit+0, BitPos(RB0_bit+0) 
;choose_seletor.c,40 :: 		for(i = 0 ; i != pos_selector ; i++)
	INCF        R1, 1 
;choose_seletor.c,44 :: 		}
	GOTO        L_decrementoSignal0
L_decrementoSignal1:
;choose_seletor.c,45 :: 		}
L_end_decrementoSignal:
	RETURN      0
; end of _decrementoSignal
