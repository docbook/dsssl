#!/bin/bash

. /usr/share/debconf/confmodule

PACKAGE=M4package
CENTRALCAT=/etc/sgml/${PACKAGE}.cat
DTDDIR=M4DTDDIR
ORDCATS="M4ORDCATS"
COMPATLNK=/usr/lib/sgml/stylesheet/dsssl/docbook/nwalsh
COMPATLNKTO=../../../../../share/sgml/docbook/stylesheet/dsssl/modular
CONFDIR=M4CONFDIR
CONFTEMPLATEDIR=M4CONFTEMPLATEDIR
HTMLCONF=${CONFDIR}/html/siteconfig.dsl
PRINTCONF=${CONFDIR}/print/siteconfig.dsl
IMAGEDIR=M4IMAGEDIR

set -e

# whether to be verbose
verbose=false

ME=`basename $0`

# 
debug () {
    if ${verbose}; then
        echo $ME: $* >&2
    fi
}

# e.g.: setit print %visual-acuity% normal
setit () {
    local which=$1; shift
    local setting=$1; shift
    local value=$1; shift
    local file

    if [ -z "$setting" -o -z "$value" ]; then
        echo "setting '$setting' or value '$value' is empty, skipping" >&2
        return
    fi

    if [ "$which" = print ]; then
        file=${PRINTCONF}
    elif [ "$which" = html ]; then
        file=${HTMLCONF}
    else
        echo "setit first arg must be 'print' or 'html'" >&2
        exit 1
    fi

    if [ ! -f ${file} ]; then
        echo "configuration file '$file' doesn't exist" >&2
        exit 1
    fi
    
    # quote value if we need to
    if [ "$value" != "${value#[0-9%]}" ]; then
        : # it starts with a number or '%', leave it alone
    elif [ "$value" = true ]; then
        value='#t'
    elif [ "$value" = false ]; then
        value='#f'
    else
        # assume it's a string
        value="\"$value\""
    fi
    
    if grep -q "^(define $setting $value)" ${file}; then
        debug "setting '$setting' already set to $value in file '$file'"
    elif grep -q "^(define $setting .*)" ${file}; then
        debug "found setting '$setting' in file '$file', updating"
        sed -e "s/^(define $setting .*).*$/(define $setting $value) ;; set by debconf/;" ${file} > ${file}.new
        cat ${file}.new > ${file}
        rm -f ${file}.new
    else
        debug "did not find setting '$setting' in file '$file', adding" >&2
        sed -e "/^<style-specification-body>/a\\
(define $setting $value) \;\; set by debconf;" ${file} > ${file}.new
        cat ${file}.new > ${file}
        rm -f ${file}.new
    fi
}


if [ "$1" = configure ]; then
    if ! ${verbose}; then
        quiet="--quiet"
    fi

    ##
    ## catalog handling
    ##
    # remove old entries from transitional.cat
    install-sgmlcatalog ${quiet} --remove docbook-stylesheets

    # make the central catalog a clean slate (in case some catalogs
    # were removed or moved)
    rm -f ${CENTRALCAT}

    debug "registering $ORDCATS in $CENTRALCAT"

    # install the new delegated catalogs into a central catalog
    for ordcat in ${ORDCATS}; do
        update-catalog ${quiet} --add ${CENTRALCAT} ${DTDDIR}/${ordcat}
    done

    # install that central catalog into the super catalog
    update-catalog ${quiet} --add --super ${CENTRALCAT}

    ##
    ## cruft removal
    ##
    # old dhelp cruft
    [ ! -d /usr/doc/$PACKAGE/doc ] || rmdir --ignore-fail-on-non-empty /usr/doc/$PACKAGE/doc || true
    # postinst substitution broke
    rm -f /etc/sgml/M4package.cat*
    # for some reason the compatability link keeps turning into a directory
    if [ ! -h ${COMPATLNK} -a -d ${COMPATLNK} ] && rmdir ${COMPATLNK} 2>/dev/null; then
        ln -sf ${COMPATLNKTO} ${COMPATLNK}
    fi

    ## create conffiles if they aren't there
    if [ ! -f $HTMLCONF ]; then
        debug "creating new ${HTMLCONF}"
        install -o root -g root -m 644 -p $CONFTEMPLATEDIR/html-siteconfig.dsl ${HTMLCONF}
    fi
    if [ ! -f $PRINTCONF ]; then
        debug "creating new ${PRINTCONF}"
        install -o root -g root -m 644 -p $CONFTEMPLATEDIR/print-siteconfig.dsl ${PRINTCONF}
    fi

    ##
    ## where images are located
    ##
    setit print %admon-graphics-path% ${IMAGEDIR}/
    setit html %admon-graphics-path% ${IMAGEDIR}/
    setit html %callout-graphics-path% ${IMAGEDIR}/callouts

    ##
    ## debconf jazz
    ##
    debug "using debconf setting to do local site configuration"
    if db_get docbook-dsssl/show-comments; then
        setit print %show-comments% "$RET"
        setit html %show-comments% "$RET"
    fi
    if db_get docbook-dsssl/set-papersize && $RET; then
        setit print %page-height% `locale LC_PAPER | sed -n -e '1p'`mm
        setit print %page-width% `locale LC_PAPER | sed -n -e '2p'`mm
    fi
    if db_get docbook-dsssl/html-ext; then
        setit html %html-ext% "$RET"
    fi
    if db_get docbook-dsssl/use-id-as-filename; then
        setit html %use-id-as-filename% "$RET"
    fi
    if db_get docbook-dsssl/body-start-indent; then
        if $RET; then
            setit print %body-start-indent% 4pi
        else
            setit print %body-start-indent% 0pi
        fi
    fi
    if db_get docbook-dsssl/visual-acuity; then
        setit print %visual-acuity% "$RET"
    fi
    if db_get docbook-dsssl/title-font-family; then
        setit print %title-font-family% "$RET"
    fi
fi

# automatically generated debhelper commands
#DEBHELPER#

exit 0
