#!/bin/csh
setenv JAM_ADMIN_JFACTOR 1
setenv DISABLE_LJAM_PARSER 1

date
#mkdir xrdev-test ; cd xrdev-test ; acme nw -dl xr-dev.lu%latest; 
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs5500 -jam_opt "-j64 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs540 -jam_opt "-j64 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs560 -jam_opt "-j64 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs5k -jam_opt "-j64 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs1k -jam_opt "-j64 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat xrv9k -jam_opt "-j64 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs1001  -jam_opt "-j64 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs1004  -jam_opt "-j64 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat iosxrwbd -jam_opt "-j64 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs6k -jam_opt "-j64 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat iosxrv-x64 -jam_opt "-j64 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat asr9k-px -jam_opt "-j64 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat hfr-px  -jam_opt "-j64 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat asr9k-x64 -jam_opt "-j64 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat 8000 -jam_opt "-j64 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs540l -jam_opt "-j64 "
tools/misc/xr_bld -clean
#tools/misc/xr_bld -plat enxr
#tools/misc/xr_bld -clean
#tools/misc/xr_bld -plat enxr-spirit
#tools/misc/xr_bld -clean
#tools/misc/xr_bld -plat enxr-lindt
#tools/misc/xr_bld -clean
#tools/misc/xr_bld -plat enxr-fretta
#tools/misc/xr_bld -clean
#tools/misc/xr_bld -plat ncs4k
#tools/misc/xr_bld -plat ncs4k
#tools/misc/xr_bld -clean
#tools/misc/xr_bld -plat enxr-c64
#tools/misc/xr_bld -plat enxr-c64
#tools/misc/xr_bld -clean
#tools/misc/xr_bld -plat xrvr 
#tools/misc/xr_bld -plat xrvr 
tools/misc/xr_bld -clean

