#!/bin/csh
setenv JAM_ADMIN_JFACTOR 1

date
#
mkdir xrdev-ncs5500; cd xrdev-ncs5500 ; acme clone  -plat ncs5500 >>/dev/null
tools/misc/xr_bld -plat  ncs5500
tools/misc/xr_bld -plat  ncs5500
tools/misc/xr_bld -plat  ncs5500
grep updating xrdev-*/xr_bld*
cd ..; rm -rf xrdev-ncs5500; 
#
#mkdir xrdev-8000; cd xrdev-8000 ; acme clone  -plat 8000 >>/dev/null
#tools/misc/xr_bld -plat  8000
#tools/misc/xr_bld -plat  8000
#tools/misc/xr_bld -plat  8000
#grep updating xrdev-*/xr_bld*
#cd ..; rm -rf xrdev-8000; 
#
#mkdir xrdev-ncs540l; cd xrdev-ncs540l ; acme clone  -plat ncs540l >>/dev/null
#tools/misc/xr_bld -plat  ncs540l
#tools/misc/xr_bld -plat  ncs540l
#tools/misc/xr_bld -plat  ncs540l
#grep updating xrdev-*/xr_bld*
#cd ..; rm -rf xrdev-ncs540l; 
#
mkdir xrdev-ncs540; cd xrdev-ncs540 ; acme clone  -plat ncs540 >>/dev/null
tools/misc/xr_bld -plat  ncs540
tools/misc/xr_bld -plat  ncs540
tools/misc/xr_bld -plat  ncs540
grep updating xrdev-*/xr_bld*
cd ..; rm -rf xrdev-ncs540; 
#
mkdir xrdev-xrv9k; cd xrdev-xrv9k ; acme clone  -plat xrv9k >>/dev/null
tools/misc/xr_bld -plat  xrv9k
tools/misc/xr_bld -plat  xrv9k
tools/misc/xr_bld -plat  xrv9k
grep updating xrdev-*/xr_bld*
cd ..; rm -rf xrdev-xrv9k; 
#
mkdir xrdev-asr9k-px; cd xrdev-asr9k-px ; acme clone  -plat asr9k-px >>/dev/null
tools/misc/xr_bld -plat  asr9k-px
tools/misc/xr_bld -plat  asr9k-px
tools/misc/xr_bld -plat  asr9k-px
grep updating xrdev-*/xr_bld*
cd ..; rm -rf xrdev-asr9k-px; 
#
mkdir xrdev-ncs1k; cd xrdev-ncs1k ; acme clone  -plat ncs1k >>/dev/null
tools/misc/xr_bld -plat  ncs1k
tools/misc/xr_bld -plat  ncs1k
tools/misc/xr_bld -plat  ncs1k
grep updating xrdev-*/xr_bld*
cd .. ; rm -rf xrdev-ncs1k ;
#
mkdir xrdev-ncs1001; cd xrdev-ncs1001 ; acme clone  -plat ncs1001 >>/dev/null
tools/misc/xr_bld -plat  ncs1001 
tools/misc/xr_bld -plat  ncs1001 
tools/misc/xr_bld -plat  ncs1001 
grep updating xrdev-*/xr_bld*
cd ..; rm -rf xrdev-ncs1001;
#
mkdir xrdev-ncs5k; cd xrdev-ncs5k ; acme clone  -plat ncs5k >>/dev/null
tools/misc/xr_bld -plat  ncs5k
tools/misc/xr_bld -plat  ncs5k
tools/misc/xr_bld -plat  ncs5k
grep updating xrdev-*/xr_bld*
cd ..; rm -rf xrdev-ncs5k; 
mkdir xrdev-ncs6k; cd xrdev-ncs6k ; acme clone  -plat ncs6k >>/dev/null
tools/misc/xr_bld -plat  ncs6k
tools/misc/xr_bld -plat  ncs6k
tools/misc/xr_bld -plat  ncs6k
grep updating xrdev-*/xr_bld*
cd ..; rm -rf xrdev-ncs6k;
#
mkdir xrdev-iosxrv-x64; cd xrdev-iosxrv-x64 ; acme clone  -plat iosxrv-x64 >>/dev/null
tools/misc/xr_bld -plat  iosxrv-x64
tools/misc/xr_bld -plat  iosxrv-x64
tools/misc/xr_bld -plat  iosxrv-x64
grep updating xrdev-*/xr_bld*
cd ..; rm -rf xrdev-iosxrv-x64;
#
mkdir xrdev-hfr-px; cd xrdev-hfr-px ; acme clone  -plat hfr-px >>/dev/null
tools/misc/xr_bld -plat  hfr-px
tools/misc/xr_bld -plat  hfr-px
tools/misc/xr_bld -plat  hfr-px
grep updating xrdev-*/xr_bld*
cd .. ; rm -rf xrdev-hfr-px;
#
mkdir xrdev-asr9k-x64; cd xrdev-asr9k-x64 ; acme clone  -plat asr9k-x64 >>/dev/null
tools/misc/xr_bld -plat  asr9k-x64
tools/misc/xr_bld -plat  asr9k-x64
tools/misc/xr_bld -plat  asr9k-x64
grep updating xrdev-*/xr_bld*
cd ..; rm -rf xrdev-asr9k-x64; 
#
