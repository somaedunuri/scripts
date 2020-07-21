#!/bin/sh
#hfr image Builds
if [ ! -d crypto/toolkit ]; then
    acme mw -nodepend -noprompt -comp crypto/toolkit@crypto/cepki/toolkit.lu
fi
date >hfr.logs
echo hfr ppc build...
date
date >>hfr.logs

/router/bin/jam -notb -j20 -sJAM_CREATE_XSD=y -sJAM_CREATE_PERL_DOC=y hfr-mini-p.vm >>hfr.logs
/router/bin/jam -notb -j20 hfr-mgbl-p.pie hfr-mpls-p.pie hfr-mcast-p.pie hfr-mini-p.pie hfr-cgn-p.pie >>hfr.logs
/router/bin/jam -notb -j20 hfr-k9sec-p.pie hfr-diags-p.pie hfr-fpd-p.pie hfr-doc.pie hfr-upgrade-p.pie >>hfr.logs
/router/bin/jam -notb -j20  -sPAGENT=y hfr-pagent-p.pie hfr-pagent-px.pie >>hfr.logs

/router/bin/jam -notb -j20 hfr-infra-test-p.pie >>hfr.logs
/router/bin/jam -notb -j20 -platform hfr-p -sSYSDB_DEVEL_OPTS_ON=1 -psysdb sysdb/pie >>hfr.logs
/router/bin/jam -notb -j20 -platform hfr-p ets/rex/pie >>hfr.logs
 
# Now the px images
/router/bin/jam -notb -j20 -sJAM_CREATE_XSD=y -sJAM_CREATE_PERL_DOC=y hfr-mini-px.vm >>hfr.logs
/router/bin/jam -notb -j20 hfr-mgbl-px.pie hfr-mpls-px.pie hfr-mcast-px.pie hfr-mini-px.pie >>hfr.logs
/router/bin/jam -notb -j20 hfr-k9sec-px.pie hfr-diags-px.pie hfr-fpd-px.pie hfr-doc-px.pie hfr-cgn-px.pie hfr-upgrade-px.pie >>hfr.logs

#jam hfr-infra-test-p.pie hfr-infra-test-px.pie  >>hfr.logs
#jam -sPAGENT=y hfr-pagent-p.pie hfr-pagent-px.pie 
#**************************
cd img-hfr
ls -l hfr-mini-p.vm hfr-mini-p.pie hfr-mpls-p.pie hfr-mgbl-p.pie hfr-mcast-p.pie hfr-k9sec-p.pie hfr-fpd-p.pie hfr-diags-p.pie hfr-doc.pie hfr-cgn-p.pie hfr-upgrade-p.pie hfr-mini-px.vm hfr-mini-px.pie hfr-mcast-px.pie hfr-mpls-px.pie hfr-mgbl-px.pie hfr-k9sec-px.pie hfr-doc-px.pie hfr-fpd-px.pie hfr-doc-px.pie hfr-upgrade-px.pie hfr-cgn-px.pie
ls -l hfr-infra-test-p.pie 
date
date >>hfr.logs
