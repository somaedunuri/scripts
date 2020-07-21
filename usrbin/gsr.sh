#!/bin/sh
#gsr image Builds
if [ ! -d crypto/toolkit ]; then
    acme mw -nodepend -noprompt -comp crypto/toolkit@crypto/cepki/toolkit.lu
fi
date >c12k.logs
date 
jam c12k-mini.vm c12k-mini.pie c12k-mcast.pie c12k-mgbl.pie c12k-mpls.pie c12k-fpd.pie c12k-doc.pie c12k-k9sec.pie c12k-upgrade.pie >>c12k.logs
jam  c12k-infra-test.pie
cd img-c12k
ls -l c12k-mini.vm c12k-mini.pie c12k-mcast.pie c12k-mgbl.pie c12k-mpls.pie c12k-fpd.pie c12k-doc.pie c12k-k9sec.pie c12k-upgrade.pie c12k-infra-test.pie
date >>c12k.logs
date 
