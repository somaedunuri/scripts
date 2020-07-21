# This scripts is executed every day at 5:00 AM (by cron). It generates the 
# list of versions which were used for the ELC build and compares with previous
# day's build.

yymmdd=`date +%y%m%d`
PATH=/usr/ucb:/bin:/users/soma/bin:/usr/bin:/usr/local:/usr/local/bin:/usr/new:/etc:/usr/bin/X11

tday=`date +%y%m%d`      
yday=`expr $tday - 1`
cdir=/users/soma/tags

subject="Diffs in file Versions between Yesterday and Today's Builds"
persons="soma sglee"

export yymmdd PATH tday yday cdir subject persons

$cdir/gettags >$cdir/tags.${yymmdd}

diff $cdir/tags.$yday $cdir/tags.$tday >$cdir/diff.$yday.$tday

if [ -s $cdir/diff.$tday.$yday ] 
then
	mail -s "$subject" $persons <$cdir/diff.$yday.$tday
fi

