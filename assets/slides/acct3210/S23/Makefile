## all                             : makes slides and handouts from slides.md
output =  slides.html slides_handouts.pdf 
input = slides.md styles.html

.PHONY : all
all: $(output) $(input) push

## slides.html     : generate html slides
slides.html: slides.md styles.html
	pandoc -t revealjs -s slides.md -o slides.html \
		-H styles.html  --slide-level 3 ; \
	open slides.html

## slides_handouts : generate pdf handouts 
slides_handouts.pdf: slides.md 
	pandoc slides.md -o slides_handouts.pdf ; \
	open slides_handouts.pdf

## push                            : commits changes and pushes to github
.PHONY : push
push: $(output) $(input) # slides.md styles.html
	git add . ; \
	git commit -am "added lecture 23" ; \
	git push

## clean                           : removes output files $(output)
.PHONY : clean
clean: 
	rm -f $(output)

## help                            : help generated from double sh'd comments
.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<
