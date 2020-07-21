for i in `cat /users/soma/bin/xr_inputs_act`
do
	echo $i
	grep ^@ $1 | grep $i | awk '{print $3}' | wc
done
