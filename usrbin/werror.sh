find . -print | grep Jamfile >tt1
for i in `cat tt1`
do
	echo $i
	cat $i | sed s/\-Werror/-Wno-error/ >$i.tmp
	mv $i.tmp $i
done
