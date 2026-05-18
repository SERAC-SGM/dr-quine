MAKEFLAGS += --no-builtin-rules

NAME	:= Colleen Grace Sully

CC	:= gcc
CFLAGS	:= -Wall -Wextra -Werror
AS	:= nasm
ASFLAGS	:= -f elf64

SRCS := $(shell find . -name '*.c' -or -name '*.s')

all: $(NAME)

%.o : %.s
	$(AS) $(ASFLAGS) $< -o $@

% : %.o
	$(CC) $(CFLAGS) $< -o $@ 

clean: 
	rm -f $(NAME)
	rm -f *.o
	rm -f Grace_kid.s
	rm -f Sully_*

diff-colleen:
	diff Colleen.s <(./Colleen)

diff-grace:
	./Grace
	diff Grace.s Grace_kid.s

diff-sully:
	./Sully
	diff Sully.s Sully_5.s

.PHONY:
	all clean diff
