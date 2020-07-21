#!/bin/bash
COMP_LIST=" tor_fretta-2.0.0.0-9.2.1.lib32_n9000.rpm"
#ncs5500-parser-2.0.0.0-r701134I.x86_64.rpm"
#
DIFFOSCOPE=$(type -p diffoscope)
if [ -z "$DIFFOSCOPE" ]; then
  echo "Cannot run diffoscope" && exit 1
fi

GLOB_PATTERN='xxvar/lib/rpm/*'
REGEX_PATTERN='^readelf.*\s--debug-dump=info'
export TMPDIR=`pwd`

if [ -n "$1" ]; then
  if [ "$1" = "-t" ]; then
    logfile="diffout-$$.txt"
    mode="--text"
    shift 1
  elif [ "$1" = "-j" ]; then
    logfile="diffout-$$.json"
    mode="--json"
    shift 1
  else
    logfile=html_dir 
    mode="--html"
  fi
fi

# if [ -z "$1" -o -z "$2" ]; then
#   echo "Needs two file/directory arguments to run diffoscope" && exit 1
# fi  

if [ $# -eq 0 ]; then
    for f in $COMP_LIST
    do
      echo Comparing 1/$f and 2/$f...
      ${DIFFOSCOPE} \
        --exclude-directory-metadata \
        --no-default-limits \
        --max-page-size 4096000 \
        --max-page-size-child 4096000 \
        --max-report-size 0 \
        $mode OUTFILE \
        --exclude ${GLOB_PATTERN} \
        --exclude-command ${REGEX_PATTERN} \
        1/$f 2/$f
        cat OUTFILE >> $logfile
    done
else
  set -x
  ${DIFFOSCOPE} \
    --exclude-directory-metadata \
    --no-default-limits \
    --max-page-size 4096000 \
    --max-page-size-child 4096000 \
    --max-report-size 0 \
    $mode $logfile \
    --exclude ${GLOB_PATTERN} \
    --exclude-command ${REGEX_PATTERN} \
    $*
fi

if [ "$mode" = "--text" ]; then
  if [ -s $logfile ]; then
    /users/soma/bin/diffstat.sh $logfile | tee diffoscope-rpt-$$.txt 
  fi
fi
