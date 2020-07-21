#!/bin/bash
EGREP_PAT1="file list|filetype from file|readelf|objdump|isoinfo"
EGREP_PAT2="header|content|.*-content$"

if [ -f $1 -a -s $1 ]; then
    grep '├── ' $1 | egrep -v -e "(($EGREP_PAT1)|$EGREP_PAT2)" | \
    sed -e 's/│/=/g' -e 's/├/+/' -e 's/──/:/' > $1.summary
fi

declare -A types
if [ -f $1.summary -a -s $1.summary ]; then
    awk -F '/' '{print $NF}' $1.summary > temp.$$
    file_cnt=$(wc -l temp.$$ |  cut -d ' ' -f1)
    while read name
    do
        if [[ $name == *.so.[0-9]* ]]; then
            ext=so
        else
            ext=$(echo $name | sed -e 's/.*\.\(.*\)/\1/')
        fi
        if [ "$ext" = "$name" ];then
            ext=noext
        fi
        ((types[$ext]++))
    done < temp.$$ 
    for i in "${!types[@]}"
    do
        echo "Count of $i = ${types[$i]}"
    done 
    echo Number of files differ: $file_cnt
fi
