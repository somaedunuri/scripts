rm -rf /nobackup/soma/bm-$1
rm /tmp/acme#.out
cd /nobackup/soma
mkdir bm-$1
cd bm-$1
date
/usr/cisco/bin/acme nw -proj  $1 -sb ios_ena >/tmp/acme#.out
date
cp /users/soma/soma2#.sh #.
./soma2#.sh c12k 
#./soma2#.sh c12k 
#./soma2#.sh c12k 
#./soma2#.sh c12k 
/router/bin/jam clean 
./soma2#.sh hfr-px 
#./soma2#.sh hfr-px 
#./soma2#.sh hfr-px 
#./soma2#.sh hfr-px 
/router/bin/jam clean 
./soma2#.sh asr9k-px 
#./soma2#.sh asr9k-px 
#./soma2#.sh asr9k-px 
#./soma2#.sh asr9k-px 
/router/bin/jam clean 
./soma2#.sh xrvr 
#./soma2#.sh xrvr 
#./soma2#.sh xrvr 
#./soma2#.sh xrvr 
/router/bin/jam clean 
./soma2#.sh ncs6k
#./soma2#.sh ncs6k
#./soma2#.sh ncs6k
#./soma2#.sh ncs6k
/router/bin/jam clean 
./soma2#.sh ncs4k
#./soma2#.sh ncs4k
#./soma2#.sh ncs4k
#./soma2#.sh ncs4k
/router/bin/jam clean 

