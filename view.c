/*
  MENUS DESENVOLVIDOS PARA O PROJETO COM VETORES
  DEVIDCE: PIC18F4550        SIMULA�AO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA: JULHO 2020
  CLOCK: 20MHz                CICLO DE MAQU: 200nS

*/
//-----------------------------------------------------------------------------
// ---- IMPORTANDO O CABE�ALHO DO PROJETO ----

#include "menu.h"

//-----------------------------------------------------------------------------
// ---- DECLARANDO VARI�VEIS UTILIZADAS ----

char txt[7];

char opcoesSinal[2] [16] = {"SINAL INDUTIVO", "SINAL HALL"};

//----------------------------------------------------------------------------
// --- DECLARA�AO DAS FUN�OES DE IMPRESSAO NO LCD

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
  
  //Definindo o maximo de op��es
  max_menu = 1;
  min_menu = 0;

  Lcd_Chr(1,1,'T');
  Lcd_Chr_Cp('I');
  Lcd_Chr_Cp('P');
  Lcd_Chr_Cp('O');
  Lcd_Chr_Cp(' ');
  Lcd_Chr_Cp('S');
  Lcd_Chr_Cp('I');
  Lcd_Chr_Cp('N');
  Lcd_Chr_Cp('A');
  Lcd_Chr_Cp('L');
  Lcd_Chr_Cp(' ');
  Lcd_Chr_Cp(':');
  
  Lcd_Out(2,1,opcoesSinal[var_menu]);
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

void escolhaDentes(unsigned short var_menu)
{
  limpaLcd();

  //Definindo o maximo de op��es
  max_menu = 150;
  min_menu = 0;

  Lcd_Chr(1,1,'Q');
  Lcd_Chr_Cp('U');
  Lcd_Chr_Cp('A');
  Lcd_Chr_Cp('N');
  Lcd_Chr_Cp('T');
  Lcd_Chr_Cp(' ');
  Lcd_Chr_Cp('D');
  Lcd_Chr_Cp('E');
  Lcd_Chr_Cp('N');
  Lcd_Chr_Cp('T');
  Lcd_Chr_Cp('E');
  Lcd_Chr_Cp('S');
  Lcd_Chr_Cp(' ');
  Lcd_Chr_Cp(':');

  ByteToStr(var_menu,txt);
  Lcd_Out(2,2,txt);
}

//-----------------------------------------------------------------------------

void escolhaEspacos(unsigned short var_menu)
{
  limpaLcd();

  //Definindo o maximo de op��es
  max_menu = 150;
  min_menu = 0;

  Lcd_Chr(1,1,'Q');
  Lcd_Chr_Cp('U');
  Lcd_Chr_Cp('A');
  Lcd_Chr_Cp('N');
  Lcd_Chr_Cp('T');
  Lcd_Chr_Cp(' ');
  Lcd_Chr_Cp('E');
  Lcd_Chr_Cp('S');
  Lcd_Chr_Cp('P');
  Lcd_Chr_Cp('A');
  Lcd_Chr_Cp('C');
  Lcd_Chr_Cp('O');
  Lcd_Chr_Cp('S');
  Lcd_Chr_Cp(' ');
  Lcd_Chr_Cp(':');

  ByteToStr(var_menu,txt);
  Lcd_Out(2,2,txt);
}

//-----------------------------------------------------------------------------

void sinalFonica(unsigned short dentes,unsigned short espacos)
{
  limpaLcd();

  Lcd_Chr(1,1,'S');
  Lcd_Chr_Cp('I');
  Lcd_Chr_Cp('N');
  Lcd_Chr_Cp('A');
  Lcd_Chr_Cp('L');
  Lcd_Chr_Cp(' ');
  Lcd_Chr_Cp('F');
  Lcd_Chr_Cp('O');
  Lcd_Chr_Cp('N');
  Lcd_Chr_Cp('I');
  Lcd_Chr_Cp('C');
  Lcd_Chr_Cp('A');
  Lcd_Chr_Cp(' ');
  Lcd_Chr_Cp(':');

  ByteToStr(dentes,txt);
  Lcd_Out(2,1,Ltrim(txt));
  
  Lcd_Chr(2,4,'-');
  
  ByteToStr(espacos,txt);
  Lcd_Out(2,6,Ltrim(txt));
}

//-----------------------------------------------------------------------------

void sinalHall()
{
  limpaLcd();

  Lcd_Chr(1,1,'S');
  Lcd_Chr_Cp('I');
  Lcd_Chr_Cp('N');
  Lcd_Chr_Cp('A');
  Lcd_Chr_Cp('L');
  Lcd_Chr_Cp(' ');
  Lcd_Chr_Cp('H');
  Lcd_Chr_Cp('A');
  Lcd_Chr_Cp('L');
  Lcd_Chr_Cp('L');
  Lcd_Chr_Cp(' ');
  Lcd_Chr_Cp(':');
}

//-----------------------------------------------------------------------------


