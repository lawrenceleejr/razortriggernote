# Makefile for creating an ATLAS LaTeX document
#------------------------------------------------------------------------------
# $Id: Makefile 301909 2014-09-09 21:19:03Z brock $
# $HeadURL: svn+ssh://svn.cern.ch/reps/atlasgroups/pubcom/latex/atlasnote/tags/atlasnote-00-04-07/Makefile $
#------------------------------------------------------------------------------
# By default makes razortriggernote.pdf using target razortriggernote_pdflatex
# Replace razortriggernote with your main filename or add another target set
# Use "make clean" to cleanup.
# "make cleanall" also deletes the PDF file.

LATEX    = latex
PDFLATEX = pdflatex
BIBTEX   = bibtex
DVIPS    = dvips
DVIPDF   = dvipdf

# Default target - make emptynote.pdf with pdflatex
default: razortriggernote_pdflatex

.PHONY: clean

razortriggernote_pdflatex: razortriggernote.pdf
	@echo "Made $<"

razortriggernote_latex: razortriggernote.dvi
	$(DVIPDF) -sPAPERSIZE=a4 -dPDFSETTINGS=/prepress ${BASENAME}
	@echo "Made $<"

# Standard Latex targets
%.pdf:	%.tex *.bib
	$(PDFLATEX) $<
	-$(BIBTEX)   $(basename $<)
	$(PDFLATEX) $<
	$(PDFLATEX) $<

%.dvi:	%.tex 
	$(LATEX)    $<
	-$(BIBTEX)   $(basename $<)
	$(LATEX)    $<
	$(LATEX)    $<

%.bbl:	%.tex *.bib
	$(LATEX) $*
	$(BIBTEX) $*

%.ps:	%.dvi
	$(DVIPS) $< -o $@

clean:
	-rm *.dvi *.toc *.aux *.log *.out *.bbl *.blg *.brf \
		*.cb *.ind *.idx *.ilg *.inx \
		*.synctex.gz *~ ~* spellTmp 
	
cleanall: clean
	-rm razortriggernote.pdf
