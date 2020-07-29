/*
  ARQUIVO DE DEFINI��O DAS FUN��ES DE CONTROLLER
  DEVIDCE: PIC18F4550       SIMULA�AO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA:JULHO 2020
  CLOCK: 20MHz                CICLO DE MAQU: 200nS
*/
//-----------------------------------------------------------------------------
// --- INCLUINDO EXPORTA��ES

#include <choose_header.h>

//-----------------------------------------------------------------------------
// --- CRIANDO VARI�VEIS NECESS�RIAS

bit flagb1,
    flagb2;

//-----------------------------------------------------------------------------
// --- DESENVOLVENDO AS FUN��ES

void test_button()
{
  if(b1 && !flagb1)  flagb1 = 0x01;
  if(b2 && !flagb2)  flagb2 = 0x01;

  if(!b1 && flagb1)
  {
    limpa_lcd = 0x01;
    flagb1 = 0x00;
    selector = 0x01;
    pos_selector++;
    if(pos_selector >= 11) pos_selector = 1;
  }

  if(!b2 && flagb2)
  {
    char i;

    limpa_lcd = 0x01;
    flagb2 = 0x00;
    selector = 0x01;
    pos_selector--;
    if(pos_selector <= 0) pos_selector = 10;
    reset_selector = 0x01;
    reset_selector = 0x00;
    for(i = 0 ; i != pos_selector ; i++)
    {
      selector = 0x01;
      selector = 0x00;
    }
  }

  selector = 0x00;

}

//----------------------------------------------------------------------------