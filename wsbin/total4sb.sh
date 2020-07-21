#!/bin/csh
setenv JAM_ADMIN_JFACTOR 1

date
mkdir xrdev-ncs5k; cd xrdev-ncs5k ; acme nw -dl xr-dev.lu -plat ncs5k >>/dev/null
tools/misc/xr_bld -plat  ncs5k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs5k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs5k -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  ncs5k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs5k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs5k -core -jam_opt "-j32 "
#cd ..; rm -rf xrdev-ncs5k; 
cd .. ;
mkdir xrdev-hfr-px; cd xrdev-hfr-px ; acme nw -dl xr-dev.lu -plat hfr-px >>/dev/null
tools/misc/xr_bld -plat  hfr-px -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  hfr-px -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  hfr-px -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  hfr-px -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  hfr-px -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  hfr-px -core -jam_opt "-j32 "
#cd .. ; rm -rf xrdev-hfr-px;
cd .. ;
mkdir xrdev-ncs1k; cd xrdev-ncs1k ; acme nw -dl xr-dev.lu -plat ncs1k >>/dev/null
tools/misc/xr_bld -plat  ncs1k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs1k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs1k -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  ncs1k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs1k -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs1k -core -jam_opt "-j32 "
#cd .. ; rm -rf xrdev-ncs1k ;
cd .. ;
mkdir xrdev-ncs1001; cd xrdev-ncs1001 ; acme nw -dl xr-dev.lu -plat ncs1001 >>/dev/null
tools/misc/xr_bld -plat  ncs1001 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs1001 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs1001 -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  ncs1001 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs1001 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs1001 -core -jam_opt "-j32 "
#cd ..; rm -rf xrdev-ncs1001;
cd .. ;
mkdir xrdev-ncs1004; cd xrdev-ncs1004 ; acme nw -dl xr-dev.lu -plat ncs1004 >>/dev/null
tools/misc/xr_bld -plat  ncs1004 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs1004 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs1004 -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  ncs1004 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs1004 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  ncs1004 -core -jam_opt "-j32 "
#cd ..; rm -rf xrdev-ncs1004;
cd .. ;
