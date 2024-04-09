## all                             : makes slides and handouts from costallocation2_slides.md
output =  costallocation2_slides.html costallocation2_slides.pdf costallocation2_slides_handouts.pdf 
input = costallocation2_slides.md styles.html

.PHONY : all
all: $(output) $(input) push

## costallocation2_slides.html     : generate html slides
costallocation2_slides.html: costallocation2_slides.md styles.html
	pandoc -t revealjs -s costallocation2_slides.md -o costallocation2_slides.html \
		-H styles.html  --slide-level 3 ; \
	open costallocation2_slides.html

## costallocation2_slides.pdf	  : generate pdf slides 
costallocation2_slides.pdf: costallocation2_slides.md 
	pandoc costallocation2_slides.md --dpi=300 --slide-level 3 -V \
		classoption:aspectratio=169 -t beamer -o \
		costallocation2_slides.pdf 
	open costallocation2_slides.pdf                                                       

## costallocation2_slides_handouts : generate pdf handouts 
costallocation2_slides_handouts.pdf: costallocation2_slides.md 
	pandoc costallocation2_slides.md -o costallocation2_slides_handouts.pdf ; \
	open costallocation2_slides_handouts.pdf

## push                            : commits changes and pushes to github
.PHONY : push
push: $(output) $(input) # costallocation2_slides.md styles.html
	git add . ; \
	git commit -am "added lecture 17" ; \
	git push

## clean                           : removes output files $(output)
.PHONY : clean
clean: 
	rm -f $(output)

## help                            : help generated from double sh'd comments
.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<
