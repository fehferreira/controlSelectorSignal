#line 1 "C:/Users/Felipe-HOME/Documents/programas/PIC/signal-chooser/interrupcaoTMR1.c"
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
#line 16 "C:/Users/Felipe-HOME/Documents/programas/PIC/signal-chooser/interrupcaoTMR1.c"
unsigned short contador_rotacao;




void configInterruptTMR1()
{
 T1CON = 0b01000000;




 TMR1L = 0x00;
 TMR1H = 0x00;
 TMR1IE_bit = 0x01;
 TMR1IP_bit = 0x01;
}



void interruptTMR1()
{
 if(TMR1IF_bit)
 {

 if(!flagHall)
 {
 contador_rotacao ++;

 if(contador_rotacao < ((dentes*2) - (espacos*2)))  LATD0_bit  = ~ LATD0_bit ;
 if(contador_rotacao >= ((dentes*2) - (espacos*2)))
 {
  LATB3_bit  = ~ LATB3_bit ;
  LATD0_bit  = 0x00;
 }
 if(contador_rotacao == (dentes*2))
 {
 contador_rotacao = 0x00;
  LATB3_bit  = 0x00;
 }

 }else
 {
  LATD1_bit  = ~ LATD1_bit ;
 }

 TMR1L = contT << 8;
 TMR1H = contT >> 8;

 valor_tmr1 = contT;

 TMR1IF_bit = 0x00;

 }
}



void ligarTMR1()
{
 TMR1ON_bit = 1;
}



void desligaTMR1()
{
  LATD0_bit  = 0;
  LATB3_bit  = 0;
 TMR1ON_bit = 0;
}
