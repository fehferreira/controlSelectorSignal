/*
  PROJETOS SELETOR DE SINAIS FONICA E HALL
  DEVIDCE: PIC18F4550        SIMULA�AO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA: JULHO 2020
  CLOCK: 20MHz                CICLO DE MAQU: 200nS

   
   CALCULO DE INTERRUP�AO PARA VERIFICA�AO DOS BOTOES - TIMER0 EM 8BITS
   
   ciclo de maquina = 1/(frequencia/4)
   
   ciclo de maquina = 1/(2E+7/4) = 0,000001s ou 1uS
   
   Timer0_Ovf = (65536 - (TMR0H + TMR0L)) * prescaler * ciclo de maquina
   
   0,004 ~= (65536 - x) * 1 * 2E-7
   
   x = 65536 - (0,004/(1 * 2E-7))
   
   x = 45536             TMR0H = 0xB1 / TMR0L = 0xE0
    
*/
//-----------------------------------------------------------------------------
// ---- IMPORTANDO O CABE�ALHO DO PROJETO ----

#include "header.h"
#include "menu.h"

//-----------------------------------------------------------------------------
// --- DEFININDO LCD

sbit voltar   at   RB4_bit;
sbit esquerda at   RB5_bit;
sbit direita  at   RB6_bit;
sbit ok       at   RB7_bit;

//---------------------------------------------------------------------------
// --- CRIA�AO DE VARIAVEIS GLOBAIS

unsigned int contador_rotacao;               //Valor recebido pelo modulo ADC


//-----------------------------------------------------------------------------
// --- CRIANDO PROT�TIPOS DAS FUN�OES ----

void interrupt();
void interrupt_low();

//---------------------------------------------------------------------------
// --- C�DIGO PRINCIPAL
void main()
{
   // --- CONFIGURA��ES GERAIS DE INTERRUP��O ---
   
   GIE_bit = 0x01;                         //Habilitando interrup��es gerais
   PEIE_bit = 0x01;                        //Habilitando interrup��es de perif�ricos
   IPEN_bit = 0x01;                        //Habilita prioridade de interrup��o

   // --- CONFIGURANDO TIMER0 (TESTE DE BOTOES) ---
   
   T0CON = 0b10001000;                     //Configurando TIMER0
                                           //Habilita TIMER0
                                           //Prescaler 1:1
                                           //2 counters de 8bits
                                           //Incremento por ciclo de m�quina
   TMR0H = 0xB1;                           //Inicializa o counter High do TIMER0
   TMR0L = 0xE0;                           //Inicializa o counter LOW do TIMER0
   TMR0IE_bit = 0x01;                      //Habilita interrup��o do TIMER0
   TMR0IP_bit = 0x00;                      //Configura TMR0 como baixa prioridade.

   // --- CONFIGURANDO AS ENTRADAS ---
   
   ADCON0 = 0x00;                          //Desabilita o modulo ADC
   ADCON1 = 0x0F;                          //Configurando PORTA:PORTB como entradas digitais
   
   TRISB = 0xF0;                           //Configura RB4:RB7 como entrada digital.
   TRISD = 0x00;                           //Configura PORTD como sa�da
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
// --- DECLARA�AO DAS FUN�OES LOGICAS

void interrupt_low()                           //Funcao de interrupcao
{
  if(TMR0IF_bit)                           //Houve interrup�ao externa?
  {                                        //Sim...
    TMR0IF_bit = 0x00;                     //Limpa flag da interrup�ao
    TMR0H = 0xB1;                          //Reinicializa TMR0H
    TMR0L = 0xE0;                          //Reinicializa TMR0L
    
    buttonMenu();
  }
}

//----------------------------------------------------------------------------