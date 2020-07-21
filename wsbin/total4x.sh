#!/bin/csh
setenv JAM_ADMIN_JFACTOR 1

date
mkdir cnp-ncs1k; cd cnp-ncs1k ; acme nw -dl xr-dev.lu -plat ncs1k >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh ncs1k
/router/bin/jam clean
cd .. ; mkdir cnp-ncs1001; cd cnp-ncs1001 ; acme nw -dl xr-dev.lu -plat ncs1001 >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh ncs1001 
/router/bin/jam clean
cd .. ; mkdir cnp-ncs4k; cd cnp-ncs4k ; acme nw -dl xr-dev.lu -plat ncs4k >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh ncs4k 
/router/bin/jam clean
cd .. ; mkdir cnp-ncs5k; cd cnp-ncs5k ; acme nw -dl xr-dev.lu -plat ncs5k >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh ncs5k 
/router/bin/jam clean
cd .. ; mkdir cnp-ncs5500; cd cnp-ncs5500 ; acme nw -dl xr-dev.lu -plat ncs5500 >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh ncs5500 
/router/bin/jam clean
cd .. ; mkdir cnp-ncs6k; cd cnp-ncs6k ; acme nw -dl xr-dev.lu -plat ncs6k >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh ncs6k 
/router/bin/jam clean
cd .. ; mkdir cnp-xrv9k; cd cnp-xrv9k ; acme nw -dl xr-dev.lu -plat xrv9k >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh xrv9k 
/router/bin/jam clean
cd .. ; mkdir cnp-asr9k-x64; cd cnp-asr9k-x64 ; acme nw -dl xr-dev.lu -plat asr9k-x64 >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh asr9k-x64
/router/bin/jam clean
cd ../ ; mkdir cnp-hfr-px; cd cnp-hfr-px ; acme nw -dl xr-dev.lu -plat hfr-px >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh hfr-px
/router/bin/jam clean
cd .. ; mkdir cnp-asr9k-px; cd cnp-asr9k-px ; acme nw -dl xr-dev.lu -plat asr9k-px >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh asr9k-px 
/router/bin/jam clean
cd ..; mkdir cnp-xrvr; cd cnp-xrvr ; acme nw -dl xr-dev.lu -plat xrvr >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh xrvr
/router/bin/jam clean
cd ..; mkdir cnp-iosxrv-x64; cd cnp-iosxrv-x64 ; acme nw -dl xr-dev.lu -plat iosxrv-x64 >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh iosxrv-x64
/router/bin/jam clean
