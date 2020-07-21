# This script accepts platform code and build Core images
setenv JAM_ADMIN_JFACTOR 1
#setenv MY_JAM /ecs/perf/bin/ejam.new.new
#setenv MY_JAM /ecs/perf/bin/ejam-6.0.2
#setenv MY_JAM "/ecs/perf/bin/ejam.new --electrify-version=8.0.0b3"

echo "Build Start" >>soma.log
uptime >>soma.log
date	>>soma.log
/auto/iox/bin/xr_bld -plat $1 -jam_opt "-j32 -dax" 
date	>>soma.log
uptime >>soma.log
echo "Build End" >>soma.log
echo " "

