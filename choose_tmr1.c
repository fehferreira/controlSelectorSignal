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


void configTMR1()
{
 T0CON = 0b10001000;                         //Configurando TMR0
                                             //incremento por ciclo de máquina
                                             //prescaler de 1:1
                                             //utilizando 2 contadores de 8 bits

 TMR0H = 0xB1;                               //Iniciando os contadores (45536)
 TMR0L = 0xE0;                               //Iniciando os contadores (45536)
 TMR0IF_bit = 0x00;                          //Limpando a flag de interrupção
 TMR0IP_bit = 0x01;                          //Configurando como interrupção de alta prioridade
 TMR0IE_bit = 0x01;                          //Habilita interrupção do TMR0
}

//-----------------------------------------------------------------------------

void interrupt_tmr1()
{
  if(TMR1IF_bit)
  {
    TMR1IF_bit = 0x00;                       //Limpa a flag de interrupção
    TMR1H = 0xB1;                            //Reiniciando os contadores (45536)
    TMR1L = 0xE0;                            //Reiniciando os contadores (45536)
    out_signal = ~out_signal;

  }
}