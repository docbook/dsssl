all:	collateindex.pl.1

collateindex.pl.1: collateindex.pl
	pod2man --section=1 --center="DocBook DSSSL" \
		--release="docbook-dsssl v$(cat ../VERSION)" $< > $@

clean:
	rm -f collateindex.pl.1
