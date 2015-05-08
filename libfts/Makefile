#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gleger <gleger@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2013/11/19 14:34:47 by gleger            #+#    #+#              #
#    Updated: 2015/03/03 00:30:02 by gleger           ###   ########.fr        #
#                                                                              #
#******************************************************************************#

NAME =	libfts.a

SRC = 	test.s

OBJ = $(SRC:.s=.o)

all: $(NAME)

$(NAME): $(OBJ)
	@echo "\033[1;35;m[Linking] \t\t\033[0m: " | tr -d '\n'
	ar rc $(NAME) $(OBJ)
	@ranlib $(NAME)	
	@echo "\033[1;32;m[Libfts Success] \t\t\t\033[0m"

%.o: %.s
	@echo "\033[1;36;m[Compiling $<]\t\033[0m: " | tr -d '\n'
	nasm -f macho64 $(SRC)

clean:
	@echo "\033[0;33;m[Cleaning libfts objects]\033[0m"
	@rm -f $(OBJ)

fclean: clean
	@echo "\033[0;31;m[Deleting $(NAME)]\033[0m"
	@rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re 
