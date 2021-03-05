# Makefile for the GIFLIB package for Windows

OFLAGS = -O0 -g
OFLAGS  = -O2
CFLAGS  = -std=gnu99 -fPIC -Wall -Wno-format-truncation $(OFLAGS)

#SHELL = /bin/sh
TAR = tar
INSTALL = install

PREFIX = /usr/local
BINDIR = $(PREFIX)/bin
INCDIR = $(PREFIX)/include
LIBDIR = $(PREFIX)/lib
MANDIR = $(PREFIX)/share/man

# No user-serviceable parts below this line

VERSION:=$(shell ./getversion)
LIBMAJOR=7
LIBMINOR=2
LIBPOINT=0
LIBVER=$(LIBMAJOR).$(LIBMINOR).$(LIBPOINT)

SOURCES = dgif_lib.c egif_lib.c gifalloc.c gif_err.c gif_font.c \
	gif_hash.c openbsd-reallocarray.c
HEADERS = gif_hash.h  gif_lib.h  gif_lib_private.h
OBJECTS = $(SOURCES:.c=.o)

USOURCES = qprintf.c quantize.c getarg.c 
UHEADERS = getarg.h
UOBJECTS = $(USOURCES:.c=.o)

# Some utilities are installed
INSTALLABLE = \
	gif2rgb \
	gifbuild \
	giffix \
	giftext \
	giftool \
	gifclrmp

# Some utilities are only used internally for testing.
# There is a parallel list in doc/Makefile.
# These are all candidates for removal in future releases.
UTILS = $(INSTALLABLE) \
	gifbg \
	gifcolor \
	gifecho \
	giffilter \
	gifhisto \
	gifinto \
	gifsponge \
	gifwedge

LDLIBS=libgif.a -lm
