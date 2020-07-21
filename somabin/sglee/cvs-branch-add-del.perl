#!/usr/local/bin/perl -- -*-Perl-*-
# $Id: cvs-twig-add-rm.perl,v 1.8 1996/03/01 00:16:45 mdb Exp $
# $Source: /srccvs/cvs/local/cvs-utils/cvs-twig-add-rm.perl,v $
#------------------------------------------------------------------
# help sycnronize changes made on a parent branch to this branch
#
# February 1994, Mark D. Baushke
#
# Copyright (c) 1994 by cisco Systems, Inc.
# All rights reserved.
# 
# Longer description here.
#------------------------------------------------------------------
# $Log: cvs-twig-add-rm.perl,v $
# Revision 1.8  1996/03/01  00:16:45  mdb
# being in the attic does not matter if we found the parent tag
#
# Revision 1.7  1995/05/11  19:00:49  mdb
# do not remove files unless they are in the Attic
#
# Revision 1.6  1994/05/25  01:39:48  mdb
# fix problem with Attic in new filenames
#
# Revision 1.5  1994/05/20  00:06:44  wfried
# bugfix
#
# Revision 1.4  1994/03/30  10:10:57  mdb
# fix endcase bug and add more tag checking
#
# Revision 1.3  1994/03/29  08:04:40  mdb
# fix typos in dirname for removed files
#
# Revision 1.2  1994/02/26  04:45:06  mdb
# fix typos
#
# Revision 1.1  1994/02/17  07:40:17  mdb
# initial version
#
#------------------------------------------------------------------
# $EndLog$

# The problem:
#		A branch which is taken from a system with lots
#		of structural changes occuring is difficult to
#		track.

# Possible solution:
#		Find all files in the parent branch which are not
#		part of the target branch (new files) and 
#		consider adding them to the fold...
#
#		We also need to worry about 'deleted' files that are
#		no longer part of the parent branch.

select(STDERR); $| = 1;		# no buffering of stderr

if (! -d 'CVS') {
    print STDERR "You are not in a checked out cvs tree\n";
    exit 1;
}

open(CVSREP, 'CVS/Repository') || die("Unable to read CVS/Repository: $!");
$repository = <CVSREP>;
chop($repository);
close(CVSREP);

if (! -r 'CVS/Tag') {
    print STDERR "You do not appear to be in a branch of $repository\n";
    exit 1;
}

open(CVSTAG, 'CVS/Tag') || die("Unable to read CVS/Tag: $!");
$branch = <CVSTAG>;
chop($branch);
$branch =~ s/^T//;
close(CVSTAG);
    
if (@ARGV < 1) {
        die("Usage : $0 <New Tag Name> \n");
}

$parent = $ARGV[0];

# process options
while ($ARGV[0] =~ /^-/) {
    if ($ARGV[0] eq '-p') {
	shift;
	$parent = shift;
    }
    elsif ( $ARGV[0] eq '-v' ) {
	$verbose = 1;
	shift;
    }
    elsif (( $ARGV[0] eq '-n' ) || ( $ARGV[0] eq '-t' )) {
        $testing = 1;
	shift;
    }
    else {
	print STDERR "usage: $0 [-n] [-v] [-p parent-tagname]\n";
	exit 1;
    }
}

#while ($parent eq '') {
#    print STDERR "Enter name of new parent tagname for $branch\n";
#    print STDERR "(base2 of previous cmd cvs update -kkv -jbase1 -jbase2)\n";
#    chop($parent = <STDIN>);
#    s/^\s+//g;			# strip leading whitespace
#    s/\s+$//g;			# strip trailing whitespace
#    if ($parent eq '') {
#	print STDERR "Enter MAIN as tagname for the main trunk\n";
#    }
#}

print STDERR "Searching of \'$repository\'\n";
print STDERR "for Parent \'$parent\' and Branch \'$branch\' tags...\n";

$parentpat = "\t".$parent.':';
$branchpat = "\t".$branch.':';

open(LOGFILE, '>cvs-twig-add-rm.log') ||
    die "Unable to open cvs-twig-add-rm.log: $!";

$found_parent = 0;

require 'find.pl';

