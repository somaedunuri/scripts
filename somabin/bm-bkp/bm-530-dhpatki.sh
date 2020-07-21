rm -rf /nobackup/dhpatki/bm-ci-530
rm /tmp/acme.out
cd /nobackup/dhpatki
mkdir bm-ci-530
cd bm-ci-530
/usr/cisco/bin/acme nw -lineup ci-530.lu >/tmp/acme.out
#cp /users/dhpatki/soma.sh .
/users/dhpatki/soma.sh asr9k-px; 
/users/dhpatki/soma.sh asr9k-px; 
/users/dhpatki/soma.sh asr9k-px; 
/users/dhpatki/soma.sh asr9k-px; 
/router/bin/jam clean ;
/users/dhpatki/soma.sh c12k; 
/users/dhpatki/soma.sh c12k; 
/users/dhpatki/soma.sh c12k; 
/users/dhpatki/soma.sh c12k; 
/router/bin/jam clean ;
/users/dhpatki/soma.sh hfr-px; 
/users/dhpatki/soma.sh hfr-px; 
/users/dhpatki/soma.sh hfr-px; 
/users/dhpatki/soma.sh hfr-px; 
/router/bin/jam clean ;
/users/dhpatki/soma.sh ncs6k
/users/dhpatki/soma.sh ncs6k
/users/dhpatki/soma.sh ncs6k
/users/dhpatki/soma.sh ncs6k
/router/bin/jam clean ;
/users/dhpatki/soma.sh ncs4k
/users/dhpatki/soma.sh ncs4k
/users/dhpatki/soma.sh ncs4k
/users/dhpatki/soma.sh ncs4k
/router/bin/jam clean ;
/users/dhpatki/soma.sh xrvr; 
/users/dhpatki/soma.sh xrvr; 
/users/dhpatki/soma.sh xrvr; 
/users/dhpatki/soma.sh xrvr; 
/router/bin/jam clean ;
