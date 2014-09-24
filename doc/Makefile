# Makefile for creating documentation for ATLAS LaTeX
# Creates:
#    instructions.pdf
#    atlasphysics.pdf
#	 bibtex_guide.pdf

LATEX    = latex
PDFLATEX = pdflatex
BIBTEX   = bibtex
DVIPS    = dvips
DVIPDF   = dvipdf

# Default is to make instructions.pdf and atlasphysics.pdf with pdflatex
default: all

.PHONY: clean

all: instructions atlasphysics bibtex_guide

# Instructions - use pdflatex by default
instructions: instructions_pdflatex

instructions_pdflatex: instructions.pdf
	@echo "Made $<"

instructions_latex: instructions.dvi
	$(DVIPDF) -sPAPERSIZE=a4 -dPDFSETTINGS=/prepress $<
	@echo "Made $< and $(basename $<).pdf"

# atlasphysics - use pdflatex by default
atlasphysics: atlasphysics_pdflatex

atlasphysics_pdflatex: atlasphysics.pdf
	@echo "Made $<"

atlasphysics_latex: atlasphysics.dvi
	$(DVIPDF) -sPAPERSIZE=a4 -dPDFSETTINGS=/prepress $<
	@echo "Made $< and $(basename $<).pdf"

# bibtex_guide - use pdflatex by default
bibtex_guide: bibtex_guide_pdflatex

bibtex_guide_pdflatex: bibtex_guide.pdf
	@echo "Made $<"

bibtex_guide_latex: bibtex_guide.dvi
	$(DVIPDF) -sPAPERSIZE=a4 -dPDFSETTINGS=/prepress $<
	@echo "Made $< and $(basename $<).pdf"

# Standard LaTeX targets
# Explicit commands if bibtex needed, otherwise take default
instructions.pdf: instructions.tex *.bib
	$(PDFLATEX) $<
	$(BIBTEX)   $(basename $<)
	$(PDFLATEX) $<
	$(PDFLATEX) $<

instructions.dvi: instructions.tex *.bib
	$(LATEX)    $<
	$(BIBTEX)   $(basename $<)
	$(LATEX)    $<
	$(LATEX)    $<

bibtex_guide.pdf: bibtex_guide.tex *.bib
	$(PDFLATEX) $<
	$(BIBTEX)   $(basename $<)
	$(PDFLATEX) $<
	$(PDFLATEX) $<

bibtex_guide.dvi: bibtex_guide.tex *.bib
	$(LATEX)    $<
	$(BIBTEX)   $(basename $<)
	$(LATEX)    $<
	$(LATEX)    $<

%.pdf: %.tex
	$(PDFLATEX) $<
	$(PDFLATEX) $<

%.dvi: %.tex
	$(LATEX)    $<
	$(LATEX)    $<

%.bbl:	%.tex *.bib
	$(PDFLATEX) $*
	$(BIBTEX) $*

clean:
	-rm *.dvi *.toc *.aux *.log *.out *.blg *.bbl *.synctex.gz *~
	
cleanall: clean
	-rm instructions.pdf atlasphysics.pdf bibtex_guide.pdf

