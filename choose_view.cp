#line 1 "C:/Users/Felipe - Oficina/Documents/Programa��o/PIC/alternador de sinais/choose_view.c"
#line 1 "c:/users/felipe - oficina/documents/programa��o/pic/alternador de sinais/choose_header.h"
#line 24 "c:/users/felipe - oficina/documents/programa��o/pic/alternador de sinais/choose_header.h"
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
#line 15 "C:/Users/Felipe - Oficina/Documents/Programa��o/PIC/alternador de sinais/choose_view.c"
void limpaLcd();

void inicioLcd();
void menuPrincipal(char var_menu);

void menu1();
void menu2();
#line 1 "c:/users/felipe - oficina/documents/programa��o/pic/alternador de sinais/choose_header.h"
#line 24 "c:/users/felipe - oficina/documents/programa��o/pic/alternador de sinais/choose_header.h"
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
#line 31 "C:/Users/Felipe - Oficina/Documents/Programa��o/PIC/alternador de sinais/choose_view.c"
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



void limpaLcd()
{
 if(limpa_lcd)
 {
 Lcd_Cmd(_LCD_CLEAR);
 limpa_lcd = 0x00;
 }
}



void menu1()
{
 limpaLcd();
 Lcd_Chr(1,1,'S');
 Lcd_Chr_Cp('I');
 Lcd_Chr_Cp('N');
 Lcd_Chr_Cp('A');
 Lcd_Chr_Cp('L');
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp('R');
 Lcd_Chr_Cp('O');
 Lcd_Chr_Cp('T');
 Lcd_Chr_Cp('A');
 Lcd_Chr_Cp('C');
 Lcd_Chr_Cp('A');
 Lcd_Chr_Cp('O');

 Lcd_Chr(2,1,'I');
 Lcd_Chr_Cp('N');
 Lcd_Chr_Cp('D');
 Lcd_Chr_Cp('U');
 Lcd_Chr_Cp('C');
 Lcd_Chr_Cp('A');
 Lcd_Chr_Cp('O');
 Lcd_Chr_Cp(':');

 Lcd_Chr(2,11,'-');
 Lcd_Chr_Cp('>');
}



void menu2()
{
 limpaLcd();
 Lcd_Chr(1,1,'S');
 Lcd_Chr_Cp('I');
 Lcd_Chr_Cp('N');
 Lcd_Chr_Cp('A');
 Lcd_Chr_Cp('L');
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp('R');
 Lcd_Chr_Cp('O');
 Lcd_Chr_Cp('T');
 Lcd_Chr_Cp('A');
 Lcd_Chr_Cp('C');
 Lcd_Chr_Cp('A');
 Lcd_Chr_Cp('O');

 Lcd_Chr(2,1,'H');
 Lcd_Chr_Cp('A');
 Lcd_Chr_Cp('L');
 Lcd_Chr_Cp('L');
 Lcd_Chr_Cp(':');

 Lcd_Chr(2,11,'-');
 Lcd_Chr_Cp('>');
}
