#! /usr/local/perl -w

open(IN,"../01_GROseq/Data_length_PI_cortex_WT.xls")||die("Can't open INC:$!\n");
open(INA,"../../Count_all_genes/ATAC/ATAC_Nex_p_WT_rep1_TSS_allgene.txt")||die("Can't open INA:$!\n");
open(INB,"../../Count_all_genes/ATAC/ATAC_Nex_p_WT_rep2_TSS_allgene.txt")||die("Can't open INB:$!\n");

open(OUA,">ATAC_Nex_p_WT_rep1_3kTSS3k_activeGene.txt")||die("Can't write OUA:$!\n");
open(OUB,">ATAC_Nex_p_WT_rep2_3kTSS3k_activeGene.txt")||die("Can't write OUB:$!\n");


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

while(<INA>)
{
 chomp;
 if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/)
 {
  if(exists $active{$1}){$a2++; print OUA "$active{$1}\t$2\n";}
 }
 else{print "error2\t$_\n";}
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

print "Active-gene: $a1 $a2 $a3 \n";

close INA; close INB; close INC;
close OUA; close OUB;


