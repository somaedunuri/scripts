rm -rf /nobackup/soma/bm-flex-xr
rm /tmp/acme.out
cd /nobackup/soma
mkdir bm-flex-xr
cd bm-flex-xr
date
/usr/cisco/bin/acme nw -proj  flex-xr -sb ios_ena >/tmp/acme.out
date
cp /users/soma/soma.sh .
./soma.sh c12k 
#./soma.sh c12k 
#./soma.sh c12k 
#./soma.sh c12k 
/router/bin/jam clean 
./soma.sh hfr-px 
#./soma.sh hfr-px 
#./soma.sh hfr-px 
#./soma.sh hfr-px 
/router/bin/jam clean 
./soma.sh asr9k-px 
#./soma.sh asr9k-px 
#./soma.sh asr9k-px 
#./soma.sh asr9k-px 
/router/bin/jam clean 
./soma.sh ncs6k
#./soma.sh ncs6k
#./soma.sh ncs6k
#./soma.sh ncs6k
/router/bin/jam clean 
./soma.sh ncs4k
#./soma.sh ncs4k
#./soma.sh ncs4k
#./soma.sh ncs4k
/router/bin/jam clean 
./soma.sh xrvr 
#./soma.sh xrvr 
#./soma.sh xrvr 
#./soma.sh xrvr 
/router/bin/jam clean 
./soma.sh sunstone 
#./soma.sh sunstone 
#./soma.sh sunstone 
#./soma.sh sunstone 
/router/bin/jam clean 
./soma.sh ucs 
#./soma.sh ucs 
#./soma.sh ucs 
#./soma.sh ucs 
/router/bin/jam clean 
./soma.sh asr9k-x64 
#./soma.sh asr9k-x64 
#./soma.sh asr9k-x64 
#./soma.sh asr9k-x64 
/router/bin/jam clean 
