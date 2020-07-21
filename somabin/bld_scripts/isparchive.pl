#!/usr/local/bin/perl -- -*-Perl-*-

#---------------------------------------------------------------------
# Script to archive images, suns, and symbols 12.0S Release
#
# December, 1998
#
# Copyright (c) 1998 by cisco Systems, Inc.
# All rights reserved.
#---------------------------------------------------------------------

$prog = ($0 =~ m,/([^/]+)$,) ? $1 : $0;
$usage = "Usage: $prog <build_date> <image_name>\n";

# Examples:
# isparchive.pl 981224 120-2.3.S.1227

				# options
$opt_d = 0;			# -d : debug; donot do anything
				#      just talk about it
$opt_s = 0;			# -s : silent; donot show details
$opt_t = 0;			# -t : test; execute copies etc but
				#      remove files when done
require 'getopt.pl';
&Getopt("");

die $usage unless $#ARGV >= 1;
($build_date, $image_name) = @ARGV;

($USER,$pw,$uid,$gid,$quota,$comment,$gcos,$HOME,$shell) = getpwuid($>);

$archive = "/nfs/sj-dropspace/ISP/120";

$bldbin = "../images/$build_date";
$bldsym = "../sym/$build_date";
$bldsun = "../sun/$build_date";

$arcbin = "$archive/bin/$image_name";
$arcsym = "$archive/sym/$image_name";
$arcsun = "$archive/sun/$image_name";

@image_list = ( "rsp-pv-mz", "rsp-jsv-mz", "rsp-boot-mz", "svip-dw-m",
	       	"c7200-p-mz", "c7200-js-mz", "c7200-boot-mz",
	       	"gsr-p-mz", "gsr-boot-mz", "glc1-lc-m",
	       	"c4500-p-mz", "c4500-js-mz",
	       	"c3640-p-mz", "c3620-p-mz",
		"c2600-p-mz", "c2500-p-l");
#
# Verify the existance of images/symbols/sun files for all platforms
#

# verification of Images existance
foreach $image_list (@image_list) {
    $image="$bldbin/$image_list.$image_name";
    unless (-r $image) {
	print ("ERROR: Missing Image file $image \n");
	die;
    }
}
print ("Image List Acccess Test done\n");
# verification of Symbols
foreach $image_list (@image_list) {
    $symbol="$bldsym/$image_list.symbols.$image_name";
    unless (-r $symbol) {
	print ("ERROR: Missing Symbol file $symbol \n");
	die;
    }
}
print ("Symbol Files Access Test done\n");
# verification of Sun Files
foreach $image_list (@image_list) {
    $sun="$bldsun/$image_list.sun.$image_name.gz";
    unless (-r $sun) {
	print ("ERROR: Missing Sun file $sun \n");
	die;
    }
}
print ("Sun Files Access Test done\n");

# verification of README, bin.sums, sym.sums, sun.sums files existance
$readme="$bldbin/README.$image_name";
unless (-r $readme) {
   print ("ERROR: Missing README file $readme \n");
   die;
}
$binsums="$bldbin/bin.sums.$image_name";
unless (-r $binsums) {
   print ("ERROR: Missing bin.sums file $binsums \n");
   die;
}
$symsums="$bldsym/sym.sums.$image_name";
unless (-r $symsums) {
   print ("ERROR: Missing sym.sums file $symsums \n");
   die;
}
$sunsums="$bldsun/sun.sums.$image_name";
unless (-r $sunsums) {
   print ("ERROR: Missing sun.sums file $sunsums \n");
   die;
}
print ("README, bin.sums, sym.sums, sun.sums files existance confirmed \n");

#
# gzip the sun files before archiving
#
#print ("Zipping the Sun files in build directory \n");
#foreach $image_list (@image_list) {
#	$inpfile="$bldsun/$image_list.sun.$image_name";
#	$arcfile="$arcsun/$image_list.sun.$image_name";
#	&tsys("gzip $inpfile");
#}
#print ("\nSun files Zipped \n");

