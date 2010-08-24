;;
;; skeleton.el for squeleton in /u/all/plenar_d/cu
;; 
;; Made by damien plenard
;; Login   <plenar_d@epitech.net>
;; 
;; Started on  Mon Dec  7 09:56:43 2009 damien plenard
;; Last update Mon May 10 19:31:23 2010 damien plenard
;;

;; Skeleton des headers protege
(define-skeleton insert-protect-header
  "Inserts a define to protect the header file."
  ""
  '(setq str (file-name-sans-extension
	      (file-name-nondirectory (buffer-file-name))))
  "#ifndef __"(upcase str)"_H__\n"
  "# define __"(upcase str)"_H__\n"
  "\n"
  "\n"
  "\n"
  "#endif /* !__"(upcase str)"_H__ */\n")

;; Skeleton des main
(define-skeleton create-main
"#include <stdlib.h>
#include <sys/types.h>

/*
** |---------------------------------------------|
** |   /!\ Don't touch the _malloc_options /!\	 |
** |---------------------------------------------|
*/

int			main(void)
{
#if defined (DEBUG)
  _malloc_options = "Z";
#endif

  return (EXIT_SUCCESS);
}
")

;; Skeleton des Makefiles
(define-skeleton create-makefile
"## Name of project
NAME		= 

## Version
# (DEBUG or RELEASE)
V		= DEBUG

OS		= `uname -s`
ARCH		= `uname -p`

## Directory
SRCDIR		= src
INCDIR		= include
LIBDIR		= lib

## Source
SRC		= $(SRCDIR)/main.c

OBJ		= $(SRC:.c=.o)

LIBS		= 

## Binary
CC		= gcc
RM		= rm -f
ECHO		= echo
PRINTF		= printf
ETAGS		= etags
READ${PAGER}	= ${PAGER}
READ		= more

## Flags
OFLAGS_DEBUG	= -ggdb
OFLAGS_RELEASE	= -O2 -fomit-frame-pointer
WFLAGS		= -W -Wall -Werror -Wstrict-prototypes -ansi -pedantic
IFLAGS		= -I$(INCDIR)
CFLAGS		+= $(WFLAGS) $(IFLAGS) $(OFLAGS_$(V))
LDFLAGS		+= -L$(LIBDIR)/ $(LIBS)

## Rules
$(NAME)_DEBUG	: $(OBJ)
		  $(CC) -o $(NAME) $(OBJ) $(LDFLAGS)

clean		:
		  -@$(RM) $(OBJ) \#*\# *~

all		: $(NAME)_$(V)

fclean		: clean
		  -@$(RM) $(NAME)

re		: fclean all

.PHONY		: all clean re

.c.o		: 
		  $(CC) $(CFLAGS) -o $@ -c $< -D$(V)

tag		:
		  $(ETAGS) $(INCDIR)/*.h $(SRC)
")