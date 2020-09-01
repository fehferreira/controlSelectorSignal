#line 1 "C:/Users/Felipe-HOME/Documents/programas/PIC/signal-chooser/menu.c"
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
void sinalFonica(unsigned short dentes,unsigned short espacos);
void sinalHall();




void logicaMenuPrincipal();
void logicaFonica();
void logicaHall();
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
#line 15 "C:/Users/Felipe-HOME/Documents/programas/PIC/signal-chooser/menu.c"
bit flagConfirma,
 flagVoltar;

unsigned short var_menu,
 pos_menu,
 max_menu,
 min_menu,
 vetor_menu[5];




char controle_menu(char var_atual)
{
 if(flagVoltar == 0)
 {
 vetor_menu[pos_menu] = var_atual;
 pos_menu++;
 var_atual = 0;
 }else if(pos_menu > 0)
 {
 pos_menu--;
 var_atual = vetor_menu[pos_menu];
 }

 return var_atual;
}




void logicaMenuPrincipal()
{
 while(flagVoltar != 1)
 {
 while(flagConfirma != 1)
 {
 menuPrincipal(var_menu);
 }

 flagConfirma = 0;
 var_menu = controle_menu(var_menu);

 switch(vetor_menu[pos_menu-1])
 {
 case 0: logicaFonica();break;
 case 1: logicaHall(); break;
 }
 }

 flagVoltar = 0;
}



void logicaFonica()
{
 unsigned short dentes, espacos;

 while(flagVoltar != 1)
 {
 while(flagConfirma != 1)
 {
 escolhaDentes(var_menu);
 }
 flagConfirma = 0;
 dentes = var_menu;
 var_menu = 0;

 while(flagConfirma != 1)
 {
 escolhaEspacos(var_menu);
 }
 flagConfirma = 0;
 espacos = var_menu;
 var_menu = 0;

 while(flagConfirma != 1)
 {
 sinalFonica(dentes,espacos);
 }
 flagConfirma = 0;
 var_menu = controle_menu(var_menu);

 if(flagVoltar != 1)
 {
#line 105 "C:/Users/Felipe-HOME/Documents/programas/PIC/signal-chooser/menu.c"
 }
 }
 flagVoltar = 0;
}



void logicaHall()
{
 while(flagVoltar != 1)
 {

 while(flagConfirma != 1)
 {
 sinalHall();
 }
 flagConfirma = 0;
 }
 flagVoltar = 0;
}
