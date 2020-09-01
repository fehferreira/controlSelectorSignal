#line 1 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/alternador de sinais/interrupcaoTMR0.c"
#line 1 "c:/users/felipe - oficina/documents/programação/pic/alternador de sinais/header.h"
#line 11 "c:/users/felipe - oficina/documents/programação/pic/alternador de sinais/header.h"
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










void interruptTMR0();
void configInterruptTMR0();
#line 1 "c:/users/felipe - oficina/documents/programação/pic/alternador de sinais/menu.h"
#line 11 "c:/users/felipe - oficina/documents/programação/pic/alternador de sinais/menu.h"
extern sfr sbit voltar;
extern sfr sbit esquerda;
extern sfr sbit direita;
extern sfr sbit ok;




void limpaLcd();

void inicioLcd();
void menuPrincipal(unsigned short var_menu);
void menu1(unsigned short var_menu);




void logicaMenuPrincipal();
void logicaMenu1();
void buttonMenu();




extern bit limpa_lcd,
 flagVoltar,
 flagConfirma;

extern unsigned short var_menu,
 pos_menu,
 max_menu,
 min_menu,
 vetor_menu[5];

extern unsigned int counter_rotacao;
#line 17 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/alternador de sinais/interrupcaoTMR0.c"
void interruptTMR0()
{
 if(TMR0IF_bit)
 {
 TMR0IF_bit = 0x00;
 TMR0H = 0xB1;
 TMR0L = 0xE0;

 buttonMenu();
 }
}



void configInterruptTMR0()
{
 T0CON = 0b10001000;




 TMR0H = 0xB1;
 TMR0L = 0xE0;
 TMR0IE_bit = 0x01;
 TMR0IP_bit = 0x00;
}
