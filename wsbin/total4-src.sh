#!/bin/csh
setenv JAM_ADMIN_JFACTOR 1

date
mkdir xrdev-ncs1k; cd xrdev-ncs1k ; acme nw -dl xr-dev.lu%latest >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh ncs1k
cd .. ; 
mkdir xrdev-ncs4k; cd xrdev-ncs4k ; acme nw -dl xr-dev.lu%latest >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh ncs4k
cd ..; 
mkdir xrdev-ncs5k; cd xrdev-ncs5k ; acme nw -dl xr-dev.lu%latest >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh ncs5k
cd ..; 
mkdir xrdev-ncs5500; cd xrdev-ncs5500 ; acme nw -dl xr-dev.lu%latest >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh ncs5500
cd ..; 
mkdir xrdev-asr9kpx; cd xrdev-asr9k-px ; acme nw -dl xr-dev.lu%latest >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh asr9k-px 
cd ..; 
