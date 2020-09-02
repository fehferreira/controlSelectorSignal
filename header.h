/*
  HEADER DO PROJETO SELETOR DE SINAL FONICA E HALL
  DEVIDCE: PIC18F4550        SIMULAÇAO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA: JULHO 2020
  CLOCK: 20MHz                CICLO DE MAQU: 200nS
  
*/
//-----------------------------------------------------------------------------
// --- MAPEAMENTO DE HARDWARE (DEFININDO LCD) ---

sbit LCD_RS at LATD2_bit;
sbit LCD_EN at LATD3_bit;
sbit LCD_D4 at LATD4_bit;
sbit LCD_D5 at LATD5_bit;
sbit LCD_D6 at LATD6_bit;
sbit LCD_D7 at LATD7_bit;

sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;


#define rotacao  LATD0_bit
#define rotacao2 LATD1_bit
#define fase     LATB3_bit

//-----------------------------------------------------------------------------
// ---- DECLARANDO VARIAVEIS GLOBAIS DO PROJETO ----



//-----------------------------------------------------------------------------
// ---- DECLARANDO FUNCOES PARA SEREM DESENVOLVIDAS ----

// --- FUNCAO DE INTERRUPCAO TMR1 (SINAL DE ROTACAO) ---
void interruptTMR1();
void configInterruptTMR1();
void ligarTMR1();
void desligaTMR1();

// --- FUNCAO DE INTERRUPCAO TMR0 (TESTE BOTAO) ---
void interruptTMR0();
void configInterruptTMR0();
void ligarTMR0();
void desligaTMR0();




