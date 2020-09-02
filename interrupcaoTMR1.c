/*
  FUNCOES PARA CONFIGURACAO DA INTERRUPCAO DO TIMER1 (SINAL DE ROTACAO)
  DEVIDCE: PIC18F4550        SIMULAÇAO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA: SETEMBRO 2020
  CLOCK: 20MHz                CICLO DE MAQU: 200nS
*/
//-----------------------------------------------------------------------------
// ---- IMPORTANDO O CABEÇALHO DO PROJETO ----

#include "header.h"
#include "menu.h"

//----------------------------------------------------------------------------
// ---- DECLARAÇÃO DE VARIAVEIS -----

unsigned short contador_rotacao;

//----------------------------------------------------------------------------
// --- FUNÇÃO DE CONTROLE DE NIVEL E SUBNIVEL DE MENUS ---

void configInterruptTMR1()
{
  T1CON = 0b01000000;                      //Configuraçao TIMER1
                                           //Clock interno
                                           //Prescaler 1:1
                                           //Desliga modulo TIMER1

  TMR1L = 0x97;                            //Inicializa variaveis de contagem
  TMR1H = 0xEA;                            //Inicializa variaveis de contagem
  TMR1IE_bit = 0x01;                       //Habilita interrupçao do TIMER1
  TMR1IP_bit = 0x01;                       //Configura a interrupção como HighPriority
}

//----------------------------------------------------------------------------

void interruptTMR1()
{
  if(TMR1IF_bit)                           //Houve interrupçao do TIMER1?
  {                                        //Sim...
    
    if(!flagHall)
    {
      contador_rotacao ++;                   //incrementa sinal de rotaçao

      if(contador_rotacao < ((dentes*2)-(espacos*2)))  rotacao = ~rotacao;
      if(contador_rotacao >= ((dentes*2)-(espacos*2))) rotacao = 0x00;
      if(contador_rotacao == (dentes*2))               contador_rotacao = 0x00;
      
    }else
    {
      rotacao2 = ~rotacao2;
    }
    
    TMR1L = contT << 8;
    TMR1H = contT >> 8;
    
    valor_tmr1 = (0.018 * (contT - 60000)) ;

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
  rotacao2 = 0;
  fase = 0;
  TMR1ON_bit = 0;
}

//-----------------------------------------------------------------------------