##
## EPITECH PROJECT, 2018
## 
## File description:
## 
##

ASM =	nasm -Wfatal-errors

NAME =	libasm.so

ASFLAGS = -f elf64

RM =	rm -f

SRC =	src/strlen.asm	\
	src/strchr.asm	\
	src/memset.asm	\
	src/memcpy.asm	\
	src/strcmp.asm	\
	src/strncmp.asm	\
	src/memmove.asm	\
	src/rindex.asm	\
	src/strstr.asm	\
	src/strpbrk.asm	\
	src/strcspn.asm	\
	src/strcasecmp.asm

OBJS =	$(SRC:.asm=.o)

all: $(NAME)

$(NAME): $(OBJS)
	ld -shared $(OBJS) -o $(NAME)

%.o: %.asm
	$(ASM) $(ASFLAGS) $< -o $@	

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
