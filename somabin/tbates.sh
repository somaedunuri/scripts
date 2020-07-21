#!/usr/local/bin/perl -- -*-Perl-*- 
#
# Stupid script to grok the ftp logs to see who pulled the ELC_ISP
# images
#
# usage: groklog [ -i ] [ -s search pattern ] [ -f filename ]
#
# OPTIONS
#         -i  Give some image details
#         -s  specify search pattern
#         -f  specify alternate logfile.
#         
# Tony Bates $Id: groklog,v 1.4 1997/07/03 22:07:11 tbates Exp tbates $
#
#
$opt_f = "/var/adm/xferlog";
$opt_h = `/usr/ucb/hostname`;
$PLACE= "ftp-eng";
$TMPF = "/tmp/groklog$$";
$SORT = "/usr/5bin/sort";
$first = 0;
#
$opt_s = "ELC_ISP"; 
#
require "getopts.pl";
&Getopts('is:f:h:');
#
if($opt_h !~ /^$PLACE$/) {
    printf STDERR "groklog: please run this on $PLACE\n";
    exit(-1);
}
$files = `/bin/ls -rt $opt_f`;
$files =~ s/\n/ /g;
open(FD," /users/tbates/bin/cat-or-zcat $files|") || die "grok: $!";
while(<FD>) {
    chop;
    next if $_  !~ /$opt_s/;
    ($day,$mon,$dt,$time,$yr,$crap1,$host,$crap2,
     $file,$crap3,$crap4,$crap5,$crap6,$email,$crap7,
     $crap8,$crap9) =  split(/\s+/, $_);
    if($opt_i) {
	if($file =~ /.*README.*/ || $file =~ /.*sum.*/ || 
	   $file =~ /.*\.html$/ || $file =~ /.*\.txt$/ ||
	   $file =~ /.*Buglist.*/) {
	} else	{
	    $images{$file} = 1;
	    $imagesassoc{"$file%$host%$email"}++;
	}
    }
    $list{$file}++;
    $user{"$host%$email"}++;
    $begin = "$day $mon $dt $time $yr" if !$first;
    $first = 1;
    $end = "$day $mon $dt $time $yr" if EOF;
}
printf "Results of search for $opt_s in $files on $opt_h\n";
if(!$first) {
    printf "Nothing found!!\n";
    exit(-1);
}
printf "From: $begin\n";
printf "To:   $end\n\n";
printf "%-70s %5s\n", "Files retrieved", "#";
print "-"x78; printf "\n";
open(X, ">$TMPF") || die "$!";
foreach (sort keys %list) {
    printf X "%-70s %5s\n",$_, $list{$_};
}
close(X);
$num = 1;
&sortit;
unlink($TMPF);
printf "\n";
printf "%-34s  %-34s %5s\n", "Who", "Where", "#";
print "-"x78; printf "\n";

open(Y, ">$TMPF") || die "$!";
foreach (sort keys %user) {
    ($a,$b) = split(/\%/, $_);
    printf Y "%-34s  %-34s %5s\n", $b, $a, $user{$_};
}
close(Y);
$num = 2;
&sortit;
unlink($TMPF);
#
if($opt_i) {
    printf "\n\nDetailed Image breakdown\n";
    print "-"x78; printf "\n";
    foreach $i (sort keys %images) {
	printf "\nImage: $i\n";
	printf "%-34s  %-34s %5s\n", "Who", "Where", "#";
	print "-"x78; printf "\n";
	foreach $j (keys %imagesassoc) {
	    ($imagename, $imagehost, $imageemail) = split (/\%/, $j);
	    if($imagename =~ $i) {
		printf "%-34s  %-34s %5s\n",$imageemail, 
		$imagehost, $imagesassoc{$j};
	    }
	}
    }
}
#
sub num {$c<=>$d};
#
sub sortit {
    open(SORT, "$SORT -rn \+$num $TMPF|") || die "groklog: sort broke $!";
    while(<SORT>) {
	print;
    }
    close(SORT);
}
#

