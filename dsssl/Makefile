CVS2LOG=../cvstools/cvs2log
MERGELOGS=../cvstools/mergechangelogs
NEXTVER=../cvstools/nextversion
DIFFVER=
ZIPVER=

all:
	$(MAKE) -C common
	$(MAKE) -C html
	$(MAKE) -C print

doc: all
	$(MAKE) -C docsrc
	$(MAKE) -C doc

distrib: all doc
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
	find . -type f -name ".cvsignore"  | cut -c3- >> /tmp/tar.exclude
	find . -type f -name "Makefile*"   | cut -c3- >> /tmp/tar.exclude
	find . -type f -name "README.CVS"   | cut -c3- >> /tmp/tar.exclude
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
	tar cf - doc docsrc --exclude-from /tmp/tar.exclude | (cd /tmp/docbook-dsssl-$(ZIPVER); tar xf -)
	cd /tmp && tar cf - docbook-dsssl-$(ZIPVER) | gzip > docbook-dsssl-doc-$(ZIPVER).tar.gz
	cd /tmp && zip -rpD docbook-dsssl-doc-$(ZIPVER).zip docbook-dsssl-$(ZIPVER)
	rm -f tar.exclude
endif

clean:
	$(MAKE) -C doc clean
