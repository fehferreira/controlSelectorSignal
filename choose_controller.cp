#line 1 "C:/Users/Felipe - Oficina/Documents/Programa��o/PIC/alternador de sinais/choose_controller.c"
#line 1 "c:/users/felipe - oficina/documents/programa��o/pic/alternador de sinais/choose_header.h"
#line 21 "c:/users/felipe - oficina/documents/programa��o/pic/alternador de sinais/choose_header.h"
void impressao();
void limpaLcd();



void test_button();



void incrementoSignal();
void decrementoSignal();



void interrupt_tmr0();




extern bit limpa_lcd;
extern unsigned short pos_selector;
#line 15 "C:/Users/Felipe - Oficina/Documents/Programa��o/PIC/alternador de sinais/choose_controller.c"
bit flagb1,
 flagb2;




void test_button()
{
 if( RB6_bit  && !flagb1) flagb1 = 0x01;
 if( RB7_bit  && !flagb2) flagb2 = 0x01;

 if(! RB6_bit  && flagb1)
 {
 limpa_lcd = 0x01;
 flagb1 = 0x00;
 pos_selector++;
 if(pos_selector >= 11) pos_selector = 1;

 incrementoSignal();
 }

 if(! RB7_bit  && flagb2)
 {
 limpa_lcd = 0x01;
 flagb2 = 0x00;
 pos_selector--;
 if(pos_selector <= 0) pos_selector = 10;

 decrementoSignal();
 }
}
