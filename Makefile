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

NAME = assemblator

HEADERS = -I libfts/ -I .

LIBFTS = libfts/libfts.a

SOURCES = main.c

OBJECTS = $(SOURCES:.c=.o)

HFILE = ft_libasm.h

FLAGS = -g -Wall -Wextra -Werror -O3

CC	=	clang

all: $(NAME)

$(NAME): $(OBJECTS) $(HFILE) $(LIBFTS)
	@echo "\033[1;35;m[Linking] \t\t\033[0m: " | tr -d '\n'
	$(CC) $(FLAGS) $(LIBFTS) -o $@ $(OBJECTS)
	@echo "\033[1;32;m[Success] \t\t\t\033[0m"

$(LIBFTS):
	@make -C libfts
	@echo "\033[1;35;m[Linking Libfts]\033[0m"

%.o:		%.c $(HPP)
	@echo "\033[1;36;m[Compiling $<]\t\033[0m: " | tr -d '\n'
	$(CC) -c $< $(FLAGS) $(HEADERS)

clean:
	@make -C libfts/ clean
	@echo "\033[0;33;m[Cleaning objects]\033[0m"
	@rm -f $(OBJECTS)

fclean: clean
	@make -C libfts/ fclean
	@echo "\033[0;31;m[Deleting $(NAME)]\033[0m"
	@rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
