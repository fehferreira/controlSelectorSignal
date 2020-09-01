/*
  MENUS DESENVOLVIDOS PARA O PROJETO COM VETORES
  DEVIDCE: PIC18F4550        SIMULAÇAO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA: JULHO 2020
  CLOCK: 20MHz                CICLO DE MAQU: 200nS

*/
//-----------------------------------------------------------------------------
// ---- IMPORTANDO O CABEÇALHO DO PROJETO ----

#include "menu.h"

//-----------------------------------------------------------------------------
// ---- DECLARANDO VARIÁVEIS UTILIZADAS ----

char opcoesMontadora[3] [16] = {"FIAT ->", "FORD ->", "GM ->"};
char fiatModelo[2] [16] = {"IAW 1G7 ->", "IAW 59FB ->"};

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

void menuPrincipal(unsigned short var_menu)
{
  limpaLcd();
  
  //Definindo o maximo de opções
  max_menu = 2;
  min_menu = 0;

  Lcd_Chr(1,1,'M');
  Lcd_Chr_Cp('O');
  Lcd_Chr_Cp('N');
  Lcd_Chr_Cp('T');
  Lcd_Chr_Cp('A');
  Lcd_Chr_Cp('D');
  Lcd_Chr_Cp('O');
  Lcd_Chr_Cp('R');
  Lcd_Chr_Cp('A');
  Lcd_Chr_Cp(' ');
  Lcd_Chr_Cp(':');
  
  Lcd_Out(2,1,opcoesMontadora[var_menu]);
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

void menu1(unsigned short var_menu)
{
  limpaLcd();

  //Definindo o maximo de opções
  max_menu = 1;
  min_menu = 0;

  Lcd_Chr(1,1,'F');
  Lcd_Chr_Cp('I');
  Lcd_Chr_Cp('A');
  Lcd_Chr_Cp('T');
  Lcd_Chr_Cp(' ');
  Lcd_Chr_Cp('-');
  Lcd_Chr_Cp(' ');
  Lcd_Chr_Cp('M');
  Lcd_Chr_Cp('O');
  Lcd_Chr_Cp('D');
  Lcd_Chr_Cp('E');
  Lcd_Chr_Cp('L');
  Lcd_Chr_Cp('O');
  Lcd_Chr_Cp(':');

  Lcd_Out(2,1,fiatModelo[var_menu]);

}

//==============================================================================
//---------------   SUB MENUS - NVL 1   -----------------
