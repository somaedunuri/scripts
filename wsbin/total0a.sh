#!/bin/csh
setenv JAM_ADMIN_JFACTOR 1
setenv DISABLE_LJAM_PARSER 1

date
rm -rf xrdev-test;
mkdir xrdev-test ; cd xrdev-test ; acme nw -dl xr-dev.lu%latest  >>/dev/null
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat xrv9k
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs5500
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs540
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs560
tools/misc/xr_bld -clean
