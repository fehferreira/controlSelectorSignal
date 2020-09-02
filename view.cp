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
#line 16 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/alternador de sinais/view.c"
char txt[7],
 txt2[17];

char opcoesSinal[2] [16] = {"SINAL INDUTIVO", "SINAL HALL"};

unsigned contT = 60055;

unsigned short valor_tmr1;




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

 Lcd_Chr(2,16,'%');

 ByteToStr(dentes,txt);
 Lcd_Out(2,1,Ltrim(txt));

 Lcd_Chr(2,3,'-');

 ByteToStr(espacos,txt);
 Lcd_Out(2,4,Ltrim(txt));

 ByteToStr(valor_tmr1,txt2);
 Lcd_Out(2,13,Ltrim(txt2));

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

 Lcd_Chr(2,16,'%');

 ByteToStr(valor_tmr1,txt2);
 Lcd_Out(2,13,Ltrim(txt2));
}
