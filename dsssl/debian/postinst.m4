#!/bin/sh

PACKAGE=M4package
CENTRALCAT=/etc/sgml/${PACKAGE}.cat
DTDDIR=M4DTDDIR
ORDCATS="M4ORDCATS"
COMPATLNK=/usr/lib/sgml/stylesheet/dsssl/docbook/nwalsh
COMPATLNKTO=../../../../../share/sgml/docbook/stylesheet/dsssl/modular


set -e

if [ "$1" = configure ]; then
    # remove old entries from transitional.cat
    install-sgmlcatalog --quiet --remove docbook-stylesheets

    # some old cruft which is lying around -- probably dhelp cruft
    [ ! -d /usr/doc/$PACKAGE/doc ] || rmdir --ignore-fail-on-non-empty /usr/doc/$PACKAGE/doc || true

    # make the central catalog a clean slate (in case some catalogs
    # were removed or moved)
    rm -f ${CENTRALCAT}

    # install the new delegated catalogs into a central catalog
    for ordcat in ${ORDCATS}; do
        update-catalog --quiet --add ${CENTRALCAT} ${DTDDIR}/${ordcat}
    done

    # install that central catalog into the super catalog
    update-catalog --quiet --add --super ${CENTRALCAT}

    # for some reason the compatability link keeps turning into a directory
    if [ ! -h ${COMPATLNK} -a -d ${COMPATLNK} ] && rmdir ${COMPATLNK} 2>/dev/null; then
        ln -sf ${COMPATLNKTO} ${COMPATLNK}
    fi
fi

# automatically generated debhelper commands
#DEBHELPER#

exit 0
