XSLT=../../cvstools/saxon
XJPARSE=../../cvstools/xjparse
JADE=jade
CATALOG=/share/doctypes/catalog
XMLDCL=../dtds/decls/xml.dcl

# Yes, it would be desireable to do this with Jade, but the source files
# cannot be made valid so Jade barfs. If there's a 'do a well-formed parse
# even if there's a doctype declaration' option on OpenJade, then maybe
# that would work.

SOURCES=dbl1af.ent \
        dbl1ca.ent dbl1cs.ent dbl1da.ent dbl1de.ent dbl1el.ent \
        dbl1en.ent dbl1es.ent dbl1et.ent dbl1eu.ent dbl1fi.ent dbl1fr.ent \
        dbl1he.ent dbl1hu.ent dbl1id.ent dbl1it.ent dbl1ja.ent dbl1ko.ent \
        dbl1nl.ent dbl1nn.ent dbl1no.ent dbl1pl.ent dbl1pt.ent dbl1ptbr.ent \
        dbl1ro.ent dbl1ru.ent dbl1sk.ent dbl1sl.ent dbl1sr.ent \
        dbl1sv.ent dbl1th.ent dbl1tr.ent dbl1uk.ent dbl1xh.ent \
        dbl1zhcn.ent dbl1zhtw.ent

all: $(SOURCES) dbl10n.dsl catalog

dbl10n.dsl: dbl10n.template dbl10n.pl
	perl dbl10n.pl

dbl1ptbr.ent dbl1zhcn.ent dbl1zhtw.ent:
	$(XSLT) $(shell echo $@ | sed -e 's|dbl1\(..\)\(..\).ent|../../gentext/locale/\1_\2.xml|;') ../../gentext/xsl/dsssl.xsl $@
	perl -i.bak cs-hack.pl $@
	rm -f $@.bak

dbl1%.ent: ../../gentext/locale/%.xml
	$(XSLT) $< ../../gentext/xsl/dsssl.xsl $@
	perl -i.bak cs-hack.pl $@
	rm -f $@.bak

catalog:	$(wildcard *.dsl)
	: > $@
	echo "OVERRIDE YES" >> $@
	grep "^ *PUBLIC" *.dsl | sed -e 's|^\(dbl1[^.]*\).dsl: *\(.*\)$$|\2 "\1.ent"|;' >> $@

clean:
	rm -f catalog
#	 why not remove also  dbl10n.dsl?
	rm -f $(filter-out dbl10n.ent,$(wildcard *.ent))
