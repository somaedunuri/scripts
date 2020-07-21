date
#mkdir xrdev-test ; cd xrdev-test ; acme nw -dl xr-dev.lu%latest;
#cp /users/soma/xr_bld* tools/misc
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >>/dev/null
tools/misc/xr_bld -plat  iosxrv-x64 
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >>/dev/null
/auto/iox/bin/xr_bld -plat  iosxrv-x64 
#
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >>/dev/null
tools/misc/xr_bld -plat  asr9k-x64 
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >>/dev/null
/auto/iox/bin/xr_bld -plat  asr9k-x64 
#
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >>/dev/null
tools/misc/xr_bld -plat  xrvr  
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >>/dev/null
/auto/iox/bin/xr_bld -plat  xrvr  
#
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >>/dev/null
tools/misc/xr_bld -plat  asr9k-px  
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >>/dev/null
/auto/iox/bin/xr_bld -plat  asr9k-px  
#
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >>/dev/null
tools/misc/xr_bld -plat  hfr-px  
/router/bin/jam clean  ; calvados/build/make-lib/xrmk clean cleanall >>/dev/null
/auto/iox/bin/xr_bld -plat  hfr-px  
#
