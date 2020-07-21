#set PATH /auto/binos-tools/bin:$PATH 
mkdir /scratch/3/soma/ncob-pol-$1-$2
cd  /scratch/3/soma/ncob-pol-$1-$2
mkdir pol_binos_$1 ;  cd pol_binos_$1
acme nw -sb xe -dl polaris_dev%2101
cd binos
rm /tmp/mcp_ios_precommit.mk; /users/rathreya/addtimestamp.py  > /tmp/mcp_ios_precommit.mk
cp /tmp/mcp_ios_precommit.mk build/make-lib/mcp_ios_precommit.mk
setenv BINOS_ROOT /scratch/3/soma/ncob-pol-$1-$2/pol_binos_$1/binos
cd ../..
start_task -v /vob/ios -t pol_iosd_$1_$2 -l BLD_POLARIS_DEV_LATEST_20141008_161020 -a -d /scratch/3/soma/ncob-pol-$1-$2
#/usr/atria/bin/cleartool setview soma-pol_iosd_$1_$2
cd /view/soma-pol_iosd_$1_$2/vob/ios/sys
#cd /vob/ios/sys
echo "  "
echo "Starting the builds for " $1_super
date; /auto/binos-tools/bin/mcp_ios_precommit $1_super >&! /scratch/3/soma/ncob-pol-$1-$2/$1.log1 ;
date; /auto/binos-tools/bin/mcp_ios_precommit $1_super >&! /scratch/3/soma/ncob-pol-$1-$2/$1.log2 ;
date; /auto/binos-tools/bin/mcp_ios_precommit $1_super >&! /scratch/3/soma/ncob-pol-$1-$2/$1.log3 ;
date; /auto/binos-tools/bin/mcp_ios_precommit $1_super >&! /scratch/3/soma/ncob-pol-$1-$2/$1.log4 ;
date;


