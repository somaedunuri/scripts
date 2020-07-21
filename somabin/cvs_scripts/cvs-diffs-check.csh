#! /bin/csh -f

# This program accepts the source name as input and generates the
# cvs diffs from main line and ELC_SYNC and comapre both the diffs
# after cleaning them for comments and extra stuff

#if (@ARGV < 1) {
#	die("Usage : $0 <input filename> \n");
#}

#set inputfile  $[1]

rm -rf 111.elc.diffs

foreach line (`cat jk4`) 

	echo $line

	cvs diff $line >elc.diff
	cvs diff -rV111_10_4 -rV111_11_4 $line >111.diff
	cvs-diffs-clean.perl elc.diff
	cvs-diffs-clean.perl 111.diff


	sed s/^.//g <elc.diffclean >elc.diffclean.sed
	sed s/^.//g <111.diffclean >111.diffclean.sed
	mv elc.diffclean.sed elc.diffclean
	mv 111.diffclean.sed 111.diffclean

	set input1 = `ls -l elc.diffclean | awk '{print $5}'`
	set input2 = `ls -l 111.diffclean | awk '{print $5}'`

	if ($input1 != $input2 ) then
		echo "Index: " $line >>111.elc.diffs
		echo "===================================================================" >>111.elc.diffs
		diff 111.diffclean elc.diffclean >>111.elc.diffs
		echo "	" >>111.elc.diffs
		echo "--------------------------------------------------------------------------------" >>111.elc.diffs
		echo " " >>111.elc.diffs
	endif
end

rm -rf 111.diff 111.diffclean 111.diffextra
rm -rf elc.diff elc.diffclean elc.diffextra
rm -rf 111.diffclean.sed elc.diffclean.sed

