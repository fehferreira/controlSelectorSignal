/*
  FUNÇÕES DE LÓGICA PARA OS MENUS - "CONTROLER"
  DEVIDCE: PIC18F4550        SIMULAÇAO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA: JULHO 2020
  CLOCK: 20MHz                CICLO DE MAQU: 200nS
*/
//-----------------------------------------------------------------------------
// ---- IMPORTANDO O CABEÇALHO DO PROJETO ----

#include "menu.h"

//----------------------------------------------------------------------------
// ---- DECLARAÇÃO DE VARIAVEIS -----

bit flagConfirma,
    flagVoltar;
    
unsigned short var_menu,
               pos_menu,
               max_menu,
               min_menu,
               vetor_menu[5];
    
//----------------------------------------------------------------------------
// --- FUNÇÃO DE CONTROLE DE NIVEL E SUBNIVEL DE MENUS ---

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

//----------------------------------------------------------------------------
// --- DECLARAÇAO DAS FUNÇOES LOGICAS DOS MENUS E SUBMENUS -----

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
        case 0: logicaMenu1();break;
    }
  }
  
  flagVoltar = 0;
}

//----------------------------------------------------------------------------

void logicaMenu1()
{
  while(flagVoltar != 1)
  {
    while(flagConfirma != 1)
    {
      menu1(var_menu);
    }
    
    flagConfirma = 0;
    var_menu = controle_menu(var_menu);
    
    if(flagVoltar != 1)
    {
      /*switch(vetor_menu[pos_menu-1])
      {
        case 1: logicaMenu1_1();break;
      }*/
    }
  }
  flagVoltar = 0;
}