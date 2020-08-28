/*
  ARQUIVO DE DEFINIÇÃO DAS FUNÇÕES DE VIEW
  DEVIDCE: PIC18F4550       SIMULAÇAO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA:JULHO 2020
  CLOCK: 20MHz                CICLO DE MAQU: 200nS
*/
//-----------------------------------------------------------------------------
// --- INCLUINDO EXPORTAÇÕES

#include <choose_header.h>

//-----------------------------------------------------------------------------
// --- PROTÓTIPOS DAS FUNÇÕES

void limpaLcd();

void inicioLcd();
void menuPrincipal(char var_menu);

void menu1();
void menu2();

//-----------------------------------------------------------------------------
// ---- IMPORTANDO O CABEÇALHO DO PROJETO ----

#include "choose_header.h"

//----------------------------------------------------------------------------
// --- DECLARAÇAO DAS FUNÇOES DE IMPRESSAO NO LCD

void inicioLcd()
{
  limpaLcd();

  Lcd_Chr(1,4,'J');
  Lcd_Chr_Cp('C');
  Lcd_Chr_Cp(' ');
  Lcd_Chr_Cp('M');
  Lcd_Chr_Cp('O');
  Lcd_Chr_Cp('D');
  Lcd_Chr_Cp('U');
  Lcd_Chr_Cp('L');
  Lcd_Chr_Cp('O');
  Lcd_Chr_Cp('S');

  Lcd_Chr(2,1,'S');
  Lcd_Chr_Cp('I');
  Lcd_Chr_Cp('M');
  Lcd_Chr_Cp('U');
  Lcd_Chr_Cp(' ');
  Lcd_Chr_Cp('D');
  Lcd_Chr_Cp('E');
  Lcd_Chr_Cp(' ');
  Lcd_Chr_Cp('C');
  Lcd_Chr_Cp('E');
  Lcd_Chr_Cp('N');
  Lcd_Chr_Cp('T');
  Lcd_Chr_Cp('R');
  Lcd_Chr_Cp('A');
  Lcd_Chr_Cp('I');
  Lcd_Chr_Cp('S');
}

//-----------------------------------------------------------------------------

void limpaLcd()
{
  if(limpa_lcd)
  {
    Lcd_Cmd(_LCD_CLEAR);
    limpa_lcd = 0x00;
  }
}

//-----------------------------------------------------------------------------

void menu1()
{
  limpaLcd();
  Lcd_Chr(1,1,'S');
  Lcd_Chr_Cp('I');
  Lcd_Chr_Cp('N');
  Lcd_Chr_Cp('A');
  Lcd_Chr_Cp('L');
  Lcd_Chr_Cp(' ');
  Lcd_Chr_Cp('R');
  Lcd_Chr_Cp('O');
  Lcd_Chr_Cp('T');
  Lcd_Chr_Cp('A');
  Lcd_Chr_Cp('C');
  Lcd_Chr_Cp('A');
  Lcd_Chr_Cp('O');
  
  Lcd_Chr(2,1,'I');
  Lcd_Chr_Cp('N');
  Lcd_Chr_Cp('D');
  Lcd_Chr_Cp('U');
  Lcd_Chr_Cp('C');
  Lcd_Chr_Cp('A');
  Lcd_Chr_Cp('O');
  Lcd_Chr_Cp(':');
  
  Lcd_Chr(2,11,'-');
  Lcd_Chr_Cp('>');
}

//-----------------------------------------------------------------------------

void menu2()
{
  limpaLcd();
  Lcd_Chr(1,1,'S');
  Lcd_Chr_Cp('I');
  Lcd_Chr_Cp('N');
  Lcd_Chr_Cp('A');
  Lcd_Chr_Cp('L');
  Lcd_Chr_Cp(' ');
  Lcd_Chr_Cp('R');
  Lcd_Chr_Cp('O');
  Lcd_Chr_Cp('T');
  Lcd_Chr_Cp('A');
  Lcd_Chr_Cp('C');
  Lcd_Chr_Cp('A');
  Lcd_Chr_Cp('O');

  Lcd_Chr(2,1,'H');
  Lcd_Chr_Cp('A');
  Lcd_Chr_Cp('L');
  Lcd_Chr_Cp('L');
  Lcd_Chr_Cp(':');

  Lcd_Chr(2,11,'-');
  Lcd_Chr_Cp('>');
}

//-----------------------------------------------------------------------------