#line 1 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/alternador de sinais/choose_seletor.c"
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
#line 15 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/alternador de sinais/choose_seletor.c"
void incrementoSignal();
void decrementoSignal();




unsigned short pos_selector = 1;




void incrementoSignal()
{
  RB0_bit  = 0x01;
  RB0_bit  = 0x00;
}


void decrementoSignal()
{
 char i;

  RB0_bit  = 0x01;
  RB1_bit  = 0x01;
  RB1_bit  = 0x00;
 for(i = 0 ; i != pos_selector ; i++)
 {
  RB0_bit  = 0x01;
  RB0_bit  = 0x00;
 }
}
