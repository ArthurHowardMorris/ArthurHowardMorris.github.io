## all                 : makes slides and handouts from vik_slides.md
output =  vik_slides.html vik_slides.pdf vik_slides_handouts.pdf vik_solution_slides.html vik_solution_slides.pdf vik_solution_slides_handouts.pdf
all: $(output)

## vik_slides.html     : generate html slides
vik_slides.html: vik_slides.md 
	pandoc -t revealjs -s vik_slides.md -o vik_slides.html \
		-H styles.html --slide-level 3
	open vik_slides.html

## vik_slides.pdf	: generate pdf slides 
vik_slides.pdf: vik_slides.md 
	pandoc vik_slides.md --dpi=300 --slide-level 2 -V \
		classoption:aspectratio=169 -t beamer -o \
		vik_slides.pdf 
	open vik_slides.pdf                                                       

## vik_slides_handouts : generate pdf handouts 
vik_slides_handouts.pdf: vik_slides.md
	pandoc vik_slides.md -o vik_slides_handouts.pdf
	open vik_slides_handouts.pdf
## vik_solution_slides.html     : generate html slides
vik_solution_slides.html: vik_solution_slides.md 
	pandoc -t revealjs -s vik_solution_slides.md -o vik_solution_slides.html \
		-H styles.html --slide-level 3
	open vik_solution_slides.html

## vik_slides.pdf	: generate pdf slides 
vik_solution_slides.pdf: vik_solution_slides.md 
	pandoc vik_solution_slides.md --dpi=300 --slide-level 2 -V \
		classoption:aspectratio=169 -t beamer -o \
		vik_solution_slides.pdf 
	open vik_solution_slides.pdf                                                       

## vik_slides_handouts : generate pdf handouts 
vik_solution_slides_handouts.pdf: vik_solution_slides.md
	pandoc vik_solution_slides.md -o vik_solution_slides_handouts.pdf
	open vik_solution_slides_handouts.pdf

## clean               : removes output files $(output)
.PHONY : clean
clean: 
	rm -f $(output)

## help                : help generated from double sh'd comments
.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<
