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

void incrementoSignal();
void decrementoSignal();

//-----------------------------------------------------------------------------
// --- DEFINIDO VARIAVEIS GLOBAIS

unsigned short pos_selector = 1;

//-----------------------------------------------------------------------------
// --- DESENVOLVENDO AS FUNÇÕES

void incrementoSignal()
{
  selector = 0x01;
  selector = 0x00;
}


void decrementoSignal()
{
  char i;

  selector = 0x01;
  reset_selector = 0x01;
  reset_selector = 0x00;
  for(i = 0 ; i != pos_selector ; i++)
  {
    selector = 0x01;
    selector = 0x00;
  }
}

