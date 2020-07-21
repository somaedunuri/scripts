date
mkdir xrdev-test ; cd xrdev-test ; acme nw -dl xr-dev.lu%latest; 
cp /users/soma/soma.sh .
./soma.sh hfr-px 
/router/bin/jam clean 
./soma.sh asr9k-px 
/router/bin/jam clean 
./soma.sh xrvr 
/router/bin/jam clean 
./soma.sh asr9k-x64
/router/bin/jam clean 
./soma.sh xrv9k
/router/bin/jam clean 
