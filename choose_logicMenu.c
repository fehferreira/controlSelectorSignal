/*
  FUNCOES DE LÓGICA PARA OS MENUS - "CONTROLER"
  DEVIDCE: PIC18F4550        SIMULACAO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA: JULHO 2020
  CLOCK: 20MHz                CICLO DE MAQU: 200nS
*/
//-----------------------------------------------------------------------------
// ---- IMPORTANDO O CABECALHO DO PROJETO ----

#include "choose_header.h"

//-----------------------------------------------------------------------------
// ---- DEFININDO ENUM'S ----

enum tipoSinais
{
  fonica, hall, generica
}sinais;

//----------------------------------------------------------------------------
// --- FUNÇÃO DE CONTROLE DE NIVEL E SUBNIVEL DE MENUS ---

void desligaSinais()
{
/*TMR1ON_bit = 0x00;
  TMR3ON_bit = 0x00;
  rotacao = 0x00;
  fase = 0x00;*/
}

//----------------------------------------------------------------------------
// --- DECLARAÇAO DAS FUNCOES LOGICAS DOS MENUS E SUBMENUS -----

void logicaMenuPrincipal()
{
  //Definindo a quantidade de menu
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

//----------------------------------------------------------------------------

void logicaMenu1()
{
  //Definindo a quantidade de menu
  max_menu = 2;
  min_menu = 1;
  
  //Chamo a função de selecao do sinal desejado
  seletorSignal(fonica);
  
  //Configuro o TMR1 - (GERADOR DO SINAL)
  /*configTMR1();*/

  while(flagVoltar != 1)
  {
    while(flagConfirma != 1)
    {
      switch(var_menu)
      {
        /*case 1: sub_menu1_1();break;*/
      }
    }
    flagConfirma = 0;
    var_menu = controle_menu(var_menu);
    if(flagVoltar != 1)
    {
      switch(vetor_menu[pos_menu-1])
      {
        /*case 1: logicaMenu1_1();break;*/
      }
    }
  }
  flagVoltar = 0;
}

//----------------------------------------------------------------------------

void logicaMenu2()
{
  //Definindo a quantidade de menu
  max_menu = 1;
  min_menu = 1;
  
  //Chamo a função de selecao do sinal desejado
  seletorSignal(hall);

  //Configuro o TMR1 - (GERADOR DO SINAL)
  /*configTMR1();*/

  while(flagVoltar != 1)
  {
    while(flagConfirma != 1)
    {
      switch(var_menu)
      {
        /*case 1: sub_menu2_1();break;
        case 2: sub_menu2_2();break;*/
      }
    }
    flagConfirma = 0;
    var_menu = controle_menu(var_menu);
    if(flagVoltar != 1)
    {
      //switch(vetor_menu[pos_menu])
      //{
      //}
    }
  }
  flagVoltar = 0;
}

//----------------------------------------------------------------------------
// --- DECLARACAO DAS FUNCOES LOGICAS DOS SUBMENUS ----