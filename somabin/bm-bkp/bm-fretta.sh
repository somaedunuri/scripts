rm -rf /nobackup/soma/bm-fretta-xr
rm /tmp/acme.out
cd /nobackup/soma
mkdir bm-fretta-xr
cd bm-fretta-xr
date
/usr/cisco/bin/acme nw -proj  fretta-xr  -sb ios_ena >/tmp/acme.out
date
cp /users/soma/soma.sh .
./soma.sh fretta
#./soma.sh c12k 
#./soma.sh c12k 
#./soma.sh c12k 
/router/bin/jam clean 
