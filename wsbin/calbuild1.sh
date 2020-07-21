#!/bin/sh
cd xrdev-392583 ; tools/misc/xr_bld -clean ; 
cat /ws/soma-sjc/soma >> calvados/fabric_pkg/retimer/driver/barchetta/src/retimer_init.c ; 
tools/misc/xr_bld -plat $1 ; 
cd ../xrdev-396889 ; tools/misc/xr_bld -clean ; 
cat /ws/soma-sjc/soma  >> calvados/fabric_pkg/retimer/driver/barchetta/src/retimer_init.c ; 
tools/misc/xr_bld -plat $1 ; 
#
cd ../xrdev-392583 ;
cat /ws/soma-sjc/soma  >> calvados/fabric_pkg/retimer/driver/barchetta/src/retimer_init.c ; 
tools/misc/xr_bld -plat $1 ; 
cd ../xrdev-396889;
cat /ws/soma-sjc/soma  >> calvados/fabric_pkg/retimer/driver/barchetta/src/retimer_init.c ; 
tools/misc/xr_bld -plat $1 ; 
#
cd ../xrdev-392583 ;
cat /ws/soma-sjc/soma  >> calvados/fabric_pkg/retimer/driver/barchetta/src/retimer_init.c ; 
tools/misc/xr_bld -plat $1 ; 
mv xr_bld.$1.log xr_bld.$1.log-3
cd ../xrdev-396889;
cat /ws/soma-sjc/soma  >> calvados/fabric_pkg/retimer/driver/barchetta/src/retimer_init.c ; 
tools/misc/xr_bld -plat $1 ; 
mv xr_bld.$1.log xr_bld.$1.log-3
#
