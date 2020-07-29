
_main:

;choose_signal.c,36 :: 		void main()
;choose_signal.c,40 :: 		GIE_bit = 0x01;                             //Habilitando interrupções globais
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;choose_signal.c,41 :: 		PEIE_bit = 0x01;                            //Habilitando interrupções de periféricos
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;choose_signal.c,42 :: 		IPEN_bit = 0x01;                            //Habilitando interrupções HIGH e LOW
	BSF         IPEN_bit+0, BitPos(IPEN_bit+0) 
;choose_signal.c,44 :: 		TRISD = 0x00;                               //Configura PORTD como saida
	CLRF        TRISD+0 
;choose_signal.c,45 :: 		TRISB = 0xF8;                               //Configura RB0:RB2 como saida, restante entrada
	MOVLW       248
	MOVWF       TRISB+0 
;choose_signal.c,47 :: 		ADCON0 = 0x00;                              //Conversor A-D Desabilitado
	CLRF        ADCON0+0 
;choose_signal.c,48 :: 		ADCON1 = 0x0F;                              //Configurando saída como Digitais
	MOVLW       15
	MOVWF       ADCON1+0 
;choose_signal.c,52 :: 		T0CON = 0b10001000;                         //Configurando TMR0
	MOVLW       136
	MOVWF       T0CON+0 
;choose_signal.c,57 :: 		TMR0H = 0xB1;                               //Iniciando os contadores (45536)
	MOVLW       177
	MOVWF       TMR0H+0 
;choose_signal.c,58 :: 		TMR0L = 0xE0;                               //Iniciando os contadores (45536)
	MOVLW       224
	MOVWF       TMR0L+0 
;choose_signal.c,59 :: 		TMR0IF_bit = 0x00;                          //Limpando a flag de interrupção
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;choose_signal.c,60 :: 		TMR0IP_bit = 0x01;                          //Configurando como interrupção de alta prioridade
	BSF         TMR0IP_bit+0, BitPos(TMR0IP_bit+0) 
;choose_signal.c,61 :: 		TMR0IE_bit = 0x01;                          //Habilita interrupção do TMR0
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;choose_signal.c,65 :: 		Lcd_Init();                                 //Inicializa o LCD
	CALL        _Lcd_Init+0, 0
;choose_signal.c,66 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                   //Desabilita o curso do LCD
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;choose_signal.c,68 :: 		while(1)
L_main0:
;choose_signal.c,70 :: 		limpaLcd();
	CALL        _limpaLcd+0, 0
;choose_signal.c,71 :: 		impressao(pos_selector);
	MOVF        _pos_selector+0, 0 
	MOVWF       FARG_impressao_pos_selector+0 
	CALL        _impressao+0, 0
;choose_signal.c,72 :: 		}
	GOTO        L_main0
;choose_signal.c,74 :: 		}//FINAL MAIN
L_end_main:
	GOTO        $+0
; end of _main

_interrupt:

;choose_signal.c,79 :: 		void interrupt()
;choose_signal.c,81 :: 		interrupt_tmr0(pos_selector);
	MOVF        _pos_selector+0, 0 
	MOVWF       FARG_interrupt_tmr0_pos_selector+0 
	CALL        _interrupt_tmr0+0, 0
;choose_signal.c,82 :: 		}
L_end_interrupt:
L__interrupt4:
	RETFIE      1
; end of _interrupt
