#line 1 "C:/Users/Felipe-Oficina/Documents/Programação/PIC/alternador de sinais/choose_view.c"
#line 1 "c:/users/felipe-oficina/documents/programação/pic/alternador de sinais/choose_header.h"
#line 21 "c:/users/felipe-oficina/documents/programação/pic/alternador de sinais/choose_header.h"
void impressao();
void limpaLcd();



void test_button();



void interrupt_tmr0();




extern bit limpa_lcd;
extern char pos_selector;
#line 15 "C:/Users/Felipe-Oficina/Documents/Programação/PIC/alternador de sinais/choose_view.c"
void impressao();




bit limpa_lcd;




void impressao()
{
 char txt[7];

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



void limpaLcd()
{
 if(limpa_lcd)
 {
 Lcd_Cmd(_LCD_CLEAR);
 limpa_lcd = 0x00;
 }
}