#
# Create release sub directiries in bin, sym and sun directories
#
@copy_dirs = ("bin", "sym", "sun");
foreach $dir (@copy_dirs) {
    mkdir("$archive/$dir/$image_name", 0777);
}
print ("$image_name directories created successfully \n");

umask 0222;

#
# Copy the images, symbols and sun files to /nfs/sj-dropspace/ISP/120 
#

# Copy images to /nfs/sj-dropspace/ISP/120/bin/<release> directory
print ("Archiving Images to $arcbin directory \n");
foreach $image_list (@image_list) {
	$inpfile="$bldbin/$image_list.$image_name";
	$arcfile="$arcbin/$image_list.$image_name";
    	&tcopy($inpfile, $arcfile);
    	print (".");
}
print ("\nImages Archived\n");

# Copy symbols to /nfs/sj-dropspace/ISP/120/sym/<release> directory
print ("Archiving Symbols to $arcsym directory \n");
foreach $image_list (@image_list) {
	$inpfile="$bldsym/$image_list.symbols.$image_name";
	$arcfile="$arcsym/$image_list.symbols.$image_name";
    	&tcopy($inpfile, $arcfile);
    	print (".");
}
print ("\nSymbols Archived\n");

# Copy sun files to /nfs/sj-dropspace/ISP/120/sun/<release> directory
print ("Archiving Sun files to $arcsun directory \n");
foreach $image_list (@image_list) {
	$inpfile="$bldsun/$image_list.sun.$image_name.gz";
	$arcfile="$arcsun/$image_list.sun.$image_name.gz";
    	&tcopy($inpfile, $arcfile);
    	print (".");
}
print ("\nSun files Archived\n");

# Copy README to /nfs/sj-dropspace/ISP/120/bin/<release> directory
$inpfile="$bldbin/README.$image_name";
$arcfile="$arcbin/README.$image_name";
&tcopy($inpfile, $arcfile);
 
# Copy bin.sums to /nfs/sj-dropspace/ISP/120/bin/<release> directory
$inpfile="$bldbin/bin.sums.$image_name";
$arcfile="$arcbin/bin.sums.$image_name";
&tcopy($inpfile, $arcfile);
 
# Copy sym.sums to /nfs/sj-dropspace/ISP/120/sym/<release> directory
$inpfile="$bldsym/sym.sums.$image_name";
$arcfile="$arcsym/sym.sums.$image_name";
&tcopy($inpfile, $arcfile);
 
# Copy sun.sums to /nfs/sj-dropspace/ISP/120/sun/<release> directory
$inpfile="$bldsun/sun.sums.$image_name";
$arcfile="$arcsun/sun.sums.$image_name";
&tcopy($inpfile, $arcfile);

print ("\nREADME, bin.sums, sym.sums, sun.sums files Archived \n");

#
# subroutines
#

sub tcopy {			# conditional copy
    local($src, $dst) = @_;
    local($buf,$len,$offset,$written);
    
    if ($opt_d) {
	print "cp $src $dst\n";
    } else {
	unlink($dst);
	open (SRC, "<$src") || die "FATAL: can\'t open $src:\n\t$!\n";
	open (DST, ">$dst") || die "FATAL: can\'t open $dst:\n\t$!\n";
	while ($len = sysread(SRC, $buf, 16384)) {
	    if (!defined $len) {
		next if $! =~ /Interrupted/;
		die "FATAL: read error of $src:\n\t$!\n";
	    }
	    $offset = 0;
	    while ($len) {
		$written = syswrite(DST, $buf, $len, $offset);
		die "FATAL: write error for $dst:\n\t$!\n"
		    unless defined $written;
		$len -= $written;
		$offset +=written;
	    }
	}
	close SRC;
	close DST;
	if ($opt_t) {
	    unlink($dst) || die "FATAL: test run can\'t unlink $dst:\n\t$!\n";
	}
    }
    $dst;
}

sub progress {			# show progress with a DOT
    print ".";
}

sub tsys {			# conditional execution of system
    local($stat) = 0;

    if ($opt_d) {
	print @_, "\n";
    } else {
	$stat = system(@_) >> 8;
	warn "ERROR [$stat] with: ", @_, "!\n" if $stat;
    }
    $stat;
}

