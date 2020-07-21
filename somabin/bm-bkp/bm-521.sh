rm -rf /nobackup/soma/bm-ci-521
rm -rf /tmp/acme.out
cd /nobackup/soma
mkdir bm-ci-521
cd bm-ci-521
/usr/cisco/bin/acme nw -lineup ci-521.lu >/tmp/acme.out
#cp /users/soma/soma.sh .
/users/soma/soma.sh asr9k-px; 
/users/soma/soma.sh asr9k-px; 
/users/soma/soma.sh asr9k-px; 
/users/soma/soma.sh asr9k-px; 
/router/bin/jam clean ;
/users/soma/soma.sh c12k; 
/users/soma/soma.sh c12k; 
/users/soma/soma.sh c12k; 
/users/soma/soma.sh c12k; 
/router/bin/jam clean ;
/users/soma/soma.sh hfr-px; 
/users/soma/soma.sh hfr-px; 
/users/soma/soma.sh hfr-px; 
/users/soma/soma.sh hfr-px; 
/router/bin/jam clean ;
/users/soma/soma.sh ncs4k; 
/users/soma/soma.sh ncs4k; 
/users/soma/soma.sh ncs4k; 
/users/soma/soma.sh ncs4k; 
/router/bin/jam clean ;
/users/soma/soma.sh ncs6k; 
/users/soma/soma.sh ncs6k; 
/users/soma/soma.sh ncs6k; 
/users/soma/soma.sh ncs6k; 
/router/bin/jam clean ;
/users/soma/soma.sh xrvr; 
/users/soma/soma.sh xrvr; 
/users/soma/soma.sh xrvr; 
/users/soma/soma.sh xrvr; 
/router/bin/jam clean ;
