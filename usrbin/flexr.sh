rm -rf /nobackup/soma/bm-$1
rm /tmp/acme.out
cd /nobackup/soma
mkdir bm-$1
cd bm-$1
date
/usr/cisco/bin/acme nw -proj  $1 -sb ios_ena >/tmp/acme.out
date
cp /users/soma/soma.sh .
./soma.sh fretta 
./soma.sh fretta 
./soma.sh fretta 
./soma.sh fretta 
/router/bin/jam clean 
./soma.sh sunstone 
./soma.sh sunstone 
./soma.sh sunstone 
./soma.sh sunstone 
/router/bin/jam clean 
./soma.sh asr9k-x64 
./soma.sh asr9k-x64 
./soma.sh asr9k-x64 
./soma.sh asr9k-x64 
/router/bin/jam clean 
./soma.sh ncs6k
./soma.sh ncs6k
./soma.sh ncs6k
./soma.sh ncs6k
/router/bin/jam clean 
./soma.sh ncs4k
./soma.sh ncs4k
./soma.sh ncs4k
./soma.sh ncs4k
/router/bin/jam clean 
