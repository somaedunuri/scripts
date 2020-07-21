#!/bin/csh
setenv JAM_ADMIN_JFACTOR 1

date
#
rm -rf xrdev-src;
mkdir xrdev-src ; cd xrdev-src ; acme nw -dl xr-dev.lu%latest >>/dev/null
#
#cd xrdev-src
tools/misc/xr_bld -clean ; 
#
tools/misc/xr_bld -plat  ncs540
tools/misc/xr_bld -plat  ncs540
tools/misc/xr_bld -plat  ncs540
tools/misc/xr_bld -plat  ncs540
mv xr_bld.ncs540.log  xr_bld.ncs540.log-4
tools/misc/xr_bld -clean ; 
#
tools/misc/xr_bld -plat  ncs560
tools/misc/xr_bld -plat  ncs560
tools/misc/xr_bld -plat  ncs560
tools/misc/xr_bld -plat  ncs560
mv xr_bld.ncs560.log  xr_bld.ncs560.log-4
tools/misc/xr_bld -clean ; 
#
tools/misc/xr_bld -plat  ncs5500
tools/misc/xr_bld -plat  ncs5500
tools/misc/xr_bld -plat  ncs5500
tools/misc/xr_bld -plat  ncs5500
mv xr_bld.ncs5500.log  xr_bld.ncs5500.log-4
tools/misc/xr_bld -clean ; 
#
tools/misc/xr_bld -plat  ncs5k
tools/misc/xr_bld -plat  ncs5k
tools/misc/xr_bld -plat  ncs5k
tools/misc/xr_bld -plat  ncs5k
mv xr_bld.ncs5k.log  xr_bld.ncs5k.log-4
tools/misc/xr_bld -clean ; 
#
tools/misc/xr_bld -plat  ncs6k
tools/misc/xr_bld -plat  ncs6k
tools/misc/xr_bld -plat  ncs6k
tools/misc/xr_bld -plat  ncs6k
mv xr_bld.ncs6k.log  xr_bld.ncs6k.log-4
tools/misc/xr_bld -clean ; 
#
tools/misc/xr_bld -plat  xrv9k
tools/misc/xr_bld -plat  xrv9k
tools/misc/xr_bld -plat  xrv9k
tools/misc/xr_bld -plat  xrv9k
mv xr_bld.xrv9k.log  xr_bld.xrv9k.log-4
tools/misc/xr_bld -clean ; 
#
tools/misc/xr_bld -plat  8000
tools/misc/xr_bld -plat  8000
tools/misc/xr_bld -plat  8000
tools/misc/xr_bld -plat  8000
mv xr_bld.8000.log  xr_bld.8000.log-4
tools/misc/xr_bld -clean ; 
#
tools/misc/xr_bld -plat  ncs540l
tools/misc/xr_bld -plat  ncs540l
tools/misc/xr_bld -plat  ncs540l
tools/misc/xr_bld -plat  ncs540l
mv xr_bld.ncs540l.log  xr_bld.ncs540l.log-4
tools/misc/xr_bld -clean ; 
#
