#set PATH /auto/binos-tools/bin:$PATH 
cc_rmview -force -ns -vob /vob/ios -view soma-pol_iosd_$1_$2
mkdir /nobackup/soma/ncob-pol-$1-$2
cd  /nobackup/soma/ncob-pol-$1-$2
mkdir pol_binos_$1 ;  cd pol_binos_$1
acme nw -sb xe -dl polaris_dev%2463
cd binos
rm /tmp/mcp_ios_precommit.mk; /users/rathreya/addtimestamp.py  > /tmp/mcp_ios_precommit.mk
cp /tmp/mcp_ios_precommit.mk build/make-lib/mcp_ios_precommit.mk
setenv BINOS_ROOT /nobackup/soma/ncob-pol-$1-$2/pol_binos_$1/binos
cd ../..
start_task -v /vob/ios -t pol_iosd_$1_$2 -l BLD_POLARIS_DEV_LATEST_20141110_080059  -a -d /nobackup/soma/ncob-pol-$1-$2
#/usr/atria/bin/cleartool setview soma-pol_iosd_$1_$2
cd /view/soma-pol_iosd_$1_$2/vob/ios/sys
#cd /vob/ios/sys
echo "  "
echo "Starting the builds for " $1_super
date; /auto/binos-tools/bin/mcp_ios_precommit $1_super >&! /nobackup/soma/ncob-pol-$1-$2/$1.log1 ;
date; /auto/binos-tools/bin/mcp_ios_precommit $1_super >&! /nobackup/soma/ncob-pol-$1-$2/$1.log2 ;
date; /auto/binos-tools/bin/mcp_ios_precommit $1_super >&! /nobackup/soma/ncob-pol-$1-$2/$1.log3 ;
date; /auto/binos-tools/bin/mcp_ios_precommit $1_super >&! /nobackup/soma/ncob-pol-$1-$2/$1.log4 ;
date;


