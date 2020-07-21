#!/usr/local/bin/perl

# This program accepts the cc merge  as input file and generates a 
# clean version (deletes unwanted lines) of the same file 

if (@ARGV < 1) {
	die("Usage : $0 <input filename> \n");
}

$inputfile  = "$ARGV[0].orig";
$cleanfile  = $ARGV[0];
$extrafile  = 'extra-report';
$confile    = 'cc-merge-report';

@proglist = ("cp $ARGV[0] $ARGV[0].orig");
system (@proglist);

#@proglist = ("cp -r $ARGV[0] /cscpv/mergesave/$ARGV[0]");
#system (@proglist);

unless (open(infile, "$inputfile")) {
	die ("Can not open input file $inputfile \n");
}

unless (open(clnfile, ">$cleanfile")) {
	die ("Can not open output file $cleanfile \n");
}

unless (open(extfile, ">>$extrafile")) {
	die ("Can not open output file $extrafile \n");
}

unless (open(confile, ">>$confile")) {
	die ("Can not open output file $confile \n");
}

# Looks for Source File Header and deletes the input

while (1) {

	while (($line=<infile>) !~ /^<<<<<<</) {
		if ($line eq "") {
			&cleanup;
		}
                print clnfile ($line);
                next;
        }
	$line1=$line;

	if (($line=<infile>) eq "") {
		print extfile ($line1);
		&cleanup;
	}

# Check for Source Header and deletes the input

	if (($line =~ /Id:/ ) || ($line =~ /Source:/)) {
		&srcheadp;
	}
	else {
		&saveup;
	}

# Save the input till "<<<<<<" string is encountered

	while (($line=<infile>) !~ /^<<<<<<</) {
		if ($line eq "") {
			&cleanup;
		}
		print clnfile ($line);
		next;
	}
	$line1=$line;

	if (($line=<infile>) eq "") {
		print extfile ($line1);
		&cleanup;
	}

# Check for Copyright meesage change

	if ($line =~ /Copyright/) {
		&cprightp;
	}

# Looking for RCS Header and delete the extra stuff


	if ($line =~ /Revision/)  {
		&rcsheadp;
	}
	else {
		&saveup;
	}

# Save the input till the end of file

	while (($line=<infile>) ne "") {
		if ($line eq "") {
			&cleanup;
		}
		if ($line =~ /^<<<<<<</) {
			print confile ("Need to fix manually $cleanfile \n");
		}
		print clnfile ($line);
		next;
	}
}

# Subroutine to cleanup Source Header message changes

sub srcheadp{

	print extfile ($line1);
	print clnfile ($line);

        while (($line=<infile>) !~ /^=======/) {
                if ($line eq "") {
                        &cleanup;
                }
                print clnfile ($line);
                next;
        }
        print extfile ($line);
        while (($line=<infile>) !~ /^>>>>>>>/) {
                if ($line eq "") {
                        &cleanup;
                }
                print extfile ($line);
                next;
        }
        print extfile ($line);
}

# Subroutine to cleanup RCS Header message changes

sub rcsheadp {

	print extfile ($line1);
        print clnfile ($line);

        while (($line=<infile>) !~ /^=======/) {
                if ($line eq "") {
                        &cleanup;
                }
                print clnfile ($line);
                next;
        }
        print extfile ($line);
        while (($line=<infile>) !~ /^>>>>>>>/) {
                if ($line eq "") {
                        &cleanup;
                }
                print extfile ($line);
                next;
        }
	print extfile ($line);
	print extfile ("--------------------------------------------------------------\n");
}

# Subroutine to cleanup Copyright message changes

sub cprightp {

	print extfile ($line1);
	print extfile ($line);

        while (($line=<infile>) !~ /^=======/) {
                if ($line eq "") {
                        &cleanup;
                }
                print extfile ($line);
                next;
        }
        print extfile ($line);
        while (($line=<infile>) !~ /^>>>>>>>/) {
                if ($line eq "") {
                        &cleanup;
                }
                print clnfile ($line);
                next;
        }
        print extfile ($line);

        while (($line=<infile>) !~ /^<<<<<<</) {
                if ($line eq "") {
                        &cleanup;
                }
                print clnfile ($line);
                next;
        }

	$line1=$line;

        if (($line=<infile>) eq "") {
        	print extfile ($line1);
                &cleanup;
	}
}

# Subroutine to close all the files and exit gracefully

sub cleanup {
	close(clnfile);
       	close(extfile);
       	close(confile);
       	close(infile);
	@proglist = ("rm $ARGV[0].orig");
	system (@proglist);
	exit 0;
}

# Subroutine to save the remanining lines in the file 

sub saveup {
	print clnfile ($line1);
	print clnfile ($line);
	print extfile ("--------------------------------------------------------------\n");
	print confile ("Need to fix manually $cleanfile \n");
	while (($line=<infile>) ne "") {
                if ($line eq "") {
                        &cleanup;
                }
		print clnfile ($line);
	}
}

