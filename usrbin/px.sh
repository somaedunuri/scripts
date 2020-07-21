date >px.logs
date
jam -j8 -C -sJAM_MINI_XR=enabled -sCRS_X86_PHOENIX_RP=enabled comp-hfr-mini-px-phoenix.vm >>px.logs
jam -l -d2 -j8 hfr-mpls-px.pie hfr-mgbl-px.pie hfr-mcast-px.pie hfr-doc-px.pie >>px.logs
cd img-crs1
ls -l  comp-hfr-mini-px-phoenix.vm hfr-mpls-px.pie hfr-mgbl-px.pie hfr-mcast-px.pie hfr-doc-px.pie 
date >>px.logs
date
