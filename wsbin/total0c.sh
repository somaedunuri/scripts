#!/bin/csh
setenv JAM_ADMIN_JFACTOR 1
setenv DISABLE_LJAM_PARSER 1

date
rm -rf xrdev-test;
mkdir xrdev-test ; cd xrdev-test ; acme nw -dl xr-dev.lu%latest  >>/dev/null
tools/misc/xr_bld -clean
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat asr9k-px 
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat hfr-px 
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat asr9k-x64
tools/misc/xr_bld -clean
