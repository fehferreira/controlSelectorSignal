
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
;choose_main.c,45 :: 		flaginicio = 1;
	BSF         _flaginicio+0, BitPos(_flaginicio+0) 
;choose_main.c,46 :: 		limpa_lcd = 1;
	BSF         _limpa_lcd+0, BitPos(_limpa_lcd+0) 
;choose_main.c,50 :: 		configTMR0();
	CALL        _configTMR0+0, 0
;choose_main.c,54 :: 		Lcd_Init();                                 //Inicializa o LCD
	CALL        _Lcd_Init+0, 0
;choose_main.c,55 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                   //Desabilita o curso do LCD
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;choose_main.c,57 :: 		while(1)
L_main0:
;choose_main.c,59 :: 		if(flaginicio == 1)    inicioLcd();
	BTFSS       _flaginicio+0, BitPos(_flaginicio+0) 
	GOTO        L_main2
	CALL        _inicioLcd+0, 0
	GOTO        L_main3
L_main2:
;choose_main.c,60 :: 		else                   logicaMenuPrincipal();
	CALL        _logicaMenuPrincipal+0, 0
L_main3:
;choose_main.c,61 :: 		}
	GOTO        L_main0
;choose_main.c,63 :: 		}//FINAL MAIN
L_end_main:
	GOTO        $+0
; end of _main

_interrupt:

;choose_main.c,68 :: 		void interrupt()
;choose_main.c,70 :: 		interrupt_tmr1();
	CALL        _interrupt_tmr1+0, 0
;choose_main.c,71 :: 		}
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

;choose_main.c,73 :: 		void interrupt_low()
;choose_main.c,75 :: 		interrupt_tmr0();
	CALL        _interrupt_tmr0+0, 0
;choose_main.c,76 :: 		}
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
