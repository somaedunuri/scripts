#!/bin/csh
setenv JAM_ADMIN_JFACTOR 1
setenv DISABLE_LJAM_PARSER 1

date
#mkdir xrdev-test ; cd xrdev-test ; acme nw -dl xr-dev.lu%latest; 
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs5500
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs5500
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs5500
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs5500
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs5500
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs5500
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs5500
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs5500
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs5500
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs5500
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs5500
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs5500
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs5500
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs5500
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs5500
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

