#!/usr/cisco/bin/perl5.6
QDDTS=/usr/cisco
use strict;
#use warnings;
# --<EXEC>-- DO NOT MODIFY --<EXEC>--
BEGIN {
    no warnings qw(uninitialized);
    my $module = "lib/QDDTS/Logger.pm";
    eval { require "$ENV{QDDTS}/$module" };
    eval { require "/usr/cisco/packages/qddts/current/$module" } if $@;
    QDDTS::Logger::register("CLI", $0, @ARGV) unless $@;
}
# --<EXEC>-- DO NOT MODIFY --<EXEC>--

use FindBin;
if ( "$FindBin::Bin" =~ /\/usr\/cisco\/bin/ ) {
      use lib "$FindBin::Bin/../lib/qddts";
}
else {
      use lib "$FindBin::Bin/../lib";
}
my $os = $^O;
if ( $os =~ m/solaris/ ) {
        system("/vws/aak/qddts/current/bin/table.pl @ARGV");
        exit;
}
my $cel_ver=`grep version /etc/system-profile 2>/dev/null | cut -d " " -f2 | cut -d  "-" -f1`;
if ( $os =~ m/linux/ and $cel_ver !~ /5.5/ ) {
        system("/vws/aak/qddts/current/bin/table.pl @ARGV");
        exit;
}

use QDDTS;
use QDDTS::Core qw(parse_data_line field_values_from_cache);
use QDDTS::Date qw(date2int int2date);
use QDDTS::Sthist qw(read_init set_closed_states raw_history unpack_history
		     internal_compress_closed);
#
# This script is used to product a table of metrics from a list
# of defect ids from standard input.  The metrics available for
# measurement are:
#
#   Number of outstanding defects
#   Number of closed defects
#   Number of incoming defects
#   Difference between incoming and closed defects
#
# These values can be measured daily, weekly, monthly, or quarterly.
# Note: outstanding defects are measured at the end of each interval,
#       and closed and incoming values are measured through the interval.
#
# The values can be qualified by the following values:
#
#   Externally found vs. Internally found
#   Severity
#   Priority (urgency)
#
# The usage for this script is:
#
#   generic.pl StartDate StopDate
#              [ -daily | -weekly | -monthly | -quarterly ]
#              type [ ext | int ] [ seva [ - sevb ] ] [ pria [ - prib ] ]
#              ...
#

my @dates;
my $ntype;
my @met_type;
my @met_where;
my @met_seva;
my @met_sevb;
my @met_pria;
my @met_prib;
my @debug_string;

my $need_query;

my $closed_states	= "CJUDMRV";
my %is_closed;

my @ids;
my %severity;
my %priority;
my %found;

my @data;
my $npts;

my $dbg;
my $progress;
my $udbg;   # User specified debug

my @sinc_cnt;
my @inc_cnt;
my @out_cnt;
my @clo_cnt;
my @finc_cnt;

my $debug_string;
{
    #
    # Main program
    #

    read_init;

    print STDERR "Parsing argument list\n"			if $dbg;
    &parse;
    print STDERR "Getting Ids\n"				if $dbg;
    &getids;

    if ($need_query) {
	print STDERR "Getting Values for Ids\n"			if $dbg;
	&getvals;
    }

    print STDERR "Processing\n"					if $dbg;
    set_closed_states($closed_states);
    &process;
    print STDERR "Printing Data\n"				if $dbg;
    &plot;

    print STDERR "Do User Debug\n"				if $dbg;
    &udebug;

    print STDERR "Done\n"					if $dbg;

    exit(0);
}

