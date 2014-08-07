OUTPUT = notes

OUTPUT_FILE = $(OUTPUT).pdf

OPTIONS = -synctex=1 -shell-escape -interaction=nonstopmode --jobname=$(OUTPUT)

MAIN = Main.tex

CLEAN = rm -v *.log *.synctex.gz *.aux

CON = Main.tex -nt $(OUTPUT_FILE) -o \
	  Title.tex -nt $(OUTPUT_FILE) -o \
	  Isoperimetric.tex -nt $(OUTPUT_FILE)

notes:
	cd src; pdflatex $(OPTIONS) $(MAIN); $(CLEAN)

continuous:
	cd src; while true; do sleep 2; if [ $(CON) ]; then pdflatex $(OPTIONS) $(MAIN); $(CLEAN); fi; done;
