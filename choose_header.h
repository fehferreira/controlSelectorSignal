/*
  HEADER DO PROJETO DO PROGRAMA SELETOR DE SINAL
  DEVIDCE: PIC18F4550       SIMULAÇAO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA:JULHO 2020
  CLOCK: 20MHz                CICLO DE MAQU: 200nS
*/
//-----------------------------------------------------------------------------
// --- MAPEAMENTO DE HARDWARE

#define b1             RB6_bit
#define b2             RB7_bit
#define out_signal     RD0_bit
#define selector       RB0_bit
#define reset_selector RB1_bit

//-----------------------------------------------------------------------------
// --- PROTÓTIPOS DAS FUNÇÕES

// --- VIEW ---

void impressao();
void limpaLcd();

// --- CONTROLLER ---

void test_button();

// --- SELETOR ---

void incrementoSignal();
void decrementoSignal();

// --- TIMER0 ---

void interrupt_tmr0();

//-----------------------------------------------------------------------------
// --- CRIANDO VARIAVEIS GLOBAIS

extern bit limpa_lcd;
extern unsigned short pos_selector;