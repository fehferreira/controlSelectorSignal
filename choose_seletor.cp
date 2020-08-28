#line 1 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/alternador de sinais/choose_seletor.c"
#line 1 "c:/users/felipe - oficina/documents/programação/pic/alternador de sinais/choose_header.h"
#line 24 "c:/users/felipe - oficina/documents/programação/pic/alternador de sinais/choose_header.h"
void limpaLcd();

void inicioLcd();
void menuPrincipal(char var_menu);

void menu1();
void menu2();



char controle_menu(char var_atual);

void logicaMenuPrincipal();

void logicaMenu1();
void logicaMenu2();

void buttonMenu();



void seletorSignal(unsigned short signalSeletor);


void configTMR0();
void interrupt_tmr0();


void configTMR1();
void interrupt_tmr1();




extern bit limpa_lcd,
 flagConfirma,
 flagVoltar,
 flaginicio;

extern unsigned short var_menu,
 pos_menu,
 max_menu,
 min_menu;

extern char vetor_menu[5];
#line 15 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/alternador de sinais/choose_seletor.c"
void seletorSignal(unsigned short signalSeletor);




void seletorSignal(unsigned short signalSeletor)
{
 char i;

  RB1_bit  = 0x01;
  RB1_bit  = 0x00;
 for(i = 0 ; i != signalSeletor ; i++)
 {
  RB0_bit  = 0x01;
  RB0_bit  = 0x00;
 }
}
