VPATH=../docsrc
DSL2MAN=../../cvstools/dsl2man
JADE=../../cvstools/runjade

all: htmlpr/dbparam.sgm printpr/dbparam.sgm libref/dblib.sgm \
     collateindex.olink imagelib.olink olinksemantics.olink \
     indexing.olink olinktarget.olink

htmlpr/dbparam.sgm: ../html/dbparam.dsl
	cd ../html && $(DSL2MAN) -i ht -d ../docsrc/htmlpr dbparam.dsl

printpr/dbparam.sgm: ../print/dbparam.dsl
	cd ../print && $(DSL2MAN) -i pr -d ../docsrc/printpr dbparam.dsl

libref/dblib.sgm: ../lib/dblib.dsl
	cd ../lib && $(DSL2MAN) -i lib -d ../docsrc/libref dblib.dsl

%.olink: %.sgm
	$(JADE) sgml ../olink/olink.dsl $< > $@
