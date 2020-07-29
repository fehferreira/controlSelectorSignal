/*
  ARQUIVO DE DEFINI��O DAS FUN��ES DE VIEW
  DEVIDCE: PIC18F4550       SIMULA�AO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA:JULHO 2020
  CLOCK: 20MHz                CICLO DE MAQU: 200nS
*/
//-----------------------------------------------------------------------------
// --- INCLUINDO EXPORTA��ES

#include <choose_header.h>

//-----------------------------------------------------------------------------
// --- PROT�TIPOS DAS FUN��ES

void impressao();

//---------------------------------------------------------------------------
// --- CRIA�AO DE VARIAVEIS

bit limpa_lcd;

//-----------------------------------------------------------------------------
// --- DESENVOLVENDO A L�GICA DAS FUN��ES

void impressao()
{
  char txt[7];
  
  Lcd_Chr(1,1,'J');
  Lcd_Chr_Cp('C');
  Lcd_Chr_Cp(' ');
  Lcd_Chr_Cp('M');
  Lcd_Chr_Cp('O');
  Lcd_Chr_Cp('D');
  Lcd_Chr_Cp('U');
  Lcd_Chr_Cp('L');
  Lcd_Chr_Cp('O');
  Lcd_Chr_Cp('S');

  Lcd_Chr(2,1,'P');
  Lcd_Chr_Cp('O');
  Lcd_Chr_Cp('S');
  Lcd_Chr_Cp(':');

  IntToStr(pos_selector,txt);
  Lcd_Out(2,6,txt);

}

//---------------------------------------------------------------------------

void limpaLcd()
{
  if(limpa_lcd)
  {
    Lcd_Cmd(_LCD_CLEAR);
    limpa_lcd = 0x00;
  }
}

//----------------------------------------------------------------------------
