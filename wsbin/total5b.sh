date
mkdir xrdev-iosxrv-x64; cd xrdev-iosxrv-x64 ; acme nw -dl xr-dev.lu -plat iosxrv-x64 >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh iosxrv-x64 
./soma.sh iosxrv-x64 
./soma.sh iosxrv-x64 
jam clean; 
cd ..; mkdir xrdev-asr9k-x64; cd xrdev-asr9k-x64 ; acme nw -dl xr-dev.lu -plat asr9k-x64 >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh asr9k-x64
./soma.sh asr9k-x64
./soma.sh asr9k-x64
jam clean; 
cd ..; mkdir xrdev-hfr-px; cd xrdev-hfr-px ; acme nw -dl xr-dev.lu -plat hfr-px >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh hfr-px
./soma.sh hfr-px
./soma.sh hfr-px
jam clean; 
cd ..; mkdir xrdev-asr9k-px; cd xrdev-asr9k-px ; acme nw -dl xr-dev.lu -plat asr9k-px >/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh asr9k-px
./soma.sh asr9k-px
./soma.sh asr9k-px
jam clean; 
cd ..; mkdir xrdev-xrvr; cd xrdev-xrvr; acme nw -dl xr-dev.lu -plat xrvr >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh xrvr
./soma.sh xrvr
./soma.sh xrvr
jam clean; 
