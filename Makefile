.POSIX:

DESTDIR=${HOME}/.local/bin
CC=gcc

dwmblocks: dwmblocks.o
	$(CC) dwmblocks.o -lX11 -o dwmblocks

dwmblocks.o: dwmblocks.c config.h
	$(CC) -c dwmblocks.c

clean:
	rm -f *.o *.gch dwmblocks

install: dwmblocks
	mkdir -p $(DESTDIR)
	cp -f dwmblocks $(DESTDIR)
	chmod 755 $(DESTDIR)/dwmblocks

uninstall:
	rm -f $(DESTDIR)/dwmblocks

.PHONY: clean install uninstall
