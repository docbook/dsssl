DSLXREF=../../cvstools/dslxref

all:

XREF: db31.dsl dbadmon.dsl dbautoc.dsl dbbibl.dsl dbblock.dsl \
      dbcallou.dsl dbcompon.dsl dbdivis.dsl dbefsyn.dsl \
      dbgloss.dsl dbgraph.dsl dbindex.dsl dbinfo.dsl dbinline.dsl \
      dblink.dsl dblists.dsl dblot.dsl dbmath.dsl dbmsgset.dsl \
      dbparam.dsl dbprint.dsl dbprocdr.dsl dbrfntry.dsl dbsect.dsl \
      dbsynop.dsl dbtable.dsl dbtitle.dsl dbttlpg.dsl dbverb.dsl \
      docbook.dsl notoc.dsl plain.dsl version.dsl
	$(DSLXREF) docbook.dsl > XREF

clean:
	rm -f XREF