my (@count, @dbgids, @id_out, @id_clo, @id_sinc, @id_inc);
sub process {
    #
    # This routine does all the work.  It determines for each
    # defect id when it falls (if ever) into one of the
    # categories asked for by the user.
    #

    my ($id, @match);
    my ($tnum, $type);
    my ($sev, $pri, $wh, $nmatch);
    my ($date0, $date1, $daten);
    my ($idx, $n);
    my ($states, $opened, $closed);
    my ($nproc, $totids);

    $n = @dates - 1;

    foreach $tnum ( 0 .. $ntype-1 ) {
	$count[$tnum] = [ (0) x $n ];
    }

    $totids = @ids + 0;

    foreach $id ( @ids ) {

	if ($progress && ((++$nproc % 100) == 0)) {
	    print STDERR $nproc, "/", $totids, "\n";
	}

	@match = ();

	$sev = $severity{$id};
	$pri = $priority{$id};
	$wh  = $found{$id};

	#
	# Find which of the specifications match, if any
	#
	$nmatch = 0;
	foreach $tnum ( 0 .. $ntype-1 ) {

	    if ($need_query) {
		# Be pessimistic... we won't match
		$match[$tnum] = 0;

		# Check against severity
		next if $sev < $met_seva[$tnum] || $sev > $met_sevb[$tnum];

		# Check against priority
		next if $pri < $met_pria[$tnum] || $pri > $met_prib[$tnum];

		if ($met_where[$tnum] eq "ext") {
		    # Check for an external find with matching priorities
		    next if $wh ne "external";
		} elsif ($met_where[$tnum] eq "int") {
		    # Check for an internal find
		    next if $wh ne "internal";
		}
	    }

	    # We've found a match
	    $match[$tnum] = 1;
	    $nmatch++;

	    push(@{$dbgids[$tnum]}, $id) if ($udbg);

	}

	#
	# Don't go through with the next part, unless the defect meets
	# at least one of the criteria set up by the user
	#
	next unless $nmatch;

	@sinc_cnt = (0) x $n;
	@inc_cnt  = (0) x $n;
	@clo_cnt  = (0) x $n;
	@out_cnt  = (0) x $n;
        @finc_cnt  = (0) x $n;

	#
	# Do the date calculations
	#
	&calc_changes($id);

	#
	# Store the results from this id into the totals
	#
	foreach $tnum ( 0 .. $ntype-1 ) {

	    if ($match[$tnum]) {

		$type = $met_type[$tnum];

		if ($type eq "out") {

		    &add_arrays($count[$tnum], \@out_cnt);
                    @{$id_out[$tnum]{$id}} = @out_cnt if ($udbg);

		} elsif ($type eq "closed" || $type eq "cclosed") {

		    &add_arrays($count[$tnum], \@clo_cnt);
                    @{$id_clo[$tnum]{$id}} = @clo_cnt if ($udbg);

		} elsif ($type eq "inc" || $type eq "cinc") {

		    &add_arrays($count[$tnum], \@inc_cnt);
                    @{$id_inc[$tnum]{$id}} = @inc_cnt if ($udbg);

		} elsif ($type eq "sinc" || $type eq "csinc") {

		    &add_arrays($count[$tnum], \@sinc_cnt);
                    @{$id_sinc[$tnum]{$id}} = @sinc_cnt if ($udbg);

		} elsif ($type eq "diff") {

		    &add_arrays($count[$tnum], \@inc_cnt);
		    &sub_arrays($count[$tnum], \@clo_cnt);
                    @{$id_inc[$tnum]{$id}} = @inc_cnt if ($udbg);
                    @{$id_clo[$tnum]{$id}} = @clo_cnt if ($udbg);

		}elsif ($type eq "finc") {

                    &add_arrays($count[$tnum], \@finc_cnt);

                }
	    }
	}
    }

    foreach $tnum ( 0 .. $ntype-1 ) {

	if ($met_type[$tnum] eq "cinc"    ||
	    $met_type[$tnum] eq "csinc"   ||
	    $met_type[$tnum] eq "cclosed") {

	    my $arr_ref = $count[$tnum];
	    $n       = @$arr_ref;

	    for ( 1 .. $n-1 ) {
		$$arr_ref[$_] += $$arr_ref[$_-1];
	    }

	    $count[$tnum] = $arr_ref;

	}
    }
}

