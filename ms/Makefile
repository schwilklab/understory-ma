## Put this Makefile in your project directory---i.e., the directory
## containing the paper you are writing. Assuming you are using the
## rest of the toolchain here, you can use it to create .html, .tex,
## and .pdf output files (complete with bibliography, if present) from
## your markdown file. 
## -	Change the paths at the top of the file as needed.
## -	Using `make` without arguments will generate html, tex, and pdf 
## 	output files from all of the files with the designated markdown
##	extension. The default is `.md` but you can change this. 
## -	You can specify an output format with `make tex`, `make pdf` or 
## - 	`make html`. 
## -	Doing `make clean` will remove all the .tex, .html, and .pdf files 
## 	in your working directory. Make sure you do not have files in these
##	formats that you want to keep!

## Markdown extension (e.g. md, markdown, mdown).
MEXT = md

## All markdown files in the working directory
SRC = $(wildcard *.$(MEXT))

## Location of Pandoc support files including tempaltes, csl files, latex
## styles specific to pandoc build system, etc
PREFIX = $(HOME)/write/pandoc

## CSL stylesheet (located in the csl folder of the PREFIX directory).
CSL = ecology.csl

## latex template
LATEXT = schwilk-ms.latex

## HTML template and CSS style
HTMLT = schwilk-ms.html
CSS = kultiad-serif.css

export TEXINPUTS := $(PREFIX)/tex//:${TEXINPUTS}

PDFS=$(SRC:.md=.pdf)
HTML=$(SRC:.md=.html)
TEX=$(SRC:.md=.tex)
DOCX=$(SRC:.md=.docx)
ODT=$(SRC:.md=.odt)


all:	$(PDFS) $(HTML) $(TEX) $(DOCX)

pdf:	clean $(PDFS)
html:	clean $(HTML)
tex:	clean $(TEX)
docx:	clean $(DOCX)
odt:	clean $(ODT)

%.html:	%.md
	../scripts/make-tables.R
	cp ../results/tables/pvals1 pvals-table
	cat $^ | ./include.py |  pandoc -r \
             markdown+grid_tables+table_captions+yaml_metadata_block \
             -w html -S --mathml \
             --template=$(PREFIX)/templates/$(HTMLT) \
             --css=$(PREFIX)/css/$(CSS) \
             --filter pandoc-citeproc \
             --csl=$(PREFIX)/csl/$(CSL)  -o $@
	rm pvals-table

%.tex:	%.md
	../scripts/make-tables.R
	cp ../results/tables/pvals.latex pvals-table
	cat $^ | ./include.py | pandoc -r \
             markdown+grid_tables+table_captions+yaml_metadata_block \
             -w latex -s -S --latex-engine=pdflatex \
             --template=$(PREFIX)/templates/$(LATEXT) \
             --filter pandoc-citeproc   \
             --csl=$(PREFIX)/csl/$(CSL) -o $@
	rm pvals-table

%.pdf:	%.md
	../scripts/make-tables.R
	cp ../results/tables/pvals.latex pvals-table
	cat $^ | ./include.py | pandoc -r \
             markdown+grid_tables+table_captions+yaml_metadata_block -s -S \
             --latex-engine=pdflatex \
             --template=$(PREFIX)/templates/$(LATEXT)  \
             --filter pandoc-citeproc  \
             --csl=$(PREFIX)/csl/$(CSL) -o $@
	rm pvals-table

%.odt:	%.md
	../scripts/make-tables.R
	cp ../results/tables/pvals1 pvals-table
	cat $^ | ./include.py | pandoc -r \
             markdown+grid_tables+table_captions+yaml_metadata_block \
             -s -S  --filter pandoc-citeproc   \
             --csl=$(PREFIX)/csl/$(CSL) -o $@
	rm pvals-table


%.docx:	%.md
	../scripts/make-tables.R
	cp ../results/tables/pvals1 pvals-table
	cat $^ | ./include.py | pandoc -r \
             markdown+grid_tables+table_captions+yaml_metadata_block \
             -s -S  --filter pandoc-citeproc   \
             --reference-docx=$(PREFIX)/templates/reference.docx \
             --csl=$(PREFIX)/csl/$(CSL) -o $@
	rm pvals-table

clean:
	rm -f *.html *.pdf *.tex *.docx *.log *.aux

