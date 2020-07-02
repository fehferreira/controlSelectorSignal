/*
  PROJETO DE SELETOR DE SINAIS DIFERENTES COM A MESMA SAIDA
  DEVIDCE: PIC18F4550       SIMULAÇAO:PROTEUS
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
#define reset_selector RB1_bit
#define inib_selector  RB2_bit
#define carry_out      RB3_bit


//---------------------------------------------------------------------------
// --- CRIAÇAO DE VARIAVEIS GLOBAIS

bit limpa_lcd,
    flagb1,
    flagb2;
    
char pos_selector = 0x01,
     txt[7];

//-----------------------------------------------------------------------------
// --- CRIANDO PROTÓTIPOS DAS FUNÇOES

void interrupt();
void interrupt_low();
void limpaLcd();
void teste_button();
void impressao();

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
 
 //------- Limpando as variaveis para inicio do programa ------
 
 flagb1 = 0x00;
 flagb2 = 0x00;
 limpa_lcd = 0x01;
 
 //-------------- CONFIGURANDO TIMER0 ( TESTE DE BOTÃO ) --------------------
 
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
  //---------- TRATAMENTO DE INTERRUOPÇÃO DO TIMER0 (TESTE DO BOTAO)----------
  if(TMR0IF_bit)
  {
    TMR0IF_bit = 0x00;                       //Limpa a flag de interrupção
    TMR0H = 0xB1;                            //Reiniciando os contadores (45536)
    TMR0L = 0xE0;                            //Reiniciando os contadores (45536)
    out_signal = ~out_signal;
    
    teste_button();
    
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

void teste_button()
{
  if(b1 && !flagb1)  flagb1 = 0x01;
  if(b2 && !flagb2)  flagb2 = 0x01;
  
  if(!b1 && flagb1)
  {
    limpa_lcd = 0x01;
    flagb1 = 0x00;
    selector = 0x01;
    pos_selector++;
    if(pos_selector >= 11) pos_selector = 1;
  }
  
  if(!b2 && flagb2)
  {
    char i;
    
    limpa_lcd = 0x01;
    flagb2 = 0x00;
    selector = 0x01;
    pos_selector--;
    if(pos_selector <= 0) pos_selector = 10;
    reset_selector = 0x01;
    reset_selector = 0x00;
    for(i = 0 ; i != pos_selector ; i++)
    {
      selector = 0x01;
      selector = 0x00;
    }
  }
  
  selector = 0x00;

}

//----------------------------------------------------------------------------

void impressao()
{
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


//----------------------------------------------------------------------------


