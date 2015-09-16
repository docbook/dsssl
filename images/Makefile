include Make.images

.PHONY: all clean

all: $(EPS) $(PDF)
	$(MAKE) -C callouts

clean:
	rm -f $(EPS) $(PDF)
	$(MAKE) -C callouts clean
