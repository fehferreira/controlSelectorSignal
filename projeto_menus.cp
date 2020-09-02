#line 1 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/alternador de sinais/projeto_menus.c"
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
#line 39 "c:/users/felipe - oficina/documents/programação/pic/alternador de sinais/header.h"
void interruptTMR1();
void configInterruptTMR1();
void ligarTMR1();
void desligaTMR1();


void interruptTMR0();
void configInterruptTMR0();
void ligarTMR0();
void desligaTMR0();
#line 1 "c:/users/felipe - oficina/documents/programação/pic/alternador de sinais/menu.h"
#line 11 "c:/users/felipe - oficina/documents/programação/pic/alternador de sinais/menu.h"
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
void buttonRotacao();




extern bit limpa_lcd,
 flagVoltar,
 flagConfirma,
 flagHall,
 flagRotacao;

extern unsigned short var_menu,
 pos_menu,
 dentes,
 espacos,
 valor_tmr1,
 vetor_menu[5];

extern unsigned int counter_rotacao,
 max_menu,
 min_menu,
 contT;
#line 32 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/alternador de sinais/projeto_menus.c"
sbit voltar at RB4_bit;
sbit esquerda at RB5_bit;
sbit direita at RB6_bit;
sbit ok at RB7_bit;




void interrupt();
void interrupt_low();



void main()
{


 GIE_bit = 0x01;
 PEIE_bit = 0x01;
 IPEN_bit = 0x01;



 configInterruptTMR0();



 configInterruptTMR1();



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



void interrupt()
{
 interruptTMR1();
}
