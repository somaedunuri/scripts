#!/bin/sh
CWD=`pwd`
found=0
while [ "$CWD" != "/" ]; do
  if [ -d ${CWD}/.ACMEROOT ]; then
    found=1
    break
  else
    CWD=`dirname $CWD`
  fi
done
if [ $found -eq 1 ]; then
  WSROOT=$CWD
else
  printf "\nNot in workspace. Program Exited.\n"
fi
cd $WSROOT
diff=`ls -1tr wsdiff* 2>/dev/null | tail -1`
if [ X"$diff" = X ]; then
	acme diff -workspace -opts "\-cBb" > wsdiff-`date +%m-%d:%H:%M`.log 
    diff=`ls -1tr wsdiff* 2>&1 | tail -1`
fi
if [ -n "$1" -a "$1" = "-c" ]; then
    grep '^Component: ' $diff | awk '{print $2}' | tee comp.list.$$
    shift
    if [ -n "$1" -a "$1" = "-p" ]; then
        find $(cat comp.list.$$) -type f -name ".#*private*"
    fi
else
    rm -f cs-files.list
    grep '^Index: ' $diff | awk '{print $NF}' | while read line
    do
        if [ -e $line -a ! -d $line ]; then
            echo $line >> cs-files.list
        fi
    done
fi