sub calc_changes {
    my($id) = @_;
    my($ndate, $nstate);
    my($didx, $sidx);
    my($hist, @hist);
    my($date0, $date1);
    my($cur_state, $new_state, $new_st_date);

    print STDERR "Process id $id\n"				if $dbg;

    $ndate  = @dates - 1;

    $hist = raw_history($id);
    return unless $hist;

    @hist = reverse internal_compress_closed(unpack_history($hist));

    $nstate = @hist;

    $didx = $sidx = 0;
    $cur_state = "-";

    $new_st_date = shift(@hist);
    $new_state   = shift(@hist);

    $date0 = $dates[0];
    $date1 = $dates[1];

    while (date2int($new_st_date) < date2int($date0)) {

	$cur_state = $new_state;

	$new_state   = "";
	$new_st_date = 0;

	last unless @hist;

	$new_st_date = shift(@hist);
	$new_state   = shift(@hist);
    }

    while ($didx < $ndate) {

	if ($new_st_date  &&
	    date2int($new_st_date) >= date2int($date0)  &&
	    date2int($new_st_date) <  date2int($date1)) {

	    while (@hist &&
		   date2int($hist[0]) >= date2int($date0)  &&
		   date2int($hist[0]) <  date2int($date1)) {
		#
		# Next state transition is in this interval too
		#
		if ( $new_state eq "F" ){
		      $finc_cnt[$didx] = 1;
		}

		$new_st_date = shift(@hist);
		$new_state   = shift(@hist);
	    }

            if ( $new_state eq "F" ){
                $finc_cnt[$didx] = 1;
            }


	    if ($cur_state eq "-") {
		#
		# No current state
		#

		$sinc_cnt[$didx] = 1;
		$inc_cnt[$didx]  = 1;

		if ($new_state && $is_closed{$new_state}) {
		    #
		    # Transition from nothing -> [open] -> closed
		    #
		    $clo_cnt[$didx] = 1;

		} elsif ($new_state) {
		    #
		    # Transition from nothing -> [open]
		    #
		    $out_cnt[$didx] = 1;

		}

	    } elsif ($is_closed{$cur_state} != 1) {
		#
		# Currently open
		#

		if ($new_state && $is_closed{$new_state}) {
		    #
		    # Transition from open -> closed
		    #
		    $clo_cnt[$didx] = 1;

		} else {
		    #
		    # (No) transition from open -> open
		    #
		    $out_cnt[$didx] = 1;

		}
		
	    } else {
		#
		# Currently closed
		#

		if ($is_closed{$new_state}) {
		    #
		    # (no) Transition from closed -> closed
		    #

		} elsif ($new_state) {
		    #
		    # Transition from closed -> open
		    #

		    $inc_cnt[$didx] = 1;
		    $out_cnt[$didx] = 1;

		}
	    }

	    $cur_state = $new_state if $new_state;

	    #
	    # Move to next state transition
	    #
	    if (@hist) {
		$new_st_date = shift(@hist);
		$new_state   = shift(@hist);
	    } else {
		$new_st_date = 0;
		$new_state   = "";
	    }

	} else {
	    #
	    # No state transition in this date interval
	    #

	    if ($cur_state ne "-" && $is_closed{$cur_state} != 1) {
		$out_cnt[$didx] = 1;

	    }
	}

	#
	# Move to next date interval
	#
	++$didx;

	$date0 = $dates[$didx];
	$date1 = $dates[$didx + 1];


    } # while

    if ($is_closed{$cur_state} != 1) {
	while ($didx < $ndate) {
	    $out_cnt[$didx++] = 1;
	}
    }
}

sub add_arrays {
    my ($arr1_ref, $arr2_ref) = @_;
    my ($len);

    $len = $#$arr1_ref;

    die "add_arrays: Mismatching array lengths\n"
	unless $len == $#$arr2_ref;

    for ( 0 .. $len ) {
	$$arr1_ref[$_] += $$arr2_ref[$_];
    }
}

