#!/bin/csh
setenv JAM_ADMIN_JFACTOR 1

date
setenv JAM_ADMIN_JFACTOR 1
#mkdir xrdev-test ; cd xrdev-test ; acme nw -dl xr-dev.lu%latest;
#cp /users/soma/xr_bld* tools/misc
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  spitfire -nightly -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  ncs1k -nightly -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  ncs4k -nightly -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  ncs5k -nightly -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  ncs5500 -nightly -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  ncs6k -nightly -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  xrv9k -nightly -jam_opt "-j32 "
tools/misc/xr_bld -clean
