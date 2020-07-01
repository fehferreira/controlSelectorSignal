
_main:

;choose_signal.c,45 :: 		void main()
;choose_signal.c,55 :: 		while(1)
L_main0:
;choose_signal.c,58 :: 		}
	GOTO        L_main0
;choose_signal.c,60 :: 		}//FINAL MAIN
L_end_main:
	GOTO        $+0
; end of _main

_interrupt:

;choose_signal.c,65 :: 		void interrupt()
;choose_signal.c,68 :: 		}
L_end_interrupt:
L__interrupt4:
	RETFIE      1
; end of _interrupt

_interrupt_low:
	MOVWF       ___Low_saveWREG+0 
	MOVF        STATUS+0, 0 
	MOVWF       ___Low_saveSTATUS+0 
	MOVF        BSR+0, 0 
	MOVWF       ___Low_saveBSR+0 

;choose_signal.c,72 :: 		void interrupt_low()
;choose_signal.c,75 :: 		}
L_end_interrupt_low:
L__interrupt_low6:
	MOVF        ___Low_saveBSR+0, 0 
	MOVWF       BSR+0 
	MOVF        ___Low_saveSTATUS+0, 0 
	MOVWF       STATUS+0 
	SWAPF       ___Low_saveWREG+0, 1 
	SWAPF       ___Low_saveWREG+0, 0 
	RETFIE      0
; end of _interrupt_low
