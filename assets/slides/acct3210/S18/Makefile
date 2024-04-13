## all                             : makes slides and handouts from costallocation3_slides.md
output =  costallocation3_slides.pdf costallocation3_slides_handouts.pdf 
input = costallocation3_slides.md styles.html

.PHONY : all
all: $(output) $(input) push

# costallocation3_slides.html     : generate html slides
# costallocation3_slides.html: costallocation3_slides.md styles.html
# 	pandoc -t revealjs -s costallocation3_slides.md -o costallocation3_slides.html \
# 		-H styles.html  --slide-level 3 ; \
# 	open costallocation3_slides.html

## costallocation2_slides.pdf	  : generate pdf slides 
costallocation3_slides.pdf: costallocation3_slides.md 
	pandoc costallocation3_slides.md --dpi=300 --slide-level 3 -V \
		classoption:aspectratio=169 -t beamer -o \
		costallocation3_slides.pdf 
	open costallocation3_slides.pdf                                                       


## costallocation3_slides_handouts : generate pdf handouts 
costallocation3_slides_handouts.pdf: costallocation3_slides.md 
	pandoc costallocation3_slides.md -o costallocation3_slides_handouts.pdf ; \
	open costallocation3_slides_handouts.pdf

## push                            : commits changes and pushes to github
.PHONY : push
push: $(output) $(input) # costallocation3_slides.md styles.html
	git add . ; \
	git commit -am "added lecture 18" ; \
	git push

## clean                           : removes output files $(output)
.PHONY : clean
clean: 
	rm -f $(output)

## help                            : help generated from double sh'd comments
.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<
