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
bit limpa_lcd,
 flagb1,
 flagb2;

char pos_selector = 0x01,
 txt[7];




void interrupt();
void interrupt_low();
void limpaLcd();
void teste_button();
void impressao();



void main()
{


 GIE_bit = 0x01;
 PEIE_bit = 0x01;
 IPEN_bit = 0x01;

 TRISD = 0x00;
 TRISB = 0xF8;

 ADCON0 = 0x00;
 ADCON1 = 0x0F;



 flagb1 = 0x00;
 flagb2 = 0x00;
 limpa_lcd = 0x01;



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

 if(TMR0IF_bit)
 {
 TMR0IF_bit = 0x00;
 TMR0H = 0xB1;
 TMR0L = 0xE0;
  RD0_bit  = ~ RD0_bit ;

 teste_button();

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



void teste_button()
{
 if( RB6_bit  && !flagb1) flagb1 = 0x01;
 if( RB7_bit  && !flagb2) flagb2 = 0x01;

 if(! RB6_bit  && flagb1)
 {
 limpa_lcd = 0x01;
 flagb1 = 0x00;
  RB0_bit  = 0x01;
 pos_selector++;
 if(pos_selector >= 11) pos_selector = 1;
 }

 if(! RB7_bit  && flagb2)
 {
 char i;

 limpa_lcd = 0x01;
 flagb2 = 0x00;
  RB0_bit  = 0x01;
 pos_selector--;
 if(pos_selector <= 0) pos_selector = 10;
  RB1_bit  = 0x01;
  RB1_bit  = 0x00;
 for(i = 0 ; i != pos_selector ; i++)
 {
  RB0_bit  = 0x01;
  RB0_bit  = 0x00;
 }
 }

  RB0_bit  = 0x00;

}



void impressao()
{
 Lcd_Chr(1,1,'J');
 Lcd_Chr_Cp('C');
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp('M');
 Lcd_Chr_Cp('O');
 Lcd_Chr_Cp('D');
 Lcd_Chr_Cp('U');
 Lcd_Chr_Cp('L');
 Lcd_Chr_Cp('O');
 Lcd_Chr_Cp('S');

 Lcd_Chr(2,1,'P');
 Lcd_Chr_Cp('O');
 Lcd_Chr_Cp('S');
 Lcd_Chr_Cp(':');

 IntToStr(pos_selector,txt);
 Lcd_Out(2,6,txt);

}
