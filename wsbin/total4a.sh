#!/bin/csh
setenv JAM_ADMIN_JFACTOR 1

date
mkdir cnp-ncs1k; cd cnp-ncs1k ; acme nw -dl xr-dev.lu -plat ncs1k >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh ncs1k
./soma.sh ncs1k
./soma.sh ncs1k
/router/bin/jam clean
cd .. ; mkdir cnp-ncs1001; cd cnp-ncs1001 ; acme nw -dl xr-dev.lu -plat ncs1001 >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh ncs1001 
./soma.sh ncs1001 
./soma.sh ncs1001 
/router/bin/jam clean
cd .. ; mkdir cnp-ncs4k; cd cnp-ncs4k ; acme nw -dl xr-dev.lu -plat ncs4k >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh ncs4k 
./soma.sh ncs4k 
./soma.sh ncs4k 
/router/bin/jam clean
cd .. ; mkdir cnp-ncs5k; cd cnp-ncs5k ; acme nw -dl xr-dev.lu -plat ncs5k >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh ncs5k 
./soma.sh ncs5k 
./soma.sh ncs5k 
/router/bin/jam clean
cd .. ; mkdir cnp-ncs5500; cd cnp-ncs5500 ; acme nw -dl xr-dev.lu -plat ncs5500 >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh ncs5500 
./soma.sh ncs5500 
./soma.sh ncs5500 
/router/bin/jam clean
cd .. ; mkdir cnp-ncs6k; cd cnp-ncs6k ; acme nw -dl xr-dev.lu -plat ncs6k >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh ncs6k 
./soma.sh ncs6k 
./soma.sh ncs6k 
/router/bin/jam clean
cd .. ; mkdir cnp-xrv9k; cd cnp-xrv9k ; acme nw -dl xr-dev.lu -plat xrv9k >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh xrv9k 
./soma.sh xrv9k 
./soma.sh xrv9k 
/router/bin/jam clean
