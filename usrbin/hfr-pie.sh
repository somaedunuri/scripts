echo " "
date 
jam  iosxr-os-crs1-rp.pie iosxr-os-crs1-lc.pie iosxr-os-crs1-sp.pie iosxr-os-crs1-drp.pie iosxr-infra-crs1.pie iosxr-fwding-crs1.pie iosxr-routing-crs1.pie iosxr-mpls-crs1.pie iosxr-mcast-crs1.pie iosxr-mgbl-crs1.pie >hfr-pie-iox.log
date 
jam  hfr-os-support-rp.pie hfr-os-support-lc.pie hfr-os-support-sp.pie hfr-os-support-drp.pie hfr-os-mbi.pie hfr-base.pie hfr-fwding.pie hfr-mcast-p.pie hfr-mgbl-p.pie hfr-diags-p.pie hfr-fpd.pie >hfr-pie-hfr.log
cd img-crs1; 
ls -l iosxr-os-crs1-rp.pie iosxr-os-crs1-lc.pie iosxr-os-crs1-sp.pie iosxr-os-crs1-drp.pie iosxr-infra-crs1.pie iosxr-fwding-crs1.pie iosxr-routing-crs1.pie iosxr-mpls-crs1.pie iosxr-mcast-crs1.pie iosxr-mgbl-crs1.pie
ls -l hfr-os-support-rp.pie hfr-os-support-lc.pie hfr-os-support-sp.pie hfr-os-support-drp.pie hfr-os-mbi.pie hfr-base.pie hfr-fwding.pie hfr-mcast-p.pie hfr-mgbl-p.pie hfr-diags-p.pie hfr-fpd.pie 
date 
