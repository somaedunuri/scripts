#!/bin/csh
setenv JAM_ADMIN_JFACTOR 1

date
mkdir xrdev-ncs5500; cd xrdev-ncs5500 ; acme nw -dl xr-dev.lu -plat ncs5500 >>/dev/null
tools/misc/xr_bld -plat  ncs5500 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs5500 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs5500 -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  ncs5500 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs5500 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs5500 -core -jam_opt "-j32 "
cd ..; rm -rf xrdev-ncs5500; 
mkdir xrdev-xrv9k; cd xrdev-xrv9k ; acme nw -dl xr-dev.lu -plat xrv9k >>/dev/null
tools/misc/xr_bld -plat  xrv9k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  xrv9k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  xrv9k -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  xrv9k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  xrv9k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  xrv9k -core -jam_opt "-j32 "
cd ..; rm -rf xrdev-xrv9k;
mkdir xrdev-asr9k-x64; cd xrdev-asr9k-x64 ; acme nw -dl xr-dev.lu -plat asr9k-x64 >>/dev/null
tools/misc/xr_bld -plat  asr9k-x64 -core -jam_opt "-j16 "
tools/misc/xr_bld -plat  asr9k-x64 -core -jam_opt "-j16 "
tools/misc/xr_bld -plat  asr9k-x64 -core -jam_opt "-j16 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  asr9k-x64 -core -jam_opt "-j16 "
tools/misc/xr_bld -plat  asr9k-x64 -core -jam_opt "-j16 "
tools/misc/xr_bld -plat  asr9k-x64 -core -jam_opt "-j16 "
cd .. ; rm -rf xrdev-asr9k-x64;
mkdir xrdev-asr9k-px; cd xrdev-asr9k-px ; acme nw -dl xr-dev.lu -plat asr9k-px >>/dev/null
tools/misc/xr_bld -plat  asr9k-px -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  asr9k-px -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  asr9k-px -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  asr9k-px -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  asr9k-px -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  asr9k-px -core -jam_opt "-j32 "
cd ..; rm -rf xrdev-asr9k-px;
mkdir xrdev-ncs4k; cd xrdev-ncs4k ; acme nw -dl xr-dev.lu -plat ncs4k >>/dev/null
tools/misc/xr_bld -plat  ncs4k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs4k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs4k -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  ncs4k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs4k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs4k -core -jam_opt "-j32 "
cd ..; rm -rf  xrdev-ncs4k;
mkdir xrdev-ncs6k; cd xrdev-ncs6k ; acme nw -dl xr-dev.lu -plat ncs6k >>/dev/null
tools/misc/xr_bld -plat  ncs6k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs6k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs6k -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  ncs6k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs6k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs6k -core -jam_opt "-j32 "
cd ..; rm -rf xrdev-ncs6k;
mkdir xrdev-ncs5k; cd xrdev-ncs5k ; acme nw -dl xr-dev.lu -plat ncs5k >>/dev/null
tools/misc/xr_bld -plat  ncs5k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs5k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs5k -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  ncs5k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs5k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs5k -core -jam_opt "-j32 "
cd ..; rm -rf xrdev-ncs5k; 
mkdir xrdev-hfr-px; cd xrdev-hfr-px ; acme nw -dl xr-dev.lu -plat hfr-px >>/dev/null
tools/misc/xr_bld -plat  hfr-px -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  hfr-px -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  hfr-px -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  hfr-px -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  hfr-px -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  hfr-px -core -jam_opt "-j32 "
cd .. ; rm -rf xrdev-hfr-px;
mkdir xrdev-ncs1k; cd xrdev-ncs1k ; acme nw -dl xr-dev.lu -plat ncs1k >>/dev/null
tools/misc/xr_bld -plat  ncs1k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs1k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs1k -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  ncs1k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs1k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs1k -core -jam_opt "-j32 "
cd .. ; rm -rf xrdev-ncs1k ;
mkdir xrdev-ncs1001; cd xrdev-ncs1001 ; acme nw -dl xr-dev.lu -plat ncs1001 >>/dev/null
tools/misc/xr_bld -plat  ncs1001 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs1001 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs1001 -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  ncs1001 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs1001 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs1001 -core -jam_opt "-j32 "
cd ..; rm -rf xrdev-ncs1001;
mkdir xrdev-ncs1004; cd xrdev-ncs1004 ; acme nw -dl xr-dev.lu -plat ncs1004 >>/dev/null
tools/misc/xr_bld -plat  ncs1004 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs1004 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs1004 -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  ncs1004 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs1004 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs1004 -core -jam_opt "-j32 "
cd ..; rm -rf xrdev-ncs1004;
mkdir xrdev-iosxrv-x64; cd xrdev-iosxrv-x64 ; acme nw -dl xr-dev.lu -plat iosxrv-x64 >>/dev/null
tools/misc/xr_bld -plat  iosxrv-x64 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  iosxrv-x64 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  iosxrv-x64 -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  iosxrv-x64 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  iosxrv-x64 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  iosxrv-x64 -core -jam_opt "-j32 "
cd ..; rm -rf xrdev-iosxrv-x64;
mkdir xrdev-iosxrwb; cd xrdev-iosxrwb ; acme nw -dl xr-dev.lu -plat iosxrwb >>/dev/null
tools/misc/xr_bld -plat  iosxrwb -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  iosxrwb -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  iosxrwb -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  iosxrwb -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  iosxrwb -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  iosxrwb -core -jam_opt "-j32 "
cd .. ; rm -rf  xrdev-iosxrwb; 
mkdir xrdev-xrvr; cd xrdev-xrvr ; acme nw -dl xr-dev.lu -plat xrvr >>/dev/null
tools/misc/xr_bld -plat  xrvr -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  xrvr -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  xrvr -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  xrvr -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  xrvr -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  xrvr -core -jam_opt "-j32 "
cd .. ; rm -rf  xrdev-xrvr; 
mkdir xrdev-enxr; cd xrdev-enxr ; acme nw -dl xr-dev.lu -plat enxr >>/dev/null
tools/misc/xr_bld -plat  enxr -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  enxr -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  enxr -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  enxr -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  enxr -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  enxr -core -jam_opt "-j32 "
cd .. ; rm -rf  xrdev-enxr; 
mkdir xrdev-enxr-spirit; cd xrdev-enxr-spirit ; acme nw -dl xr-dev.lu -plat enxr-spirit >>/dev/null
tools/misc/xr_bld -plat  enxr-spirit -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  enxr-spirit -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  enxr-spirit -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  enxr-spirit -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  enxr-spirit -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  enxr-spirit -core -jam_opt "-j32 "
cd .. ; rm -rf  xrdev-enxr-spirit; 
mkdir xrdev-enxr-fretta; cd xrdev-enxr-fretta ; acme nw -dl xr-dev.lu -plat enxr-fretta >>/dev/null
tools/misc/xr_bld -plat  enxr-fretta -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  enxr-fretta -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  enxr-fretta -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  enxr-fretta -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  enxr-fretta -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  enxr-fretta -core -jam_opt "-j32 "
cd .. ; rm -rf  xrdev-enxr-fretta; 
