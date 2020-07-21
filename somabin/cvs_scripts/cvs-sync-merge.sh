# This script will do three parts : checkout, merge/sync and trial build
# Part one  : check out the ELC_branch tree
# Part two  : merge the diffs between two tags, run cvs-branch-add-del.perl
#             and cvs-fix-merge.perl scripts on boot, sys, micro directories
# Part three: try do dependancy and make production for core platforms

#if ($# < 2) then  
#        echo "Usage : $0 <starting tag> <ending tag> \n"
#	exit 1
#endif

set starting_tag 	= $1
set ending_tag   	= $2

echo "Start Tag : 	" $starting_tag >>sync.log
echo "End   Tag : 	" $ending_tag   >>sync.log


# Checkout the latest ELC_branch tree

echo "Checkout is in Progress......"  	>>sync.log
echo " "  				>>sync.log

cvs co -rELC_branch newworld

echo "Checkout Completed       "  	>>sync.log
echo " "  				>>sync.log


# Merge/Sync the sys, boot and micro directories from 11.1

echo "Merge is in Progress....."	>>sync.log
echo " "				>>sync.log

foreach dir  (boot micro subsys sys)
	echo " 	Merging of" $dir "has started" >>sync.log
        cd $dir
        cvs update -kkv -j$starting_tag -j$ending_tag 
        cvs-branch-add-del.perl $ending_tag
	cvs-fix-merge.perl
	echo " 	Merging of" $dir "completed "	>>sync.log
        cd ..
end

echo "Merging has Completed " 			>>sync.log
echo "	"					>>sync.log

# Do the make depend and trial build for all Core Images 

echo "Make depend is in Progress......"		>>sync.log
echo " "					>>sync.log

cd sys
make depend MAKEFLAG_J=-j12

echo "Make depend Done " 			>>sync.log
echo "	"					>>sync.log

echo "Build is in Progress......"         	>>sync.log
echo " "                                        >>sync.log

foreach dir  (obj-4k-c7100 obj-4k-rsp obj-68-c7000)
        cd $dir
	make production MAKEFLAG_J=-j12
        cd ..
end

echo "Build Completed Successfully 	"       >>sync.log
echo " "                                        >>sync.log


