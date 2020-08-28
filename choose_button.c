/*
  FUNCOES DE LÓGICA PARA OS BOTÕES - "CONTROLER"
  DEVIDCE: PIC18F4550        SIMULACAO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA: JULHO 2020
  CLOCK: 20MHz                CICLO DE MAQU: 200nS
*/
//-----------------------------------------------------------------------------
// ---- IMPORTANDO O CABECALHO DO PROJETO ----

#include "choose_header.h"

//----------------------------------------------------------------------------
// ---- DECLARACAO DE VARIAVEIS -----

bit flagb1,
    flagb2,
    flagb3,
    flagb4,
    flagConfirma,
    flagVoltar,
    flaginicio,
    limpa_lcd;                                //Variaveis de auxilio dos botoes

unsigned short var_menu = 1,
               pos_menu,
               max_menu,
               min_menu;

char vetor_menu[5],
     txt[7];                                  //Variavel para situacoes de condiï¿½oes

unsigned int counter_rotacao;

//----------------------------------------------------------------------------
// --- DECLARACAO DAS FUNCOES DE LOGICA DE BOTOES ----

void buttonMenu()                           //Funcao que recebe valor do botao
{
  if(voltar   && !flagb1) flagb1 = 0x01;    //Botao foi apertado? Seta flagb1
  if(esquerda && !flagb2) flagb2 = 0x01;    //Botao foi apertado? Seta flagb2
  if(direita  && !flagb3) flagb3 = 0x01;    //Botao foi apertado? Seta flagb3
  if(ok       && !flagb4) flagb4 = 0x01;    //Botao foi apertado? Seta flagb4

  if(!voltar && flagb1)                     //Botao solto?
  {
    if(flaginicio == 0)
    {
      flagb1 = 0x00;                          //Limpa flagb1
      flagVoltar = 1;
      flagConfirma = 1;
      limpa_lcd = 0x01;
    }
  }

  if(!esquerda && flagb2)
  {
    if(flaginicio == 0)
    {
      flagb2 = 0x00;                          //Limpa flagb2
      if(var_menu <= max_menu && var_menu > min_menu) var_menu --;
      else                             var_menu = min_menu;
      limpa_lcd = 0x01;
    }
  }

  if(!direita && flagb3)
  {
    if(flaginicio == 0)
    {
      flagb3 = 0x00;                          //Limpa flagb3
      if(var_menu < max_menu && var_menu >= 0) var_menu ++;
      else                             var_menu = max_menu;
      limpa_lcd = 0x01;
    }
  }

  if(!ok && flagb4)
  {
    if(flaginicio == 1)
    {
      flagb4 = 0x00;
      flaginicio = 0;
      limpa_lcd = 1;
    }else
    {
      flagb4 = 0x00;                          //Limpa flagb4
      flagConfirma = 1;
      limpa_lcd = 0x01;
    }
  }

}

//----------------------------------------------------------------------------
// --- FUNÇAO DE CONTROLE DE NIVEL E SUBNIVEL DE MENUS ---

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

