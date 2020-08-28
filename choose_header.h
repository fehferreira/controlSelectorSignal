/*
  HEADER DO PROJETO DO PROGRAMA SELETOR DE SINAL
  DEVIDCE: PIC18F4550       SIMULAÇAO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA:JULHO 2020
  CLOCK: 20MHz                CICLO DE MAQU: 200nS
*/
//-----------------------------------------------------------------------------
// --- MAPEAMENTO DE HARDWARE

#define out_signal     RD0_bit
#define selector       RB0_bit
#define reset_selector RB1_bit
#define voltar         RB4_bit
#define esquerda       RB5_bit
#define direita        RB6_bit
#define ok             RB7_bit


//-----------------------------------------------------------------------------
// --- PROTÓTIPOS DAS FUNÇÕES

// --- VIEW ---

void limpaLcd();

void inicioLcd();
void menuPrincipal(char var_menu);

void menu1();
void menu2();

// --- CONTROLLER ---

char controle_menu(char var_atual);

void logicaMenuPrincipal();

void logicaMenu1();
void logicaMenu2();

void buttonMenu();

// --- SELETOR ---

void seletorSignal(unsigned short signalSeletor);

// --- TIMER0 ---
void configTMR0();
void interrupt_tmr0();

// --- TIMER1 ---
void configTMR1();
void interrupt_tmr1();

//-----------------------------------------------------------------------------
// --- CRIANDO VARIAVEIS GLOBAIS

extern bit limpa_lcd,
           flagConfirma,
           flagVoltar,
           flaginicio;
           
extern unsigned short var_menu,
                      pos_menu,
                      max_menu,
                      min_menu;
                      
extern char vetor_menu[5];