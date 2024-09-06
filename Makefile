NAME = push_swap

CC = gcc

LIBFT = ./libft/libft.a

FLAGS = -Wall -Wextra -Werror

MY_SOURCES =	sources/push_swap/split.c \
				sources/push_swap/handle_errors.c \
				sources/push_swap/init_a_to_b.c \
				sources/push_swap/init_b_to_a.c \
				sources/push_swap/push_swap.c \
				sources/push_swap/stack_init.c \
				sources/push_swap/stack_utils.c \
				sources/commands/push.c \
				sources/commands/rev_rotate.c \
				sources/commands/rotate.c \
				sources/commands/sort_stack.c \
				sources/commands/sort_three.c \
				sources/commands/swap.c \

MY_OBJECTS = $(MY_SOURCES:.c=.o)

INC_DIR = includes

all: $(NAME)

$(LIBFT): 
	make -C libft

$(NAME):  $(MY_OBJECTS) $(LIBFT)
	$(CC) $(FLAGS) $(MY_OBJECTS) -I $(INC_DIR) $(LIBFT) -o $(NAME)


%.o:%.c
	$(CC) $(FLAGS) -c $< -o $@ 

clean:
	@rm -rf sources/push_swap/*.o
	@rm -rf sources/commands/*.o
	@make clean -C ./libft

fclean: clean
	@rm -rf $(NAME)
	@rm -rf $(LIBFT)

re: fclean all

.PHONY: all libft clean fclean re