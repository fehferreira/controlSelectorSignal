
_main:

;projeto_menus.c,51 :: 		void main()
;projeto_menus.c,55 :: 		GIE_bit = 0x01;                         //Habilitando interrupções gerais
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;projeto_menus.c,56 :: 		PEIE_bit = 0x01;                        //Habilitando interrupções de periféricos
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;projeto_menus.c,57 :: 		IPEN_bit = 0x01;                        //Habilita prioridade de interrupção
	BSF         IPEN_bit+0, BitPos(IPEN_bit+0) 
;projeto_menus.c,61 :: 		configInterruptTMR0();
	CALL        _configInterruptTMR0+0, 0
;projeto_menus.c,65 :: 		ADCON0 = 0x00;                          //Desabilita o modulo ADC
	CLRF        ADCON0+0 
;projeto_menus.c,66 :: 		ADCON1 = 0x0F;                          //Configurando PORTA:PORTB como entradas digitais
	MOVLW       15
	MOVWF       ADCON1+0 
;projeto_menus.c,68 :: 		TRISB = 0xF0;                           //Configura RB4:RB7 como entrada digital.
	MOVLW       240
	MOVWF       TRISB+0 
;projeto_menus.c,69 :: 		TRISD = 0x00;                           //Configura PORTD como saída
	CLRF        TRISD+0 
;projeto_menus.c,72 :: 		Lcd_Init();                             //Inicializa o LCD
	CALL        _Lcd_Init+0, 0
;projeto_menus.c,73 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;projeto_menus.c,75 :: 		InicioLcd();
	CALL        _inicioLcd+0, 0
;projeto_menus.c,76 :: 		delay_ms(1500);
	MOVLW       39
	MOVWF       R11, 0
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       38
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
;projeto_menus.c,77 :: 		limpa_lcd = 1;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;projeto_menus.c,78 :: 		limpaLcd();
	CALL        _limpaLcd+0, 0
;projeto_menus.c,80 :: 		while(1)
L_main1:
;projeto_menus.c,82 :: 		logicaMenuPrincipal();
	CALL        _logicaMenuPrincipal+0, 0
;projeto_menus.c,84 :: 		}//FINAL LOOP
	GOTO        L_main1
;projeto_menus.c,86 :: 		}//FINAL MAIN
L_end_main:
	GOTO        $+0
; end of _main

_interrupt_low:
	MOVWF       ___Low_saveWREG+0 
	MOVF        STATUS+0, 0 
	MOVWF       ___Low_saveSTATUS+0 
	MOVF        BSR+0, 0 
	MOVWF       ___Low_saveBSR+0 

;projeto_menus.c,91 :: 		void interrupt_low()                           //Funcao de interrupcao
;projeto_menus.c,93 :: 		interruptTMR0();
	CALL        _interruptTMR0+0, 0
;projeto_menus.c,94 :: 		}
L_end_interrupt_low:
L__interrupt_low5:
	MOVF        ___Low_saveBSR+0, 0 
	MOVWF       BSR+0 
	MOVF        ___Low_saveSTATUS+0, 0 
	MOVWF       STATUS+0 
	SWAPF       ___Low_saveWREG+0, 1 
	SWAPF       ___Low_saveWREG+0, 0 
	RETFIE      0
; end of _interrupt_low
