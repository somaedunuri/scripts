#!/bin/csh
setenv JAM_ADMIN_JFACTOR 1
setenv DISABLE_LJAM_PARSER 1

date
#mkdir xrdev-test ; cd xrdev-test ; acme nw -dl xr-dev.lu%latest; 
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs5500
tools/misc/xr_bld -plat ncs5500
tools/misc/xr_bld -plat ncs5500
tools/misc/xr_bld -plat ncs5500
mv xr_bld.ncs5500.log xr_bld.ncs5500.log-4
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs540
tools/misc/xr_bld -plat ncs540
tools/misc/xr_bld -plat ncs540
tools/misc/xr_bld -plat ncs540
mv xr_bld.ncs540.log xr_bld.ncs540.log-4
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs560
tools/misc/xr_bld -plat ncs560
tools/misc/xr_bld -plat ncs560
tools/misc/xr_bld -plat ncs560
mv xr_bld.ncs560.log xr_bld.ncs560.log-4
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs6k
tools/misc/xr_bld -plat ncs6k
tools/misc/xr_bld -plat ncs6k
tools/misc/xr_bld -plat ncs6k
mv xr_bld.ncs6k.log xr_bld.ncs6k.log-4
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs5k
tools/misc/xr_bld -plat ncs5k
tools/misc/xr_bld -plat ncs5k
tools/misc/xr_bld -plat ncs5k
mv xr_bld.ncs5k.log xr_bld.ncs5k.log-4
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs1k
tools/misc/xr_bld -plat ncs1k
tools/misc/xr_bld -plat ncs1k
tools/misc/xr_bld -plat ncs1k
mv xr_bld.ncs1k.log xr_bld.ncs1k.log-4
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat xrv9k
tools/misc/xr_bld -plat xrv9k
tools/misc/xr_bld -plat xrv9k
tools/misc/xr_bld -plat xrv9k
mv xr_bld.xrv9k.log xr_bld.xrv9k.log-4
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat asr9k-px
tools/misc/xr_bld -plat asr9k-px
tools/misc/xr_bld -plat asr9k-px
tools/misc/xr_bld -plat asr9k-px
mv xr_bld.asr9k-px.log xr_bld.asr9k-px.log-4
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat asr9k-x64
tools/misc/xr_bld -plat asr9k-x64
tools/misc/xr_bld -plat asr9k-x64
tools/misc/xr_bld -plat asr9k-x64
mv xr_bld.asr9k-x64.log xr_bld.asr9k-x64.log-4
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat 8000 
tools/misc/xr_bld -plat 8000 
tools/misc/xr_bld -plat 8000 
tools/misc/xr_bld -plat 8000 
mv xr_bld.8000.log xr_bld.8000.log-4
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat ncs540l
tools/misc/xr_bld -plat ncs540l
tools/misc/xr_bld -plat ncs540l
tools/misc/xr_bld -plat ncs540l
mv xr_bld.ncs540l.log xr_bld.ncs540l.log-4
#tools/misc/xr_bld -clean
#tools/misc/xr_bld -plat iosxrv-x64
#tools/misc/xr_bld -plat iosxrv-x64
#tools/misc/xr_bld -plat iosxrv-x64
#tools/misc/xr_bld -clean
#tools/misc/xr_bld -plat iosxrwb
#tools/misc/xr_bld -plat iosxrwb
#tools/misc/xr_bld -plat iosxrwb
tools/misc/xr_bld -clean
