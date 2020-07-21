#!/bin/csh
setenv JAM_ADMIN_JFACTOR 1

date
setenv JAM_ADMIN_JFACTOR 1
#mkdir xrdev-test ; cd xrdev-test ; acme nw -dl xr-dev.lu%latest;
#cp /users/soma/xr_bld* tools/misc
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  asr9k-x64 -nightly -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  xrvr  -nightly -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  asr9k-px  -nightly -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  hfr-px  -nightly -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  iosxrv-x64 -nightly -jam_opt "-j32 "
tools/misc/xr_bld -clean
