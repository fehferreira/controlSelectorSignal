#line 1 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/alternador de sinais/choose_logicMenu.c"
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
#line 15 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/alternador de sinais/choose_logicMenu.c"
enum tipoSinais
{
 fonica, hall, generica
}sinais;




void desligaSinais()
{
#line 29 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/alternador de sinais/choose_logicMenu.c"
}




void logicaMenuPrincipal()
{

 max_menu = 2;
 min_menu = 1;

 while(flagConfirma != 1)
 {
 switch(var_menu)
 {
 case 1: menu1();break;
 case 2: menu2();break;
 }
 }
 flagConfirma = 0;
 var_menu = controle_menu(var_menu);
 if(flagVoltar != 1)
 {
 switch(vetor_menu[pos_menu-1])
 {
 case 1: logicaMenu1();break;
 case 2: logicaMenu2();break;
 }
 }
 flagVoltar = 0x00;
}



void logicaMenu1()
{

 max_menu = 2;
 min_menu = 1;


 seletorSignal(fonica);




 while(flagVoltar != 1)
 {
 while(flagConfirma != 1)
 {
 switch(var_menu)
 {

 }
 }
 flagConfirma = 0;
 var_menu = controle_menu(var_menu);
 if(flagVoltar != 1)
 {
 switch(vetor_menu[pos_menu-1])
 {

 }
 }
 }
 flagVoltar = 0;
}



void logicaMenu2()
{

 max_menu = 1;
 min_menu = 1;


 seletorSignal(hall);




 while(flagVoltar != 1)
 {
 while(flagConfirma != 1)
 {
 switch(var_menu)
 {
#line 119 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/alternador de sinais/choose_logicMenu.c"
 }
 }
 flagConfirma = 0;
 var_menu = controle_menu(var_menu);
 if(flagVoltar != 1)
 {



 }
 }
 flagVoltar = 0;
}
