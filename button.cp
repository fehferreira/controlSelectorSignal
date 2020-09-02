#line 1 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/alternador de sinais/button.c"
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
#line 15 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/alternador de sinais/button.c"
bit flagb1,
 flagb2,
 flagb3,
 flagb4,
 limpa_lcd;




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



void buttonRotacao()
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
 if(contT == 60055 || contT <= 60110) contT = 60055;
 else contT -= 55;
 limpa_lcd = 0x01;
 }

 if(!direita && flagb3)
 {
 flagb3 = 0x00;
 if(contT == 65535 || contT >= 65480) contT = 65535;
 else contT += 55;
 limpa_lcd = 0x01;
 }

 if(!ok && flagb4)
 {
 flagb4 = 0x00;
 flagConfirma = 1;
 limpa_lcd = 0x01;
 }
}
