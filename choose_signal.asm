
_main:

;choose_signal.c,56 :: 		void main()
;choose_signal.c,60 :: 		GIE_bit = 0x01;                             //Habilitando interrupções globais
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;choose_signal.c,61 :: 		PEIE_bit = 0x01;                            //Habilitando interrupções de periféricos
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;choose_signal.c,62 :: 		IPEN_bit = 0x01;                            //Habilitando interrupções HIGH e LOW
	BSF         IPEN_bit+0, BitPos(IPEN_bit+0) 
;choose_signal.c,64 :: 		TRISD = 0x00;                               //Configura PORTD como saida
	CLRF        TRISD+0 
;choose_signal.c,65 :: 		TRISB = 0xF8;                               //Configura RB0:RB2 como saida, restante entrada
	MOVLW       248
	MOVWF       TRISB+0 
;choose_signal.c,67 :: 		ADCON0 = 0x00;                              //Conversor A-D Desabilitado
	CLRF        ADCON0+0 
;choose_signal.c,68 :: 		ADCON1 = 0x0F;                              //Configurando saída como Digitais
	MOVLW       15
	MOVWF       ADCON1+0 
;choose_signal.c,72 :: 		flagb1 = 0x00;
	BCF         _flagb1+0, BitPos(_flagb1+0) 
;choose_signal.c,73 :: 		flagb2 = 0x00;
	BCF         _flagb2+0, BitPos(_flagb2+0) 
;choose_signal.c,74 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;choose_signal.c,78 :: 		T0CON = 0b10001000;                         //Configurando TMR0
	MOVLW       136
	MOVWF       T0CON+0 
;choose_signal.c,83 :: 		TMR0H = 0xB1;                               //Iniciando os contadores (45536)
	MOVLW       177
	MOVWF       TMR0H+0 
;choose_signal.c,84 :: 		TMR0L = 0xE0;                               //Iniciando os contadores (45536)
	MOVLW       224
	MOVWF       TMR0L+0 
;choose_signal.c,85 :: 		TMR0IF_bit = 0x00;                          //Limpando a flag de interrupção
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;choose_signal.c,86 :: 		TMR0IP_bit = 0x01;                          //Configurando como interrupção de alta prioridade
	BSF         TMR0IP_bit+0, BitPos(TMR0IP_bit+0) 
;choose_signal.c,87 :: 		TMR0IE_bit = 0x01;                          //Habilita interrupção do TMR0
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;choose_signal.c,91 :: 		Lcd_Init();                                 //Inicializa o LCD
	CALL        _Lcd_Init+0, 0
;choose_signal.c,92 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                   //Desabilita o curso do LCD
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;choose_signal.c,94 :: 		while(1)
L_main0:
;choose_signal.c,96 :: 		limpaLcd();
	CALL        _limpaLcd+0, 0
;choose_signal.c,97 :: 		impressao();
	CALL        _impressao+0, 0
;choose_signal.c,98 :: 		}
	GOTO        L_main0
;choose_signal.c,100 :: 		}//FINAL MAIN
L_end_main:
	GOTO        $+0
; end of _main

_interrupt:

;choose_signal.c,105 :: 		void interrupt()
;choose_signal.c,108 :: 		if(TMR0IF_bit)
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt2
;choose_signal.c,110 :: 		TMR0IF_bit = 0x00;                       //Limpa a flag de interrupção
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;choose_signal.c,111 :: 		TMR0H = 0xB1;                            //Reiniciando os contadores (45536)
	MOVLW       177
	MOVWF       TMR0H+0 
;choose_signal.c,112 :: 		TMR0L = 0xE0;                            //Reiniciando os contadores (45536)
	MOVLW       224
	MOVWF       TMR0L+0 
;choose_signal.c,113 :: 		out_signal = ~out_signal;
	BTG         RD0_bit+0, BitPos(RD0_bit+0) 
;choose_signal.c,115 :: 		teste_button();
	CALL        _teste_button+0, 0
;choose_signal.c,117 :: 		}
L_interrupt2:
;choose_signal.c,119 :: 		}
L_end_interrupt:
L__interrupt27:
	RETFIE      1
; end of _interrupt

_interrupt_low:
	MOVWF       ___Low_saveWREG+0 
	MOVF        STATUS+0, 0 
	MOVWF       ___Low_saveSTATUS+0 
	MOVF        BSR+0, 0 
	MOVWF       ___Low_saveBSR+0 

;choose_signal.c,123 :: 		void interrupt_low()
;choose_signal.c,126 :: 		}
L_end_interrupt_low:
L__interrupt_low29:
	MOVF        ___Low_saveBSR+0, 0 
	MOVWF       BSR+0 
	MOVF        ___Low_saveSTATUS+0, 0 
	MOVWF       STATUS+0 
	SWAPF       ___Low_saveWREG+0, 1 
	SWAPF       ___Low_saveWREG+0, 0 
	RETFIE      0
; end of _interrupt_low

_limpaLcd:

;choose_signal.c,130 :: 		void limpaLcd()
;choose_signal.c,132 :: 		if(limpa_lcd)
	BTFSS       _limpa_lcd+0, BitPos(_limpa_lcd+0) 
	GOTO        L_limpaLcd3
;choose_signal.c,134 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;choose_signal.c,135 :: 		limpa_lcd = 0x00;
	BCF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;choose_signal.c,136 :: 		}
L_limpaLcd3:
;choose_signal.c,137 :: 		}
L_end_limpaLcd:
	RETURN      0
; end of _limpaLcd

_teste_button:

