#line 1 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/alternador de sinais/choose_tmr0.c"
#line 1 "c:/users/felipe - oficina/documents/programação/pic/alternador de sinais/choose_header.h"
#line 21 "c:/users/felipe - oficina/documents/programação/pic/alternador de sinais/choose_header.h"
void impressao();
void limpaLcd();



void test_button();



void incrementoSignal();
void decrementoSignal();



void interrupt_tmr0();




extern bit limpa_lcd;
extern unsigned short pos_selector;
#line 15 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/alternador de sinais/choose_tmr0.c"
void interrupt_tmr0()
{
 if(TMR0IF_bit)
 {
 TMR0IF_bit = 0x00;
 TMR0H = 0xB1;
 TMR0L = 0xE0;
  RD0_bit  = ~ RD0_bit ;

 test_button();

 }
}
