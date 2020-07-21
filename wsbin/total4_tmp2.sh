#!/bin/csh

echo "ncs5500 platform pulls";
echo "Only Source Code pull...";
setenv ACME_DISABLE_PROCESS all 
date
mkdir xrdev-ncs5500-src; cd xrdev-ncs5500-src ; acme nw -dl xr-dev.lu -plat ncs5500 >/tmp/src.log
date
cd .. ; 
echo "Source Code pull + Linkify/tidl...";
unsetenv ACME_DISABLE_PROCESS 
date
mkdir xrdev-ncs5500-lnk; cd xrdev-ncs5500-lnk ; acme nw -dl xr-dev.lu -plat ncs5500 -no_cncopy >/tmp/lnk.log
date
cd .. ; 
echo "Source Code pull + CnCopy binaries copy ...";
unsetenv ACME_DISABLE_PROCESS 
date
mkdir xrdev-ncs5500-cnp; cd xrdev-ncs5500-cnp ; acme nw -dl xr-dev.lu -plat ncs5500 >/tmp/cnp.log
date
cd .. ; 
echo "All 3 workspace pulls Completed";
#
