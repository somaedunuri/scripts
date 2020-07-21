#!/bin/csh
setenv JAM_ADMIN_JFACTOR 1

date
setenv JAM_ADMIN_JFACTOR 1
#mkdir xrdev-test ; cd xrdev-test ; acme nw -dl xr-dev.lu%latest;
#cp /users/soma/xr_bld* tools/misc
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >&/dev/null
tools/misc/xr_bld -plat  ncs1k -nightly -jam_opt "-j32 "
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >&/dev/null
tools/misc/xr_bld -plat  ncs1001  -nightly -jam_opt "-j32 "
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >&/dev/null
tools/misc/xr_bld -plat  ncs4k -nightly -jam_opt "-j32 "
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >&/dev/null
tools/misc/xr_bld -plat  ncs5500 -nightly -jam_opt "-j32 "
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >&/dev/null
tools/misc/xr_bld -plat  xrv9k -nightly -jam_opt "-j32 "
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >&/dev/null
tools/misc/xr_bld -plat  iosxrv-x64 -nightly -jam_opt "-j32 "
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >&/dev/null
tools/misc/xr_bld -plat  xrvr  -nightly -jam_opt "-j32 "
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >&/dev/null
tools/misc/xr_bld -plat  asr9k-x64 -nightly -jam_opt "-j32 "
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >&/dev/null
tools/misc/xr_bld -plat  asr9k-px  -nightly -jam_opt "-j32 "
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >&/dev/null
tools/misc/xr_bld -plat  hfr-px  -nightly -jam_opt "-j32 "
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >&/dev/null
tools/misc/xr_bld -plat  ncs5k -nightly -jam_opt "-j32 "
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >&/dev/null
tools/misc/xr_bld -plat  ncs6k -nightly -jam_opt "-j32 "
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >&/dev/null
#tools/misc/xr_bld -plat  enxr,enxr-c64,enxr-spirit
#/router/bin/jam clean 
#tools/misc/xr_bld -plat  enxr-fretta
#/router/bin/jam clean 

