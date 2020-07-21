rm -rf /nobackup/soma/bm-flexr-asr9k
rm /tmp/acme.out
cd /nobackup/soma
mkdir bm-flexr-asr9k
cd bm-flexr-asr9k
date
/usr/cisco/bin/acme nw -proj  flexr-asr9k -sb ios_ena >/tmp/acme.out
date
cp /users/soma/soma.sh .
./soma.sh asr9k-x64
#./soma.sh c12k 
#./soma.sh c12k 
#./soma.sh c12k 
/router/bin/jam clean 
