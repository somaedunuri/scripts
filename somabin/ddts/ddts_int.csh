#!/bin/sh
#
# Filename = ddts-int.csh
# 
# Usage: ddts-int.csh <version_number>  <buglist>
#            where 
#		<version_number> is release number (format 11.1(dd.dd)CAdd
#	        <buglist> is a file which contains the list of ddts (one ddts per line)
#
# example : ddts-bugint.csh 11.1\(12.03\)CA04  buglist
# 
#	Note : Open and close braces needs to be preceedbe by \
#
# Description:
#	Bugint will update the DDTs record for the listed bugIds in 
# 	buglist file. The DDTs field,"Integrated-releases", is updated 
# 	with the release number using another script called 'ddtsint'. It 
# 	also double checks to make sure that field (Integrated-releases) 
#       does not have version information the same release before updating
#	field. 
#************************************************************************

##########################################################################
# Check for correct usage
##########################################################################

if [ "$#" != "2" ]; then
    echo "Usage: $0 <version_number> <buglist>"
    echo "  "
    echo "Example: $0 11.1\(12\)CA buglist"
    exit
else 
    version_number=$1
    buglist=$2

fi

##########################################################################
# Check to see if the parameter entered is a valid file 
# If so, assign the filename to "datafile", else, display error msg.
# Put the datafile information into your environment
##########################################################################

if [  ! -f "$buglist" ] ; then
        echo "invalid argument, ddts file \"$buglist\" does not exist"
        exit 1
fi

##########################################################################
# Function (check_it) 
#  	It checks the "Integrated-releases" fleld for version information
# 	before attempting to update.  Create $bugint file to update this
# 	field only if it doesn't have version information already. 
##########################################################################

check_it()
{
  echo "Checking BugIds in DDTS. Please wait."
	
  bugtmp=/tmp/bugtmp.$$
  bugint=/tmp/bugint.$$
  intver=`echo $version_number`

  touch $bugtmp
  for bugid in `cat $buglist`
  do
    echo $bugid | bugval Identifier Integrated-releases >>  $bugtmp
  done 
  grep -v "$intver" $bugtmp | awk '{print $1}' >  $bugint
  sort -u $bugint -o $bugint
  echo "Done checking."
}



#####
#### MAIN
###
#
##########################################################################
# Use ddtsint against buglist.  Catch the results in $sysver-$sysrev.ddts
# in the $logdir
##########################################################################

check_it

if [ -s "$bugint" ] ; then
   /nfs/ddtsbin/ddtsint.pl $intver $bugint 
else
    echo "No Bugid in $bugint to intergrate."
fi

# rm $$bugint $bugtmp
