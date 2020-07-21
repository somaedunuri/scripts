rm -rf /nobackup/soma/bm-$1
rm /tmp/acme.out
cd /nobackup/soma
mkdir bm-$1
cd bm-$1
date
/usr/cisco/bin/acme nw -lineup  $1.lu -sb ios_ena >/tmp/acme.out
date
cp /users/soma/soma.sh .
#./soma.sh c12k 
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
./soma.sh xrvr 
#./soma.sh xrvr 
#./soma.sh xrvr 
#./soma.sh xrvr 
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

