#!/bin/csh

echo "ncs5500 platform pulls";
echo "Only Source Code pull...";
setenv ACME_DISABLE_PROCESS all 
date
mkdir xrdev-ncs5500; cd xrdev-ncs5500 ; acme nw -dl xr-dev.lu -plat ncs5500 >>/dev/null
date
cd .. ; rm -rf xrdev-ncs5500 ;
echo "Source Code pull + Linkify/tidl...";
unsetenv ACME_DISABLE_PROCESS 
date
mkdir xrdev-ncs5500; cd xrdev-ncs5500 ; acme nw -dl xr-dev.lu -plat ncs5500 -no_cncopy >>/dev/null
date
cd .. ; rm -rf xrdev-ncs5500 ;
echo "Source Code pull + CnCopy binaries copy ...";
unsetenv ACME_DISABLE_PROCESS 
date
mkdir xrdev-ncs5500; cd xrdev-ncs5500 ; acme nw -dl xr-dev.lu -plat ncs5500 >>/dev/null
date
cd .. ; rm -rf xrdev-ncs5500 ;
echo "   ";
#
echo "xrv9k platform pulls";
echo "Only Source Code pull...";
setenv ACME_DISABLE_PROCESS all 
date
mkdir xrdev-xrv9k; cd xrdev-xrv9k ; acme nw -dl xr-dev.lu -plat xrv9k >>/dev/null
date
cd .. ; rm -rf xrdev-xrv9k ;
echo "Source Code pull + Linkify/tidl...";
unsetenv ACME_DISABLE_PROCESS 
date
mkdir xrdev-xrv9k; cd xrdev-xrv9k ; acme nw -dl xr-dev.lu -plat xrv9k -no_cncopy >>/dev/null
date
cd .. ; rm -rf xrdev-xrv9k ;
echo "Source Code pull + CnCopy binaries copy ...";
unsetenv ACME_DISABLE_PROCESS 
date
mkdir xrdev-xrv9k; cd xrdev-xrv9k ; acme nw -dl xr-dev.lu -plat xrv9k >>/dev/null
date
cd .. ; rm -rf xrdev-xrv9k ;
echo "   ";
#
echo "asr9k-px platform pulls";
echo "Only Source Code pull...";
setenv ACME_DISABLE_PROCESS all 
date
mkdir xrdev-asr9k-px; cd xrdev-asr9k-px ; acme nw -dl xr-dev.lu -plat asr9k-px >>/dev/null
date
cd .. ; rm -rf xrdev-asr9k-px ;
echo "Source Code pull + Linkify/tidl...";
unsetenv ACME_DISABLE_PROCESS 
date
mkdir xrdev-asr9k-px; cd xrdev-asr9k-px ; acme nw -dl xr-dev.lu -plat asr9k-px -no_cncopy >>/dev/null
date
cd .. ; rm -rf xrdev-asr9k-px ;
echo "Source Code pull + CnCopy binaries copy ...";
unsetenv ACME_DISABLE_PROCESS 
date
mkdir xrdev-asr9k-px; cd xrdev-asr9k-px ; acme nw -dl xr-dev.lu -plat asr9k-px >>/dev/null
date
cd .. ; rm -rf xrdev-asr9k-px ;
echo "   ";
echo "All Platform pulls Completed"
