#line 1 "C:/Users/Felipe-HOME/Documents/programas/PIC/signal-chooser/menu.c"
#line 1 "c:/users/felipe-home/documents/programas/pic/signal-chooser/menu.h"
#line 11 "c:/users/felipe-home/documents/programas/pic/signal-chooser/menu.h"
extern sfr sbit voltar;
extern sfr sbit esquerda;
extern sfr sbit direita;
extern sfr sbit ok;




void limpaLcd();
void inicioLcd();

void menuPrincipal(unsigned short var_menu);
void escolhaDentes(unsigned short var_menu);
void escolhaEspacos(unsigned short var_menu);
void sinalFonica();
void sinalHall();




void logicaMenuPrincipal();
void logicaFonica();
void logicaHall();
void buttonMenu();




extern bit limpa_lcd,
 flagVoltar,
 flagConfirma,
 flagHall;

extern unsigned short var_menu,
 pos_menu,
 max_menu,
 min_menu,
 dentes,
 espacos,
 vetor_menu[5];

extern unsigned int counter_rotacao,
 contT;

extern float valor_tmr1;
#line 1 "c:/users/felipe-home/documents/programas/pic/signal-chooser/header.h"
#line 11 "c:/users/felipe-home/documents/programas/pic/signal-chooser/header.h"
sbit LCD_RS at LATD2_bit;
sbit LCD_EN at LATD3_bit;
sbit LCD_D4 at LATD4_bit;
sbit LCD_D5 at LATD5_bit;
sbit LCD_D6 at LATD6_bit;
sbit LCD_D7 at LATD7_bit;

sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;
#line 39 "c:/users/felipe-home/documents/programas/pic/signal-chooser/header.h"
void interruptTMR1();
void configInterruptTMR1();
void ligarTMR1();
void desligaTMR1();


void interruptTMR0();
void configInterruptTMR0();
void ligarTMR0();
void desligaTMR0();
#line 16 "C:/Users/Felipe-HOME/Documents/programas/PIC/signal-chooser/menu.c"
bit flagConfirma,
 flagVoltar,
 flagHall;

unsigned short var_menu,
 pos_menu,
 max_menu,
 min_menu,
 dentes,
 espacos,
 vetor_menu[5];




char controle_menu(char var_atual)
{
 if(flagVoltar == 0)
 {
 vetor_menu[pos_menu] = var_atual;
 pos_menu++;
 var_atual = 0;
 }else if(pos_menu > 0)
 {
 pos_menu--;
 var_atual = vetor_menu[pos_menu];
 }

 return var_atual;
}




void logicaMenuPrincipal()
{
 while(flagVoltar != 1)
 {
 while(flagConfirma != 1)
 {
 menuPrincipal(var_menu);
 }

 flagConfirma = 0;
 var_menu = controle_menu(var_menu);

 switch(vetor_menu[pos_menu-1])
 {
 case 0: logicaFonica();break;
 case 1: logicaHall(); break;
 }
 }

 flagVoltar = 0;
}



void logicaFonica()
{
 while(flagVoltar != 1)
 {
 while(flagConfirma != 1)
 {
 escolhaDentes(var_menu);
 }
 flagConfirma = 0;
 dentes = var_menu;
 var_menu = 0;

 while(flagConfirma != 1)
 {
 escolhaEspacos(var_menu);
 }
 flagConfirma = 0;
 espacos = var_menu;
 var_menu = 0;

 ligarTMR1();

 while(flagConfirma != 1)
 {
 sinalFonica();
 }
 flagConfirma = 0;
 var_menu = controle_menu(var_menu);

 if(flagVoltar != 1)
 {
#line 109 "C:/Users/Felipe-HOME/Documents/programas/PIC/signal-chooser/menu.c"
 }
 desligaTMR1();
 }
 flagVoltar = 0;
}



void logicaHall()
{
 while(flagVoltar != 1)
 {
 ligarTMR1();
 flagHall = 1;

 while(flagConfirma != 1)
 {
 sinalHall();
 }

 flagHall = 0;
 flagConfirma = 0;
 desligaTMR1();
 }
 flagVoltar = 0;
}
