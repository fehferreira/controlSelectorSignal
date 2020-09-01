#line 1 "C:/Users/Felipe-HOME/Documents/programas/PIC/signal-chooser/projeto_menus.c"
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










void interruptTMR0();
void configInterruptTMR0();
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
void sinalFonica(unsigned short dentes,unsigned short espacos);
void sinalHall();




void logicaMenuPrincipal();
void logicaFonica();
void logicaHall();
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
#line 32 "C:/Users/Felipe-HOME/Documents/programas/PIC/signal-chooser/projeto_menus.c"
sbit voltar at RB4_bit;
sbit esquerda at RB5_bit;
sbit direita at RB6_bit;
sbit ok at RB7_bit;




unsigned int contador_rotacao;





void interrupt();
void interrupt_low();



void main()
{


 GIE_bit = 0x01;
 PEIE_bit = 0x01;
 IPEN_bit = 0x01;



 configInterruptTMR0();



 ADCON0 = 0x00;
 ADCON1 = 0x0F;

 TRISB = 0xF0;
 TRISD = 0x00;


 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);

 InicioLcd();
 delay_ms(1500);
 limpa_lcd = 1;
 limpaLcd();

 while(1)
 {
 logicaMenuPrincipal();

 }

}




void interrupt_low()
{
 interruptTMR0();
}
