all: eps pdf
	$(MAKE) -C callouts

.PHONY: eps pdf

eps:
	for f in *.gif; do convert $$f `basename $$f .gif`.eps; done

pdf: eps
	for f in *.eps; do epstopdf --outfile=`basename $$f .eps`.pdf $$f; done
