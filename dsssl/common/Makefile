XSLT=../../cvstools/saxon
XJPARSE=../../cvstools/xjparse
JADE=jade
CATALOG=/share/doctypes/catalog
XMLDCL=../dtds/decls/xml.dcl

# Yes, it would be desireable to do this with Jade, but the source files
# cannot be made valid so Jade barfs. If there's a 'do a well-formed parse
# even if there's a doctype declaration' option on OpenJade, then maybe
# that would work.

SOURCES=dbl1ca.ent dbl1cs.ent dbl1da.ent dbl1de.ent dbl1el.ent \
        dbl1en.ent dbl1es.ent dbl1et.ent dbl1fi.ent dbl1fr.ent \
        dbl1hu.ent dbl1id.ent dbl1it.ent dbl1ja.ent dbl1ko.ent \
        dbl1nl.ent dbl1no.ent dbl1pl.ent dbl1pt.ent dbl1ptbr.ent \
        dbl1ro.ent dbl1ru.ent dbl1sk.ent dbl1sl.ent dbl1sr.ent \
        dbl1sv.ent \
        dbl1zhcn.ent dbl1zhtw.ent

all: $(SOURCES)

dbl1ca.ent: ../../gentext/locale/ca.xml
dbl1cs.ent: ../../gentext/locale/cs.xml
dbl1da.ent: ../../gentext/locale/da.xml
dbl1de.ent: ../../gentext/locale/de.xml
dbl1el.ent: ../../gentext/locale/el.xml
dbl1en.ent: ../../gentext/locale/en.xml
dbl1es.ent: ../../gentext/locale/es.xml
dbl1et.ent: ../../gentext/locale/et.xml
dbl1fi.ent: ../../gentext/locale/fi.xml
dbl1fr.ent: ../../gentext/locale/fr.xml
dbl1hu.ent: ../../gentext/locale/hu.xml
dbl1id.ent: ../../gentext/locale/id.xml
dbl1it.ent: ../../gentext/locale/it.xml
dbl1ja.ent: ../../gentext/locale/ja.xml
dbl1ko.ent: ../../gentext/locale/ko.xml
dbl1nl.ent: ../../gentext/locale/nl.xml
dbl1no.ent: ../../gentext/locale/no.xml
dbl1pl.ent: ../../gentext/locale/pl.xml
dbl1pt.ent: ../../gentext/locale/pt.xml
dbl1ptbr.ent: ../../gentext/locale/pt_br.xml
dbl1ro.ent: ../../gentext/locale/ro.xml
dbl1ru.ent: ../../gentext/locale/ru.xml
dbl1sk.ent: ../../gentext/locale/sk.xml
dbl1sl.ent: ../../gentext/locale/sl.xml
dbl1sr.ent: ../../gentext/locale/sr.xml
dbl1sv.ent: ../../gentext/locale/sv.xml
dbl1zhcn.ent: ../../gentext/locale/zh_cn.xml
dbl1zhtw.ent: ../../gentext/locale/zh_tw.xml

%.ent:
	$(XSLT) $< ../../gentext/xsl/dsssl.xsl $@
	perl -i.bak cs-hack.pl $@
	rm -f $@.bak

clean:
	rm -f *.ent
