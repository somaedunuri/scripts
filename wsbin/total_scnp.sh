#!/bin/csh
setenv JAM_ADMIN_JFACTOR 1

date
#
rm -rf xrdev-src-$1;
mkdir xrdev-src-$1 ; cd xrdev-src-$1 ; acme nw -dl xr-dev.lu%latest >>/dev/null
tools/misc/xr_bld -plat  $1
tools/misc/xr_bld -plat  $1
tools/misc/xr_bld -plat  $1
cd ..
#
rm -rf xrdev-cnp-$1;
mkdir xrdev-cnp-$1 ; cd xrdev-cnp-$1 ; 
acme nw -dl xr-dev.lu -plat $1 >>/dev/null
tools/misc/xr_bld -plat  $1
tools/misc/xr_bld -plat  $1
tools/misc/xr_bld -plat  $1
cd ..
#
rm -rf xrdev-cnp-mono-$1;
mkdir xrdev-cnp-mono-$1 ; cd xrdev-cnp-mono-$1 ; 
acme clone -plat $1 >>/dev/null
tools/misc/xr_bld -plat  $1
tools/misc/xr_bld -plat  $1
tools/misc/xr_bld -plat  $1
cd ..
