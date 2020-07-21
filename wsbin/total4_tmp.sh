#!/bin/csh

date
mkdir xrdev-ncs1k; cd xrdev-ncs1k ; acme nw -dl xr-dev.lu -plat ncs1k >>/dev/null
cd .. ; rm -rf xrdev-ncs1k ;
date
mkdir xrdev-ncs1001; cd xrdev-ncs1001 ; acme nw -dl xr-dev.lu -plat ncs1001 >>/dev/null
cd ..; rm -rf xrdev-ncs1001;
date
mkdir xrdev-ncs4k; cd xrdev-ncs4k ; acme nw -dl xr-dev.lu -plat ncs4k >>/dev/null
cd ..; rm -rf  xrdev-ncs4k;
date
mkdir xrdev-ncs5k; cd xrdev-ncs5k ; acme nw -dl xr-dev.lu -plat ncs5k >>/dev/null
cd ..; rm -rf xrdev-ncs5k; 
date
mkdir xrdev-ncs5500; cd xrdev-ncs5500 ; acme nw -dl xr-dev.lu -plat ncs5500 >>/dev/null
cd ..; rm -rf xrdev-ncs5500; 
date
mkdir xrdev-ncs6k; cd xrdev-ncs6k ; acme nw -dl xr-dev.lu -plat ncs6k >>/dev/null
cd ..; rm -rf xrdev-ncs6k;
date
mkdir xrdev-xrv9k; cd xrdev-xrv9k ; acme nw -dl xr-dev.lu -plat xrv9k >>/dev/null
cd ..; rm -rf xrdev-xrv9k;
date
mkdir xrdev-iosxrv-x64; cd xrdev-iosxrv-x64 ; acme nw -dl xr-dev.lu -plat iosxrv-x64 >>/dev/null
cd ..; rm -rf xrdev-iosxrv-x64;
date
mkdir xrdev-asr9k-x64; cd xrdev-asr9k-x64 ; acme nw -dl xr-dev.lu -plat asr9k-x64 >>/dev/null
mkdir xrdev-hfr-px; cd xrdev-hfr-px ; acme nw -dl xr-dev.lu -plat hfr-px >>/dev/null
cd .. ; rm -rf xrdev-hfr-px;
date
mkdir xrdev-asr9k-px; cd xrdev-asr9k-px ; acme nw -dl xr-dev.lu -plat asr9k-px >>/dev/null
cd ..; rm -rf xrdev-asr9k-px;
date
mkdir xrdev-xrvr; cd xrdev-xrvr ; acme nw -dl xr-dev.lu -plat xrvr >>/dev/null
cd .. ; rm -rf  xrdev-xrvr; 
date