sub do_it {
    local($cmd) = @_;

    ($verbose || $testing) && print STDERR "doit: $cmd\n";
    print LOGFILE "($cmd)\n";
    if (! $testing) {
	system $cmd;
	if ($?) {
	    local($val) = $?/256;
	    print LOGFILE "# Error $val\n";
	    print STDERR "$0: $cmd\n" if (! $verbose);
	    print STDERR "$0: Error $val\n";
	}
    }
}

die("Cannot access repository directory ($repository)\n")
    if (! -d $repository);

print STDERR "Starting find\n";
$reality_check = 1;		# check relationship of parent and twig
&find($repository);		# find calls wanted for each name
sub wanted { 
    if ($name =~ /.*,v$/) {
	$result = &check($name);
	push(@removed, $name) if ($result eq 'removed');
	push(@added,   $name) if ($result eq 'added'  );
    }
}

sub check {
    local($rcsfile) = @_;
    local($in_parent,$found) = (0,0);
    local($res) = '';

    open (RCSFILE, $rcsfile) || die("cannot open $rcsfile: $!");
    while(<RCSFILE>) {
	last if (/^symbols/);	# skip forward until symbols
    }
    while(<RCSFILE>) {
	if (/^$parentpat/) {
	    $in_parent = 1;
	    $parentline = $_;
	    last if $found;
	}
	if (/^$branchpat/) {
	    $found = 1;
	    $branchline = $_;
	    last if $in_parent;
	}
	last if (/\;/);
    }
    close(RCSFILE);

    $found_parent += $in_parent;

    if ($found) {
	if (!$in_parent) {
	    # unless in Attic, don't remove yet
	    $in_parent = ($name !~ m,/Attic/,)
	}
	$res = 'removed' if (!$in_parent);
    }
    else {
	$res = 'added' if ($in_parent);
    }

    if ($reality_check && $res ne '') {
	$branchline =~ s/^.*://;
	$branchline =~ s/;$//;

	$parentline =~ s/^.*://;
	$parentline =~ s/;$//;

	$reality_check = 0;
    }

    $res;
}

print STDERR "Done with find.\n";

if ($found_parent == 0) {
    print STDERR "Unable to find $parent in repository:\n\t$repository\n";
    print STDERR "You may have made a typo in the name\n";
    print STDERR "Please check that the parent tag exists\n";
    print STDERR "before re-running this script.\n";
    exit 1;
}

if (scalar(@added)) {
    print STDOUT "The following files in the main branch of the\n";
    print STDOUT "$repository repository do NOT have a $branch tag:\n\n";
    print STDOUT join("\n",@added),"\n\n";

    $open = open(LATER, ">later.sh");
    foreach (@added) {
	s,^$repository/,,;
	$name = $_;
	($basename = $name) =~ s,[^/]*/,,g;
	($dirname = $name) =~ s,$basename$,,;
	$dirname =~ s,/$,,;
	$dirname =~ s,Attic$,,;
	$dirname =~ s,/$,,;
	$dirname = '.' if ($dirname eq '');
	$basename =~ s/,v$//;
	$cmd = "cd $dirname;";
	$cmd.= "cvs update -r$parent $basename";
	&do_it($cmd);
	print LATER "(cd $dirname;cvs tag -b $branch $basename;".
	    "cvs update -r $branch $basename)\n" if ($open);
    }
}

if (scalar(@removed)) {
    print STDOUT "The following files in the $branch branch of the\n";
    print STDOUT "$repository repository should have the branch tag removed:\n\n";
    print STDOUT join("\n",@removed),"\n\n";

    foreach (@removed) {
	s,^$repository/,,;
	$name = $_;
	($basename = $name) =~ s,[^/]*/,,g;
	($dirname = $name) =~ s,$basename$,,;
	$dirname =~ s,/$,,;
	$dirname =~ s,Attic$,,;
	$dirname =~ s,/$,,;
	$dirname = '.' if ($dirname eq '');
	$basename =~ s/,v$//;
	$cmd = "cd $dirname;";
	$cmd.= "cvs diff -c $basename > $basename.diff;";
	$cmd.= "mv $basename $basename.bak;";
	$cmd.= "cvs rm $basename;";
	&do_it($cmd);
    }
}

close(LOGFILE);

exit 0;
