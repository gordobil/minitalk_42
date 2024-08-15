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

SERVER				=	server
CLIENT				=	client

CC					=	gcc
CC_FLAGS			=	-Wall -Wextra -Werror

UTILS				=	./utils/

SOURCES_S			=	server.c \
						$(UTILS)ft_atoi.c \
						$(UTILS)ft_printf.c \
						$(UTILS)ft_putchar.c \
						$(UTILS)ft_puthex.c \
						$(UTILS)ft_putnbr.c \
						$(UTILS)ft_putptr.c \
						$(UTILS)ft_putstr.c \
						$(UTILS)ft_putunbr.c \

SOURCES_C			=	client.c \
						$(UTILS)ft_atoi.c \
						$(UTILS)ft_printf.c \
						$(UTILS)ft_putchar.c \
						$(UTILS)ft_puthex.c \
						$(UTILS)ft_putnbr.c \
						$(UTILS)ft_putptr.c \
						$(UTILS)ft_putstr.c \
						$(UTILS)ft_putunbr.c \

OBJECTS_S			=	$(SOURCES_S:%.c=%.o)
OBJECTS_C			=	$(SOURCES_C:%.c=%.o)

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

all:			$(SERVER) $(CLIENT)

$(SERVER):		$(OBJECTS_S)
				$(CC) $(CC_FLAGS) $(OBJECTS_S) -o $(SERVER)
				echo "\n························· Server compilation complete ·························"

$(CLIENT):		$(OBJECTS_C)
				$(CC) $(CC_FLAGS) $(OBJECTS_C) -o $(CLIENT)
				mkdir ./objects/
				mv $(OBJECTS_S) ./objects/
				mv client.o ./objects/
				echo "\n························· Client compilation complete ·························"
				echo "$$MINITALK"

clean:
				rm -rf ./objects/
				rm -rf ./*.o
				echo "\n·······························"
				echo "\n· Objects correctly removed."

fclean:			clean
				rm -rf $(SERVER) $(CLIENT)
				echo "· Executables correctly removed.\n"

re:				fclean all
.PHONY:			all clean fclean re
