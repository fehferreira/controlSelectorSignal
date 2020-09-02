/*
  HEADER DA CONFIGURACAO DOS MENUS
  DEVIDCE: PIC18F4550        SIMULA�AO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA: SETEMBRO 2020
  CLOCK: 20MHz                CICLO DE MAQU: 200nS

*/
//-----------------------------------------------------------------------------
// --- MAPEAMENTO DE HARDWARE

extern sfr sbit voltar;
extern sfr sbit esquerda;
extern sfr sbit direita;
extern sfr sbit ok;

//-----------------------------------------------------------------------------
// ---- DEFININDO OS PROT�TIPOS DAS FUN��ES DO VIEW ----

void limpaLcd();
void inicioLcd();

void menuPrincipal(unsigned short var_menu);
void escolhaDentes(unsigned short var_menu);
void escolhaEspacos(unsigned short var_menu);
void sinalFonica();
void sinalHall();

//----------------------------------------------------------------------------
// --- DECLARA��O DOS PROT�TIPOS DAS FUN��ES DO CONTROLLER ----

void logicaMenuPrincipal();
void logicaFonica();
void logicaHall();
void buttonMenu();

//-----------------------------------------------------------------------------
// ---- DECLARANDO VARIAVEIS GLOBAIS DO PROJETO ----

extern bit limpa_lcd,
           flagVoltar,
           flagConfirma,
           flagHall;

extern unsigned short var_menu,
                      pos_menu,
                      max_menu,
                      min_menu,
                      dentes,
                      espacos,
                      vetor_menu[5];

extern unsigned int counter_rotacao,
                    contT;
                    
extern float valor_tmr1;