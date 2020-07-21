rm -rf /nobackup/soma/bm-skywarp2
rm /tmp/acme.out
cd /nobackup/soma
mkdir bm-skywarp2
cd bm-skywarp2
date
/usr/cisco/bin/acme nw -proj  skywarp2  -sb ios_ena >/tmp/acme.out
date
cp /users/soma/soma.sh .
./soma.sh skywarp
#./soma.sh c12k 
#./soma.sh c12k 
#./soma.sh c12k 
/router/bin/jam clean 
