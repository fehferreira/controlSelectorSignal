
_main:

;choose_signal.c,54 :: 		void main()
;choose_signal.c,58 :: 		GIE_bit = 0x01;                             //Habilitando interrupções globais
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;choose_signal.c,59 :: 		PEIE_bit = 0x01;                            //Habilitando interrupções de periféricos
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;choose_signal.c,60 :: 		IPEN_bit = 0x01;                            //Habilitando interrupções HIGH e LOW
	BSF         IPEN_bit+0, BitPos(IPEN_bit+0) 
;choose_signal.c,62 :: 		TRISD = 0x00;                               //Configura PORTD como saida
	CLRF        TRISD+0 
;choose_signal.c,63 :: 		TRISB = 0xF8;                               //Configura RB0:RB2 como saida, restante entrada
	MOVLW       248
	MOVWF       TRISB+0 
;choose_signal.c,65 :: 		ADCON0 = 0x00;                              //Conversor A-D Desabilitado
	CLRF        ADCON0+0 
;choose_signal.c,66 :: 		ADCON1 = 0x0F;                              //Configurando saída como Digitais
	MOVLW       15
	MOVWF       ADCON1+0 
;choose_signal.c,70 :: 		flagb1 = 0x00;
	BCF         _flagb1+0, BitPos(_flagb1+0) 
;choose_signal.c,71 :: 		flagb2 = 0x00;
	BCF         _flagb2+0, BitPos(_flagb2+0) 
;choose_signal.c,72 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;choose_signal.c,76 :: 		T0CON = 0b10001000;                         //Configurando TMR0
	MOVLW       136
	MOVWF       T0CON+0 
;choose_signal.c,81 :: 		TMR0H = 0xB1;                               //Iniciando os contadores (45536)
	MOVLW       177
	MOVWF       TMR0H+0 
;choose_signal.c,82 :: 		TMR0L = 0xE0;                               //Iniciando os contadores (45536)
	MOVLW       224
	MOVWF       TMR0L+0 
;choose_signal.c,83 :: 		TMR0IF_bit = 0x00;                          //Limpando a flag de interrupção
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;choose_signal.c,84 :: 		TMR0IP_bit = 0x01;                          //Configurando como interrupção de alta prioridade
	BSF         TMR0IP_bit+0, BitPos(TMR0IP_bit+0) 
;choose_signal.c,85 :: 		TMR0IE_bit = 0x01;                          //Habilita interrupção do TMR0
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;choose_signal.c,89 :: 		Lcd_Init();                                 //Inicializa o LCD
	CALL        _Lcd_Init+0, 0
;choose_signal.c,90 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                   //Desabilita o curso do LCD
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;choose_signal.c,92 :: 		while(1)
L_main0:
;choose_signal.c,94 :: 		limpaLcd();
	CALL        _limpaLcd+0, 0
;choose_signal.c,95 :: 		impressao();
	CALL        _impressao+0, 0
;choose_signal.c,96 :: 		}
	GOTO        L_main0
;choose_signal.c,98 :: 		}//FINAL MAIN
L_end_main:
	GOTO        $+0
; end of _main

_interrupt:

;choose_signal.c,103 :: 		void interrupt()
;choose_signal.c,106 :: 		if(TMR0IF_bit)
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt2
;choose_signal.c,108 :: 		TMR0IF_bit = 0x00;                       //Limpa a flag de interrupção
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;choose_signal.c,109 :: 		TMR0H = 0xB1;                            //Reiniciando os contadores (45536)
	MOVLW       177
	MOVWF       TMR0H+0 
;choose_signal.c,110 :: 		TMR0L = 0xE0;                            //Reiniciando os contadores (45536)
	MOVLW       224
	MOVWF       TMR0L+0 
;choose_signal.c,111 :: 		out_signal = ~out_signal;
	BTG         RD0_bit+0, BitPos(RD0_bit+0) 
;choose_signal.c,113 :: 		teste_button();
	CALL        _teste_button+0, 0
;choose_signal.c,115 :: 		}
L_interrupt2:
;choose_signal.c,117 :: 		}
L_end_interrupt:
L__interrupt27:
	RETFIE      1
; end of _interrupt

_limpaLcd:

;choose_signal.c,121 :: 		void limpaLcd()
;choose_signal.c,123 :: 		if(limpa_lcd)
	BTFSS       _limpa_lcd+0, BitPos(_limpa_lcd+0) 
	GOTO        L_limpaLcd3
;choose_signal.c,125 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;choose_signal.c,126 :: 		limpa_lcd = 0x00;
	BCF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;choose_signal.c,127 :: 		}
L_limpaLcd3:
;choose_signal.c,128 :: 		}
L_end_limpaLcd:
	RETURN      0
; end of _limpaLcd

_teste_button:

;choose_signal.c,132 :: 		void teste_button()
;choose_signal.c,134 :: 		if(b1 && !flagb1)  flagb1 = 0x01;
	BTFSS       RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L_teste_button6
	BTFSC       _flagb1+0, BitPos(_flagb1+0) 
	GOTO        L_teste_button6
L__teste_button24:
	BSF         _flagb1+0, BitPos(_flagb1+0) 
