#!/bin/csh
setenv JAM_ADMIN_JFACTOR 1

date
#
rm -rf xrdev-src;
mkdir xrdev-src ; cd xrdev-src ; acme nw -dl xr-dev.lu%latest >>/dev/null
#
#cd xrdev-382934
tools/misc/xr_bld -clean ; 
#
tools/misc/xr_bld -plat  ncs1k
tools/misc/xr_bld -plat  ncs1k
tools/misc/xr_bld -plat  ncs1k
tools/misc/xr_bld -plat  ncs1k
mv xr_bld.ncs1k.log  xr_bld.ncs1k.log-4
tools/misc/xr_bld -clean ; 
#
tools/misc/xr_bld -plat  ncs540
tools/misc/xr_bld -plat  ncs540
tools/misc/xr_bld -plat  ncs540
tools/misc/xr_bld -plat  ncs540
mv xr_bld.ncs540.log  xr_bld.ncs540.log-4
tools/misc/xr_bld -clean ; 
#
tools/misc/xr_bld -plat  ncs5500
tools/misc/xr_bld -plat  ncs5500
tools/misc/xr_bld -plat  ncs5500
tools/misc/xr_bld -plat  ncs5500
mv xr_bld.ncs5500.log  xr_bld.ncs5500.log-4
tools/misc/xr_bld -clean ; 
#
tools/misc/xr_bld -plat  ncs560
tools/misc/xr_bld -plat  ncs560
tools/misc/xr_bld -plat  ncs560
tools/misc/xr_bld -plat  ncs560
mv xr_bld.ncs560.log  xr_bld.ncs560.log-4
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
tools/misc/xr_bld -plat  iosxrv-x64
tools/misc/xr_bld -plat  iosxrv-x64
tools/misc/xr_bld -plat  iosxrv-x64
tools/misc/xr_bld -plat  iosxrv-x64
mv xr_bld.iosxrv-x64.log  xr_bld.iosxrv-x64.log-4
tools/misc/xr_bld -clean ; 
#
tools/misc/xr_bld -plat  ncs1001 
tools/misc/xr_bld -plat  ncs1001 
tools/misc/xr_bld -plat  ncs1001 
tools/misc/xr_bld -plat  ncs1001 
mv xr_bld.ncs1001.log  xr_bld.ncs1001.log-4
tools/misc/xr_bld -clean ; 
#
tools/misc/xr_bld -plat  asr9k-px
tools/misc/xr_bld -plat  asr9k-px
tools/misc/xr_bld -plat  asr9k-px
tools/misc/xr_bld -plat  asr9k-px
mv xr_bld.asr9k-px.log  xr_bld.asr9k-px.log-4
tools/misc/xr_bld -clean ; 
#
tools/misc/xr_bld -plat  asr9k-x64
tools/misc/xr_bld -plat  asr9k-x64
tools/misc/xr_bld -plat  asr9k-x64
tools/misc/xr_bld -plat  asr9k-x64
mv xr_bld.asr9k-x64.log  xr_bld.asr9k-x64.log-4
tools/misc/xr_bld -clean ; 
#
tools/misc/xr_bld -plat  hfr-px
tools/misc/xr_bld -plat  hfr-px
tools/misc/xr_bld -plat  hfr-px
tools/misc/xr_bld -plat  hfr-px
mv xr_bld.hfr-px.log  xr_bld.hfr-px.log-4
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
