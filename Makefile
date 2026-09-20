NASM      := nasm
NASMFLAGS := -f elf64 -g -F dwarf -I src/
LD        := ld

SRCS := src/main.asm \
        src/error_procedures.asm

OBJS := $(SRCS:.asm=.o)
BIN  := dnsd

.PHONY: all clean

all: $(BIN)

$(BIN): $(OBJS)
	$(LD) -o $@ $^

%.o: %.asm
	$(NASM) $(NASMFLAGS) -o $@ $<

clean:
	rm -f $(OBJS) $(BIN)