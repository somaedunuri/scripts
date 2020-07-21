rm -rf /scratch/soma/bm-$1
rm /tmp/acme.out
cd /scratch/soma
mkdir bm-$1
cd bm-$1
date
/usr/cisco/bin/acme nw -proj  $1 -sb ios_ena >/tmp/acme.out
date
cp /users/soma/soma.sh .
./soma.sh enxr 
#./soma.sh enxr 
#./soma.sh enxr 
#./soma.sh enxr 
/router/bin/jam clean 
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
