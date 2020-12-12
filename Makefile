## Paths
DATA := data
SCRIPTS := scripts
OUT := out
PAPER := paper
LASTOUT := $(OUT)/05_plot.png  # Last output from the last file of the analysis pipeline

## Primary targets: all; (analysis) pipe and paper
.PHONY: all pipe paper
all: pipe paper


## Analysis pipe ----
pipe: $(LASTOUT)

$(OUT)/05_plot.png: $(SCRIPTS)/analysis.R \
                    $(DATA)/data.csv
	cd $(SCRIPTS); Rscript -e "rmarkdown::render('analysis.R')"


## Paper ----
paper: $(PAPER)/paper.pdf
$(PAPER)/paper.pdf: $(PAPER)/paper.md \
                    $(LASTOUT)
	cd $(PAPER); pandoc paper.md -o paper.pdf 


## Cleaning ----
.PHONY: clean
MADEDATA := $(filter-out $(wildcard $(DATA)/00_*), $(wildcard $(DATA)/*))
MADE := $(wildcard $(OUT)/*) \
        $(SCRIPTS)/analysis.html \
        $(MADEDATA) \
        $(PAPER)/paper.pdf        
clean:
	rm $(MADE)