L_teste_button6:
;choose_signal.c,135 :: 		if(b2 && !flagb2)  flagb2 = 0x01;
	BTFSS       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L_teste_button9
	BTFSC       _flagb2+0, BitPos(_flagb2+0) 
	GOTO        L_teste_button9
L__teste_button23:
	BSF         _flagb2+0, BitPos(_flagb2+0) 
L_teste_button9:
;choose_signal.c,137 :: 		if(!b1 && flagb1)
	BTFSC       RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L_teste_button12
	BTFSS       _flagb1+0, BitPos(_flagb1+0) 
	GOTO        L_teste_button12
L__teste_button22:
;choose_signal.c,139 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;choose_signal.c,140 :: 		flagb1 = 0x00;
	BCF         _flagb1+0, BitPos(_flagb1+0) 
;choose_signal.c,141 :: 		selector = 0x01;
	BSF         RB0_bit+0, BitPos(RB0_bit+0) 
;choose_signal.c,142 :: 		pos_selector++;
	INCF        _pos_selector+0, 1 
;choose_signal.c,143 :: 		if(pos_selector >= 11) pos_selector = 1;
	MOVLW       11
	SUBWF       _pos_selector+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_teste_button13
	MOVLW       1
	MOVWF       _pos_selector+0 
L_teste_button13:
;choose_signal.c,144 :: 		}
L_teste_button12:
;choose_signal.c,146 :: 		if(!b2 && flagb2)
	BTFSC       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L_teste_button16
	BTFSS       _flagb2+0, BitPos(_flagb2+0) 
	GOTO        L_teste_button16
L__teste_button21:
;choose_signal.c,150 :: 		limpa_lcd = 0x01;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;choose_signal.c,151 :: 		flagb2 = 0x00;
	BCF         _flagb2+0, BitPos(_flagb2+0) 
;choose_signal.c,152 :: 		selector = 0x01;
	BSF         RB0_bit+0, BitPos(RB0_bit+0) 
;choose_signal.c,153 :: 		pos_selector--;
	DECF        _pos_selector+0, 1 
;choose_signal.c,154 :: 		if(pos_selector <= 0) pos_selector = 10;
	MOVF        _pos_selector+0, 0 
	SUBLW       0
	BTFSS       STATUS+0, 0 
	GOTO        L_teste_button17
	MOVLW       10
	MOVWF       _pos_selector+0 
L_teste_button17:
;choose_signal.c,155 :: 		reset_selector = 0x01;
	BSF         RB1_bit+0, BitPos(RB1_bit+0) 
;choose_signal.c,156 :: 		reset_selector = 0x00;
	BCF         RB1_bit+0, BitPos(RB1_bit+0) 
;choose_signal.c,157 :: 		for(i = 0 ; i != pos_selector ; i++)
	CLRF        R1 
L_teste_button18:
	MOVF        R1, 0 
	XORWF       _pos_selector+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_teste_button19
;choose_signal.c,159 :: 		selector = 0x01;
	BSF         RB0_bit+0, BitPos(RB0_bit+0) 
;choose_signal.c,160 :: 		selector = 0x00;
	BCF         RB0_bit+0, BitPos(RB0_bit+0) 
;choose_signal.c,157 :: 		for(i = 0 ; i != pos_selector ; i++)
	INCF        R1, 1 
;choose_signal.c,161 :: 		}
	GOTO        L_teste_button18
L_teste_button19:
;choose_signal.c,162 :: 		}
L_teste_button16:
;choose_signal.c,164 :: 		selector = 0x00;
	BCF         RB0_bit+0, BitPos(RB0_bit+0) 
;choose_signal.c,166 :: 		}
L_end_teste_button:
	RETURN      0
; end of _teste_button

_impressao:

;choose_signal.c,170 :: 		void impressao()
;choose_signal.c,172 :: 		Lcd_Chr(1,1,'J');
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       74
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;choose_signal.c,173 :: 		Lcd_Chr_Cp('C');
	MOVLW       67
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_signal.c,174 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_signal.c,175 :: 		Lcd_Chr_Cp('M');
	MOVLW       77
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_signal.c,176 :: 		Lcd_Chr_Cp('O');
	MOVLW       79
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_signal.c,177 :: 		Lcd_Chr_Cp('D');
	MOVLW       68
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_signal.c,178 :: 		Lcd_Chr_Cp('U');
	MOVLW       85
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_signal.c,179 :: 		Lcd_Chr_Cp('L');
	MOVLW       76
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_signal.c,180 :: 		Lcd_Chr_Cp('O');
	MOVLW       79
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_signal.c,181 :: 		Lcd_Chr_Cp('S');
	MOVLW       83
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_signal.c,183 :: 		Lcd_Chr(2,1,'P');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       80
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;choose_signal.c,184 :: 		Lcd_Chr_Cp('O');
	MOVLW       79
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_signal.c,185 :: 		Lcd_Chr_Cp('S');
	MOVLW       83
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_signal.c,186 :: 		Lcd_Chr_Cp(':');
	MOVLW       58
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;choose_signal.c,188 :: 		IntToStr(pos_selector,txt);
	MOVF        _pos_selector+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVLW       0
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;choose_signal.c,189 :: 		Lcd_Out(2,6,txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;choose_signal.c,191 :: 		}
L_end_impressao:
	RETURN      0
; end of _impressao
