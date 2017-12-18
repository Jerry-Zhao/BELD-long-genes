#! /usr/local/perl -w
open(INA,"../02_BELD/BED_BED_Data_length_PI30_ChIP_RPKM_cortex_WT.xls")||die("Can't open INB:$!\n");
open(INB,"../../Count_all_genes/Encode/Expression_8_points/Encode_totalRNAseq_FPKM_8_TimePoints.xls")||die("Can't open INA:$!\n");
open(INC,"../../Count_all_genes/Encode/Expression_8_points/GSM2795477_RNAseq_Ezh2WT_2wk_Cortex_A_rep1.txt")||die("Can't open INC:$!\n");
open(IND,"../../Count_all_genes/Encode/Expression_8_points/GSM2795478_RNAseq_Ezh2WT_2wk_Cortex_B_rep1.txt")||die("Can't open INC:$!\n");
open(INE,"../../Count_all_genes/Encode/Expression_8_points/GSM2795489_RNAseq_Dnmt3aWT_2wk_Cortex.txt")||die("Can't open INC:$!\n");
open(INF,"../02_BELD/Total_20150928_FPKM_whole_gene.xls")||die("Can't open INF:$!\n");
open(ING,"BELD_expression_13_tissues_FPKM_2.xls")||die("Can't open ING:$!\n");
open(OUT,">FPKM_BELD_expression_time_points.xls")||die("Can't write OUT:$!\n");

while(<INA>)
{
 chomp;
 if(/^(chr\w\w?\:\d+\-\d+\:)(ENSMUSG\d+)(\_[\w\.\-\(\)]+\:\w+\:[+|-])\t/)
 {
  $a1++;
  if(exists $beld{$2}){print "error exists gene ID:$_\n";}
  else{$beld{$2}="$1$2$3";}
 }
}

while(<INB>)
{
 chomp;
 if(/^(ENSMUSG\d+)\t([\d\.\t]+)$/)
 {
  if(exists $beld{$1})
  {
   $a2++; $encode{$1}=$2;
  }
 }
 else{print "error2\t$_\n";}
}

while(<INC>){chomp;if(/^(ENSMUSG\d+)\t([\d\.\t]+)$/){if(exists $beld{$1}){$a3++; $p141{$1}=$2;}}else{print "error3\t$_\n";}}
while(<IND>){chomp;if(/^(ENSMUSG\d+)\t([\d\.\t]+)$/){if(exists $beld{$1}){$a4++; $p142{$1}=$2;}}else{print "error4\t$_\n";}}
while(<INE>){chomp;if(/^(ENSMUSG\d+)\t([\d\.\t]+)$/){if(exists $beld{$1}){$a5++; $p143{$1}=$2;}}else{print "error5\t$_\n";}}

while(<INF>)
{
 chomp;
 if(/^chr\w\w?\:\d+\-\d+\:(ENSMUSG\d+)\_[\w\.\-\(\)]+\:\w+\:[+|-]\t([\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+)\t/)
 {
  if(exists $beld{$1})
  {
   $a6++; $p42{$1}=$2;
  }
 }
 else{print "error6\t$_\n";}
}

while(<ING>)
{
 chomp;
 if(/^chr\w\w?\:\d+\-\d+\:(ENSMUSG\d+)\_[\w\.\-\(\)]+\:\w+\:[+|-]\t([\d\.]+\t[\d\.]+)\t/)
 {
  if(exists $beld{$1})
  {
   $a7++; $p56{$1}=$2;
  }
 }
 else{print "error7\t$_\n";}
}

print OUT "\tE10.5_rep1\tE10.5_rep2\tE11.5_rep1\tE11.5_rep2\tE12.5_rep1\ttE12.5_rep2\tE13.5_rep1\tE13.5_rep2\tE14.5_rep1\tE14.5_rep2\t";
print OUT   "E15.5_rep1\tE15.5_rep2\tE16.5_rep1\tE16.5_rep2\tP0_rep1\tP0_rep2\t";
print OUT   "P14_rep1\tP14_rep2\tP14_rep3\tP42_rep1\tP42_rep2\tP42_rep3\tP42_rep4\tP56_rep1\tP56_rep2\n";
foreach (keys %p56)
{
 if(exists $p141{$_})
 {
  print OUT "$beld{$_}\t$encode{$_}\t$p141{$_}\t$p142{$_}\t$p143{$_}\t$p42{$_}\t$p56{$_}\n";
  $a8++;
 }
}

print "BELD:$a1 \nEncode: $a2 \n2w: $a3 $a4 $a5 \n6W: $a6 \n8W: $a7\nFinal-results: $a8\n";

