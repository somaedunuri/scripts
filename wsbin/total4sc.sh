#!/bin/csh
setenv JAM_ADMIN_JFACTOR 1

date
mkdir xrdev-iosxrv-x64; cd xrdev-iosxrv-x64 ; acme nw -dl xr-dev.lu -plat iosxrv-x64 >>/dev/null
tools/misc/xr_bld -plat  iosxrv-x64 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  iosxrv-x64 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  iosxrv-x64 -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  iosxrv-x64 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  iosxrv-x64 -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  iosxrv-x64 -core -jam_opt "-j32 "
#cd ..; rm -rf xrdev-iosxrv-x64;
cd ..;
mkdir xrdev-iosxrwb; cd xrdev-iosxrwb ; acme nw -dl xr-dev.lu -plat iosxrwb >>/dev/null
tools/misc/xr_bld -plat  iosxrwb -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  iosxrwb -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  iosxrwb -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  iosxrwb -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  iosxrwb -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  iosxrwb -core -jam_opt "-j32 "
#cd .. ; rm -rf  xrdev-iosxrwb; 
cd ..;
mkdir xrdev-xrvr; cd xrdev-xrvr ; acme nw -dl xr-dev.lu -plat xrvr >>/dev/null
tools/misc/xr_bld -plat  xrvr -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  xrvr -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  xrvr -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  xrvr -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  xrvr -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  xrvr -core -jam_opt "-j32 "
#cd .. ; rm -rf  xrdev-xrvr; 
cd ..;
mkdir xrdev-enxr; cd xrdev-enxr ; acme nw -dl xr-dev.lu -plat enxr >>/dev/null
tools/misc/xr_bld -plat  enxr -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  enxr -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  enxr -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  enxr -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  enxr -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  enxr -core -jam_opt "-j32 "
#cd .. ; rm -rf  xrdev-enxr; 
cd ..;
mkdir xrdev-enxr-spirit; cd xrdev-enxr-spirit ; acme nw -dl xr-dev.lu -plat enxr-spirit >>/dev/null
tools/misc/xr_bld -plat  enxr-spirit -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  enxr-spirit -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  enxr-spirit -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  enxr-spirit -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  enxr-spirit -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  enxr-spirit -core -jam_opt "-j32 "
#cd .. ; rm -rf  xrdev-enxr-spirit; 
cd ..;
mkdir xrdev-enxr-fretta; cd xrdev-enxr-fretta ; acme nw -dl xr-dev.lu -plat enxr-fretta >>/dev/null
tools/misc/xr_bld -plat  enxr-fretta -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  enxr-fretta -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  enxr-fretta -core -jam_opt "-j32 "
tools/misc/xr_bld -clean
tools/misc/xr_bld -plat  enxr-fretta -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  enxr-fretta -core -jam_opt "-j32 "
tools/misc/xr_bld -plat  enxr-fretta -core -jam_opt "-j32 "
#cd .. ; rm -rf  xrdev-enxr-fretta; 
cd ..;
