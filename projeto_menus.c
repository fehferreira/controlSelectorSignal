/*
  PROJETOS SELETOR DE SINAIS FONICA E HALL
  DEVIDCE: PIC18F4550        SIMULAÇAO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA: JULHO 2020
  CLOCK: 20MHz                CICLO DE MAQU: 200nS

   
   CALCULO DE INTERRUPÇAO PARA VERIFICAÇAO DOS BOTOES - TIMER0 EM 8BITS
   
   ciclo de maquina = 1/(frequencia/4)
   
   ciclo de maquina = 1/(2E+7/4) = 0,000001s ou 1uS
   
   Timer0_Ovf = (65536 - (TMR0H + TMR0L)) * prescaler * ciclo de maquina
   
   0,004 ~= (65536 - x) * 1 * 2E-7
   
   x = 65536 - (0,004/(1 * 2E-7))
   
   x = 45536             TMR0H = 0xB1 / TMR0L = 0xE0
    
*/
//-----------------------------------------------------------------------------
// ---- IMPORTANDO O CABEÇALHO DO PROJETO ----

#include "header.h"
#include "menu.h"

//-----------------------------------------------------------------------------
// --- DEFININDO LCD

sbit voltar   at   RB4_bit;
sbit esquerda at   RB5_bit;
sbit direita  at   RB6_bit;
sbit ok       at   RB7_bit;

//---------------------------------------------------------------------------
// --- CRIAÇAO DE VARIAVEIS GLOBAIS

unsigned int contador_rotacao;               //Valor recebido pelo modulo ADC


//-----------------------------------------------------------------------------
// --- CRIANDO PROTÓTIPOS DAS FUNÇOES ----

void interrupt();
void interrupt_low();

//---------------------------------------------------------------------------
// --- CÓDIGO PRINCIPAL
void main()
{
   // --- CONFIGURAÇÕES GERAIS DE INTERRUPÇÃO ---
   
   GIE_bit = 0x01;                         //Habilitando interrupções gerais
   PEIE_bit = 0x01;                        //Habilitando interrupções de periféricos
   IPEN_bit = 0x01;                        //Habilita prioridade de interrupção

   // --- CONFIGURANDO TIMER0 (TESTE DE BOTOES) ---
   
   configInterruptTMR0();

   // --- CONFIGURANDO AS ENTRADAS ---
   
   ADCON0 = 0x00;                          //Desabilita o modulo ADC
   ADCON1 = 0x0F;                          //Configurando PORTA:PORTB como entradas digitais
   
   TRISB = 0xF0;                           //Configura RB4:RB7 como entrada digital.
   TRISD = 0x00;                           //Configura PORTD como saída
   // --- INICIANDO LCD ---

   Lcd_Init();                             //Inicializa o LCD
   Lcd_Cmd(_LCD_CURSOR_OFF);
   
   InicioLcd();
   delay_ms(1500);
   limpa_lcd = 1;
   limpaLcd();
   
   while(1)
   {
     logicaMenuPrincipal();
     
   }//FINAL LOOP

}//FINAL MAIN

//----------------------------------------------------------------------------
// --- DECLARAÇAO DAS FUNÇOES LOGICAS

void interrupt_low()                           //Funcao de interrupcao
{
  interruptTMR0();
}

//----------------------------------------------------------------------------