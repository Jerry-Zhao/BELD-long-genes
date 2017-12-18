#! /usr/local/perl -w

#Total 10998	BED: 185	 non-BED: 581
#BED-SFARI: 51	 nonBED-SFARI: 73


open(INA,"BED_BED_Data_length_PI30_ChIP_RPKM_cortex_WT.xls")||die("Can't opn INA:$!\n");
open(INB,"BED_nonBEDlong_Data_length_PI30_ChIP_RPKM_cortex_WT.xls")||die("Can't opn INA:$!\n");
open(IND,"../06_SFARI/SFARI_Total_overlap_cortex_long_genes.xls")||die("Can't open IND:$!\n"); 
 
open(IN,"Data_length_PI30_ChIP_RPKM_cortex_WT.xls")||die("Can't open IN:$!\n");
open(OUT,">Supplementary_table_for_submit.xls")||die("Can't write OUT:$!\n");

while(<INA>){chomp;if(/^(chr\w\w?\:\d+\-\d+)\:(ENSMUSG\d+)\_([\w\.\-\(\)]+)\:\w+\:([+|-])\t/){
 if(exists $se{$2}){print "error exists SE ID $_\n";} else{$se{$2}="$2\t$3\t$1\t$4"; $total{$2}=1;}} else{print "error1\t$_\n";}}

while(<INB>){chomp;if(/^(chr\w\w?\:\d+\-\d+)\:(ENSMUSG\d+)\_([\w\.\-\(\)]+)\:\w+\:([+|-])\t/){
 if(exists $nonse{$2}){print "error exists nonSE ID $_\n";} else{$nonse{$2}="$2\t$3\t$1\t$4"; $total{$2}=1;}} else{print "error2\t$_\n";}}

while(<IND>){chomp;if(/^(chr\w\w?\:\d+\-\d+)\:(ENSMUSG\d+)\_([\w\.\-\(\)]+)\:\w+\:([+|-])\t/){
 if(exists $sfari{$2}){print "error exists SFARI ID $_\n";} else{$sfari{$2}="$2\t$3\t$1\t$4";}} else{print "error4\t$_\n";}}

print OUT "Ensembl ID\tGene Symbol\tChromosome loci\tStrand\tCategory\tSFARI genes\tCPM of H3K27ac rep1\tCPM of H3K27ac rep2\tCPM of H3K4me1 rep1\tCPM of H3K4me1 rep2\t";
print OUT "RPKM of H3K27ac rep1\tRPKM of H3K27ac rep2\tRPKM of H3K4me1 rep1\tRPKM of H3K4me1 rep2\tPausing index\tGene length\n";
while(<IN>)
{
 chomp;
 if(/^chr\w\w?\:\d+\-\d+\:(ENSMUSG\d+)\_[\w\.\-\(\)]+\:\w+\:[+|-]\t([\d\.]+\t[\d\.]+)\t[\d\.]+\t[\d\.]+\t([\d\.]+\t[\d\.]+)\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t(\d+)\t([\d\.]+\t[\d\.]+)\t[\d\.]+\t[\d\.]+\t([\d\.]+\t[\d\.]+)\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t\d+\t\d+\t\d+\t\d+\t\d+\t([\d\.]+)$/)
 {
  $a1++;
  if(exists $se{$1})
  {
   print OUT "$se{$1}\tBED genes\t"; $a3++; 
   if(exists $sfari{$1}){print OUT "Yes\t";$b1++;}else{print OUT "No\t";}
   print OUT "$2\t$3\t$5\t$6\t$7\t$4\n";
  }
  if(exists $nonse{$1})
  {
   print OUT "$nonse{$1}\tnon-BED long genes\t"; $a4++; 
   if(exists $sfari{$1}){print OUT "Yes\t";$b2++;}else{print OUT "No\t";}
   print OUT "$2\t$3\t$5\t$6\t$7\t$4\n";
  }
 }
 else{print "error1\t$_\n";}
}

print "Total $a1\tBED: $a3\t non-BED: $a4\n";
print "BED-SFARI: $b1\t nonBED-SFARI: $b2\n";



