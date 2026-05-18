NAME	:= Colleen Grace Sully

CC	:= gcc
CFLAGS	:= -Wall -Wextra -Werror

SRCS := $(shell find . -name '*.c' -or -name '*.s')

all: $(NAME)

% : %.c
	$(CC) $(CFLAGS) $< -o $@

clean: 
	rm -f $(NAME)
	rm -f Grace_kid.c
	rm -f Sully_*
	
diff-colleen:
	diff Colleen.c <(./Colleen)

diff-grace:
	./Grace
	diff Grace.c Grace_kid.c

diff-sully:
	./Sully
	diff Sully.c Sully_5.c

.PHONY:
	all clean diff
