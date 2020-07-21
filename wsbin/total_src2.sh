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
tools/misc/xr_bld -plat  ncs1k
tools/misc/xr_bld -plat  ncs1k
tools/misc/xr_bld -plat  ncs1k
tools/misc/xr_bld -plat  ncs1k
mv xr_bld.ncs1k.log  xr_bld.ncs1k.log-4
tools/misc/xr_bld -clean ; 
#
