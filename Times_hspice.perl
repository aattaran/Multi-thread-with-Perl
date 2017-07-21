#!/usr/local/bin/perl

#Gets current working directory

use Cwd;

#Lets us check if sub-process has completed

use POSIX ":sys_wait_h";

#Allows us to wait less than 1 second

use Time::HiRes qw (sleep);

#Set Header File Values For output

$str = " WN1; WN2; WP1; WP2; delay; vq; vqb; area; Percentage_Failure; alter \n" ;
$generic_file_name='ReadW.sp';

$dir1 = getcwd;
$i = 0;
$l = 0;
$k = 0;
$hang_count = 0;

#Specify the max time the simulation should take

$timeout_a = 30;

#Specify the increments to check completion

$slept = 1;

#Generates number of check loops executed

$timeout = int($timeout_a/$slept) ;

system("rm stat_result.txt &");wait;
system("touch stat_result.txt &");wait;

my $file = "$dir1/alter_block.sp";
  
  open (FH, "< $file") or die "Can't open $file for read: $!";
  my @lines;
  while (<FH>) {
      push (@lines, $_);  
  }
  
close FH or die "Cannot close $file: $!";
    
my $file = "$dir1/$generic_file_name";
  
  open (FH, "< $file") or die "Can't open $file for read: $!";
  my @lines1;
  while (<FH>) {
      $l = $l +1;
      push (@lines1, $_);  
  }

close FH or die "Cannot close $file: $!";


my $filename = "$dir1/stat_result.txt";
    
  open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
  print $fh "$str";
          
close $fh;

$j = 0;
$l = scalar @lines;

while($j<($l/5)){
  
  $b = $j*5;
  $c = $b+3;
  $j = $j+1;
  
  my $filename = "$dir1/mont_read.sp";
    
      open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
      print {$fh} @lines1;
      print {$fh} "\n";
      print {$fh} @lines[$b..$c];
      print {$fh} ".end \n\n";
    
  close $fh;
  
  my $pid = fork();
  die "Could not fork\n" if not defined $pid;
   
  if ($pid==0){
      
      print "In child\n";
      
        system("hspice -i mont_read.sp -o out -mt 4");wait;
        sleep(.8);wait;
        exit(0);
        
  }
  
  else{
     
  print "In parent \n";
  
  $i = 0;
  
  $mont_number = $j - 1;
  
  out: while (1){
      
      $res=waitpid($pid, WNOHANG);
      
      if ($res == -1) {
          
          print "Successful Exit Process Detected\n";
          system("mv out.mt0 mont_read.mt0");wait;
          sleep(1);wait;
          system("perl monte_stat.pl > rel_out.txt"); wait ;
          system("cat stat_result.txt rel_out.txt > stat_result.tmp"); wait; 
          system("mv stat_result.tmp stat_result.txt");wait;
          print "\nSim #$mont_number complete\n";wait;
          last out;
      
      }
      
      if($res != -1){
      
        if($i>=$timeout){
        
          $hang_count = $hang_count+1;
          system("killall hspice");wait;
          sleep(1);
          print("time_out complete\n");wait;
          print "\nSim #$mont_number complete\n";wait;
          last out; 
        
        }
      
        if($i<$timeout){
            
            sleep $slept;wait;
              
        }
    
      $i=$i+1;
      
      }
      
      }
      }       
      
  
  } 

print "Simulation Finished With $hang_count hangs\n" ;

exit;
