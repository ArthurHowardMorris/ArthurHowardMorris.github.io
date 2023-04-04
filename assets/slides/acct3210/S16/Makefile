## all                             : makes slides and handouts from costallocation1_slides.md
output =  costallocation1_slides.html costallocation1_slides_handouts.pdf 
all: $(output)
## costallocation1_slides.html     : generate html slides
costallocation1_slides.html: costallocation1_slides.md styles.html
	pandoc -t revealjs -s costallocation1_slides.md -o costallocation1_slides.html \
		-H styles.html  --slide-level 3
	open costallocation1_slides.html

## costallocation1_slides_handouts : generate pdf handouts 
costallocation1_slides_handouts.pdf: costallocation1_slides.md 
	pandoc costallocation1_slides.md -o costallocation1_slides_handouts.pdf 
	open costallocation1_slides_handouts.pdf

## clean                           : removes output files $(output)
.PHONY : clean
clean: 
	rm -f $(output)

## help                            : help generated from double sh'd comments
.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<
