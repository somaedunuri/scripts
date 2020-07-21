# This script accepts platform code and build Core images
#setenv JAM_ADMIN_JFACTOR 1
#setenv MY_JAM /ecs/perf/bin/ejam

echo "Build Start" >>soma.log
uptime >>soma.log
date	>>soma.log
/auto/iox/bin/xr_bld -plat $1 -jam_opt " -dax" 
date	>>soma.log
uptime >>soma.log
echo "Build End" >>soma.log
echo " "

