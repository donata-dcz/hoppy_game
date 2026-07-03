##
## EPITECH PROJECT, 2026
## G-ING-401-PAR-4-1-cartridge-2
## File description:
## Makefile
##

NAME	=	hoppy_game.gb

CC		=	lcc
CFLAGS	+=	-I./include -I./include/snake -I./include/sprites
CFLAGS	+=	-Wa-l -Wl-m
CFLAGS	+=	-Wl-yt0x1B -Wm-yoA -Wm-ya1

SRC	=	src/games/hoppy_snake/snake_game_loop.c	\
		src/games/hoppy_snake/init_snake_game.c	\
		src/games/hoppy_snake/snake_step.c	\
		src/games/hoppy_snake/coords_t.c	\
		src/games/hoppy_snake/get_member_next.c	\
		src/games/hoppy_snake/get_coords_next.c	\
		src/games/hoppy_snake/place_fish.c	\
		src/games/hoppy_snake/snake_board_t.c	\
		src/games/hoppy_snake/snake_event_handler.c	\
		src/games/hoppy_snake/snake_score.c	\
		src/games/hoppy_snake/get_head_sprite.c	\
		src/games/hoppy_run/hoppy_run.c		\
		src/games/hoppy_run/manage_display.c	\
		src/games/hoppy_run/manage_input.c	\
		src/games/hoppy_run/score.c			\
		src/menu/menu.c				\
		src/menu/hoppy_game.c			\
		src/utils/end_game.c			\
		src/utils/font_utils.c			\
		src/utils/leaderboard.c			\
		src/utils/playername.c			\
		src/games/hoppy_bird/flappy.c			\
		src/games/hoppy_bird/flappy_pipe.c		\
		src/main.c


OBJ	=	$(SRC:.c=.o)

RM	?=	rm -rf

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $(OBJ) $(CFLAGS) -o $(NAME)

clean:
	$(RM)	\
		$(OBJ)	\
		$(patsubst %.o,%.asm,$(OBJ))	\
		$(patsubst %.o,%.lst,$(OBJ))	\
		$(patsubst %.o,%.sym,$(OBJ))	\
		$(patsubst %.gb,%.map,$(NAME))	\
		$(patsubst %.gb,%.ihx,$(NAME))

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: clean fclean all re
