#line 1 "C:/Users/Felipe-Oficina/Documents/Programação/PIC/alternador de sinais/choose_main.c"
#line 1 "c:/users/felipe-oficina/documents/programação/pic/alternador de sinais/choose_header.h"
#line 21 "c:/users/felipe-oficina/documents/programação/pic/alternador de sinais/choose_header.h"
void impressao();
void limpaLcd();



void test_button();



void interrupt_tmr0();




extern bit limpa_lcd;
extern char pos_selector;
#line 15 "C:/Users/Felipe-Oficina/Documents/Programação/PIC/alternador de sinais/choose_main.c"
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




char pos_selector = 1;



void main()
{


 GIE_bit = 0x01;
 PEIE_bit = 0x01;
 IPEN_bit = 0x01;

 TRISD = 0x00;
 TRISB = 0xF8;

 ADCON0 = 0x00;
 ADCON1 = 0x0F;



 limpa_lcd = 1;

 T0CON = 0b10001000;




 TMR0H = 0xB1;
 TMR0L = 0xE0;
 TMR0IF_bit = 0x00;
 TMR0IP_bit = 0x01;
 TMR0IE_bit = 0x01;



 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);

 while(1)
 {
 limpaLcd();
 impressao();
 }

}




void interrupt()
{
 interrupt_tmr0();
}
