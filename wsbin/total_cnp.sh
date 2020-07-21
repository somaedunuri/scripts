#!/bin/csh
setenv JAM_ADMIN_JFACTOR 1

date
#
mkdir xrdev-ncs5500; cd xrdev-ncs5500 ; acme nw -dl xr-dev.lu -plat ncs5500 >>/dev/null
tools/misc/xr_bld -plat  ncs5500
tools/misc/xr_bld -plat  ncs5500
tools/misc/xr_bld -plat  ncs5500
grep updating xr_bld*
cd ..; rm -rf xrdev-ncs5500; 
#
mkdir xrdev-ncs540; cd xrdev-ncs540 ; acme nw -dl xr-dev.lu -plat ncs540 >>/dev/null
tools/misc/xr_bld -plat  ncs540
tools/misc/xr_bld -plat  ncs540
tools/misc/xr_bld -plat  ncs540
grep updating xr_bld*
cd ..; rm -rf xrdev-ncs540; 
#
mkdir xrdev-ncs560; cd xrdev-ncs560 ; acme nw -dl xr-dev.lu -plat ncs560 >>/dev/null
tools/misc/xr_bld -plat  ncs560
tools/misc/xr_bld -plat  ncs560
tools/misc/xr_bld -plat  ncs560
grep updating xr_bld*
cd ..; rm -rf xrdev-ncs560; 
#
mkdir xrdev-xrv9k; cd xrdev-xrv9k ; acme nw -dl xr-dev.lu -plat xrv9k >>/dev/null
tools/misc/xr_bld -plat  xrv9k
tools/misc/xr_bld -plat  xrv9k
tools/misc/xr_bld -plat  xrv9k
grep updating xr_bld*
cd ..; rm -rf xrdev-xrv9k; 
#
mkdir xrdev-ncs1k; cd xrdev-ncs1k ; acme nw -dl xr-dev.lu -plat ncs1k >>/dev/null
tools/misc/xr_bld -plat  ncs1k
tools/misc/xr_bld -plat  ncs1k
tools/misc/xr_bld -plat  ncs1k
grep updating xr_bld*
cd .. ; rm -rf xrdev-ncs1k ;
#
mkdir xrdev-ncs1001; cd xrdev-ncs1001 ; acme nw -dl xr-dev.lu -plat ncs1001 >>/dev/null
tools/misc/xr_bld -plat  ncs1001 
tools/misc/xr_bld -plat  ncs1001 
tools/misc/xr_bld -plat  ncs1001 
grep updating xr_bld*
cd ..; rm -rf xrdev-ncs1001;
#
mkdir xrdev-ncs5k; cd xrdev-ncs5k ; acme nw -dl xr-dev.lu -plat ncs5k >>/dev/null
tools/misc/xr_bld -plat  ncs5k
tools/misc/xr_bld -plat  ncs5k
tools/misc/xr_bld -plat  ncs5k
grep updating xr_bld*
cd ..; rm -rf xrdev-ncs5k; 
mkdir xrdev-ncs6k; cd xrdev-ncs6k ; acme nw -dl xr-dev.lu -plat ncs6k >>/dev/null
tools/misc/xr_bld -plat  ncs6k
tools/misc/xr_bld -plat  ncs6k
tools/misc/xr_bld -plat  ncs6k
grep updating xr_bld*
cd ..; rm -rf xrdev-ncs6k;
#
mkdir xrdev-iosxrv-x64; cd xrdev-iosxrv-x64 ; acme nw -dl xr-dev.lu -plat iosxrv-x64 >>/dev/null
tools/misc/xr_bld -plat  iosxrv-x64
tools/misc/xr_bld -plat  iosxrv-x64
tools/misc/xr_bld -plat  iosxrv-x64
grep updating xr_bld*
cd ..; rm -rf xrdev-iosxrv-x64;
#
mkdir xrdev-iosxrwbd; cd xrdev-iosxrwbd ; acme nw -dl xr-dev.lu -plat iosxrwbd >>/dev/null
tools/misc/xr_bld -plat  iosxrwbd
tools/misc/xr_bld -plat  iosxrwbd
tools/misc/xr_bld -plat  iosxrwbd
grep updating xr_bld*
cd ..; rm -rf xrdev-iosxrwbd;
#
mkdir xrdev-asr9k-px; cd xrdev-asr9k-px ; acme nw -dl xr-dev.lu -plat asr9k-px >>/dev/null
tools/misc/xr_bld -plat  asr9k-px
tools/misc/xr_bld -plat  asr9k-px
tools/misc/xr_bld -plat  asr9k-px
grep updating xr_bld*
cd ..; rm -rf xrdev-asr9k-px; 
#
mkdir xrdev-hfr-px; cd xrdev-hfr-px ; acme nw -dl xr-dev.lu -plat hfr-px >>/dev/null
tools/misc/xr_bld -plat  hfr-px
tools/misc/xr_bld -plat  hfr-px
tools/misc/xr_bld -plat  hfr-px
grep updating xr_bld*
cd .. ; rm -rf xrdev-hfr-px;
#
mkdir xrdev-asr9k-x64; cd xrdev-asr9k-x64 ; acme nw -dl xr-dev.lu -plat asr9k-x64 >>/dev/null
tools/misc/xr_bld -plat  asr9k-x64
tools/misc/xr_bld -plat  asr9k-x64
tools/misc/xr_bld -plat  asr9k-x64
grep updating xr_bld*
cd ..; rm -rf xrdev-asr9k-x64; 
#
mkdir xrdev-8000; cd xrdev-8000 ; acme nw -dl xr-dev.lu -plat 8000 >>/dev/null
tools/misc/xr_bld -plat  8000
tools/misc/xr_bld -plat  8000
tools/misc/xr_bld -plat  8000
grep updating xr_bld*
cd ..; rm -rf xrdev-8000; 
#
mkdir xrdev-ncs540l; cd xrdev-ncs540l ; acme nw -dl xr-dev.lu -plat ncs540l >>/dev/null
tools/misc/xr_bld -plat  ncs540l
tools/misc/xr_bld -plat  ncs540l
tools/misc/xr_bld -plat  ncs540l
grep updating xr_bld*
cd ..; rm -rf xrdev-ncs540l; 
#
