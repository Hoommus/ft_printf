# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vtarasiu <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/03/24 10:11:17 by vtarasiu          #+#    #+#              #
#    Updated: 2019/05/18 14:06:38 by vtarasiu         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

FLAGS = -Wall -Wextra -Werror

CC = clang

HEADER = include
SRC_DIR = ./src/
OBJ_DIR = ./obj/

LIB_DIR = ../libft
LIB_NAME = libft.a

PRINTF_SRC = stringf.c integerf.c nbr_util.c ft_printf.c generic_functions.c \
            generic_functions2.c util.c parsing.c evals.c evals2.c           \
            variations.c

OBJ = $(addprefix $(OBJ_DIR), $(PRINTF_SRC:.c=.o))

$(NAME): $(OBJ)
	make -C $(LIB_DIR)
	@mkdir -p $(OBJ_DIR)
	cp $(LIB_DIR)/$(LIB_NAME) ./$(NAME)
	@echo "ar rc $(NAME) $(OBJ_DIR)*.o"
	@ar rc $(NAME) $(OBJ)
	ranlib $(NAME)

$(OBJ_DIR)%.o: $(SRC_DIR)%.c
	@mkdir -p $(OBJ_DIR)
	$(CC) $(FLAGS) -I $(HEADER) -o $@ -c $<

all: $(NAME)

clean:
	@echo "rm -rf $(OBJ_DIR)*.o"
	@/bin/rm -rf $(OBJ)
	/bin/rm -rf $(OBJ_DIR)
	make -C $(LIB_DIR) clean

fclean: clean
	/bin/rm -f $(NAME)
	make -C $(LIB_DIR) fclean

re: fclean all

love:
	@echo "Not all."

.PHONY: clean all fclean re love 
