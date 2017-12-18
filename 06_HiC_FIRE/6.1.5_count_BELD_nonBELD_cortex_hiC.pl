#! /usr/local/perl -w

open(INA,"../02_BELD/BED_BED_Data_length_PI30_ChIP_RPKM_cortex_WT.xls")||die("Can't open INA:$!\n");
open(INB,"../../Count_all_genes/HiC/Homer/RenLab_HiC_cortex_sigInter_intraChrom_2k10k.txt")||die("Can't open INA:$!\n");
open(OUT,">Cortex_HiC_intraChrom_2k10k_whole_gene_count_BELD.txt")||die("Can't write OUT:$!\n");

#open(INA,"../02_BELD/BED_nonBEDlong_Data_length_PI30_ChIP_RPKM_cortex_WT.xls")||die("Can't open INA:$!\n");
#open(INB,"../../Count_all_genes/HiC/Homer/RenLab_HiC_cortex_sigInter_intraChrom_2k10k.txt")||die("Can't open INA:$!\n");
#open(OUT,">Cortex_HiC_intraChrom_2k10k_whole_gene_count_nonBELDlong.txt")||die("Can't write OUT:$!\n");

while(<INA>)
{
 chomp;
 if(/^(chr\w\w?)\:(\d+)\-(\d+)(\:ENSMUSG\d+\_[\w\.\-\(\)]+\:\w+\:[+|-])\t/)
 {
  $a1++;
  $chr=$1; $id="$1:$2-$3$4";
  $$chr{$id}="$2\t$3"; $count{$id}=0;
 }
 else{print "error1\t$_\n";}
}

while(<INB>)
{
 chomp;
 if(/^\w+\tchr\w\w?\-\d+\t(chr\w\w?)\t(\d+)\t(\d+)\t\+\t[\d\.]+\tchr\w\w?\-\d+\t(chr\w\w?)\t(\d+)\t(\d+)\t\+\t[\d\.]+\t\d+\t([\d\.]+)\t/)
 {
  $chr1=$1; $left1=$2; $right1=$3;
  $chr2=$4; $left2=$5; $right2=$6;
  $interactReads=$7; 
#  print "$7\n";
  
  foreach $key (keys %$chr1)
  {
   if($$chr1{$key}=~/^(\d+)\t(\d+)$/)
   {
    if(($1>=$left1 and $1<=$right1) or ($2>=$left1 and $2<=$right1) or ($left1>=$1 and $left1<=$2) or ($right1>=$1 and $right1<=$2)){$count{$key}+=$interactReads;}
   }
   else{print "error HASH keys :$_\n";}
  }

  foreach $key (keys %$chr2)
  {
   if($$chr2{$key}=~/^(\d+)\t(\d+)$/)
   {
    if(($1>=$left2 and $1<=$right2) or ($2>=$left2 and $2<=$right2) or ($left2>=$1 and $left2<=$2) or ($right2>=$1 and $right2<=$2)){$count{$key}+=$interactReads;}
   }
   else{print "error HASH keys :$_\n";}
  }
 }
 else{print "error 2\t$_\n";}
}

print OUT "\tInteractions\tInteractions_per_100kb\n";
foreach (keys %count)
{
 if($_=~/^chr\w\w?\:(\d+)\-(\d+)(\:ENSMUSG\d+\_[\w\.\-\(\)]+\:\w+\:[+|-])$/)
 { 
  $length= $2-$1+1;
  $normalized = ($count{$_} * 100000)/$length; 
  print OUT "$_\t$count{$_}\t$normalized\n"; 
  $a2++;
 }
 else{print "error HASH Keys $_\n";}
}

print "Total-genes: $a1 $a2\n";

close INA; close INB;
close OUT;


