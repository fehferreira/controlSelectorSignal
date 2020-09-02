
_configInterruptTMR1:

;interrupcaoTMR1.c,21 :: 		void configInterruptTMR1()
;interrupcaoTMR1.c,23 :: 		T1CON = 0b01000000;                      //Configuraçao TIMER1
	MOVLW       64
	MOVWF       T1CON+0 
;interrupcaoTMR1.c,28 :: 		TMR1L = 0x97;                            //Inicializa variaveis de contagem
	MOVLW       151
	MOVWF       TMR1L+0 
;interrupcaoTMR1.c,29 :: 		TMR1H = 0xEA;                            //Inicializa variaveis de contagem
	MOVLW       234
	MOVWF       TMR1H+0 
;interrupcaoTMR1.c,30 :: 		TMR1IE_bit = 0x01;                       //Habilita interrupçao do TIMER1
	BSF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;interrupcaoTMR1.c,31 :: 		TMR1IP_bit = 0x01;                       //Configura a interrupção como HighPriority
	BSF         TMR1IP_bit+0, BitPos(TMR1IP_bit+0) 
;interrupcaoTMR1.c,32 :: 		}
L_end_configInterruptTMR1:
	RETURN      0
; end of _configInterruptTMR1

_interruptTMR1:

;interrupcaoTMR1.c,36 :: 		void interruptTMR1()
;interrupcaoTMR1.c,38 :: 		if(TMR1IF_bit)                           //Houve interrupçao do TIMER1?
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_interruptTMR10
;interrupcaoTMR1.c,41 :: 		if(!flagHall)
	BTFSC       _flagHall+0, BitPos(_flagHall+0) 
	GOTO        L_interruptTMR11
;interrupcaoTMR1.c,43 :: 		contador_rotacao ++;                   //incrementa sinal de rotaçao
	INCF        _contador_rotacao+0, 1 
;interrupcaoTMR1.c,45 :: 		if(contador_rotacao < ((dentes*2)-(espacos*2)))  rotacao = ~rotacao;
	MOVF        _dentes+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	RLCF        R4, 1 
	RLCF        R5, 1 
	BCF         R4, 0 
	MOVF        _espacos+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	RLCF        R1, 1 
	BCF         R0, 0 
	MOVF        R0, 0 
	SUBWF       R4, 0 
	MOVWF       R2 
	MOVF        R1, 0 
	SUBWFB      R5, 0 
	MOVWF       R3 
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       R3, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interruptTMR18
	MOVF        R2, 0 
	SUBWF       _contador_rotacao+0, 0 
L__interruptTMR18:
	BTFSC       STATUS+0, 0 
	GOTO        L_interruptTMR12
	BTG         LATD0_bit+0, BitPos(LATD0_bit+0) 
L_interruptTMR12:
;interrupcaoTMR1.c,46 :: 		if(contador_rotacao >= ((dentes*2)-(espacos*2))) rotacao = 0x00;
	MOVF        _dentes+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	RLCF        R4, 1 
	RLCF        R5, 1 
	BCF         R4, 0 
	MOVF        _espacos+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	RLCF        R1, 1 
	BCF         R0, 0 
	MOVF        R0, 0 
	SUBWF       R4, 0 
	MOVWF       R2 
	MOVF        R1, 0 
	SUBWFB      R5, 0 
	MOVWF       R3 
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       R3, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interruptTMR19
	MOVF        R2, 0 
	SUBWF       _contador_rotacao+0, 0 
L__interruptTMR19:
	BTFSS       STATUS+0, 0 
	GOTO        L_interruptTMR13
	BCF         LATD0_bit+0, BitPos(LATD0_bit+0) 
L_interruptTMR13:
;interrupcaoTMR1.c,47 :: 		if(contador_rotacao == (dentes*2))               contador_rotacao = 0x00;
	MOVF        _dentes+0, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	RLCF        R1, 1 
	RLCF        R2, 1 
	BCF         R1, 0 
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interruptTMR110
	MOVF        R1, 0 
	XORWF       _contador_rotacao+0, 0 
L__interruptTMR110:
	BTFSS       STATUS+0, 2 
	GOTO        L_interruptTMR14
	CLRF        _contador_rotacao+0 
L_interruptTMR14:
;interrupcaoTMR1.c,49 :: 		}else
	GOTO        L_interruptTMR15
L_interruptTMR11:
;interrupcaoTMR1.c,51 :: 		rotacao2 = ~rotacao2;
	BTG         LATD1_bit+0, BitPos(LATD1_bit+0) 
;interrupcaoTMR1.c,52 :: 		}
L_interruptTMR15:
;interrupcaoTMR1.c,54 :: 		TMR1L = contT << 8;
	CLRF        TMR1L+0 
;interrupcaoTMR1.c,55 :: 		TMR1H = contT >> 8;
	MOVF        _contT+1, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVF        R0, 0 
	MOVWF       TMR1H+0 
;interrupcaoTMR1.c,57 :: 		valor_tmr1 = (0.018 * (contT - 60000)) ;
	MOVLW       96
	SUBWF       _contT+0, 0 
	MOVWF       R0 
	MOVLW       234
	SUBWFB      _contT+1, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVLW       188
	MOVWF       R4 
	MOVLW       116
	MOVWF       R5 
	MOVLW       19
	MOVWF       R6 
	MOVLW       121
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2byte+0, 0
	MOVF        R0, 0 
	MOVWF       _valor_tmr1+0 
;interrupcaoTMR1.c,59 :: 		TMR1IF_bit = 0x00;                     //Limpa a flag do TIMER1
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;interrupcaoTMR1.c,61 :: 		}
L_interruptTMR10:
;interrupcaoTMR1.c,62 :: 		}
L_end_interruptTMR1:
	RETURN      0
; end of _interruptTMR1

_ligarTMR1:

;interrupcaoTMR1.c,66 :: 		void ligarTMR1()
;interrupcaoTMR1.c,68 :: 		TMR1ON_bit = 1;
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;interrupcaoTMR1.c,69 :: 		}
L_end_ligarTMR1:
	RETURN      0
; end of _ligarTMR1

_desligaTMR1:

;interrupcaoTMR1.c,73 :: 		void desligaTMR1()
;interrupcaoTMR1.c,75 :: 		rotacao = 0;
	BCF         LATD0_bit+0, BitPos(LATD0_bit+0) 
;interrupcaoTMR1.c,76 :: 		rotacao2 = 0;
	BCF         LATD1_bit+0, BitPos(LATD1_bit+0) 
;interrupcaoTMR1.c,77 :: 		fase = 0;
	BCF         LATB3_bit+0, BitPos(LATB3_bit+0) 
;interrupcaoTMR1.c,78 :: 		TMR1ON_bit = 0;
	BCF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;interrupcaoTMR1.c,79 :: 		}
L_end_desligaTMR1:
	RETURN      0
; end of _desligaTMR1
