#! /usr/local/perl -w

open(IN,"../01_GROseq/Data_length_PI_cortex_WT.xls")||die("Can't open INC:$!\n");
open(INB,"RenLab_HiC_cortex_sigInter_intraChrom_2k10k_body_100kbupdown.txt")||die("Can't open INB:$!\n");
open(OUB,">ActiveGene_RenLab_HiC_cortex_sigInter_intraChrom_2k10k_body_100kbupdown.txt")||die("Can't write OUB:$!\n");


while(<IN>)
{
 chomp;
 if(/^(chr\w\w?\:\d+\-\d+\:)(ENSM[\w\.\-\(\)]+)(\:\w+\:[+|-])\t/)
 {
  $a1++;
  if(exists $active{$2}){print "error exists gene ID:$_\n";}
  else{$active{$2}="$1$2$3";}
 }
 else{print "error1\t$_\n";}
}

while(<INB>)
{
 chomp;
 if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/)
 {
  if(exists $active{$1}){$a3++; print OUB "$active{$1}\t$2\n";}
 }
 else{print "error3\t$_\n";}
}


print "Active-gene: $a1 $a2 $a3 $a4 $a5 $a6 $a7 \n";