sub sub_arrays {
    my ($arr1_ref, $arr2_ref) = @_;
    my ($len);

    $len = $#$arr1_ref;

    die "sub_arrays: Mismatching array lengths\n"
	unless $len == $#$arr2_ref;

    for ( 0 .. $len ) {
	$$arr1_ref[$_] -= $$arr2_ref[$_];
    }
}

sub parse {
    #
    # Read the arguments from the command line, checking for syntax
    # problems.  Sets global variables to show the user's preferences.
    #
    my ($arg, $fh);
    my ($date0, $date1, $when);
    my ($type, $where, $seva, $sevb, $pria, $prib);

    &usage("Too few arguments") if @ARGV < 4;

    $date0 = shift(@ARGV);
    $date1 = shift(@ARGV);
    $when  = shift(@ARGV);

    &gen_dates($when, $date0, $date1);

    while (@ARGV && $ARGV[0] =~ /^-/) {

	$arg = shift(@ARGV);

	if ($arg eq "-closed") {
	    &usage("Missing states for -closed") unless @ARGV;
	    $closed_states = shift(@ARGV);

	} elsif ($arg eq "-progress") {
	    $progress = 1;
	    $fh = select(STDERR); $| = 1; select($fh);

	} elsif ($arg eq "-debug") {
	    $udbg = 1;

	} else {
	    &usage("Unknown argument $arg");
	}
    }

    while (@ARGV) {
	$type  = shift(@ARGV);
	$where = "all";
	$seva  = 1;
	$sevb  = 6;
	$pria  = 1;
	$prib  = 9;

        $debug_string = $type if ($udbg);

	if ($type ne "out" &&
	    $type ne "closed" &&
	    $type ne "cclosed" &&
	    $type ne "inc" &&
	    $type ne "cinc" &&
	    $type ne "sinc" &&
	    $type ne "csinc" &&
            $type ne "finc" &&
	    $type ne "diff") {
	    &usage("Unknown metric type: $type");
	}

	if (@ARGV && ($ARGV[0] eq "ext" || $ARGV[0] eq "int")) {
	    &usage("Cannot search for internal bugs by priority")
		if $ARGV[0] == "int" && $where eq "ext";
	    $where = shift(@ARGV);
	    $need_query = 1;
            $debug_string .= " $where" if ($udbg);
	}

	if (@ARGV && $ARGV[0] =~ /[sS]([1-6])/) {
	    $seva = $sevb = $1;
	    shift(@ARGV);
            $debug_string .= " S$seva" if ($udbg);

	    if (@ARGV && $ARGV[0] eq "-") {
		shift(@ARGV);
                $debug_string .= " -" if ($udbg);
		if (@ARGV && $ARGV[0] =~ /[sS]([1-6])/) {
		    $sevb = $1;
		    shift(@ARGV);
                    $debug_string .= " S$sevb" if ($udbg);
		} else {
		    &usage("Missing second severity for $type");
		}
	    }

	    $need_query = 1;
	}

	if (@ARGV && $ARGV[0] =~ /[pP]([1-5])/) {

	    &usage("Cannot search for internal bugs by priority")
		if $where eq "int";

	    $pria = $prib = $1;
	    shift(@ARGV);
            $debug_string .= " P$pria" if ($udbg);

	    if (@ARGV && $ARGV[0] eq "-") {
		shift(@ARGV);
                $debug_string .= " -" if ($udbg);
		if (@ARGV && $ARGV[0] =~ /[pP]([1-5])/) {
		    $prib = $1;
		    shift(@ARGV);
                    $debug_string .= " P$prib" if ($udbg);
		} else {
		    &usage("Missing second priority for $type");
		}
	    }

	    if ($pria == 5) { $pria = 9; } else { $pria *= 2; }
	    if ($prib == 5) { $prib = 9; } else { $prib *= 2; }

	    $need_query = 1;
	}

	$ntype++;
	push(@met_type, $type);
	push(@met_where, $where);
	push(@met_seva,  $seva);
	push(@met_sevb,  $sevb);
	push(@met_pria,  $pria);
	push(@met_prib,  $prib);
        push(@debug_string, $debug_string) if ($udbg);
    }

    my (@closed, $state);
    @closed = split(//, $closed_states);
    $is_closed{'-'} = 0;
    foreach $state ( @closed ) {
	$is_closed{$state} = 1;
    }
    foreach $state ("S", "N", "A", "O", "W", "P", "H", "I", "P",
		    "M", "R", "V", "C", "J", "U", "D", "F", "Q") {
	$is_closed{$state} = 0 unless defined($is_closed{$state});
    }
}

sub getids {
    #
    # Read the ids from standard input
    #

    my($type, $id);

    while (<>) {
	($type, $id) = parse_data_line($_);
	if ($type eq "ID") {
	    push(@ids, $id);
	}
    }

    print STDERR "  Read in ", scalar(@ids), " bugs\n"		if $dbg;
}

sub getvals {
    #
    # Get values for the severity, priority and location.
    #
    my ($id, $found);

    foreach $id (@ids) {
	($severity{$id}, $priority{$id}, $found) =
	    field_values_from_cache($id, "Severity", "Urgency", "Found");

	$priority{$id} = 9  unless $priority{$id};

	if ($found eq "customer-use" ||
	    $found eq "beta-testing" ||
	    $found eq "partner-use"  ||
	    $found eq "field-test") {
	    $found{$id} = "external";
	} else {
	    $found{$id} = "internal";
	}
    }
}

sub gen_dates {
    #
    # This function sets up the date list based on the user
    # preference.  It also sets the $npts value to the number
    # of date values-1.
    #

    my ($kind, $date0, $date1) = @_;
    my $date;
    my ($day, $lastday);
    my ($month, $year, $stop);
    my $qn;

    if ($kind eq "-daily") {
	die "Must use YYMMDD for daily dates\n"
	    unless $date0 =~ /^\d\d\d\d\d\d$/ && $date1 =~ /^\d\d\d\d\d\d$/;

	die "Second date is earlier than the first date!\n"
	    if (date2int($date1) < date2int($date0));

	$day     = date2int($date0);
	$lastday = date2int($date1) + 1;

	while ($day <= $lastday) {
	    $date = int2date($day);
	    push(@dates, $date);
	    $day += 1;
	}

    } elsif ($kind eq "-weekly") {
	die "Must use YYMMDD for weekly dates\n"
	    unless $date0 =~ /^\d\d\d\d\d\d$/ && $date1 =~ /^\d\d\d\d\d\d$/;

	die "Second date is earlier than the first date!\n"
	    if (date2int($date1) < date2int($date0));

	$day     = date2int($date0);
	$lastday = date2int($date1) + 7;

	while ($day <= $lastday) {
	    $date = int2date($day);
	    push(@dates, $date);
	    $day += 7;
	}

    } elsif ($kind eq "-monthly") {
	die "Must use YYMM format for monthly dates\n" unless $date1  =~ /^(\d\d)(\d\d)$/;

	$month = $2;
	$year  = $1;

	die "Second date is earlier than the first date!\n"
	    if (date2int("$date1" . "01") < date2int("$date0" ."01"));

	# Make sure we catch the beginning of the next month.
	# Since all months are at most 31 days, +32 will give
	# us a value we must stay under
	$stop = date2int("$date1" . "01") + 32;

	die "Must use YYMM format for monthly dates\n" unless $date0 =~ /^(\d\d)(\d\d)$/;
	$month = $2;
	$year  = $1;
	$day   = date2int("$date0" . "01");
	while ($day <= $stop) {
	    push(@dates, int2date($day));

	    if ($month == 12) {
		$year   = ($year + 1) % 100;
		$month  = 1;
	    } else {
		$month += 1;
	    }
	    $day = date2int( sprintf("%02d%02d01", $year, $month) );
	}

    } elsif ($kind eq "-quarterly") {
	die "Must use QNYY format for quarterly dates\n" unless $date1 =~ /^Q(\d)(\d\d)$/;
	$qn   = $1;
	$year = $2;
	if ($qn == 1) {
	    $year  = ($year == 0) ? "99" : $year-1;
	    $month = 8;
	} elsif ($qn == 2) {
	    $year  = ($year == 0) ? "99" : $year-1;
	    $month = 11;
	} elsif ($qn == 3) {
	    $month = 2;
	} elsif ($qn == 4) {
	    $month = 5;
	} else {
	    die "Quarters must be numbered 1..4 (use QNYY)\n";
	}

	if ($month >= 10) {
	    $year  += 1;
	    $year  %= 100;
	    $month  = $month - 12 + 3;;
	} else {
	    $month += 3;
	}
	$stop = date2int( sprintf("%02d%02d01", $year, $month) );


	die "Must use QNYY format for quarterly dates\n" unless $date0 =~ /^Q(\d)(\d\d)$/;
	$qn   = $1;
	$year = $2;
	if ($qn == 1) {
	    $year  = ($year == 0) ? "99" : $year-1;
	    $month = 8;
	} elsif ($qn == 2) {
	    $year  = ($year == 0) ? "99" : $year-1;
	    $month = 11;
	} elsif ($qn == 3) {
	    $month = 2;
	} elsif ($qn == 4) {
	    $month = 5;
	} else {
	    die "Quarters must be numbered 1..4 (use QNYY)\n";
	}

	print STDERR "Quarters: stop $stop   $month/$year\n"	if $dbg;

	$day = date2int( sprintf("%02d%02d01", $year, $month) );

	while ($day <= $stop) {
	    push(@dates, int2date($day));

	    if ($month >= 10) {
		$year  += 1;
		$year  %= 100;
		$month  = $month - 12 + 3;
	    } else {
		$month += 3;
	    }

	    $day = date2int( sprintf("%02d%02d01", $year, $month) );
	}

    } elsif ($kind eq "-yearly") {
	die "Must use YYYY format for yearly dates\n" unless $date0 =~ /^\d{4}$/;
	die "Must use YYYY format for yearly dates\n" unless $date1 =~ /^\d{4}$/;
	die "Second date is earlier than the first date!\n" if ($date1 < $date0);

	$day   = $date0;
	while ($day <= $date1+1) {
            $day =~ /^\d{2}(\d{2})$/;
	    push(@dates, $1 . "0101");
	    $day += 1;
	}

    } else {
	&usage("Unknown date type: $kind");
    }

    $npts = @dates - 1;
}

sub plot {
    my ($daten, $metn, $idx);

    foreach my $daten ( 0 .. $#dates-1 ) {
	print $dates[$daten];
	foreach my $metn ( 0 .. $ntype-1 ) {
	    print "\t";
	    my $arr_ref = $count[$metn];
	    print $$arr_ref[$daten]+0;
	}
	print "\n";
    }
}

sub usage {
    my ($msg) = @_;

    select(STDERR);
    print "$msg\n\n" if $msg;
    print "Usage: generic.pl StartDate StopDate When [ -closed states ] Metric(s)\n";
    print "Where...      Is one of...\n";
    print "  StartDate   YYMMDD for days or weeks\n";
    print "              or YYMM for months\n";
    print "              or YYQN for quarters\n";
    print "              or YYYY for years\n";
    print "  StopDate    Same as StartDate or \"today\"\n";
    print "  When        -daily, -weekly, -monthly, -quarterly or -yearly\n";
    print "  -closed     Override states considered \"closed\"\n";
    print "              Default is CJUDFMRVPHI\n";
    print "\n";
    print "Metric takes the form of: Type Where Sev Pri\n";
    print "Where...      Is...\n";
    print "  Type        \"out\", \"closed\", \"inc\", or \"diff\"\n";
    print "  Where       \"ext\" or \"int\"\n";
    print "  Sev         \"SN\" or \"SA - SB\" for a single severity\n";
    print "              N would be 1..4.  Or for a range of severities\n";
    print "              A would be 1..3 and B would be 2..4 where A<B\n";
    print "  Pri         Is similar to severity, but Pn is used rather\n";
    print "              than Sn\n";
    exit(1);
}

sub udebug {
  if ($udbg) {
    print STDERR << "EOF";

Each "section" in the debugging output represents the correspoding column in
the table.pl output, excluding the first column.  So section n refers to 
column n+1 in the output.  Each section shows the defects that were involved
in the corresponding columns data.  Each column of the debugging output
represents the corresponding row (week/month/day/etc.) in the table.pl output.
A 1 means that the defect met specified criteria for that time period.  A 0
means the defect did not meet the criteria.  If a defect does not meet the
criteria for any time period, all 0's, the defect is not shown.  Except for
"diff", all rows in a given section in a given column, can be added together 
to give the corresponding value in the normal output.  For type "diff", you
subtract the total closed count from the toal incoming count.


EOF
    foreach my $tnum ( 0 .. $ntype-1 ) {
      print STDERR "$debug_string[$tnum]\n";
      for my $id (@{$dbgids[$tnum]}) {
	my ($type, $test_string);

	$type = $met_type[$tnum];

	if ($type eq 'out') {
            $test_string = join(" ", @{$id_out[$tnum]{$id}});
            if ($test_string =~ /1/) {
	        print STDERR "     out:  $id: @{$id_out[$tnum]{$id}}\n";
	    }
	}

	if ($type =~ /^(closed|cclosed|diff)$/) {
	    $test_string = join(" ", @{$id_clo[$tnum]{$id}});
	    if ($test_string =~ /1/) {
		print STDERR "     clo:  $id: @{$id_clo[$tnum]{$id}}\n";
	    }
	}

	if ($type =~ /^(inc|cinc|diff)$/) {
	    $test_string = join(" ", @{$id_inc[$tnum]{$id}});
	    if ($test_string =~ /1/) {
		print STDERR "     inc:  $id: @{$id_inc[$tnum]{$id}}\n";
	    }
	}

	if ($type =~ /^(sinc|csinc)$/) {
	    $test_string = join(" ", @{$id_sinc[$tnum]{$id}});
	    if ($test_string =~ /1/) {
		print STDERR "     sinc: $id: @{$id_sinc[$tnum]{$id}}\n";
	    }
	}
      }
    }
  }
}

__END__

=head1 NAME

table.pl - This script is used to produce a table of metrics from a list of defect ids from standard input


=head1 SYNOPSIS

table.pl StartDate StopDate When [ -closed states ] Metric(s)
    StartDate   YYMMDD for days or weeks
                YYMM for months
                YYQN for quarters
                YYYY for years
    StopDate    Same as StartDate or "today"
    When        -daily, -weekly, -monthly, -quarterly or -yearly
                -closed     Override states considered "closed"
    Default is   CJUDFMRVPHI
    Metric takes the form of: Type Where Sev Pri
    Where...      Is...
    Type         "out", "closed", "inc", or "diff"
    Where        "ext" or "int"
    Sev          "SN" or "SA - SB" for a single severity
    N would be 1..4.  Or for a range of severities
    A would be 1..3 and B would be 2..4 where "A is less than B"
    Pri         Is similar to severity, but Pn is used rather Sn

=head1 DESCRIPTION

B<table.pl>  produces a table of metrics from a list of defect ids from standard input.
The metrics available for measurement are:

 Number of outstanding defects
 Number of closed defects
 Number of incoming defects
 Difference between incoming and closed defects

 These values can be measured daily, weekly, monthly, or quarterly.
 Note: outstanding defects are measured at the end of each interval,
      and closed and incoming values are measured through the interval.

 The values can be qualified by the following values:

 Externally found vs. Internally found
 Severity
 Priority (urgency)

=cut

