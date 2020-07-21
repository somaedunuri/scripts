#! /sw/current/solaris2bin/perl5
     
      $input_file = $ARGV[0];
      if ($#ARGV<0){ 
	  die "please get an input file name!";
      }

      open(INPUT, $input_file) || die "Cannot open it: $!";
      while(<INPUT>){
          chop;          #get rid of new line
          s/^\s+//;      #get rid of starting space
          next if /^#/ || length($_)==0;
                         #if the line is comment line or the line is empty line
          $line =$_;
          ($sub_name, $size_1, $size_2) =split (/\s+/, $line, 3);
          if (($size_1 > ($size_2 * 1.03) ) ||($size_2 > ($size_1 * 1.03))) {
	      print "$sub_name is different, $size_1, $size_2\n";
          }
      }
 
