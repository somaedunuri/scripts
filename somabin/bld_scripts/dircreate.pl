#!/usr/local/bin/perl -- -*-Perl-*-

#---------------------------------------------------------------------
# Script to create a directory in /nfs/sj-dropspace/isp/120 directory
#
# February, 1999
#
# Copyright (c) 1999 by cisco Systems, Inc.
# All rights reserved.
#---------------------------------------------------------------------

$prog = ($0 =~ m,/([^/]+)$,) ? $1 : $0;
$usage = "Usage: $prog <dir_name>\n";

# Examples:
# dircreate.pl RRR

require 'getopt.pl';
&Getopt("");

die $usage unless $#ARGV >= 0;
($dir_name) = @ARGV;

$archive = "/nfs/sj-dropspace/ISP/120";

#
# Create release sub directiries in bin, sym and sun directories
#
@copy_dirs = ("bin", "sym", "sun");
foreach $dir (@copy_dirs) {
    mkdir("$archive/$dir/$dir_name", 0777);
}
print ("$dir_name directories created successfully \n");

# end of the program

