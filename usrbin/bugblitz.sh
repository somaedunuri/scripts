QDDTS=/vws/aak/qddts
export QDDTS 
echo "Weekly Incoming, Fix Rate and Outstanding"
echo "rajevara minus skhaunte Sev1-Sev2"
query.pl Project:CSC.ena and org:rajevara minus org:skhaunte and Version:5.0.0 and Severity:1,2 | table.pl $1 $2 -weekly -closed MRVCJUD inc closed out 
echo "rajevara minus skhaunte Sev1-Sev3"
query.pl Project:CSC.ena and org:rajevara minus org:skhaunte and Version:5.0.0 and Severity:1,2,3 | table.pl $1 $2 -weekly -closed MRVCJUD inc closed out 
for i  in `cat /users/soma/tt1`
do
echo "$i Sev1-Sev2"
query.pl Project:CSC.ena and org:$i and Version:5.0.0 and Severity:1,2 | table.pl $1 $2 -weekly -closed MRVCJUD inc closed out 
echo "$i Sev1-Sev3"
query.pl Project:CSC.ena and org:$i and Version:5.0.0 and Severity:1,2,3 | table.pl $1 $2 -weekly -closed MRVCJUD inc closed out 
done
