#line 1 "C:/Users/Felipe-HOME/Documents/programas/PIC/signal-chooser/view.c"
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
#line 16 "C:/Users/Felipe-HOME/Documents/programas/PIC/signal-chooser/view.c"
char txt[7];

char opcoesSinal[2] [16] = {"SINAL INDUTIVO", "SINAL HALL"};

unsigned contT;

float valor_tmr1;




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


 max_menu = 1;
 min_menu = 0;

 Lcd_Chr(1,1,'T');
 Lcd_Chr_Cp('I');
 Lcd_Chr_Cp('P');
 Lcd_Chr_Cp('O');
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp('S');
 Lcd_Chr_Cp('I');
 Lcd_Chr_Cp('N');
 Lcd_Chr_Cp('A');
 Lcd_Chr_Cp('L');
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp(':');

 Lcd_Out(2,1,opcoesSinal[var_menu]);
}



void limpaLcd()
{
 if(limpa_lcd)
 {
 Lcd_Cmd(_LCD_CLEAR);
 limpa_lcd = 0x00;
 }
}



void escolhaDentes(unsigned short var_menu)
{
 limpaLcd();


 max_menu = 150;
 min_menu = 0;

 Lcd_Chr(1,1,'Q');
 Lcd_Chr_Cp('U');
 Lcd_Chr_Cp('A');
 Lcd_Chr_Cp('N');
 Lcd_Chr_Cp('T');
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp('D');
 Lcd_Chr_Cp('E');
 Lcd_Chr_Cp('N');
 Lcd_Chr_Cp('T');
 Lcd_Chr_Cp('E');
 Lcd_Chr_Cp('S');
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp(':');

 ByteToStr(var_menu,txt);
 Lcd_Out(2,2,txt);
}



void escolhaEspacos(unsigned short var_menu)
{
 limpaLcd();


 max_menu = 150;
 min_menu = 0;

 Lcd_Chr(1,1,'Q');
 Lcd_Chr_Cp('U');
 Lcd_Chr_Cp('A');
 Lcd_Chr_Cp('N');
 Lcd_Chr_Cp('T');
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp('E');
 Lcd_Chr_Cp('S');
 Lcd_Chr_Cp('P');
 Lcd_Chr_Cp('A');
 Lcd_Chr_Cp('C');
 Lcd_Chr_Cp('O');
 Lcd_Chr_Cp('S');
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp(':');

 ByteToStr(var_menu,txt);
 Lcd_Out(2,2,txt);
}



void sinalFonica()
{

 limpaLcd();

 Lcd_Chr(1,1,'S');
 Lcd_Chr_Cp('I');
 Lcd_Chr_Cp('N');
 Lcd_Chr_Cp('A');
 Lcd_Chr_Cp('L');
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp('F');
 Lcd_Chr_Cp('O');
 Lcd_Chr_Cp('N');
 Lcd_Chr_Cp('I');
 Lcd_Chr_Cp('C');
 Lcd_Chr_Cp('A');
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp(':');

 ByteToStr(dentes,txt);
 Lcd_Out(2,1,Ltrim(txt));

 Lcd_Chr(2,4,'-');

 ByteToStr(espacos,txt);
 Lcd_Out(2,6,Ltrim(txt));

 Lcd_Chr(2,16,'%');

 valor_tmr1 = (1/(2*((65535 - contT) * 1 * 2E-7)));
 FloatToStr_FixLen(valor_tmr1,txt,5);
 Lcd_Out(2,11,Ltrim(txt));

}



void sinalHall()
{
 limpaLcd();

 dentes = 2;
 espacos = 1;

 Lcd_Chr(1,1,'S');
 Lcd_Chr_Cp('I');
 Lcd_Chr_Cp('N');
 Lcd_Chr_Cp('A');
 Lcd_Chr_Cp('L');
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp('H');
 Lcd_Chr_Cp('A');
 Lcd_Chr_Cp('L');
 Lcd_Chr_Cp('L');
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp(':');
}
