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

while (1) {
	if (($line = <infile>) eq ""){
             last;
        }
	if ($line =~ /^COMMAND:/) {
                print extfile ($line);
	}
	else {
		if ($line !~ /^===========================================================================\n/) {
			print clnfile ($line);
			next
		}
		else {
			print extfile ($line);
			if (($line = <infile>) eq ""){
				last;
			}
			print extfile ($line);
                }
                next;
	}
	if (($line = <infile>) eq ""){
             last;
        }
	if ($line =~ /^Index:/) {
	        print clnfile ($line);
	        print extfile ($line);
		if (($line = <infile>) eq ""){
             		last;
        	}
		print clnfile ($line);
		print extfile ($line);

	        &skipuptostars;
		next;
	}
	else {
		if ($line !~ /^===========================================================================\n/) {
			print clnfile ($line);
		}	
		else {
			print extfile ($line);
			if (($line = <infile>) eq ""){
                        	last;
               		 }
			print extfile ($line);
		}
		next;
	}
}

sub skipuptostars {

#       Skip the lines till it encounters "***************"

        $count = 0;
	$value = 0;
        while ($count < 1 ) {

		$skipback = tell(infile);

		if (($line = <infile>) eq ""){
       			last;
		}

		if ($line =~ /^\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\n/){
			print extfile ($line);
       	 		$count++;
       	 	}
		elsif ($line =~ /^\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* /){
			print clnfile ($line);
                        $count++;
                }
		elsif ($line =~ /^COMMAND:/) {
			seek (infile, $skipback, 0);
			$count++;
			return ("1");
		}
		elsif  (($line =~ /^\*\*\*/) || ($line =~ /^\-\-\-/)) {
				print extfile ($line);
		}	
		else {
			print clnfile ($line);
		}
	}
	$retval = $value;
}

