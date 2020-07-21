date
mkdir xrdev-xrv9k; cd xrdev-xrv9k ; acme nw -dl xr-dev.lu%EFR-00000353632 >>/dev/null
cp /ws/soma-sjc/soma.sh .
#acme patch -input /ws/prasures-sjc/platformrules.diff
./soma.sh xrv9k
cd ..; mkdir xrdev-ncs1k; cd xrdev-ncs1k ; acme nw -dl xr-dev.lu%EFR-00000353632 >>/dev/null
cp /ws/soma-sjc/soma.sh .
#acme patch -input /ws/prasures-sjc/platformrules.diff
./soma.sh ncs1k
cd .. ; mkdir xrdev-ncs1001; cd xrdev-ncs1001 ; acme nw -dl xr-dev.lu%EFR-00000353632 >>/dev/null
cp /ws/soma-sjc/soma.sh .
#acme patch -input /ws/prasures-sjc/platformrules.diff
./soma.sh ncs1001 
cd ..; mkdir xrdev-ncs4k; cd xrdev-ncs4k ; acme nw -dl xr-dev.lu%EFR-00000353632 >>/dev/null
cp /ws/soma-sjc/soma.sh .
#acme patch -input /ws/prasures-sjc/platformrules.diff
./soma.sh ncs4k
cd ..; mkdir xrdev-ncs5k; cd xrdev-ncs5k ; acme nw -dl xr-dev.lu%EFR-00000353632 >>/dev/null
cp /ws/soma-sjc/soma.sh .
#acme patch -input /ws/prasures-sjc/platformrules.diff
./soma.sh ncs5k
cd ..; mkdir xrdev-ncs5500; cd xrdev-ncs5500 ; acme nw -dl xr-dev.lu%EFR-00000353632 >>/dev/null
cp /ws/soma-sjc/soma.sh .
#acme patch -input /ws/prasures-sjc/platformrules.diff
./soma.sh ncs5500
cd ..; mkdir xrdev-ncs6k; cd xrdev-ncs6k ; acme nw -dl xr-dev.lu%EFR-00000353632 >>/dev/null
cp /ws/soma-sjc/soma.sh .
#acme patch -input /ws/prasures-sjc/platformrules.diff
./soma.sh ncs6k
cd ..; mkdir xrdev-iosxrv-x64; cd xrdev-iosxrv-x64 ; acme nw -dl xr-dev.lu%EFR-00000353632 >>/dev/null
cp /ws/soma-sjc/soma.sh .
#acme patch -input /ws/prasures-sjc/platformrules.diff
./soma.sh iosxrv-x64
cd ..; mkdir xrdev-asr9k-x64; cd xrdev-asr9k-x64 ; acme nw -dl xr-dev.lu%EFR-00000353632 >>/dev/null
cp /ws/soma-sjc/soma.sh .
#acme patch -input /ws/prasures-sjc/platformrules.diff
./soma.sh asr9k-x64
