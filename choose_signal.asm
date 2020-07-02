
_main:

;choose_signal.c,49 :: 		void main()
;choose_signal.c,53 :: 		GIE_bit = 0x01;                             //Habilitando interrupções globais
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;choose_signal.c,54 :: 		PEIE_bit = 0x01;                            //Habilitando interrupções de periféricos
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;choose_signal.c,55 :: 		IPEN_bit = 0x01;                            //Habilitando interrupções HIGH e LOW
	BSF         IPEN_bit+0, BitPos(IPEN_bit+0) 
;choose_signal.c,57 :: 		TRISD = 0x00;                               //Configura PORTD como saida
	CLRF        TRISD+0 
;choose_signal.c,58 :: 		TRISB = 0xF8;                               //Configura RB0:RB2 como saida, restante entrada
	MOVLW       248
	MOVWF       TRISB+0 
;choose_signal.c,63 :: 		T0CON = 0b10001000;                         //Configurando TMR0
	MOVLW       136
	MOVWF       T0CON+0 
;choose_signal.c,68 :: 		TMR0H = 0xB1;                               //Iniciando os contadores (45536)
	MOVLW       177
	MOVWF       TMR0H+0 
;choose_signal.c,69 :: 		TMR0L = 0xE0;                               //Iniciando os contadores (45536)
	MOVLW       224
	MOVWF       TMR0L+0 
;choose_signal.c,70 :: 		TMR0IF_bit = 0x00;                          //Limpando a flag de interrupção
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;choose_signal.c,71 :: 		TMR0IP_bit = 0x01;                          //Configurando como interrupção de alta prioridade
	BSF         TMR0IP_bit+0, BitPos(TMR0IP_bit+0) 
;choose_signal.c,72 :: 		TMR0IE_bit = 0x01;                          //Habilita interrupção do TMR0
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;choose_signal.c,76 :: 		Lcd_Init();                                 //Inicializa o LCD
	CALL        _Lcd_Init+0, 0
;choose_signal.c,77 :: 		Lcd_Cmd(_LCD_CLEAR);                        //Limpa o LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;choose_signal.c,78 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                   //Desabilita o curso do LCD
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;choose_signal.c,80 :: 		Lcd_Out_Cp("JC MODULOS");
	MOVLW       ?lstr1_choose_signal+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr1_choose_signal+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;choose_signal.c,85 :: 		while(1)
L_main0:
;choose_signal.c,88 :: 		}
	GOTO        L_main0
;choose_signal.c,90 :: 		}//FINAL MAIN
L_end_main:
	GOTO        $+0
; end of _main

_interrupt:

;choose_signal.c,95 :: 		void interrupt()
;choose_signal.c,98 :: 		if(TMR0IF_bit)
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt2
;choose_signal.c,100 :: 		TMR0IF_bit = 0x00;                       //Limpa a flag de interrupção
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;choose_signal.c,101 :: 		TMR0H = 0xB1;                            //Reiniciando os contadores (45536)
	MOVLW       177
	MOVWF       TMR0H+0 
;choose_signal.c,102 :: 		TMR0L = 0xE0;                            //Reiniciando os contadores (45536)
	MOVLW       224
	MOVWF       TMR0L+0 
;choose_signal.c,103 :: 		out_signal = ~out_signal;
	BTG         RD0_bit+0, BitPos(RD0_bit+0) 
;choose_signal.c,105 :: 		}
L_interrupt2:
;choose_signal.c,107 :: 		}
L_end_interrupt:
L__interrupt6:
	RETFIE      1
; end of _interrupt

_interrupt_low:
	MOVWF       ___Low_saveWREG+0 
	MOVF        STATUS+0, 0 
	MOVWF       ___Low_saveSTATUS+0 
	MOVF        BSR+0, 0 
	MOVWF       ___Low_saveBSR+0 

;choose_signal.c,111 :: 		void interrupt_low()
;choose_signal.c,114 :: 		}
L_end_interrupt_low:
L__interrupt_low8:
	MOVF        ___Low_saveBSR+0, 0 
	MOVWF       BSR+0 
	MOVF        ___Low_saveSTATUS+0, 0 
	MOVWF       STATUS+0 
	SWAPF       ___Low_saveWREG+0, 1 
	SWAPF       ___Low_saveWREG+0, 0 
	RETFIE      0
; end of _interrupt_low

_limpaLcd:

;choose_signal.c,118 :: 		void limpaLcd()
;choose_signal.c,120 :: 		if(limpa_lcd)
	BTFSS       _limpa_lcd+0, BitPos(_limpa_lcd+0) 
	GOTO        L_limpaLcd3
;choose_signal.c,122 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;choose_signal.c,123 :: 		limpa_lcd = 0x00;
	BCF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;choose_signal.c,124 :: 		}
L_limpaLcd3:
;choose_signal.c,125 :: 		}
L_end_limpaLcd:
	RETURN      0
; end of _limpaLcd
