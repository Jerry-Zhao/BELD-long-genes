#! /usr/local/perl -w
#Total-FIRE: 3167
#Total-BED: 185	Overlap: 102
#Total-nonBED: 185	Overlap: 63



open(INA,"RenLab_mCortex_FIRE.txt")||die("Can't open INA:$!\n");
open(INB,"../02_BELD/BED_BED_Data_length_PI30_ChIP_RPKM_cortex_WT.xls")||die("Can't open INA:$!\n");
open(INC,"../02_BELD/BED_nonBEDlong_Data_length_PI30_ChIP_RPKM_cortex_WT.xls")||die("Can't open INA:$!\n");

open(OUA,">BELD_FIRE_overlap.xls")||die("Can't write OUA:$!\n");
open(OUB,">nonBELDlong_FIRE_overlap.xls")||die("Can't write OUA:$!\n");
open(OUC,">RenLab_mCortex_FIRE.bed")||die("Can't write OUC:$!\n"); 

print OUC "track name=FIRE description=\"FIRE\" useScore=1\n";
while(<INA>)
{
 chomp;
 if(/^(\w\w?)\s+(\d+)\s+(\d+)\s+([\d\.]+)\s+/)
 {
  $a1++;
  $chr="chr$1"; 
  if(exists $$chr{$2}){print "error exists $_\n";}else{$$chr{$2}=$3;}

  print OUC "chr$1\t$2\t$3\t--\t$4\t+\n";
 }
 else{print "error1\t$_\n";}
}

while(<INB>)
{
 chomp;
 if(/^(chr\w\w?)\:(\d+)\-(\d+)\:([\w\.\-\:\+]+)\t/)
 {
  $b1++;
  $chr=$1;
  $label=0; 
  print OUA "$1\:$2\-$3\:$4\t";
  foreach (keys %$chr)
  {
   if(($_>=$2 and $_<=$3) or ($$chr{$_}>=$2 and $$chr{$_}<=$3) or ($2>=$_ and $2<=$$chr{$_}) or ($3>=$_ and $3<=$$chr{$_}))
   {
    $label++;
    print OUA "$chr:$_-$$chr{$_};;";
   }
  }
  if($label>0){$b2++; print OUA "\n";}else{print OUA "----\n";}
 }
 else{print "error2\t$_\n";}
}

while(<INC>)
{
 chomp;
 if(/^(chr\w\w?)\:(\d+)\-(\d+)\:([\w\.\-\:\+]+)\t/)
 {
  $c1++;
  $chr=$1;
  $label=0;
  print OUB "$1\:$2\-$3\:$4\t";
  foreach (keys %$chr)
  {
   if(($_>=$2 and $_<=$3) or ($$chr{$_}>=$2 and $$chr{$_}<=$3) or ($2>=$_ and $2<=$$chr{$_}) or ($3>=$_ and $3<=$$chr{$_}))
   {
    $label++;
    print OUB "$chr:$_-$$chr{$_};;";
   }
  }
  if($label>0){$c2++; print OUB "\n";}else{print OUB "----\n";}
 }
 else{print "error3\t$_\n";}
}


print "Total-FIRE: $a1\nTotal-BED: $b1\tOverlap: $b2\nTotal-nonBED: $c1\tOverlap: $c2\n";


