BASENAME=BASENAME_REPLACE
TARNAME=TARNAME_REPLACE
VOL=xx
PAGELO=xx
PAGEHI=xx
YEAR=2008

PDF=$(BASENAME).pdf
SRC=$(BASENAME).tex $(BASENAME).ps $(BASENAME).pdf \
	Makefile \
	eheader.tex \
	LetterForCopyrightForm.txt Copyright.tex Copyright.pdf \
	siam.bst siam10.clo siamltex.cls siamltex.sty
#	hyperref.sty

MAKE_HYPER=./make_hyper.sh
MAKE_EHEADER=./make_eheader.sh

all: ${PDF} ${PDF:.pdf=.ps}

$(BASENAME).dvi: $(BASENAME).tex eheader.tex hyperref.sty

%.dvi: %.tex eheader.tex
	latex $<
	#bibtex $*
	latex $<
	latex $<

%.pdf: %.dvi
	dvipdf -sPAPERSIZE=letter $<

%.ps: %.dvi
	dvips $< -o $@

diff.tex: orig.tex $(BASENAME).tex
	latexdiff orig.tex $(BASENAME).tex > $@

Copyright.pdf: Copyright.tex
	pdflatex Copyright.tex

eheader.tex: Makefile
	$(MAKE_EHEADER) $(VOL) $(PAGELO) $(PAGEHI) $(YEAR) > eheader.tex

hyperref.sty:
	$(MAKE_HYPER)

clean:
	rm -rf *.aux *.bbl *.blg *.log *.dvi *.out *~

realclean: clean
	rm -f ${PDF} ${PDF:.pdf=.ps}

tgz: $(TARNAME).tar.gz

$(TARNAME).tar.gz: $(SRC)
	ls $(SRC) | sed s:^:$(TARNAME)/: >MANIFEST
	ln -s `pwd` ../$(TARNAME)
	(cd ..; tar -czvf $(TARNAME).tar.gz `cat $(TARNAME)/MANIFEST`)
	rm ../$(TARNAME)

checklabels:
	~/work/etna/common/checklabels $(BASENAME).tex &

checkbib:
	~/work/etna/common/checkbib $(BASENAME).tex &
