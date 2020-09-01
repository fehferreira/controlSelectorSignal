/*
  HEADER DO PROJETO SELETOR DE SINAL FONICA E HALL
  DEVIDCE: PIC18F4550        SIMULAÇAO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA: JULHO 2020
  CLOCK: 20MHz                CICLO DE MAQU: 200nS

*/
//-----------------------------------------------------------------------------
// ---- IMPORTANDO O CABEÇALHO DO PROJETO ----

#include "header.h"
#include "menu.h"

//-----------------------------------------------------------------------------
// --- FUNCAO DE INTERRUPCAO TMR0 (TESTE BOTAO) ---

void interruptTMR0()
{
  if(TMR0IF_bit)                           //Houve interrupçao externa?
  {                                        //Sim...
    TMR0IF_bit = 0x00;                     //Limpa flag da interrupçao
    TMR0H = 0xB1;                          //Reinicializa TMR0H
    TMR0L = 0xE0;                          //Reinicializa TMR0L

    buttonMenu();
  }
}

//-----------------------------------------------------------------------------

void configInterruptTMR0()
{
   T0CON = 0b10001000;                     //Configurando TIMER0
                                           //Habilita TIMER0
                                           //Prescaler 1:1
                                           //2 counters de 8bits
                                           //Incremento por ciclo de máquina
   TMR0H = 0xB1;                           //Inicializa o counter High do TIMER0
   TMR0L = 0xE0;                           //Inicializa o counter LOW do TIMER0
   TMR0IE_bit = 0x01;                      //Habilita interrupção do TIMER0
   TMR0IP_bit = 0x00;                      //Configura TMR0 como baixa prioridade.
}

//-----------------------------------------------------------------------------