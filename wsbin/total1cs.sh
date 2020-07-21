#!/bin/csh
setenv JAM_ADMIN_JFACTOR 1

date
setenv JAM_ADMIN_JFACTOR 1
#mkdir xrdev-test ; cd xrdev-test ; acme nw -dl xr-dev.lu%latest;
#cp /users/soma/xr_bld* tools/misc
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  iosxrwb -nightly -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  ncs1001  -nightly -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  ncs1004  -nightly -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  ncs540 -nightly -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  ncs540l -nightly -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  ncs560 -nightly -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  enxr,enxr-c64,enxr-spirit
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  enxr-fretta
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  enxr-bosshogg
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  enxr-scapa
tools/misc/xr_bld -clean

