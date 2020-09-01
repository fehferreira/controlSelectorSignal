#line 1 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/alternador de sinais/view.c"
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
#line 16 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/alternador de sinais/view.c"
char opcoesMontadora[3] [16] = {"FIAT ->", "FORD ->", "GM ->"};
char fiatModelo[2] [16] = {"IAW 1G7 ->", "IAW 59FB ->"};




void inicioLcd()
{
 limpaLcd();

 Lcd_Chr(1,4,'J');
 Lcd_Chr_Cp('C');
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp('M');
 Lcd_Chr_Cp('O');
 Lcd_Chr_Cp('D');
 Lcd_Chr_Cp('U');
 Lcd_Chr_Cp('L');
 Lcd_Chr_Cp('O');
 Lcd_Chr_Cp('S');

 Lcd_Chr(2,1,'S');
 Lcd_Chr_Cp('I');
 Lcd_Chr_Cp('M');
 Lcd_Chr_Cp('U');
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp('D');
 Lcd_Chr_Cp('E');
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp('C');
 Lcd_Chr_Cp('E');
 Lcd_Chr_Cp('N');
 Lcd_Chr_Cp('T');
 Lcd_Chr_Cp('R');
 Lcd_Chr_Cp('A');
 Lcd_Chr_Cp('I');
 Lcd_Chr_Cp('S');
}



void menuPrincipal(unsigned short var_menu)
{
 limpaLcd();


 max_menu = 2;
 min_menu = 0;

 Lcd_Chr(1,1,'M');
 Lcd_Chr_Cp('O');
 Lcd_Chr_Cp('N');
 Lcd_Chr_Cp('T');
 Lcd_Chr_Cp('A');
 Lcd_Chr_Cp('D');
 Lcd_Chr_Cp('O');
 Lcd_Chr_Cp('R');
 Lcd_Chr_Cp('A');
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp(':');

 Lcd_Out(2,1,opcoesMontadora[var_menu]);
}



void limpaLcd()
{
 if(limpa_lcd)
 {
 Lcd_Cmd(_LCD_CLEAR);
 limpa_lcd = 0x00;
 }
}



void menu1(unsigned short var_menu)
{
 limpaLcd();


 max_menu = 1;
 min_menu = 0;

 Lcd_Chr(1,1,'F');
 Lcd_Chr_Cp('I');
 Lcd_Chr_Cp('A');
 Lcd_Chr_Cp('T');
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp('-');
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp('M');
 Lcd_Chr_Cp('O');
 Lcd_Chr_Cp('D');
 Lcd_Chr_Cp('E');
 Lcd_Chr_Cp('L');
 Lcd_Chr_Cp('O');
 Lcd_Chr_Cp(':');

 Lcd_Out(2,1,fiatModelo[var_menu]);

}
