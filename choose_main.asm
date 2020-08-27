
_main:

;choose_main.c,31 :: 		void main()
;choose_main.c,35 :: 		GIE_bit = 0x01;                             //Habilitando interrupções globais
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;choose_main.c,36 :: 		PEIE_bit = 0x01;                            //Habilitando interrupções de periféricos
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;choose_main.c,37 :: 		IPEN_bit = 0x01;                            //Habilitando interrupções HIGH e LOW
	BSF         IPEN_bit+0, BitPos(IPEN_bit+0) 
;choose_main.c,39 :: 		TRISD = 0x00;                               //Configura PORTD como saida
	CLRF        TRISD+0 
;choose_main.c,40 :: 		TRISB = 0xF8;                               //Configura RB0:RB2 como saida, restante entrada
	MOVLW       248
	MOVWF       TRISB+0 
;choose_main.c,42 :: 		ADCON0 = 0x00;                              //Conversor A-D Desabilitado
	CLRF        ADCON0+0 
;choose_main.c,43 :: 		ADCON1 = 0x0F;                              //Configurando saída como Digitais
	MOVLW       15
	MOVWF       ADCON1+0 
;choose_main.c,47 :: 		limpa_lcd = 1;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;choose_main.c,49 :: 		T0CON = 0b10001000;                         //Configurando TMR0
	MOVLW       136
	MOVWF       T0CON+0 
;choose_main.c,54 :: 		TMR0H = 0xB1;                               //Iniciando os contadores (45536)
	MOVLW       177
	MOVWF       TMR0H+0 
;choose_main.c,55 :: 		TMR0L = 0xE0;                               //Iniciando os contadores (45536)
	MOVLW       224
	MOVWF       TMR0L+0 
;choose_main.c,56 :: 		TMR0IF_bit = 0x00;                          //Limpando a flag de interrupção
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;choose_main.c,57 :: 		TMR0IP_bit = 0x01;                          //Configurando como interrupção de alta prioridade
	BSF         TMR0IP_bit+0, BitPos(TMR0IP_bit+0) 
;choose_main.c,58 :: 		TMR0IE_bit = 0x01;                          //Habilita interrupção do TMR0
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;choose_main.c,62 :: 		Lcd_Init();                                 //Inicializa o LCD
	CALL        _Lcd_Init+0, 0
;choose_main.c,63 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                   //Desabilita o curso do LCD
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;choose_main.c,65 :: 		while(1)
L_main0:
;choose_main.c,67 :: 		limpaLcd();
	CALL        _limpaLcd+0, 0
;choose_main.c,68 :: 		impressao();
	CALL        _impressao+0, 0
;choose_main.c,69 :: 		}
	GOTO        L_main0
;choose_main.c,71 :: 		}//FINAL MAIN
L_end_main:
	GOTO        $+0
; end of _main

_interrupt:

;choose_main.c,76 :: 		void interrupt()
;choose_main.c,78 :: 		interrupt_tmr0();
	CALL        _interrupt_tmr0+0, 0
;choose_main.c,79 :: 		}
L_end_interrupt:
L__interrupt4:
	RETFIE      1
; end of _interrupt
