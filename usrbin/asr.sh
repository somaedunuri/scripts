#!/bin/sh
#asr9k image Builds
if [ ! -d crypto/toolkit ]; then
    acme mw -nodepend -noprompt -comp crypto/toolkit@crypto/cepki/toolkit.lu
fi
date >asr.logs
date
jam asr9k-mini-p.vm asr9k-mini-p.pie asr9k-mpls-p.pie asr9k-mgbl-p.pie asr9k-mcast-p.pie asr9k-fpd.pie asr9k-doc-p.pie asr9k-k9sec-p.pie asr9k-upgrade-p.pie asr9k-video-p.pie asr9k-optic-p.pie >>asr.logs
cd img-asr9k
ls -l asr9k-mini-p.vm asr9k-mini-p.pie asr9k-mpls-p.pie asr9k-mgbl-p.pie asr9k-mcast-p.pie asr9k-fpd.pie asr9k-doc-p.pie asr9k-k9sec-p.pie asr9k-upgrade-p.pie asr9k-video-p.pie asr9k-optic-p.pie
date >>asr.logs
date
