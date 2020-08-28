/*
  CONTROLE DO SELETOR PARA ESCOLHA DOS SINAIS
  DEVIDCE: PIC18F4550       SIMULA�AO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA:JULHO 2020
  CLOCK: 20MHz                CICLO DE MAQU: 200nS
*/
//-----------------------------------------------------------------------------
// --- INCLUINDO EXPORTA��ES

#include "choose_header.h"

//-----------------------------------------------------------------------------
// --- DEFININDO OS PROT�TIPOS DAS FUN��ES

void seletorSignal(unsigned short signalSeletor);

//-----------------------------------------------------------------------------
// --- DESENVOLVENDO AS FUN��ES

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