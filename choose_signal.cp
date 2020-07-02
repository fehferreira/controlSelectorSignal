#line 1 "C:/Users/João/Documents/Programação/PIC/alternador de sinais/choose_signal.c"
#line 10 "C:/Users/João/Documents/Programação/PIC/alternador de sinais/choose_signal.c"
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
#line 38 "C:/Users/João/Documents/Programação/PIC/alternador de sinais/choose_signal.c"
bit limpa_lcd;




void interrupt();
void interrupt_low();
void limpaLcd();



void main()
{


 GIE_bit = 0x01;
 PEIE_bit = 0x01;
 IPEN_bit = 0x01;

 TRISD = 0x00;
 TRISB = 0xF8;




 T0CON = 0b10001000;




 TMR0H = 0xB1;
 TMR0L = 0xE0;
 TMR0IF_bit = 0x00;
 TMR0IP_bit = 0x01;
 TMR0IE_bit = 0x01;



 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 Lcd_Out_Cp("JC MODULOS");




 while(1)
 {

 }

}




void interrupt()
{

 if(TMR0IF_bit)
 {
 TMR0IF_bit = 0x00;
 TMR0H = 0xB1;
 TMR0L = 0xE0;
  RD0_bit  = ~ RD0_bit ;

 }

}



void interrupt_low()
{

}



void limpaLcd()
{
 if(limpa_lcd)
 {
 Lcd_Cmd(_LCD_CLEAR);
 limpa_lcd = 0x00;
 }
}
