#!/bin/tcsh
# This script accepts platform code and build Core images
#setenv JAM_ADMIN_JFACTOR 1
setenv MY_JAM /ecs/perf/bin/ejam

echo "Build Start $1 " >>soma.log
#uptime >>soma.log
date	>>soma.log
tools/misc/xr_bld -plat $1 -jam_opt "-dax -j32 " 
#/auto/iox/bin/xr_bld -plat $1 -jam_opt  " -report " 
#/auto/iox/bin/xr_bld -plat $1 -jam_opt  " -j32" 
#/auto/iox/bin/xr_bld -plat $1 -jam_opt  " -sJAM_NO_PEBBLE=1 " 
#/auto/iox/bin/xr_bld -clean -plat $1 -jam_opt "-dax -j16 " 
date	>>soma.log
#uptime >>soma.log
echo "Build End" >>soma.log
echo " "

