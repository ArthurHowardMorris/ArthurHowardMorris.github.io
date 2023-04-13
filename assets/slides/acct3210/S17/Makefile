## all                             : makes slides and handouts from costallocation2_slides.md
output =  costallocation2_slides.html costallocation2_slides_handouts.pdf 
all: $(output)
## costallocation2_slides.html     : generate html slides
costallocation2_slides.html: costallocation2_slides.md styles.html
	pandoc -t revealjs -s costallocation2_slides.md -o costallocation2_slides.html \
		-H styles.html  --slide-level 3
	open costallocation2_slides.html

## costallocation2_slides_handouts : generate pdf handouts 
costallocation2_slides_handouts.pdf: costallocation2_slides.md 
	pandoc costallocation2_slides.md -o costallocation2_slides_handouts.pdf 
	open costallocation2_slides_handouts.pdf

## clean                           : removes output files $(output)
.PHONY : clean
clean: 
	rm -f $(output)

## help                            : help generated from double sh'd comments
.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<
