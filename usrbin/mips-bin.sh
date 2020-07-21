#!/bin/sh
#iosxr 4k binary build
if [ ! -d crypto/toolkit ]; then
    acme mw -nodepend -noprompt -comp crypto/toolkit@crypto/cepki/toolkit.lu
fi
echo "iosxr 4k binary build "
date 
jam  iosxr-os.4k.bin iosxr-infra.4k.bin iosxr-fwding.4k.bin iosxr-routing.4k.bin iosxr-diags.4k.bin iosxr-mpls.4k.bin iosxr-mcast.4k.bin iosxr-mgbl.4k.bin iosxr-docs.4k.bin iosxr-security.4k.bin iosxr-adv-video.4k.bin iosxr-service.4k.bin 2>&1 > 4k-iosxr.log
#jam -sJAM_INCLUDE_TEST_FILES=1  iosxr-infra-test.4k.bin  2>&1 > 4k-test.log
#jam iosxr-pagent.4k.bin 
#c12k 4k binary build
#echo "c12k 4k binary build "
#date 
#jam  c12k-os-supp.4k.bin c12k-base.4k.bin c12k-traffic.4k.bin c12k-mcast.4k.bin c12k-mgbl.4k.bin c12k-diags.4k.bin c12k-fpd.4k.bin c12k-k9sec.4k.bin 2>&1 >4k-c12k.log 
echo "end of binary builds"
cd obj-4k 
ls -l   iosxr-os.4k.bin iosxr-infra.4k.bin iosxr-fwding.4k.bin iosxr-routing.4k.bin iosxr-diags.4k.bin iosxr-mpls.4k.bin iosxr-mcast.4k.bin iosxr-mgbl.4k.bin iosxr-docs.4k.bin iosxr-security.4k.bin iosxr-adv-video.4k.bin iosxr-service.4k.bin
#ls -l c12k-os-supp.4k.bin c12k-base.4k.bin c12k-traffic.4k.bin c12k-mcast.4k.bin c12k-mgbl.4k.bin c12k-diags.4k.bin c12k-fpd.4k.bin c12k-k9sec.4k.bin
date 
