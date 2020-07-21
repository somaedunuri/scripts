#!/bin/bash

interval=600
iteration=144
i=0
sum=0.0
cp /ws/alsheu-sjc/signtest/* .

while [ $i -lt $iteration ]
do
date;
time=$( { /usr/bin/time -f "%e" /bin/sh -c "/router/bin//IOSXR-sign.sh  -i initrd.img -c NCS1002_dev_cert.cer -s signature.initrd.img" > /dev/null; } 2>&1 )
sum=$(echo "$sum + $time"|bc)
echo "Running Total = $sum, Time = $time"
date;
i=$[$i+1]
sleep $interval
done
echo "Final Total = $sum"


