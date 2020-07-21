#!/bin/csh
setenv JAM_ADMIN_JFACTOR 1

date
mkdir cnp-enxr; cd cnp-enxr ; acme nw -dl xr-dev.lu -plat enxr >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh enxr
./soma.sh enxr
./soma.sh enxr
/router/bin/jam clean
cd .. ; mkdir cnp-enxr-spirit; cd cnp-enxr-spirit ; acme nw -dl xr-dev.lu -plat enxr-spirit >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh enxr-spirit 
./soma.sh enxr-spirit 
./soma.sh enxr-spirit 
/router/bin/jam clean
cd ..; mkdir cnp-enxr-ncs5500; cd cnp-enxr-ncs5500 ; acme nw -dl xr-dev.lu -plat enxr-ncs5500 >>/dev/null
cp /ws/soma-sjc/soma.sh .
./soma.sh enxr-ncs5500
./soma.sh enxr-ncs5500
./soma.sh enxr-ncs5500
/router/bin/jam clean
