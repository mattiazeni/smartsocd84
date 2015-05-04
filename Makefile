default: 
	pdflatex main
	bibtex main
	pdflatex main
	pdflatex main

all: 
	pdflatex main
	bibtex main
	pdflatex main
	pdflatex main
	gv -watch main.pdf &

depe:
	latex main.tex
	bibtex main
	latex main.tex
	latex main.tex

clean: 
	rm -f *.aux *.log *.pdf

