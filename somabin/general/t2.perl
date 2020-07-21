#!/usr/local/bin/perl

# This program accepts the cc merge  as input file and generates a 
# clean version (deletes unwanted lines) of the same file 

if (@ARGV < 1) {
	die("Usage : $0 <input filename> \n");
}

$inputfile  = "$ARGV[0]";

unless (open(infile, "$inputfile")) {
	die ("Can not open input file $inputfile \n");
}

$line=<infile>;

while (1) {

	$line1=$line;

	if (($line=<infile>) eq "") {
		exit 0;
	}
	if ($line !~ /Copyright/ ) {
		$line1=$line;
		$line=<infile>;
	}

	if (($line=<infile>) eq "") {
		exit 0;
	}
	if ($line =~ /Copyright/ ) {
		print $line1;
		$line=<infile>;
		next;
	}
}
