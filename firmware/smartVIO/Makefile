# simple makefile for avr-gcc projects

# what is the final binary called
PROGRAM = smartvio

# flags to pass to the C compiler
# -mmcu should be set to the CPU type
# -DF_CPU should be the clock speed in Hz
# you can add additional -D statements which work just like #define in the code
CFLAGS = -Wall -I. -g -Os -mmcu=atmega328pb -DF_CPU=8000000 -B atmega328pb/

# Any other files that aren't C source, that trigger a rebuild
DEPS = 

# These are the object files that gcc will create, from your .c files
# you need one for each of your C source files
OBJ = main.o twimaster.o

# magic happens below here
# "make all" creates a burnable hex file
all: $(PROGRAM).hex

# this turns the .elf binary into .hex for avrdude
$(PROGRAM).hex: $(PROGRAM).elf
	avr-objcopy -O ihex $< $@

# this builds and links the .o files into a .elf binary
$(PROGRAM).elf: $(OBJ)
	avr-gcc $(CFLAGS) -o $@ $^

# this compiles the .c files into .o files
%.o: %.c $(DEPS)
	avr-gcc $(CFLAGS) -o $@ -c $<

# this calls the first macro we defined to create a .hex file
# then it runs avrdude to burn it to your Arduino

burn:   $(PROGRAM).hex
	avrdude -F -V -c atmelice_isp -p m328p -F -U flash:w:$(PROGRAM).hex

clean:
	rm *.o
	rm *.elf
	rm *.hex