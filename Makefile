BINDIR		= /usr/local/bin

CHMOD = /bin/chmod
DIFF = /bin/diff
CP = /bin/cp
RM = /bin/rm -f
PROGRAM = text2pdf
SHELL = /bin/sh

all:	$(PROGRAM)

check:	$(PROGRAM) $(PROGRAM).pdf
	@echo "The only differences should be in the /CreationDate lines"
	-$(DIFF) $(PROGRAM).pdf $(PROGRAM).pok

clean mostlyclean:
	-$(RM) *.i
	-$(RM) *.o
	-$(RM) *~
	-$(RM) \#*
	-$(RM) a.out
	-$(RM) core

clobber distclean:	clean
	-$(RM) $(PROGRAM)
	-$(RM) $(PROGRAM).pdf

install:	all uninstall
	$(CP) $(PROGRAM) $(BINDIR)/$(PROGRAM)
	$(CHMOD) 775 $(BINDIR)/$(PROGRAM)

maintainer-clean:	distclean
	@echo "This command is intended for maintainers to use;"
	@echo "it deletes files that may require special tools to rebuild."
	-$(RM) $(PROGRAM).pok

$(PROGRAM).pdf:	$(PROGRAM).c $(PROGRAM)
	./$(PROGRAM) $(PROGRAM).c >$(PROGRAM).pdf

uninstall:
	-$(RM) $(BINDIR)/$(PROGRAM)

