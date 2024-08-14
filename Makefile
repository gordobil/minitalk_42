# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ngordobi <ngordobi@student.42urduliz.com   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/08/13 12:40:21 by ngordobi          #+#    #+#              #
#    Updated: 2024/08/13 12:40:21 by ngordobi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME_C				=	client
NAME_S				=	server

CC					=	gcc
CC_FLAGS			=	-Wall -Wextra -Werror

UTILS				=	./utils/

SOURCES_C			=	client.c \
SOURCES_S			=	server.c \
SOURCES_UT			=	$(UTILS)ft_atoi.c \
						$(UTILS)ft_printf.c \
						$(UTILS)ft_putchar.c \
						$(UTILS)ft_puthex.c \
						$(UTILS)ft_putnbr.c \
						$(UTILS)ft_putptr.c \
						$(UTILS)ft_putstr.c \
						$(UTILS)ft_putunbr.c \

OBJECTS_C			=	$(SOURCES_C:%.c=%.o)
OBJECTS_S			=	$(SOURCES_S:%.c=%.o)
OBJECTS_UT			=	$(SOURCES_UT:%.c=%.o)

INCLUDE				=	minitalk.h

define MINITALK
\033[0;33m


 ███▄ ▄███▓    ██▓    ███▄    █     ██▓   ▄▄▄█████▓    ▄▄▄          ██▓        ██ ▄█▀
▓██▒▀█▀ ██▒   ▓██▒    ██ ▀█   █    ▓██▒   ▓  ██▒ ▓▒   ▒████▄       ▓██▒        ██▄█▒ 
▓██    ▓██░   ▒██▒   ▓██  ▀█ ██▒   ▒██▒   ▒ ▓██░ ▒░   ▒██  ▀█▄     ▒██░       ▓███▄░ 
▒██    ▒██    ░██░   ▓██▒  ▐▌██▒   ░██░   ░ ▓██▓ ░    ░██▄▄▄▄██    ▒██░       ▓██ █▄ 
▒██▒   ░██▒   ░██░   ▒██░   ▓██░   ░██░     ▒██▒ ░     ▓█   ▓██▒   ░██████▒   ▒██▒ █▄
░ ▒░   ░  ░   ░▓     ░ ▒░   ▒ ▒    ░▓       ▒ ░░       ▒▒   ▓▒█░   ░ ▒░▓  ░   ▒ ▒▒ ▓▒
░  ░      ░    ▒ ░   ░ ░░   ░ ▒░    ▒ ░       ░         ▒   ▒▒ ░   ░ ░ ▒  ░   ░ ░▒ ▒░
░      ░       ▒ ░      ░   ░ ░     ▒ ░     ░           ░   ▒        ░ ░      ░ ░░ ░ 
       ░       ░              ░     ░                       ░  ░       ░  ░   ░  ░   

$(END)
endef
export MINITALK

.SILENT:

all: 			$(NAME_C) $(NAME_S)

$(NAME_C):		$(OBJECTS_C) $(OBJECTS_UT) $(INCLUDE)
				$(CC) $(CC_FLAGS) $(OBJECTS_C) $(OBJECTS_UT) -o $(NAME_C)
				mkdir ./objects/
				mkdir ./utils/objects/
				mv $(OBJECTS_C) ./objects/
				mv $(OBJECTS_UT) ./utils/objects/
				echo "\n························· Client compilation complete ·························"

$(NAME_S):		$(OBJECTS_S) $(OBJECTS_UT) $(INCLUDE)
				$(CC) $(CC_FLAGS) $(OBJECTS_s) $(OBJECTS_UT) -o $(NAME_S)
				mv $(OBJECTS_S) ./objects/
				mv $(OBJECTS_UT) ./utils/objects/
				echo "\n························· Server compilation complete ·························"
				echo "$$MINITALK"

clean:
				rm -rf ./objects/
				rm -rf ./*.o
				rm -rf ./utils/objects/
				rm -rf ./utils/*.o	
				echo "\n·······························"
				echo "\n· Objects correctly removed."

fclean:			clean
				rm -rf $(NAME_C) $(NAME_S)
				echo "· Executables correctly removed.\n"

re:				fclean all
.PHONY:			all clean fclean re
