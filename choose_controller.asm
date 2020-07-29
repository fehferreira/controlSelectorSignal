
_test_button:

;choose_controller.c,21 :: 		void test_button()
;choose_controller.c,23 :: 		if(b1 && !flagb1)  flagb1 = 0x01;
	BTFSS       RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L_test_button2
	BTFSC       _flagb1+0, BitPos(_flagb1+0) 
	GOTO        L_test_button2
L__test_button20:
	BSF         _flagb1+0, BitPos(_flagb1+0) 
L_test_button2:
;choose_controller.c,24 :: 		if(b2 && !flagb2)  flagb2 = 0x01;
	BTFSS       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L_test_button5
	BTFSC       _flagb2+0, BitPos(_flagb2+0) 
	GOTO        L_test_button5
L__test_button19:
	BSF         _flagb2+0, BitPos(_flagb2+0) 
L_test_button5:
;choose_controller.c,26 :: 		if(!b1 && flagb1)
	BTFSC       RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L_test_button8
	BTFSS       _flagb1+0, BitPos(_flagb1+0) 
	GOTO        L_test_button8
L__test_button18:
;choose_controller.c,28 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;choose_controller.c,29 :: 		flagb1 = 0x00;
	BCF         _flagb1+0, BitPos(_flagb1+0) 
;choose_controller.c,30 :: 		selector = 0x01;
	BSF         RB0_bit+0, BitPos(RB0_bit+0) 
;choose_controller.c,31 :: 		pos_selector++;
	INCF        _pos_selector+0, 1 
;choose_controller.c,32 :: 		if(pos_selector >= 11) pos_selector = 1;
	MOVLW       11
	SUBWF       _pos_selector+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_test_button9
	MOVLW       1
	MOVWF       _pos_selector+0 
L_test_button9:
;choose_controller.c,33 :: 		}
L_test_button8:
;choose_controller.c,35 :: 		if(!b2 && flagb2)
	BTFSC       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L_test_button12
	BTFSS       _flagb2+0, BitPos(_flagb2+0) 
	GOTO        L_test_button12
L__test_button17:
;choose_controller.c,39 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;choose_controller.c,40 :: 		flagb2 = 0x00;
	BCF         _flagb2+0, BitPos(_flagb2+0) 
;choose_controller.c,41 :: 		selector = 0x01;
	BSF         RB0_bit+0, BitPos(RB0_bit+0) 
;choose_controller.c,42 :: 		pos_selector--;
	DECF        _pos_selector+0, 1 
;choose_controller.c,43 :: 		if(pos_selector <= 0) pos_selector = 10;
	MOVF        _pos_selector+0, 0 
	SUBLW       0
	BTFSS       STATUS+0, 0 
	GOTO        L_test_button13
	MOVLW       10
	MOVWF       _pos_selector+0 
L_test_button13:
;choose_controller.c,44 :: 		reset_selector = 0x01;
	BSF         RB1_bit+0, BitPos(RB1_bit+0) 
;choose_controller.c,45 :: 		reset_selector = 0x00;
	BCF         RB1_bit+0, BitPos(RB1_bit+0) 
;choose_controller.c,46 :: 		for(i = 0 ; i != pos_selector ; i++)
	CLRF        R1 
L_test_button14:
	MOVF        R1, 0 
	XORWF       _pos_selector+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_test_button15
;choose_controller.c,48 :: 		selector = 0x01;
	BSF         RB0_bit+0, BitPos(RB0_bit+0) 
;choose_controller.c,49 :: 		selector = 0x00;
	BCF         RB0_bit+0, BitPos(RB0_bit+0) 
;choose_controller.c,46 :: 		for(i = 0 ; i != pos_selector ; i++)
	INCF        R1, 1 
;choose_controller.c,50 :: 		}
	GOTO        L_test_button14
L_test_button15:
;choose_controller.c,51 :: 		}
L_test_button12:
;choose_controller.c,53 :: 		selector = 0x00;
	BCF         RB0_bit+0, BitPos(RB0_bit+0) 
;choose_controller.c,55 :: 		}
L_end_test_button:
	RETURN      0
; end of _test_button
