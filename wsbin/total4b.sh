#!/bin/csh
setenv JAM_ADMIN_JFACTOR 1

date
mkdir cnp-hfr-px; cd cnp-hfr-px ; acme nw -dl xr-dev.lu -plat hfr-px >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh hfr-px
./soma.sh hfr-px
./soma.sh hfr-px
/router/bin/jam clean
cd .. ; mkdir cnp-asr9k-px; cd cnp-asr9k-px ; acme nw -dl xr-dev.lu -plat asr9k-px >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh asr9k-px 
./soma.sh asr9k-px 
./soma.sh asr9k-px 
/router/bin/jam clean
cd ..; mkdir cnp-xrvr; cd cnp-xrvr ; acme nw -dl xr-dev.lu -plat xrvr >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh xrvr
./soma.sh xrvr
./soma.sh xrvr
/router/bin/jam clean
cd .. ; mkdir cnp-asr9k-x64; cd cnp-asr9k-x64 ; acme nw -dl xr-dev.lu -plat asr9k-x64 >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh asr9k-x64
./soma.sh asr9k-x64
./soma.sh asr9k-x64
/router/bin/jam clean
cd ..; mkdir cnp-iosxrv-x64; cd cnp-iosxrv-x64 ; acme nw -dl xr-dev.lu -plat iosxrv-x64 >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh iosxrv-x64
./soma.sh iosxrv-x64
./soma.sh iosxrv-x64
/router/bin/jam clean
