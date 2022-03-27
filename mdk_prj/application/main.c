#include "DS_CM3.h"
#include "system_DS_CM3.h"
//C¿â
#include <stdarg.h>
#include <string.h>
#include <stdio.h>

#define BASEADDR_LED 	0x40000000
#define BASEADDR_UART 	0x40600000
#define CHANNEL_LED 	1
#define CHANNEL_SW   	2

#define XGPIO_CHAN_OFFSET 8
#define XGpio_WriteReg(BaseAddress, RegOffset, Data)   Xil_Out32((BaseAddress) + (RegOffset), (uint32_t)(Data))
#define XGpio_ReadReg(BaseAddress, RegOffset)  		   XGpio_In32((BaseAddress) + (RegOffset))

#define XUL_TX_FIFO_OFFSET           4     /* transmit FIFO, write only */
#define XUL_STATUS_REG_OFFSET        8     /* status register, read only */
#define XUL_SR_TX_FIFO_FULL          0x08  /* transmit FIFO full */

#define XUartLite_GetStatusReg(BaseAddress)  		XUartLite_ReadReg((BaseAddress), XUL_STATUS_REG_OFFSET)
#define XUartLite_ReadReg(BaseAddress, RegOffset)   XGpio_In32((BaseAddress) + (RegOffset))

#define XUartLite_IsTransmitFull(BaseAddress) \
    ((XUartLite_GetStatusReg((BaseAddress)) & XUL_SR_TX_FIFO_FULL) == \
      XUL_SR_TX_FIFO_FULL)

#define XUartLite_WriteReg(BaseAddress, RegOffset, Data)  Xil_Out32((BaseAddress) + (RegOffset), (uint32_t)(Data))

volatile uint32_t cnt = 0;

void SysTick_Handler(void)
{
    cnt++;
}

void delay_ms(uint32_t t)
{
    cnt = 0;
    while(cnt-t>0);
}

uint32_t XGpio_In32(uint32_t Addr)
{
    return *(volatile uint32_t *) Addr;
}

void Xil_Out32(uint32_t Addr, uint32_t Value)
{
    volatile uint32_t *LocalAddr = (volatile uint32_t *)Addr;
    *LocalAddr = Value;
}

uint32_t XGpio_DiscreteRead(uint32_t Addr, uint8_t Channel)
{
    return XGpio_ReadReg(Addr, (Channel-1)*XGPIO_CHAN_OFFSET);
}

void XGpio_DiscreteWrite(uint32_t Addr, uint8_t Channel, uint32_t Data)
{
    XGpio_WriteReg(Addr, (Channel-1)*XGPIO_CHAN_OFFSET, Data);
}

void XUartLite_SendByte(uint32_t BaseAddress, uint8_t Data)
{
    while (XUartLite_IsTransmitFull(BaseAddress));
    XUartLite_WriteReg(BaseAddress, XUL_TX_FIFO_OFFSET, Data);
}

void cm3_print(const char *ptr)
{
    while (*ptr != (char)0) {
        XUartLite_SendByte(BASEADDR_UART, *ptr);
        ptr++;
    }
}

void MyUartPrintf(char *fmt,...)
{
    unsigned char UsartPrintfBuf[296];
    va_list ap;
    unsigned char *pStr = UsartPrintfBuf;
    
    va_start(ap, fmt);
    vsnprintf((char *)UsartPrintfBuf, sizeof(UsartPrintfBuf), (const char *)fmt, ap);
    va_end(ap);
    
    while(*pStr != 0)
    {
        XUartLite_SendByte(BASEADDR_UART, *pStr);
        pStr++;
    }
}

void led_blink(void)
{
    XGpio_DiscreteWrite(BASEADDR_LED, CHANNEL_LED, 0);
    delay_ms(500);
    XGpio_DiscreteWrite(BASEADDR_LED, CHANNEL_LED, 0xf);
    delay_ms(500);
}

int main(void)
{
    uint32_t sw = 0;
	
    SystemCoreClockUpdate();
    SysTick_Config(SystemCoreClock/1000);
	
	cm3_print("Hello DesignStart ARM Cortex-M3 on FPGA Xilnx Artix-7 XC7A100T \r\n");
	MyUartPrintf("SystemCoreClock = %ld\r\n", SystemCoreClock);
	
    while(1)
    {
        led_blink();
        sw = XGpio_DiscreteRead(BASEADDR_LED, CHANNEL_SW);
        MyUartPrintf("key state = %d-%d-%d-%d\r\n", sw>>3, sw>>2&1, sw>>1&1, sw&1);
    }
}

