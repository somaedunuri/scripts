#!/bin/csh
setenv JAM_ADMIN_JFACTOR 1

date
mkdir xrdev-ncs1k; cd xrdev-ncs1k ; acme nw -dl xr-dev.lu -plat ncs1k >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh ncs1k
./soma.sh ncs1k
./soma.sh ncs1k
cd .. ; rm -rf xrdev-ncs1k ;
mkdir xrdev-ncs1001; cd xrdev-ncs1001 ; acme nw -dl xr-dev.lu -plat ncs1001 >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh ncs1001 
./soma.sh ncs1001 
./soma.sh ncs1001 
cd ..; rm -rf xrdev-ncs1001;
mkdir xrdev-ncs4k; cd xrdev-ncs4k ; acme nw -dl xr-dev.lu -plat ncs4k >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh ncs4k
./soma.sh ncs4k
./soma.sh ncs4k
cd ..; rm -rf  xrdev-ncs4k;
mkdir xrdev-ncs5k; cd xrdev-ncs5k ; acme nw -dl xr-dev.lu -plat ncs5k >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh ncs5k
./soma.sh ncs5k
./soma.sh ncs5k
cd ..; rm -rf xrdev-ncs5k; 
mkdir xrdev-ncs5500; cd xrdev-ncs5500 ; acme nw -dl xr-dev.lu -plat ncs5500 >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh ncs5500
./soma.sh ncs5500
./soma.sh ncs5500
cd ..; rm -rf xrdev-ncs5500; 
mkdir xrdev-ncs6k; cd xrdev-ncs6k ; acme nw -dl xr-dev.lu -plat ncs6k >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh ncs6k
./soma.sh ncs6k
./soma.sh ncs6k
cd ..; rm -rf xrdev-ncs6k;
mkdir xrdev-xrv9k; cd xrdev-xrv9k ; acme nw -dl xr-dev.lu -plat xrv9k >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh xrv9k
./soma.sh xrv9k
./soma.sh xrv9k
cd ..; rm -rf xrdev-xrv9k;
mkdir xrdev-iosxrv-x64; cd xrdev-iosxrv-x64 ; acme nw -dl xr-dev.lu -plat iosxrv-x64 >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh iosxrv-x64
./soma.sh iosxrv-x64
./soma.sh iosxrv-x64
cd ..; rm -rf xrdev-iosxrv-x64;
mkdir xrdev-asr9k-x64; cd xrdev-asr9k-x64 ; acme nw -dl xr-dev.lu -plat asr9k-x64 >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh asr9k-x64
./soma.sh asr9k-x64
cd .. ; rm -rf xrdev-asr9k-x64;
mkdir xrdev-hfr-px; cd xrdev-hfr-px ; acme nw -dl xr-dev.lu -plat hfr-px >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh hfr-px
./soma.sh hfr-px
cd .. ; rm -rf xrdev-hfr-px;
mkdir xrdev-asr9k-px; cd xrdev-asr9k-px ; acme nw -dl xr-dev.lu -plat asr9k-px >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh asr9k-px 
./soma.sh asr9k-px 
./soma.sh asr9k-px 
cd ..; rm -rf xrdev-asr9k-px;
mkdir xrdev-xrvr; cd xrdev-xrvr ; acme nw -dl xr-dev.lu -plat xrvr >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh xrvr
./soma.sh xrvr
./soma.sh xrvr
cd .. ; rm -rf  xrdev-xrvr; 
