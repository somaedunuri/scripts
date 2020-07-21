rm -rf $1
mkdir $1 ; cd $1
rm -rf /tmp/$1
date >/tmp/$1
acme nw -proj  r61x -plat $1
date >>/tmp/$1
cat /tmp/$1
cp ~soma/soma.sh . 
soma.sh $1; soma.sh $1; soma.sh $1 ;

