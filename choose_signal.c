/*
  PROJETO DE SELETOR DE SINAIS DIFERENTES COM A MESMA SAIDA
  DEVIDCE: PIC18F4550       SIMULA�AO:PROTEUS
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
#define b1             RB6_bit
#define b2             RB7_bit
#define out_signal     RD0_bit
#define selector       RB0_bit
#define reset-selector RB1_bit
#define inib-selector  RB2_bit
#define carry-out      RB3_bit


//---------------------------------------------------------------------------
// --- CRIA�AO DE VARIAVEIS GLOBAIS

bit limpa_lcd;

//-----------------------------------------------------------------------------
// --- CRIANDO PROT�TIPOS DAS FUN�OES

void interrupt();
void interrupt_low();
void limpaLcd();

//---------------------------------------------------------------------------
// --- C�DIGO PRINCIPAL
void main()
{
 //-------------------- CONFIGURA��ES GERAIS --------------------------------
 
 GIE_bit = 0x01;                             //Habilitando interrup��es globais
 PEIE_bit = 0x01;                            //Habilitando interrup��es de perif�ricos
 IPEN_bit = 0x01;                            //Habilitando interrup��es HIGH e LOW
 
 TRISD = 0x00;                               //Configura PORTD como saida
 TRISB = 0xF8;                               //Configura RB0:RB2 como saida, restante entrada
 
 
 //-------------- CONFIGURANDO TIMER0 ( TESTE DE BOT�O ) --------------------
 
 T0CON = 0b10001000;                         //Configurando TMR0
                                             //incremento por ciclo de m�quina
                                             //prescaler de 1:1
                                             //utilizando 2 contadores de 8 bits

 TMR0H = 0xB1;                               //Iniciando os contadores (45536)
 TMR0L = 0xE0;                               //Iniciando os contadores (45536)
 TMR0IF_bit = 0x00;                          //Limpando a flag de interrup��o
 TMR0IP_bit = 0x01;                          //Configurando como interrup��o de alta prioridade
 TMR0IE_bit = 0x01;                          //Habilita interrup��o do TMR0
 
 //-------------- CONFIGURANDO LCD (BIBLIOTECA MIKROC) ----------------------
 
 Lcd_Init();                                 //Inicializa o LCD
 Lcd_Cmd(_LCD_CLEAR);                        //Limpa o LCD
 Lcd_Cmd(_LCD_CURSOR_OFF);                   //Desabilita o curso do LCD
 
 Lcd_Out_Cp("JC MODULOS");




  while(1)
   {

   }

}//FINAL MAIN

//----------------------------------------------------------------------------
// --- DECLARA�AO DAS FUN�OES

void interrupt()
{
  //---------- TRATAMENTO DE INTERRUOP��O DO TIMER0 (TESTE DO BOTAO)----------
  if(TMR0IF_bit)
  {
    TMR0IF_bit = 0x00;                       //Limpa a flag de interrup��o
    TMR0H = 0xB1;                            //Reiniciando os contadores (45536)
    TMR0L = 0xE0;                            //Reiniciando os contadores (45536)
    out_signal = ~out_signal;
    
  }

}

//----------------------------------------------------------------------------

void interrupt_low()
{

}

//----------------------------------------------------------------------------

void limpaLcd()
{
  if(limpa_lcd)
  {
    Lcd_Cmd(_LCD_CLEAR);
    limpa_lcd = 0x00;
  }
}

//----------------------------------------------------------------------------


