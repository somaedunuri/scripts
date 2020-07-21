#!/bin/sh
#hfr image Builds
if [ ! -d crypto/toolkit ]; then
    acme mw -nodepend -noprompt -comp crypto/toolkit@crypto/cepki/toolkit.lu
fi
date >hfr.logs
echo "hfr ppc build..."
date
date >>hfr.logs
jam -notb -j20 -sJAM_CREATE_XSD=y -sJAM_CREATE_PERL_DOC=y  hfr-mini-p.vm hfr-mini-p.pie hfr-mpls-p.pie hfr-mgbl-p.pie hfr-mcast-p.pie hfr-fpd-p.pie  hfr-k9sec-p.pie hfr-diags-p.pie hfr-doc-p.pie hfr-cgn-p.pie hfr-fit-p.pie hfr-upgrade-p.pie >>hfr.logs
jam -notb -j20 -sJAM_CREATE_XSD=y -sJAM_CREATE_PERL_DOC=y  hfr-mini-px.vm hfr-mini-px.pie hfr-mcast-px.pie hfr-mpls-px.pie hfr-mgbl-px.pie hfr-k9sec-px.pie hfr-diags-px.pie hfr-doc-px.pie hfr-cgn-px.pie hfr-fit-px.pie >>hfr.logs
jam hfr-infra-test-p.pie hfr-infra-test-px.pie  >>hfr.logs
jam -sPAGENT=y hfr-pagent-p.pie hfr-pagent-px.pie 
#**************************
cd img-hfr
ls -l hfr-mini-p.vm hfr-mini-p.pie hfr-mpls-p.pie hfr-mgbl-p.pie hfr-mcast-p.pie hfr-fpd-p.pie hfr-k9sec-p.pie hfr-diags-p.pie hfr-doc-p.pie hfr-cgn-p.pie hfr-fit-p.pie hfr-pagent-p.pie hfr-infra-test-p.pie hfr-upgrade-p.pie 
ls -l hfr-mini-px.vm hfr-mini-px.pie hfr-mcast-px.pie hfr-mpls-px.pie hfr-mgbl-px.pie hfr-k9sec-px.pie hfr-diags-px.pie hfr-doc-px.pie hfr-cgn-px.pie hfr-fit-px.pie hfr-pagent-px.pie hfr-infra-test-px.pie
date
date >>hfr.logs
