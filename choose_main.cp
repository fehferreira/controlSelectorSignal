#line 1 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/alternador de sinais/choose_main.c"
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
#line 15 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/alternador de sinais/choose_main.c"
sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;



void main()
{


 GIE_bit = 0x01;
 PEIE_bit = 0x01;
 IPEN_bit = 0x01;

 TRISD = 0x00;
 TRISB = 0xF8;

 ADCON0 = 0x00;
 ADCON1 = 0x0F;

 flaginicio = 1;
 limpa_lcd = 1;



 configTMR0();



 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);

 while(1)
 {
 if(flaginicio == 1) inicioLcd();
 else logicaMenuPrincipal();
 }

}




void interrupt()
{
 interrupt_tmr1();
}

void interrupt_low()
{
 interrupt_tmr0();
}
