for i in `cat $1`
do
	echo $i
#	fixcr  -i $i -n Static-Analysis -f sa.input
	fixcr  -i $i -n Unit-Test -f ut.input
	fixcr  -i $i -n Code-Review -f cr.input
#	fixcr  -i $i -n Release-note -f rne.input
done
