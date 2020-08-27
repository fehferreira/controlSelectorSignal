/*
  PROJETO DE SELETOR DE SINAIS DIFERENTES COM A MESMA SAIDA
  DEVIDCE: PIC18F4550       SIMULAÇAO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA:JULHO 2020
  CLOCK: 20MHz                CICLO DE MAQU: 200nS
*/
//-----------------------------------------------------------------------------
// --- DEFININDO LCD

#include <choose_header.h>

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

//---------------------------------------------------------------------------
// --- CÓDIGO PRINCIPAL
void main()
{
 //-------------------- CONFIGURAÇÕES GERAIS --------------------------------
 
 GIE_bit = 0x01;                             //Habilitando interrupções globais
 PEIE_bit = 0x01;                            //Habilitando interrupções de periféricos
 IPEN_bit = 0x01;                            //Habilitando interrupções HIGH e LOW
 
 TRISD = 0x00;                               //Configura PORTD como saida
 TRISB = 0xF8;                               //Configura RB0:RB2 como saida, restante entrada
 
 ADCON0 = 0x00;                              //Conversor A-D Desabilitado
 ADCON1 = 0x0F;                              //Configurando saída como Digitais
 
 //-------------- CONFIGURANDO TIMER0 ( TESTE DE BOTÃO ) --------------------
 
 limpa_lcd = 1;
 
 T0CON = 0b10001000;                         //Configurando TMR0
                                             //incremento por ciclo de máquina
                                             //prescaler de 1:1
                                             //utilizando 2 contadores de 8 bits

 TMR0H = 0xB1;                               //Iniciando os contadores (45536)
 TMR0L = 0xE0;                               //Iniciando os contadores (45536)
 TMR0IF_bit = 0x00;                          //Limpando a flag de interrupção
 TMR0IP_bit = 0x01;                          //Configurando como interrupção de alta prioridade
 TMR0IE_bit = 0x01;                          //Habilita interrupção do TMR0
 
 //-------------- CONFIGURANDO LCD (BIBLIOTECA MIKROC) ----------------------
 
 Lcd_Init();                                 //Inicializa o LCD
 Lcd_Cmd(_LCD_CURSOR_OFF);                   //Desabilita o curso do LCD

  while(1)
   {
     limpaLcd();
     impressao();
   }

}//FINAL MAIN

//----------------------------------------------------------------------------
// --- DECLARAÇAO DAS FUNÇOES

void interrupt()
{
  interrupt_tmr0();
}

//----------------------------------------------------------------------------