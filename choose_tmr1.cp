#line 1 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/alternador de sinais/choose_tmr1.c"
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
#line 16 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/alternador de sinais/choose_tmr1.c"
void configTMR1()
{
 T0CON = 0b10001000;




 TMR0H = 0xB1;
 TMR0L = 0xE0;
 TMR0IF_bit = 0x00;
 TMR0IP_bit = 0x01;
 TMR0IE_bit = 0x01;
}



void interrupt_tmr1()
{
 if(TMR1IF_bit)
 {
 TMR1IF_bit = 0x00;
 TMR1H = 0xB1;
 TMR1L = 0xE0;
  RD0_bit  = ~ RD0_bit ;

 }
}
