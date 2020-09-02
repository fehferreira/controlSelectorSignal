/*
  FUNÇÕES DE LÓGICA PARA OS BOTOES
  DEVIDCE: PIC18F4550        SIMULAÇAO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA: JULHO 2020
  CLOCK: 20MHz                CICLO DE MAQU: 200nS
*/
//-----------------------------------------------------------------------------
// ---- IMPORTANDO O CABEÇALHO DO PROJETO ----

#include "menu.h"

//----------------------------------------------------------------------------
// ---- DECLARAÇÃO DE VARIAVEIS -----

bit flagb1,
    flagb2,
    flagb3,
    flagb4,
    limpa_lcd;                                //Variaveis de auxilio dos botoes

//----------------------------------------------------------------------------
// --- DECLARAÇÃO DAS FUNÇÕES DE LÓGICA DE BOTOES ----

void buttonMenu()                           //Funcao que recebe valor do botao
{
  if(voltar   && !flagb1) flagb1 = 0x01;    //Botão foi apertado? Seta flagb1
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

//----------------------------------------------------------------------------

void buttonRotacao()
{
  if(voltar   && !flagb1) flagb1 = 0x01;    //Botão foi apertado? Seta flagb1
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
    if(contT == 60055 || contT <= 60110)  contT = 60055;
    else            contT -= 55;
    limpa_lcd = 0x01;
  }

  if(!direita && flagb3)
  {
    flagb3 = 0x00;                          //Limpa flagb3
    if(contT == 65535 || contT >= 65480)  contT = 65535;
    else              contT += 55;
    limpa_lcd = 0x01;
  }

  if(!ok && flagb4)
  {
    flagb4 = 0x00;                          //Limpa flagb4
    flagConfirma = 1;
    limpa_lcd = 0x01;
  }
}