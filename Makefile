.PHONY: all clean

# Variables
ASM = nasm
LD = ld
ASMFLAGS = -f elf64
LDFLAGS = 
RM = rm -f

# File names
SRC = bubblesort.asm
OBJ = bubblesort.o
TARGET = bubblesort

all: $(TARGET)

$(TARGET): $(OBJ)
	$(LD) $(LDFLAGS) $(OBJ) -o $(TARGET)

$(OBJ): $(SRC)
	$(ASM) $(ASMFLAGS) $(SRC) -o $(OBJ)

run: $(TARGET)
	./$(TARGET)

clean:
	$(RM) $(OBJ) $(TARGET)
