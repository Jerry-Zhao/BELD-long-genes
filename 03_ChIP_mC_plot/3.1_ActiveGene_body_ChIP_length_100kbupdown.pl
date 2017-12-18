#! /usr/local/perl -w

open(INA,"../02_BELD/Data_length_PI30_ChIP_RPKM_cortex_WT.xls")||die("Can't open INC:$!\n");

print "Please neter the data set names:\n";
chomp($name=<STDIN>);


#mv 20150723_H3K4me3_Maria_rep1_ChIP_allgene_body_100kbupdown.txt Our_cortex_H3K4me3_rep1_ChIP_allgene_body_100kbupdown.txt
#mv Jan1915_NexBirA_H3K4me3_uniq_ChIP_allgene_body_100kbupdown.txt Our_cortex_H3K4me3_rep2_ChIP_allgene_body_100kbupdown.txt

#open(INB,"../../Count_all_genes/ChIP/$name\_ChIP_allgene_body_100kbupdown.txt")||die("Can't open INA:$!\n");
#open(INB,"../../Count_all_genes/ChIP/ChIP_$name\_allgene_body_100kbupdown.txt")||die("Can't open INA:$!\n");
#open(OUT,">Body_$name\_activeGene_100kbupdown.txt")||die("Can't write OUA:$!\n");

open(INB,"../../Count_all_genes/ATAC/$name\_allgene_body_100kbupdown.txt")||die("Can't open INA:$!\n");
open(OUT,">Body_$name\_activeGene_100kbupdown.txt")||die("Can't write OUA:$!\n");


while(<INA>)
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

while(<INB>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a2++; print OUT "$active{$1}\t$2\n";}}else{print "error2\t$_\n";}}

print "Active-gene: $a1 \t$a2\n"; 

close INA; close INB; close OUT;


