date
#mkdir xrdev-test ; cd xrdev-test ; acme nw -dl xr-dev.lu%latest;
#cp /users/soma/xr_bld* tools/misc
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >>/dev/null
tools/misc/xr_bld -plat  ncs1k 
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >>/dev/null
/auto/iox/bin/xr_bld -plat  ncs1k 
#
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >>/dev/null
tools/misc/xr_bld -plat  ncs1001  
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >>/dev/null
/auto/iox/bin/xr_bld -plat  ncs1001  
#
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >>/dev/null
tools/misc/xr_bld -plat  ncs4k 
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >>/dev/null
/auto/iox/bin/xr_bld -plat  ncs4k 
#
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >>/dev/null
tools/misc/xr_bld -plat  ncs5k 
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >>/dev/null
/auto/iox/bin/xr_bld -plat  ncs5k 
#
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >>/dev/null
tools/misc/xr_bld -plat  ncs5500 
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >>/dev/null
/auto/iox/bin/xr_bld -plat  ncs5500 
#
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >>/dev/null
tools/misc/xr_bld -plat  ncs6k 
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >>/dev/null
/auto/iox/bin/xr_bld -plat  ncs6k 
#
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >>/dev/null
tools/misc/xr_bld -plat  xrv9k 
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >>/dev/null
/auto/iox/bin/xr_bld -plat  xrv9k 
#