;choose_signal.c,141 :: 		void teste_button()
;choose_signal.c,143 :: 		if(b1 && !flagb1)  flagb1 = 0x01;
	BTFSS       RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L_teste_button6
	BTFSC       _flagb1+0, BitPos(_flagb1+0) 
	GOTO        L_teste_button6
L__teste_button24:
	BSF         _flagb1+0, BitPos(_flagb1+0) 
L_teste_button6:
;choose_signal.c,144 :: 		if(b2 && !flagb2)  flagb2 = 0x01;
	BTFSS       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L_teste_button9
	BTFSC       _flagb2+0, BitPos(_flagb2+0) 
	GOTO        L_teste_button9
L__teste_button23:
	BSF         _flagb2+0, BitPos(_flagb2+0) 
L_teste_button9:
;choose_signal.c,146 :: 		if(!b1 && flagb1)
	BTFSC       RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L_teste_button12
	BTFSS       _flagb1+0, BitPos(_flagb1+0) 
	GOTO        L_teste_button12
L__teste_button22:
;choose_signal.c,148 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;choose_signal.c,149 :: 		flagb1 = 0x00;
	BCF         _flagb1+0, BitPos(_flagb1+0) 
;choose_signal.c,150 :: 		selector = 0x01;
	BSF         RB0_bit+0, BitPos(RB0_bit+0) 
;choose_signal.c,151 :: 		pos_selector++;
	INCF        _pos_selector+0, 1 
;choose_signal.c,152 :: 		if(pos_selector >= 11) pos_selector = 1;
	MOVLW       11
	SUBWF       _pos_selector+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_teste_button13
	MOVLW       1
	MOVWF       _pos_selector+0 
L_teste_button13:
;choose_signal.c,153 :: 		}
L_teste_button12:
;choose_signal.c,155 :: 		if(!b2 && flagb2)
	BTFSC       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L_teste_button16
	BTFSS       _flagb2+0, BitPos(_flagb2+0) 
	GOTO        L_teste_button16
L__teste_button21:
;choose_signal.c,159 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;choose_signal.c,160 :: 		flagb2 = 0x00;
	BCF         _flagb2+0, BitPos(_flagb2+0) 
;choose_signal.c,161 :: 		selector = 0x01;
	BSF         RB0_bit+0, BitPos(RB0_bit+0) 
;choose_signal.c,162 :: 		pos_selector--;
	DECF        _pos_selector+0, 1 
;choose_signal.c,163 :: 		if(pos_selector <= 0) pos_selector = 10;
	MOVF        _pos_selector+0, 0 
	SUBLW       0
	BTFSS       STATUS+0, 0 
	GOTO        L_teste_button17
	MOVLW       10
	MOVWF       _pos_selector+0 
L_teste_button17:
;choose_signal.c,164 :: 		reset_selector = 0x01;
	BSF         RB1_bit+0, BitPos(RB1_bit+0) 
;choose_signal.c,165 :: 		reset_selector = 0x00;
	BCF         RB1_bit+0, BitPos(RB1_bit+0) 
;choose_signal.c,166 :: 		for(i = 0 ; i != pos_selector ; i++)
	CLRF        R1 
L_teste_button18:
	MOVF        R1, 0 
	XORWF       _pos_selector+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_teste_button19
;choose_signal.c,168 :: 		selector = 0x01;
	BSF         RB0_bit+0, BitPos(RB0_bit+0) 
;choose_signal.c,169 :: 		selector = 0x00;
	BCF         RB0_bit+0, BitPos(RB0_bit+0) 
;choose_signal.c,166 :: 		for(i = 0 ; i != pos_selector ; i++)
	INCF        R1, 1 
;choose_signal.c,170 :: 		}
	GOTO        L_teste_button18
L_teste_button19:
;choose_signal.c,171 :: 		}
L_teste_button16:
;choose_signal.c,173 :: 		selector = 0x00;
	BCF         RB0_bit+0, BitPos(RB0_bit+0) 
;choose_signal.c,175 :: 		}
L_end_teste_button:
	RETURN      0
; end of _teste_button

_impressao:

;choose_signal.c,179 :: 		void impressao()
;choose_signal.c,181 :: 		Lcd_Chr(1,1,'J');
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       74
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;choose_signal.c,182 :: 		Lcd_Chr_Cp('C');
	MOVLW       67
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_signal.c,183 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_signal.c,184 :: 		Lcd_Chr_Cp('M');
	MOVLW       77
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_signal.c,185 :: 		Lcd_Chr_Cp('O');
	MOVLW       79
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_signal.c,186 :: 		Lcd_Chr_Cp('D');
	MOVLW       68
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_signal.c,187 :: 		Lcd_Chr_Cp('U');
	MOVLW       85
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_signal.c,188 :: 		Lcd_Chr_Cp('L');
	MOVLW       76
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_signal.c,189 :: 		Lcd_Chr_Cp('O');
	MOVLW       79
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_signal.c,190 :: 		Lcd_Chr_Cp('S');
	MOVLW       83
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_signal.c,192 :: 		Lcd_Chr(2,1,'P');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       80
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;choose_signal.c,193 :: 		Lcd_Chr_Cp('O');
	MOVLW       79
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_signal.c,194 :: 		Lcd_Chr_Cp('S');
	MOVLW       83
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_signal.c,195 :: 		Lcd_Chr_Cp(':');
	MOVLW       58
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_signal.c,197 :: 		IntToStr(pos_selector,txt);
	MOVF        _pos_selector+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVLW       0
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;choose_signal.c,198 :: 		Lcd_Out(2,6,txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;choose_signal.c,200 :: 		}
L_end_impressao:
	RETURN      0
; end of _impressao
