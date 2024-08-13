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

NAME_S				=	server
NAME_C				=	client

CC					=	gcc
CC_FLAGS			=	-Wall -Wextra -Werror

FT_PRINTF			=	./ft_printf/

SOURCES_S			=	server.c \
SOURCES_C			=	client.c \
SOURCES_PF			=	$(FT_PRINTF)ft_printf.c \
						$(FT_PRINTF)ft_putchar.c \
						$(FT_PRINTF)ft_putstr.c \
						$(FT_PRINTF)ft_putnbr.c \
						$(FT_PRINTF)ft_putunbr.c \
						$(FT_PRINTF)ft_puthex.c \
						$(FT_PRINTF)ft_putptr.c \

OBJECTS_S			=	$(SOURCES_S:%.c=%.o)
OBJECTS_C			=	$(SOURCES_C:%.c=%.o)
OBJECTS_PF			=	$(SOURCES_PF:%.c=%.o)

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

all: 			$(NAME_S) $(NAME_C)

$(NAME_S):		$(OBJECTS_S) $(OBJECTS_PF) $(INCLUDE)
				$(CC) $(CC_FLAGS) $(OBJECTS_s) $(OBJECTS_PF) -o $(NAME_S)
				mkdir ./objects/
				mkdir ./ft_printf/objects/
				mv $(OBJECTS_S) ./objects/
				mv $(OBJECTS_PF) ./ft_printf/objects/
				echo "\n························· Server compilation complete ·························"

$(NAME_C):		$(OBJECTS_C) $(OBJECTS_PF) $(INCLUDE)
				$(CC) $(CC_FLAGS) $(OBJECTS_C) $(OBJECTS_PF) -o $(NAME_C)
				mv $(OBJECTS_C) ./objects/
				mv $(OBJECTS_PF) ./ft_printf/objects/
				echo "\n························· Client compilation complete ·························"
				echo "$$MINITALK"

clean:
				rm -rf ./objects/
				rm -rf ./*.o
				rm -rf ./ft_printf/objects/
				rm -rf ./ft_printf/*.o
				echo "\n·······························"
				echo "\n· Objects correctly removed."

fclean:			clean
				rm -rf $(NAME_S) $(NAME_C)
				echo "· Executables correctly removed.\n"

re:				fclean all
.PHONY:			all clean fclean re
