#!/bin/sh
#
# Filename = bugint
# 
# Usage: bugint <datafile>
#            where <datafile> is a file located in
#                /release/build/cvstools/data/<datafile> containing relevant
#                release build information.
# 
# Description:
#	Bugint will update the DDTs record for the listed bugIds in 
# 	$logdir/$buglist. The DDTs field,"Integrated-releases", is update 
# 	with the release number using another script called 'ddtsint'.  It 
# 	also double checks to make sure that field (Integrated-releases) does 
# 	not have version information the same release before updating
#	field.  A log file is created in $logdir/$sysver-$sysrev.ddts
#************************************************************************

##########################################################################
# Check for correct usage
##########################################################################

if [ "$#" != "1" ]; then
    echo "Usage: $0 <build.datafile>"
    echo "Example: $0 103"
    exit
else
    datafile=$1
fi

##########################################################################
# Check to see if the parameter entered is a valid file in
# /release/build/cvstools/data.
# If so, assign the filename to "datafile", else, display error msg.
# Put the datafile information into your environment
##########################################################################

if [ -f "/release/build/cvstools/data/$datafile" ] ; then
        datafile=/release/build/cvstools/data/$datafile
elif [  ! -f "$datafile" ] ; then
        echo "invalid argument, data file \"$datafile\" does not exist"
        exit 1
fi

##########################################################################
# Initialize the NGRP variables
##########################################################################

orgsysrev=
bu_name=
bu_ver=
train_header=
sp_build=
sp_build_base=

. $datafile
. $scriptsdir/lib/checks.sh

# Make sure bu_ver is NULL for renumber
if [ "$buildtype" = "renumber" ]; then
   if [ ! -z "$bu_ver" ]; then
       echo "ERROR: bu_ver should be blank for renumber."
       exit 1
   fi
fi

##########################################################################
# Enter the version of the run, machine name, script name and process number
# of the shell, into the file "script.run" in your log directory
##########################################################################
StartLog


##########################################################################
# Function (check_it) 
#  	It checks the "Integrated-releases" fleld for version information
# 	before attempting to update.  Create $bugint file to update this
# 	field only if it doesn't have version information already. 
##########################################################################

check_it()
{
  echo "Checking BugIds in DDTS. Please wait."
  bugtmp=$logdir/BugIds.chk.$$
  bugint=$logdir/$sysver-$sysrev.bugint.$$
  if [ -z "$bu_name" ] ; then
        #this is a non-NGRP build
        intver=`echo "$dotsysver($sysrev) " | /usr/local/ddts/bin/ngrpversion`
  else
        #this is a NGRP build
        if [ -z "$bu_ver" ]; then
            intver=`echo "$dotsysver($orgsysrev)$bu_name " | /usr/local/ddts/bin/ngrpversion`
        else
            intver=`echo "$dotsysver($orgsysrev)$bu_name($bu_ver) " | /usr/local/ddts/bin/ngrpversion`
        fi
  fi
  

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
   /nfs/ddtsbin/ddtsint.pl $intver $bugint | tee -a $logdir/$sysver-$sysrev.ddts
else
    echo "No Bugid in $bugint to intergrate." | tee -a $logdir/$sysver-$sysrev.ddts
fi

##########################################################################
# Echo the status information in $logdir/script.run:
# $dotsysver($sysrev) `hostname` $0 `date` Done
##########################################################################
EndLog 0

