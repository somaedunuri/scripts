date
mkdir xrdev-ncs1k; cd xrdev-ncs1k ; acme nw -dl xr-dev.lu%EFR-00000353632 >>/dev/null
cp /ws/soma-sjc/soma.sh .
#acme patch -input /ws/prasures-sjc/platformrules.diff
./soma.sh ncs1k
cd ..; mkdir xrdev-ncs5k; cd xrdev-ncs5k ; acme nw -dl xr-dev.lu%EFR-00000353632 >>/dev/null
cp /ws/soma-sjc/soma.sh .
#acme patch -input /ws/prasures-sjc/platformrules.diff
./soma.sh ncs5k
cd ..; mkdir xrdev-ncs5500; cd xrdev-ncs5500 ; acme nw -dl xr-dev.lu%EFR-00000353632 >>/dev/null
cp /ws/soma-sjc/soma.sh .
#acme patch -input /ws/prasures-sjc/platformrules.diff
./soma.sh ncs5500
cd ..; mkdir xrdev-xrv9k; cd xrdev-xrv9k ; acme nw -dl xr-dev.lu%EFR-00000353632 >>/dev/null
cp /ws/soma-sjc/soma.sh .
#acme patch -input /ws/prasures-sjc/platformrules.diff
./soma.sh xrv9k
