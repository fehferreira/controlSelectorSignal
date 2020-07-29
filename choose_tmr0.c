/*
  ARQUIVO DE DEFINIÇÃO DAS FUNÇÕES DE CONTROLLER
  DEVIDCE: PIC18F4550       SIMULAÇAO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA:JULHO 2020
  CLOCK: 20MHz                CICLO DE MAQU: 200nS
*/
//-----------------------------------------------------------------------------
// --- INCLUINDO EXPORTAÇÕES

#include <choose_header.h>

//-----------------------------------------------------------------------------
//---------- TRATAMENTO DE INTERRUPÇÃO DO TIMER0 (TESTE DO BOTAO)----------

void interrupt_tmr0()
{
  if(TMR0IF_bit)
  {
    TMR0IF_bit = 0x00;                       //Limpa a flag de interrupção
    TMR0H = 0xB1;                            //Reiniciando os contadores (45536)
    TMR0L = 0xE0;                            //Reiniciando os contadores (45536)
    out_signal = ~out_signal;

    test_button();

  }
}