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
