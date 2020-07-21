#!/bin/sh
#iosxr ppc binary builds
if [ ! -d crypto/toolkit ]; then
    acme mw -nodepend -noprompt -comp crypto/toolkit@crypto/cepki/toolkit.lu
fi
echo "iosxr ppc binary build..."
date 
jam  iosxr-os.ppc.bin iosxr-infra.ppc.bin iosxr-fwding.ppc.bin iosxr-routing.ppc.bin iosxr-diags.ppc.bin iosxr-mpls.ppc.bin iosxr-mcast.ppc.bin iosxr-mgbl.ppc.bin iosxr-docs.ppc.bin iosxr-security.ppc.bin iosxr-adv-video.ppc.bin iosxr-service.ppc.bin 2>&1 > ppc-iosxr.log
cd obj-ppc 
ls -l   iosxr-os.ppc.bin iosxr-infra.ppc.bin iosxr-fwding.ppc.bin iosxr-routing.ppc.bin iosxr-diags.ppc.bin iosxr-mpls.ppc.bin iosxr-mcast.ppc.bin iosxr-mgbl.ppc.bin iosxr-docs.ppc.bin iosxr-security.ppc.bin iosxr-adv-video.ppc.bin iosxr-infra-test.ppc.bin iosxr-service.ppc.bin
date 
echo "     "

cd ..
echo "iosxr 4k binary build "
date 
jam  iosxr-os.4k.bin iosxr-infra.4k.bin iosxr-fwding.4k.bin iosxr-routing.4k.bin iosxr-diags.4k.bin iosxr-mpls.4k.bin iosxr-mcast.4k.bin iosxr-mgbl.4k.bin iosxr-docs.4k.bin iosxr-security.4k.bin iosxr-adv-video.4k.bin iosxr-service.4k.bin 2>&1 > 4k-iosxr.log
cd obj-4k 
ls -l   iosxr-os.4k.bin iosxr-infra.4k.bin iosxr-fwding.4k.bin iosxr-routing.4k.bin iosxr-diags.4k.bin iosxr-mpls.4k.bin iosxr-mcast.4k.bin iosxr-mgbl.4k.bin iosxr-docs.4k.bin iosxr-security.4k.bin iosxr-adv-video.4k.bin iosxr-infra-test.4k.bin iosxr-service.4k.bin
date 

#iosxr x86e binary build
cd ..
date 
jam iosxr-os.x86e.bin iosxr-infra.x86e.bin iosxr-fwding.x86e.bin iosxr-routing.x86e.bin iosxr-diags.x86e.bin iosxr-mpls.x86e.bin iosxr-mcast.x86e.bin iosxr-mgbl.x86e.bin iosxr-docs.x86e.bin iosxr-security.x86e.bin iosxr-service.x86e.bin 2>&1 > x86e-iosxr.log
cd obj-x86e 
ls -l   iosxr-os.x86e.bin iosxr-infra.x86e.bin iosxr-fwding.x86e.bin iosxr-routing.x86e.bin iosxr-diags.x86e.bin iosxr-mpls.x86e.bin iosxr-mcast.x86e.bin iosxr-mgbl.x86e.bin iosxr-docs.x86e.bin iosxr-security.x86e.bin iosxr-infra-test.x86e.bin iosxr-service.x86e.bin
date 
