mkdir cob-$1 ; 
cd cob-$1 ; 
mist new -p xr-dev-$1 ;
cp ~soma/soma.sh . ; 
soma.sh $1 ; 
soma.sh $1 ; 
soma.sh $1 ;
cd ..
rm -rf cob-$1

