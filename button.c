/*
  FUN��ES DE L�GICA PARA OS BOTOES
  DEVIDCE: PIC18F4550        SIMULA�AO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA: JULHO 2020
  CLOCK: 20MHz                CICLO DE MAQU: 200nS
*/
//-----------------------------------------------------------------------------
// ---- IMPORTANDO O CABE�ALHO DO PROJETO ----

#include "menu.h"

//----------------------------------------------------------------------------
// ---- DECLARA��O DE VARIAVEIS -----

bit flagb1,
    flagb2,
    flagb3,
    flagb4,
    limpa_lcd;                                //Variaveis de auxilio dos botoes

unsigned int counter_rotacao;

//----------------------------------------------------------------------------
// --- DECLARA��O DAS FUN��ES DE L�GICA DE BOTOES ----

void buttonMenu()                           //Funcao que recebe valor do botao
{
  if(voltar   && !flagb1) flagb1 = 0x01;    //Bot�o foi apertado? Seta flagb1
  if(esquerda && !flagb2) flagb2 = 0x01;    //Botao foi apertado? Seta flagb2
  if(direita  && !flagb3) flagb3 = 0x01;    //Botao foi apertado? Seta flagb3
  if(ok       && !flagb4) flagb4 = 0x01;    //Botao foi apertado? Seta flagb4

  if(!voltar && flagb1)                     //Botao solto?
  {
    flagb1 = 0x00;                          //Limpa flagb1
    flagVoltar = 1;
    flagConfirma = 1;
    limpa_lcd = 0x01;
  }

  if(!esquerda && flagb2)
  {
    flagb2 = 0x00;                          //Limpa flagb2
    if(var_menu <= max_menu && var_menu > min_menu) var_menu --;
    else                             var_menu = min_menu;
    limpa_lcd = 0x01;
  }

  if(!direita && flagb3)
  {
    flagb3 = 0x00;                          //Limpa flagb3
    if(var_menu < max_menu && var_menu >= 0) var_menu ++;
    else                             var_menu = max_menu;
    limpa_lcd = 0x01;
  }

  if(!ok && flagb4)
  {
    flagb4 = 0x00;                          //Limpa flagb4
    flagConfirma = 1;
    limpa_lcd = 0x01;
  }

}