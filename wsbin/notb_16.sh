#!/bin/csh
setenv JAM_ADMIN_JFACTOR 1
date
#mkdir xrdev-test ; cd xrdev-test ; acme nw -dl xr-dev.lu%latest;
#cp  /ws/soma-sjc/soma1.sh .
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >&/dev/null
/auto/iox/bin/xr_bld -plat  ncs1k -nightly -jam_opt "-dax -notb -j16 "
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >&/dev/null
/auto/iox/bin/xr_bld -plat  ncs1001  -nightly -jam_opt "-dax -notb -j16 "
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >&/dev/null
/auto/iox/bin/xr_bld -plat  ncs5500 -nightly -jam_opt "-dax -notb -j16 "
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >&/dev/null
/auto/iox/bin/xr_bld -plat  ncs6k -nightly -jam_opt "-dax -notb -j16 "
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >&/dev/null
/auto/iox/bin/xr_bld -plat  xrv9k -nightly -jam_opt "-dax -notb -j16 "
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >&/dev/null
/auto/iox/bin/xr_bld -plat  iosxrv-x64 -nightly -jam_opt "-dax -notb -j16 "
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >&/dev/null
/auto/iox/bin/xr_bld -plat  asr9k-x64 -nightly -jam_opt "-dax -notb -j16 "
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >&/dev/null
/auto/iox/bin/xr_bld -plat  xrvr  -nightly -jam_opt "-dax -notb -j16 "
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >&/dev/null
/auto/iox/bin/xr_bld -plat  asr9k-px  -nightly -jam_opt "-dax -notb -j16 "
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >&/dev/null
#/auto/iox/bin/xr_bld -plat  enxr,enxr-c64,enxr-spirit
#/router/bin/ljam clean 
#/auto/iox/bin/xr_bld -plat  enxr-fretta
#/router/bin/ljam clean 
/auto/iox/bin/xr_bld -plat  ncs4k -nightly -jam_opt "-dax -notb -j16 "
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >&/dev/null
/auto/iox/bin/xr_bld -plat  ncs5k -nightly -jam_opt "-dax -notb -j16 "
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >&/dev/null
/auto/iox/bin/xr_bld -plat  hfr-px  -nightly -jam_opt "-dax -notb -j16 "
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >&/dev/null

