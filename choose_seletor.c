/*
  CONTROLE DO SELETOR PARA ESCOLHA DOS SINAIS
  DEVIDCE: PIC18F4550       SIMULAÇAO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA:JULHO 2020
  CLOCK: 20MHz                CICLO DE MAQU: 200nS
*/
//-----------------------------------------------------------------------------
// --- INCLUINDO EXPORTAÇÕES

#include "choose_header.h"

//-----------------------------------------------------------------------------
// --- DEFININDO OS PROTÓTIPOS DAS FUNÇÕES

void seletorSignal(unsigned short signalSeletor);

//-----------------------------------------------------------------------------
// --- DESENVOLVENDO AS FUNÇÕES

void seletorSignal(unsigned short signalSeletor)
{
  char i;

  reset_selector = 0x01;
  reset_selector = 0x00;
  for(i = 0 ; i != signalSeletor ; i++)
  {
    selector = 0x01;
    selector = 0x00;
  }
}