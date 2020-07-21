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

while (($line=<infile>) ne "") {

	if ($line =~ /^[0-9][0-9]*[0-9,acd]*[0-9]*[0-9]/) {
		print extfile ($line);
		next;
	}
	if ($line =~ /^Index:/) {
		print clnfile ($line);
		next;
	}

	if ($line =~ /^===================================================================/) {
		print clnfile ($line);
		next;
	}

	if ($line =~ /^RCS file:/) {
        	print extfile ($line);
		next;
	}

	if ($line =~ /^retrieving revision /) {
        	print extfile ($line);
		next;
	}

	if ($line =~ /^diff -r/) {
        	print extfile ($line);
		next;
	}

	if (($line =~ /[#\*] \$Id: /) || ($line =~ /-* \$Id: /)) {
        	print extfile ($line);
		next;
	}

        if ($line =~ /Copyright/) {
                print extfile ($line);
                next;
        }

        if ($line =~ /^---/) {
                print extfile ($line);
                next;
        }

        if ($line =~ /Revision [0-3].[0-9]*/) {
                print extfile ($line);
                next;
        }

        if ($line =~ /CSCdi[0-9]*:/) {
                print extfile ($line);
                next;
        }

        if ($line =~ /[#\*] Branch:/) {
                print extfile ($line);
                next;
        }

        if ($line =~ /[#\*] Sync /) {
                print extfile ($line);
                next;
        }

        if ($line =~ /[#\*] Mueslix_baseline_/) {
                print extfile ($line);
                next;
        }

        if ($line =~ /[#\*] Pull /) {
                print extfile ($line);
                next;
        }

        if (($line =~ /^[<>] *#\n/) || ($line =~ /^[<>] *\*\n/)) {
                print extfile ($line);
                next;
        }

#        if ($line =~ /^[<>] *\* /) {
#                print extfile ($line);
#                next;
#        }

	print clnfile ($line);
}

