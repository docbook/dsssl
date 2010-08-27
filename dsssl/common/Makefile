XSLT=../../buildtools/saxon
XJPARSE=../../buildtools/xjparse
JADE=jade
CATALOG=/share/doctypes/catalog
XMLDCL=../dtds/decls/xml.dcl

# Yes, it would be desireable to do this with Jade, but the source files
# cannot be made valid so Jade barfs. If there's a 'do a well-formed parse
# even if there's a doctype declaration' option on OpenJade, then maybe
# that would work.

SOURCES=dbl1af.ent dbl1am.ent dbl1ar.ent dbl1as.ent dbl1ast.ent dbl1az.ent \
	dbl1bg.ent dbl1bn.ent dbl1bnin.ent dbl1bs.ent dbl1ca.ent dbl1cs.ent \
	dbl1cy.ent dbl1da.ent dbl1de.ent dbl1el.ent dbl1en.ent dbl1eo.ent \
	dbl1es.ent dbl1et.ent dbl1eu.ent dbl1fa.ent dbl1fi.ent dbl1fr.ent \
	dbl1ga.ent dbl1gl.ent dbl1gu.ent dbl1he.ent dbl1hi.ent dbl1hr.ent \
	dbl1hu.ent dbl1id.ent dbl1is.ent dbl1it.ent dbl1ja.ent dbl1ka.ent \
	dbl1kn.ent dbl1ko.ent dbl1ky.ent dbl1la.ent dbl1lt.ent dbl1lv.ent \
	dbl1ml.ent dbl1mn.ent dbl1mr.ent dbl1nb.ent dbl1nds.ent dblnl.ent \
	dblnn.ent dbl1or.ent dbl1pa.ent dbl1pl.ent dbl1pt.ent dbl1ptbr.ent \
	dbl1ro.ent dbl1ru.ent dbl1sk.ent dbl1sl.ent dbl1sq.ent dbl1sr.ent \
	dbl1srLatn.ent dbl1sv.ent dbl1ta.ent dbl1te.ent dbl1th.ent dbl1tl.ent \
	dbl1tr.ent dbl1uk.ent dbl1vi.ent dbl1xh.ent dbl1zh.ent dbl1zhcn.ent \
	dbl1zhtw.ent

all: $(SOURCES) dbl10n.dsl catalog

dbl10n.dsl: dbl10n.template dbl10n.pl
	perl dbl10n.pl

dbl1bnin.ent dbl1ptbr.ent dbl1srLatn.ent dbl1zhcn.ent dbl1zhtw.ent:
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
