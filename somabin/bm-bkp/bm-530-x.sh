set uid = `whoami`
echo $uid
rm -rf /nobackup/$uid/bm-$1
rm /tmp/acme.out
cd /nobackup/$uid
mkdir bm-$1
cd bm-$1
/usr/cisco/bin/acme nw -lineup $1.lu >/tmp/acme.out
/auto/iox/bin/xr_bld -plat c12k -jam_opt " -dax" 
/auto/iox/bin/xr_bld -plat c12k -jam_opt " -dax" 
/auto/iox/bin/xr_bld -plat c12k -jam_opt " -dax" 
/auto/iox/bin/xr_bld -plat c12k -jam_opt " -dax" 
/router/bin/jam clean ;
/auto/iox/bin/xr_bld -plat hfr-px -jam_opt " -dax" 
/auto/iox/bin/xr_bld -plat hfr-px -jam_opt " -dax" 
/auto/iox/bin/xr_bld -plat hfr-px -jam_opt " -dax" 
/auto/iox/bin/xr_bld -plat hfr-px -jam_opt " -dax" 
/router/bin/jam clean ;
/auto/iox/bin/xr_bld -plat asr9k-px -jam_opt " -dax" 
/auto/iox/bin/xr_bld -plat asr9k-px -jam_opt " -dax" 
/auto/iox/bin/xr_bld -plat asr9k-px -jam_opt " -dax" 
/auto/iox/bin/xr_bld -plat asr9k-px -jam_opt " -dax" 
/router/bin/jam clean ;
/auto/iox/bin/xr_bld -plat ncs6k -jam_opt " -dax" 
/auto/iox/bin/xr_bld -plat ncs6k -jam_opt " -dax" 
/auto/iox/bin/xr_bld -plat ncs6k -jam_opt " -dax" 
/auto/iox/bin/xr_bld -plat ncs6k -jam_opt " -dax" 
/router/bin/jam clean ;
/auto/iox/bin/xr_bld -plat ncs4k -jam_opt " -dax" 
/auto/iox/bin/xr_bld -plat ncs4k -jam_opt " -dax" 
/auto/iox/bin/xr_bld -plat ncs4k -jam_opt " -dax" 
/auto/iox/bin/xr_bld -plat ncs4k -jam_opt " -dax" 
/router/bin/jam clean ;
/auto/iox/bin/xr_bld -plat xrvr -jam_opt " -dax" 
/auto/iox/bin/xr_bld -plat xrvr -jam_opt " -dax" 
/auto/iox/bin/xr_bld -plat xrvr -jam_opt " -dax" 
/auto/iox/bin/xr_bld -plat xrvr -jam_opt " -dax" 
/router/bin/jam clean ;
/auto/iox/bin/xr_bld -plat enxr -jam_opt " -dax" 
/auto/iox/bin/xr_bld -plat enxr -jam_opt " -dax" 
/auto/iox/bin/xr_bld -plat enxr -jam_opt " -dax" 
/auto/iox/bin/xr_bld -plat enxr -jam_opt " -dax" 
/router/bin/jam clean ;
