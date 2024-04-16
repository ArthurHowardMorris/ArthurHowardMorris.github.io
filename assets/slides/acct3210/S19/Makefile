## all                             : makes slides and handouts from problems.md
output =  problems.pdf problems_handouts.pdf 
input = problems.md styles.html

.PHONY : all
all: $(output) $(input) push

# ## problems.html     : generate html slides
# problems.html: problems.md styles.html
# 	pandoc -t revealjs -s problems.md -o problems.html \
# 		-H styles.html  --slide-level 3 ; \
# 	open problems.html

## problems.pdf	  : generate pdf slides 
problems.pdf: problems.md 
	pandoc problems.md --dpi=300 --slide-level 3 -V \
		classoption:aspectratio=169 -t beamer -o \
		problems.pdf 
	open problems.pdf                                                       

## problems_handouts : generate pdf handouts 
problems_handouts.pdf: problems.md 
	pandoc problems.md -o problems_handouts.pdf ; \
	open problems_handouts.pdf

## push                            : commits changes and pushes to github
.PHONY : push
push: $(output) $(input) # problems.md styles.html
	git add . ; \
	git commit -am "added lecture 19" ; \
	git push

## clean                           : removes output files $(output)
.PHONY : clean
clean: 
	rm -f $(output)

## help                            : help generated from double sh'd comments
.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<
