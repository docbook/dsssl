/^<!ENTITY dbparam.dsl/a\
<!ENTITY siteconfig.dsl SYSTEM "/etc/sgml/docbook-dsssl/print/siteconfig.dsl" CDATA DSSSL>

s/\(use=.*\) dbparam/\1 siteconfig dbparam/;

/^<external-specification id="dbparam/a\
<external-specification id="siteconfig" document="siteconfig.dsl">
