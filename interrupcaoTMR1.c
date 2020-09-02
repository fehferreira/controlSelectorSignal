/*
  FUNCOES PARA CONFIGURACAO DA INTERRUPCAO DO TIMER1 (SINAL DE ROTACAO)
  DEVIDCE: PIC18F4550        SIMULA�AO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA: SETEMBRO 2020
  CLOCK: 20MHz                CICLO DE MAQU: 200nS
*/
//-----------------------------------------------------------------------------
// ---- IMPORTANDO O CABE�ALHO DO PROJETO ----

#include "header.h"
#include "menu.h"

//----------------------------------------------------------------------------
// ---- DECLARA��O DE VARIAVEIS -----

unsigned short contador_rotacao;

//----------------------------------------------------------------------------
// --- FUN��O DE CONTROLE DE NIVEL E SUBNIVEL DE MENUS ---

void configInterruptTMR1()
{
  T1CON = 0b01000000;                      //Configura�ao TIMER1
                                           //Clock interno
                                           //Prescaler 1:1
                                           //Desliga modulo TIMER1

  TMR1L = 0x00;                            //Inicializa variaveis de contagem
  TMR1H = 0x00;                            //Inicializa variaveis de contagem
  TMR1IE_bit = 0x01;                       //Habilita interrup�ao do TIMER1
  TMR1IP_bit = 0x01;                       //Configura a interrup��o como HighPriority
}

//----------------------------------------------------------------------------

void interruptTMR1()
{
  if(TMR1IF_bit)                           //Houve interrup�ao do TIMER1?
  {                                        //Sim...
    
    if(!flagHall)
    {
      contador_rotacao ++;                   //incrementa sinal de rota�ao

      if(contador_rotacao < ((dentes*2) - (espacos*2))) rotacao = ~rotacao;
      if(contador_rotacao >= ((dentes*2) - (espacos*2)))
      {
        fase = ~fase;
        rotacao = 0x00;
      }
      if(contador_rotacao == (dentes*2))
      {
        contador_rotacao = 0x00;
        fase = 0x00;
      }
      
    }else
    {
      rotacao2 = ~rotacao2;
    }
    
    TMR1L = contT << 8;
    TMR1H = contT >> 8;
    
    valor_tmr1 = contT;

    TMR1IF_bit = 0x00;                     //Limpa a flag do TIMER1
    
  }
}

//-----------------------------------------------------------------------------

void ligarTMR1()
{
  TMR1ON_bit = 1;
}

//-----------------------------------------------------------------------------

void desligaTMR1()
{
  rotacao = 0;
  fase = 0;
  TMR1ON_bit = 0;
}

//-----------------------------------------------------------------------------