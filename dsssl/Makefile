include ../buildtools/Makefile.incl

CVS2LOG=../buildtools/cvs2log
MERGELOGS=../buildtools/mergechangelogs
NEXTVER=../buildtools/nextversion
DIFFVER=
ZIPVER=
SFRELID=
FMGO=-N
BROWSER=w3m

all:
	$(MAKE) -C common
	$(MAKE) -C html
	$(MAKE) -C print

doc: all
	$(MAKE) -C docsrc
	$(MAKE) -C doc
	$(MAKE) -C bin

RELEASE-NOTES.html: RELEASE-NOTES.xml
	$(XJPARSE) $<
	$(XSLT) $< ../xsl/docsrc/doc-link-docbook.xsl $@

RELEASE-NOTES.txt: RELEASE-NOTES.html
	$(BROWSER) -dump $< > $@

distrib: all doc RELEASE-NOTES.html RELEASE-NOTES.txt
	$(MAKE) -C images
	$(MAKE) -C html XREF
	$(MAKE) -C print XREF
	$(CVS2LOG) -w
ifeq ($(DIFFVER),)
	$(MERGELOGS) > WhatsNew
else
	$(MERGELOGS) -v $(DIFFVER) > WhatsNew
endif

newversion:
	$(NEXTVER)
	make DIFFVER=$(DIFFVER) distrib

freshmeat:
ifeq ($(SFRELID),)
	@echo "You must specify the sourceforge release identifier in SFRELID"
else
	$(XSLT) FRESHMEAT FRESHMEAT /tmp/fm-docbook-dsssl sf-relid=$(SFRELID)
	grep -v '<?xml' /tmp/fm-docbook-dsssl | freshmeat-submit $(FMGO)
endif

zip:
ifeq ($(ZIPVER),)
	@echo You must specify ZIPVER for the zip target
else
	rm -rf /tmp/docbook-dsssl-$(ZIPVER)
	rm -f /tmp/tar.exclude
	rm -f /tmp/docbook-dsssl-$(ZIPVER).tar.gz
	rm -f /tmp/docbook-dsssl-$(ZIPVER).zip
	mkdir /tmp/docbook-dsssl-$(ZIPVER)
	touch /tmp/tar.exclude
	find . -print  | grep /CVS$$ | cut -c3- >> /tmp/tar.exclude
	find . -print  | grep /CVS/ | cut -c3- >> /tmp/tar.exclude
	find . -print  | grep /doc/ | cut -c3- >> /tmp/tar.exclude
	find . -print  | grep /docsrc/ | cut -c3- >> /tmp/tar.exclude
	find . -type f -name "*~"  | cut -c3- >> /tmp/tar.exclude
	find . -type f -name ".*~"  | cut -c3- >> /tmp/tar.exclude
	find . -type f -name "#*"  | cut -c3- >> /tmp/tar.exclude
	find . -type f -name ".#*"  | cut -c3- >> /tmp/tar.exclude
	find . -type f -name "*.bak"  | cut -c3- >> /tmp/tar.exclude
	find . -type f -name "*.orig"  | cut -c3- >> /tmp/tar.exclude
	find . -type f -name ".cvsignore"  | cut -c3- >> /tmp/tar.exclude
	find . -type f -name "Makefile*"   | cut -c3- >> /tmp/tar.exclude
	find . -type f -name "README.CVS"   | cut -c3- >> /tmp/tar.exclude
	find . -type f -name "FRESHMEAT"   | cut -c3- >> /tmp/tar.exclude
	tar cf - * --exclude-from /tmp/tar.exclude | (cd /tmp/docbook-dsssl-$(ZIPVER); tar xf -)
	cd /tmp && tar cf - docbook-dsssl-$(ZIPVER) | gzip > docbook-dsssl-$(ZIPVER).tar.gz
	cd /tmp && zip -rpD docbook-dsssl-$(ZIPVER).zip docbook-dsssl-$(ZIPVER)
	rm -f tar.exclude
	rm -rf /tmp/docbook-dsssl-$(ZIPVER)
	rm -f /tmp/tar.exclude
	rm -f /tmp/docbook-dsssl-doc-$(ZIPVER).tar.gz
	rm -f /tmp/docbook-dsssl-doc-$(ZIPVER).zip
	mkdir /tmp/docbook-dsssl-$(ZIPVER)
	touch /tmp/tar.exclude
	find . -print  | grep /CVS$$ | cut -c3- >> /tmp/tar.exclude
	find . -print  | grep /CVS/ | cut -c3- >> /tmp/tar.exclude
	find . -type f -name "*~"  | cut -c3- >> /tmp/tar.exclude
	find . -type f -name "#*"  | cut -c3- >> /tmp/tar.exclude
	find . -type f -name ".cvsignore"  | cut -c3- >> /tmp/tar.exclude
	find . -type f -name "Makefile*"   | cut -c3- >> /tmp/tar.exclude
	find . -type f -name "README.CVS"   | cut -c3- >> /tmp/tar.exclude
	find . -type f -name "FRESHMEAT"   | cut -c3- >> /tmp/tar.exclude
	tar cf - doc docsrc --exclude-from /tmp/tar.exclude | (cd /tmp/docbook-dsssl-$(ZIPVER); tar xf -)
	cd /tmp && tar cf - docbook-dsssl-$(ZIPVER) | gzip > docbook-dsssl-doc-$(ZIPVER).tar.gz
	cd /tmp && zip -rpD docbook-dsssl-doc-$(ZIPVER).zip docbook-dsssl-$(ZIPVER)
	rm -f tar.exclude
endif

clean:
	$(MAKE) -C doc $@
	$(MAKE) -C docsrc $@
	$(MAKE) -C common $@
	$(MAKE) -C html $@
	$(MAKE) -C print $@
	$(MAKE) -C bin $@
	rm -f WhatsNew ChangeLog RELEASE-NOTES.html RELEASE-NOTES.txt *~ *.bak .#*
