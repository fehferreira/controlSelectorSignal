/*
  PROJETO DE SELETOR DE SINAIS DIFERENTES COM A MESMA SAIDA
  DEVIDCE: PIC18F4550       SIMULAÇAO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA:JULHO 2020
  CLOCK: 20MHz                CICLO DE MAQU: 200nS
*/
//-----------------------------------------------------------------------------
// --- DEFININDO LCD

sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;

//-----------------------------------------------------------------------------
// --- MAPEAMENTO DE HARDWARE
#define b1         RB6_bit
#define b2         RB7_bit
#define out_signal RD0_bit
#define selector   RD1_bit


//---------------------------------------------------------------------------
// --- CRIAÇAO DE VARIAVEIS GLOBAIS



//-----------------------------------------------------------------------------
// --- CRIANDO PROTÓTIPOS DAS FUNÇOES

void interrupt();
void interrupt_low();

//---------------------------------------------------------------------------
// --- CÓDIGO PRINCIPAL
void main()
{
 //--------------------------------------------------------------------------
 //CONFIGURACOES






  while(1)
   {

   }

}//FINAL MAIN

//----------------------------------------------------------------------------
// --- DECLARAÇAO DAS FUNÇOES

void interrupt()
{

}

//----------------------------------------------------------------------------

void interrupt_low()
{

}

//----------------------------------------------------------------------------
