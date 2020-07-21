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
#cd ..; rm -rf xrdev-ncs5500; 
cd ..;
mkdir xrdev-xrv9k; cd xrdev-xrv9k ; acme nw -dl xr-dev.lu -plat xrv9k >>/dev/null
tools/misc/xr_bld -plat  xrv9k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  xrv9k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  xrv9k -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  xrv9k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  xrv9k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  xrv9k -core -jam_opt "-j32 "
#cd ..; rm -rf xrdev-xrv9k;
cd ..;
mkdir xrdev-asr9k-px; cd xrdev-asr9k-px ; acme nw -dl xr-dev.lu -plat asr9k-px >>/dev/null
tools/misc/xr_bld -plat  asr9k-px -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  asr9k-px -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  asr9k-px -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  asr9k-px -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  asr9k-px -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  asr9k-px -core -jam_opt "-j32 "
#cd ..; rm -rf xrdev-asr9k-px;
cd ..;
mkdir xrdev-ncs4k; cd xrdev-ncs4k ; acme nw -dl xr-dev.lu -plat ncs4k >>/dev/null
tools/misc/xr_bld -plat  ncs4k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs4k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs4k -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  ncs4k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs4k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs4k -core -jam_opt "-j32 "
#cd ..; rm -rf  xrdev-ncs4k;
cd ..;
mkdir xrdev-ncs6k; cd xrdev-ncs6k ; acme nw -dl xr-dev.lu -plat ncs6k >>/dev/null
tools/misc/xr_bld -plat  ncs6k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs6k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs6k -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  ncs6k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs6k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs6k -core -jam_opt "-j32 "
#cd ..; rm -rf  xrdev-ncs6k;
cd ..;
mkdir xrdev-asr9k-x64; cd xrdev-asr9k-x64 ; acme nw -dl xr-dev.lu -plat asr9k-x64 >>/dev/null
tools/misc/xr_bld -plat  asr9k-x64 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  asr9k-x64 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  asr9k-x64 -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  asr9k-x64 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  asr9k-x64 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  asr9k-x64 -core -jam_opt "-j32 "
#cd .. ; rm -rf xrdev-asr9k-x64;
cd ..;
