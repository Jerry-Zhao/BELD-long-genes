#! /usr/local/perl -w

open(INA,"RenLab_mCortex_FIRE.txt")||die("Can't open INA:$!\n");
open(INB,"../02_BELD/BED_BED_Data_length_PI30_ChIP_RPKM_cortex_WT.xls")||die("Can't open INA:$!\n");
open(INC,"../02_BELD/BED_nonBEDlong_Data_length_PI30_ChIP_RPKM_cortex_WT.xls")||die("Can't open INA:$!\n");

open(OUT,">BELD_nonBELD_FIRE_overlap_percentage.xls")||die("Can't write OUA:$!\n");

while(<INA>)
{
 chomp;
 if(/^(\w\w?)\s+(\d+)\s+(\d+)\s+([\d\.]+)\s+/)
 {
  $a1++;
  $chr="chr$1"; 
  for($i=$2;$i<=$3;$i++){ $$chr{$i}=1;}
 }
 else{print "error1\t$_\n";}
}

print OUT "\tCategory\tPercentage\n";
while(<INB>)
{
 chomp;
 if(/^(chr\w\w?)\:(\d+)\-(\d+)\:([\w\.\-\:\+]+)\t/)
 {
  $b1++; $chr=$1;
  $id="$1\:$2\-$3\:$4";

  $total_length=$3-$2+1;
  $cover_length=0;
  for($i=$2;$i<=$3;$i++){if(exists $$chr{$i}){$cover_length++;}}
  $percentage=$cover_length/$total_length;
  print OUT "$id\tBED\t$percentage\n";
 }
 else{print "error2\t$_\n";}
}

while(<INC>)
{
 chomp;
 if(/^(chr\w\w?)\:(\d+)\-(\d+)\:([\w\.\-\:\+]+)\t/)
 {
  $c1++; $chr=$1;
  $id="$1\:$2\-$3\:$4";

  $total_length=$3-$2+1;
  $cover_length=0;
  for($i=$2;$i<=$3;$i++){if(exists $$chr{$i}){$cover_length++;}}
  $percentage=$cover_length/$total_length;
  print OUT "$id\tnonBEDlong\t$percentage\n";
 }
 else{print "error3\t$_\n";}
}



print "Total-FIRE: $a1\nTotal-BED: $b1\nTotal-nonBED: $c1\n";


