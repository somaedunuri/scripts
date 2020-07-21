#!/bin/csh
setenv JAM_ADMIN_JFACTOR 1
setenv DISABLE_LJAM_PARSER 1

date
rm -rf xrdev-test;
mkdir xrdev-test ; cd xrdev-test ; acme nw -dl xr-dev.lu%latest  >>/dev/null
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs6k
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs5k
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs1k
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs1001 
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs1004 
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat iosxrv-x64 
tools/misc/xr_bld -clean
