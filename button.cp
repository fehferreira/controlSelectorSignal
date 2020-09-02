#line 1 "C:/Users/Felipe-HOME/Documents/programas/PIC/signal-chooser/button.c"
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
#line 15 "C:/Users/Felipe-HOME/Documents/programas/PIC/signal-chooser/button.c"
bit flagb1,
 flagb2,
 flagb3,
 flagb4,
 limpa_lcd;

unsigned int counter_rotacao;




void buttonMenu()
{
 if(voltar && !flagb1) flagb1 = 0x01;
 if(esquerda && !flagb2) flagb2 = 0x01;
 if(direita && !flagb3) flagb3 = 0x01;
 if(ok && !flagb4) flagb4 = 0x01;

 if(!voltar && flagb1)
 {
 flagb1 = 0x00;
 flagVoltar = 1;
 flagConfirma = 1;
 limpa_lcd = 0x01;
 }

 if(!esquerda && flagb2)
 {
 flagb2 = 0x00;
 if(var_menu <= max_menu && var_menu > min_menu) var_menu --;
 else var_menu = min_menu;
 limpa_lcd = 0x01;
 }

 if(!direita && flagb3)
 {
 flagb3 = 0x00;
 if(var_menu < max_menu && var_menu >= 0) var_menu ++;
 else var_menu = max_menu;
 limpa_lcd = 0x01;
 }

 if(!ok && flagb4)
 {
 flagb4 = 0x00;
 flagConfirma = 1;
 limpa_lcd = 0x01;
 }

}
