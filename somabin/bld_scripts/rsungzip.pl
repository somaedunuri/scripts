#!/usr/local/bin/perl -- -*-Perl-*-

#---------------------------------------------------------------------
# Script to gzip Sun files in 12.0S Release
#
# Januaryr, 1999
#
# Copyright (c) 1998 by cisco Systems, Inc.
# All rights reserved.
#---------------------------------------------------------------------

$prog = ($0 =~ m,/([^/]+)$,) ? $1 : $0;
$usage = "Usage: $prog <build_date> <image_name>\n";

# Examples:
# isparchive.pl 981224 120-2.3.S.1227

require 'getopt.pl';
&Getopt("");

die $usage unless $#ARGV >= 1;
($build_date, $image_name) = @ARGV;

($USER,$pw,$uid,$gid,$quota,$comment,$gcos,$HOME,$shell) = getpwuid($>);

$bldbin = "../images/$build_date";
$bldsym = "../sym/$build_date";
$bldsun = "../sun/$build_date";

@image_list = ( "rsp-pv-mz", "svip-dw-m", "c7200-p-mz",
                "gsr-p-mz",  "glc1-lc-m", "c4500-p-mz",
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
    $sun="$bldsun/$image_list.sun.$image_name";
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
print ("Zipping the Sun files in build directory \n");
foreach $image_list (@image_list) {
	$inpfile="$bldsun/$image_list.sun.$image_name";
	&tsys("gzip $inpfile");
}
print ("\nSun files Zipped \n");

#
# subroutines
#

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

