VPATH=../docsrc
HDSSSL=../html/docbook.dsl

JADE=../../cvstools/runjade

all: index.html collateindex.html imagelib.html olinksemantics.html \
     indexing.html html/index.html print/index.html lib/index.html

collateindex.html: collateindex.sgm ../VERSION
	$(JADE) sgml $(HDSSSL) $< -V use-output-dir

imagelib.html: imagelib.sgm ../VERSION
	$(JADE) sgml $(HDSSSL) $< -V use-output-dir

olinksemantics.html: olinksemantics.sgm ../VERSION
	$(JADE) sgml $(HDSSSL) $< -V use-output-dir

indexing.html: indexing.sgm ../VERSION
	$(JADE) sgml $(HDSSSL) $< -V use-output-dir

index.html: docbook.sgm common-version.sgm common.sgm custom.sgm \
            html-version.sgm html.sgm \
            lib-version.sgm lib.sgm otherdoc.sgm print-version.sgm \
            install.sgm print.sgm doc.dsl
	$(JADE) sgml ../docsrc/doc.dsl $< -V use-output-dir

html/index.html: htparam.sgm htmlpr/dbparam.sgm
	$(JADE) sgml ../docsrc/doc.dsl $< -V use-output-dir

print/index.html: prparam.sgm printpr/dbparam.sgm
	$(JADE) sgml ../docsrc/doc.dsl $< -V use-output-dir

lib/index.html: dblib.sgm libref/dblib.sgm
	$(JADE) sgml ../docsrc/doc.dsl $< -V use-output-dir

clean:
	rm -f *.html *.htm lib/*.html print/*.html html/*.html

