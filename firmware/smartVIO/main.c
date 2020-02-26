/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <joerg@FreeBSD.ORG> wrote this file.  As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return.        Joerg Wunsch
 * ----------------------------------------------------------------------------
 *
 * Simple AVR demonstration.  Controls a LED that can be directly
 * connected from OC1/OC1A to GND.  The brightness of the LED is
 * controlled with the PWM.  After each period of the PWM, the PWM
 * value is either incremented or decremented, that's all.
 *
 * $Id: group__demo__project.html,v 1.1.1.24 2016/02/09 07:13:43 joerg_wunsch Exp $
 */
#include <inttypes.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <i2cmaster.h>


#define VSET_3V3 0x10
#define VSET_2V5 0x80
#define VSET_1V8 0xC1

#define DAC0  0b00011000
#define DAC1  0b00011010
#define DAC2  0b00011100

int SetDAC(unsigned char addr, unsigned char value) {
    unsigned char ret = i2c_start(addr+I2C_WRITE);       // set device address and write mode
    if ( ret ) {
        /* failed to issue start condition, possibly no device found */
        i2c_stop();
                                    // activate all 8 LED to show error */
    }else {
        unsigned char data = value;

        /* issuing start condition ok, device accessible */
        i2c_write(0x00 | (data >> 4));                       // write address = 5
        i2c_write( data << 4 );                       // ret=0 -> Ok, ret=1 -> no ACK 
        i2c_stop();                            // set stop conditon = release bus   
        
    }
    return ret;
}

int main(void)
{
    DDRB  = 0x03;                              // use all pins on port B for output 
    PORTB = 0x00;                              // (active low LED's )

    DDRD = 0xE0;
    PORTD = 0x00;

    i2c_init();
    
    do {
        if(SetDAC(DAC0, VSET_1V8)){
            PORTB = 0x02;
            break;
        }
        if(SetDAC(DAC1, VSET_1V8)){
            PORTB = 0x02;
            break;
        }
        if(SetDAC(DAC2, VSET_1V8)){
            PORTB = 0x02;
            break;
        }
        PORTB=0x01;
        PORTD = 0xE0;

    }while(0);


    /* loop forever, the interrupts are doing the rest */
    for (;;) /* Note [7] */
    return (0);
}
