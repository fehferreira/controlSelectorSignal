#line 1 "C:/Users/Felipe - Oficina/Documents/Programa��o/PIC/alternador de sinais/controller_menus.c"
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
 flaginicio;
#line 15 "C:/Users/Felipe - Oficina/Documents/Programa��o/PIC/alternador de sinais/controller_menus.c"
enum tipoSinais
{
 fonica, hall, generica
}sinais;




bit flagb1,
 flagb2,
 flagb3,
 flagb4,
 flagConfirma,
 flagVoltar,
 flaginicio,
 limpa_lcd;

char var_menu = 1,
 pos_menu,
 max_menu,
 min_menu,
 vetor_menu[5],
 txt[7];

unsigned int counter_rotacao;




void buttonMenu()
{
 if( RB4_bit  && !flagb1) flagb1 = 0x01;
 if( RB5_bit  && !flagb2) flagb2 = 0x01;
 if( RB6_bit  && !flagb3) flagb3 = 0x01;
 if( RB7_bit  && !flagb4) flagb4 = 0x01;

 if(! RB4_bit  && flagb1)
 {
 if(flaginicio == 0)
 {
 flagb1 = 0x00;
 flagVoltar = 1;
 flagConfirma = 1;
 limpa_lcd = 0x01;
 }
 }

 if(! RB5_bit  && flagb2)
 {
 if(flaginicio == 0)
 {
 flagb2 = 0x00;
 if(var_menu <= max_menu && var_menu > min_menu) var_menu --;
 else var_menu = min_menu;
 limpa_lcd = 0x01;
 }
 }

 if(! RB6_bit  && flagb3)
 {
 if(flaginicio == 0)
 {
 flagb3 = 0x00;
 if(var_menu < max_menu && var_menu >= 0) var_menu ++;
 else var_menu = max_menu;
 limpa_lcd = 0x01;
 }
 }

 if(! RB7_bit  && flagb4)
 {
 if(flaginicio == 1)
 {
 flagb4 = 0x00;
 flaginicio = 0;
 limpa_lcd = 1;
 }else
 {
 flagb4 = 0x00;
 flagConfirma = 1;
 limpa_lcd = 0x01;
 }
 }

}




char controle_menu(char var_atual)
{
 if(flagVoltar == 0)
 {
 vetor_menu[pos_menu] = var_atual;
 pos_menu++;
 var_atual = 1;
 }else if(pos_menu > 0)
 {
 pos_menu--;
 var_atual = vetor_menu[pos_menu];
 }

 return var_atual;
}





void desligaSinais()
{
#line 130 "C:/Users/Felipe - Oficina/Documents/Programa��o/PIC/alternador de sinais/controller_menus.c"
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
#line 220 "C:/Users/Felipe - Oficina/Documents/Programa��o/PIC/alternador de sinais/controller_menus.c"
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
