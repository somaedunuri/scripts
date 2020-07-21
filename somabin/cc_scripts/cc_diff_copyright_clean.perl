#!/usr/local/bin/perl

# This program accepts the cvs diffs as input file and generates a 
# clean version (deletes unwanted lines) of the same file 

if (@ARGV < 1) {
	die("Usage : $0 <input filename> \n");
}

$inputfile  = $ARGV[0];
$cleanfile  = $ARGV[0].clean;
$extrafile  = $ARGV[0].extra;

unless (open(infile, "$inputfile")) {
	die ("Can not open input file $inputfile \n");
}

unless (open(clnfile, ">$cleanfile")) {
	die ("Can not open output file $cleanfile \n");
}

unless (open(extfile, ">$extrafile")) {
	die ("Can not open output file $extrafile \n");
}

if (($line = <infile>) eq ""){
	last;
}
if ($line =~ /^Index:/) {
	print clnfile ($line);
}
while (1) {
	if (($line = <infile>) eq ""){
       	     last;
        }
	print clnfile ($line);
		
	if (($line = <infile>) eq ""){
       	     last;
        }
	if (($line =~ /^\*\*\* 3,9 \*\*\*\*/)  ||
	    ($line =~ /^\*\*\* 4,10 \*\*\*\*/) ||
	    ($line =~ /^\*\*\* 5,11 \*\*\*\*/) ||
	    ($line =~ /^\*\*\* 6,12 \*\*\*\*/) ||
	    ($line =~ /^\*\*\* 7,13 \*\*\*\*/)) {
	    print extfile ($line);
		
	     $number = 0;
	     while ($number < 16 ) {
		if (($line = <infile>) eq ""){
	             last;
       		}
		print extfile ($line);
		$number++;
	     }
	}
	else {
	       print clnfile ($line);
	}	

	&skipuptoindex;
	next;
}

sub skipuptoindex {

$count = 0;
while ($count < 1 ) {

	if (($line = <infile>) eq ""){
       		last;
	}

	if ($line =~ /^Index:/){
       		$count++;
       	}
	print clnfile ($line);
  }
}

