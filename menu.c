/*
  FUN��ES DE L�GICA PARA OS MENUS - "CONTROLER"
  DEVIDCE: PIC18F4550        SIMULA�AO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA: SETEMBRO 2020
  CLOCK: 20MHz                CICLO DE MAQU: 200nS
*/
//-----------------------------------------------------------------------------
// ---- IMPORTANDO O CABE�ALHO DO PROJETO ----

#include "menu.h"
#include "header.h"

//----------------------------------------------------------------------------
// ---- DECLARA��O DE VARIAVEIS -----

bit flagConfirma,
    flagVoltar,
    flagHall,
    flagRotacao;
    
unsigned short var_menu,
               pos_menu,
               dentes,
               espacos,
               vetor_menu[5];

unsigned max_menu,
         min_menu;

//----------------------------------------------------------------------------
// --- FUN��O DE CONTROLE DE NIVEL E SUBNIVEL DE MENUS ---

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
// --- DECLARA�AO DAS FUN�OES LOGICAS DOS MENUS E SUBMENUS -----

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
        case 1: logicaHall();  break;
    }
  }
  
  flagVoltar = 0;
}

//----------------------------------------------------------------------------

void logicaFonica()
{
  while(flagVoltar != 1)
  {
    
    var_menu = 60;
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
    
    flagRotacao = 1;
    ligarTMR1();
    
    while(flagConfirma != 1)
    {
      sinalFonica();
    }
    
    flagRotacao = 0;
    flagConfirma = 0;
    desligaTMR1();
  }
  flagVoltar = 0;
}

//----------------------------------------------------------------------------

void logicaHall()
{
  while(flagVoltar != 1)
  {
    ligarTMR1();
    flagHall = 1;

    while(flagConfirma != 1)
    {
      sinalHall();
    }

    flagHall = 0;
    flagConfirma = 0;
    desligaTMR1();
  }
  flagVoltar = 0;
}

//----------------------------------------------------------------------------