#! /usr/local/perl -w
## merge the counts to normalizations

open(INA,"../../Count_all_genes/Encode/Encode_H3K27ac_mouse_forebrain_E10.5_rep1_ChIP_whole_gene_Jerry.txt")||die("Can't open INA:$!\n");
open(INB,"../../Count_all_genes/Encode/Encode_H3K27ac_mouse_forebrain_E10.5_rep2_ChIP_whole_gene_Jerry.txt")||die("Can't open INA:$!\n");
open(INC,"../../Count_all_genes/Encode/Encode_H3K27ac_mouse_forebrain_E11.5_rep1_ChIP_whole_gene_Jerry.txt")||die("Can't open INA:$!\n");
open(IND,"../../Count_all_genes/Encode/Encode_H3K27ac_mouse_forebrain_E11.5_rep2_ChIP_whole_gene_Jerry.txt")||die("Can't open INA:$!\n");
open(INE,"../../Count_all_genes/Encode/Encode_H3K27ac_mouse_forebrain_E12.5_rep1_ChIP_whole_gene_Jerry.txt")||die("Can't open INA:$!\n");
open(INF,"../../Count_all_genes/Encode/Encode_H3K27ac_mouse_forebrain_E12.5_rep2_ChIP_whole_gene_Jerry.txt")||die("Can't open INA:$!\n");
open(ING,"../../Count_all_genes/Encode/Encode_H3K27ac_mouse_forebrain_E13.5_rep1_ChIP_whole_gene_Jerry.txt")||die("Can't open INA:$!\n");
open(INH,"../../Count_all_genes/Encode/Encode_H3K27ac_mouse_forebrain_E13.5_rep2_ChIP_whole_gene_Jerry.txt")||die("Can't open INA:$!\n");
open(INI,"../../Count_all_genes/Encode/Encode_H3K27ac_mouse_forebrain_E14.5_rep1_ChIP_whole_gene_Jerry.txt")||die("Can't open INA:$!\n");
open(INJ,"../../Count_all_genes/Encode/Encode_H3K27ac_mouse_forebrain_E14.5_rep2_ChIP_whole_gene_Jerry.txt")||die("Can't open INA:$!\n");
open(INK,"../../Count_all_genes/Encode/Encode_H3K27ac_mouse_forebrain_E15.5_rep1_ChIP_whole_gene_Jerry.txt")||die("Can't open INA:$!\n");
open(INL,"../../Count_all_genes/Encode/Encode_H3K27ac_mouse_forebrain_E15.5_rep2_ChIP_whole_gene_Jerry.txt")||die("Can't open INA:$!\n");
open(INM,"../../Count_all_genes/Encode/Encode_H3K27ac_mouse_forebrain_E16.5_rep1_ChIP_whole_gene_Jerry.txt")||die("Can't open INA:$!\n");
open(INN,"../../Count_all_genes/Encode/Encode_H3K27ac_mouse_forebrain_E16.5_rep2_ChIP_whole_gene_Jerry.txt")||die("Can't open INA:$!\n");
open(INO,"../../Count_all_genes/Encode/Encode_H3K27ac_mouse_forebrain_P0_rep1_ChIP_whole_gene_Jerry.txt")||die("Can't open INA:$!\n");
open(INP,"../../Count_all_genes/Encode/Encode_H3K27ac_mouse_forebrain_P0_rep2_ChIP_whole_gene_Jerry.txt")||die("Can't open INA:$!\n");
open(INQ,"../../Count_all_genes/Encode/Greenberg_H3K27ac_2wk_Cortex_rep1_ChIP_whole_gene_Jerry.txt")||die("Can't open INA:$!\n");
open(INR,"../../Count_all_genes/Encode/Greenberg_H3K27ac_2wk_Cortex_rep2_ChIP_whole_gene_Jerry.txt")||die("Can't open INA:$!\n");
open(INS,"../../Count_all_genes/Encode/Encode_H3K27ac_mouse_Cortex_8w_rep1_ChIP_whole_gene_Jerry.txt")||die("Can't open INA:$!\n");
open(INT,"../../Count_all_genes/Encode/Encode_H3K27ac_mouse_Cortex_8w_rep2_ChIP_whole_gene_Jerry.txt")||die("Can't open INA:$!\n");

open(OUT,">Merged_Encode_H3K27ac_whole_gene_RPKM.txt")||die("Can't write OUT:$!\n");

while(<INA>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA")){$e101{$id}=$4;$total{$id}=1; $a1++;}}else{print "error1 $_\n";}}
while(<INB>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA")){$e102{$id}=$4;$total{$id}=1; $a2++;}}else{print "error1 $_\n";}}

while(<INC>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA")){$e111{$id}=$4;$total{$id}=1; $a3++;}}else{print "error1 $_\n";}}
while(<IND>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA")){$e112{$id}=$4;$total{$id}=1; $a4++;}}else{print "error1 $_\n";}}

while(<INE>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA")){$e121{$id}=$4;$total{$id}=1; $a5++;}}else{print "error1 $_\n";}}
while(<INF>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA")){$e122{$id}=$4;$total{$id}=1; $a6++;}}else{print "error1 $_\n";}}

while(<ING>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA")){$e131{$id}=$4;$total{$id}=1; $a7++;}}else{print "error1 $_\n";}}
while(<INH>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA")){$e132{$id}=$4;$total{$id}=1; $a8++;}}else{print "error1 $_\n";}}

while(<INI>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA")){$e141{$id}=$4;$total{$id}=1; $a9++;}}else{print "error1 $_\n";}}
while(<INJ>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA")){$e142{$id}=$4;$total{$id}=1; $a10++;}}else{print "error1 $_\n";}}

while(<INK>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA")){$e151{$id}=$4;$total{$id}=1; $a11++;}}else{print "error1 $_\n";}}
while(<INL>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA")){$e152{$id}=$4;$total{$id}=1; $a12++;}}else{print "error1 $_\n";}}

while(<INM>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA")){$e161{$id}=$4;$total{$id}=1; $a13++;}}else{print "error1 $_\n";}}
while(<INN>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA")){$e162{$id}=$4;$total{$id}=1; $a14++;}}else{print "error1 $_\n";}}

while(<INO>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA")){$p01{$id}=$4;$total{$id}=1; $a15++;}}else{print "error1 $_\n";}}
while(<INP>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA")){$p02{$id}=$4;$total{$id}=1; $a16++;}}else{print "error1 $_\n";}}

while(<INQ>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA")){$p141{$id}=$4;$total{$id}=1; $a17++;}}else{print "error1 $_\n";}}
while(<INR>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA")){$p142{$id}=$4;$total{$id}=1; $a18++;}}else{print "error1 $_\n";}}

while(<INS>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA")){$p561{$id}=$4;$total{$id}=1; $a19++;}}else{print "error1 $_\n";}}
while(<INT>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA")){$p562{$id}=$4;$total{$id}=1; $a20++;}}else{print "error1 $_\n";}}
 
print "Total(protein_coding lincRNA miRNA snRNA snoRNA): $a1 $a2 $a3 $a4 $a5 $a6 $a7 $a8 $a9 $a10 $a11 $a12 $a13 $a14 $a15 $a16 $a17 $a18 $a19 $a20\n";

print OUT "\tE10.5_rep1\tE10.5_rep2\tE11.5_rep1\tE11.5_rep2\tE12.5_rep1\tE12.5_rep2\tE13.5_rep1\tE13.5_rep2\t";
print OUT   "E14.5_rep1\tE14.5_rep2\tE15.5_rep1\tE15.5_rep2\tE16.5_rep1\tE16.5_rep2\t";
print OUT   "P0_rep1\tP0_rep2\tP14_rep1\tP14_rep2\tP56_rep1\tP56_rep2\n";

foreach (keys %total)
{
 $geneid=$_;
 if($geneid=~/^chr\w\w?\:(\d+)\-(\d+)\:/)
 {
  $length=$2-$1+1; 
  $fpkme101 = int($e101{$geneid}*(1000000/66471857)*(1000/$length)*100 + 5)/100;
  $fpkme102 = int($e102{$geneid}*(1000000/48020189)*(1000/$length)*100 + 5)/100;
  $fpkme111 = int($e111{$geneid}*(1000000/18000644)*(1000/$length)*100 + 5)/100;
  $fpkme112 = int($e112{$geneid}*(1000000/16029127)*(1000/$length)*100 + 5)/100;
  $fpkme121 = int($e121{$geneid}*(1000000/33996891)*(1000/$length)*100 + 5)/100;
  $fpkme122 = int($e122{$geneid}*(1000000/37070716)*(1000/$length)*100 + 5)/100;

  $fpkme131 = int($e131{$geneid}*(1000000/38012789)*(1000/$length)*100 + 5)/100;
  $fpkme132 = int($e132{$geneid}*(1000000/37014491)*(1000/$length)*100 + 5)/100;
  $fpkme141 = int($e141{$geneid}*(1000000/23232832)*(1000/$length)*100 + 5)/100;
  $fpkme142 = int($e142{$geneid}*(1000000/24478023)*(1000/$length)*100 + 5)/100;
  $fpkme151 = int($e151{$geneid}*(1000000/41233909)*(1000/$length)*100 + 5)/100;
  $fpkme152 = int($e152{$geneid}*(1000000/35449045)*(1000/$length)*100 + 5)/100;
  $fpkme161 = int($e161{$geneid}*(1000000/27521669)*(1000/$length)*100 + 5)/100;
  $fpkme162 = int($e162{$geneid}*(1000000/25036299)*(1000/$length)*100 + 5)/100;

  $fpkmp01 = int($p01{$geneid}*(1000000/20909279)*(1000/$length)*100 + 5)/100;
  $fpkmp02 = int($p02{$geneid}*(1000000/23764525)*(1000/$length)*100 + 5)/100;

  $fpkmp141 = int($p141{$geneid}*(1000000/26568579)*(1000/$length)*100 + 5)/100;
  $fpkmp142 = int($p142{$geneid}*(1000000/38746886)*(1000/$length)*100 + 5)/100;
  $fpkmp561 = int($p561{$geneid}*(1000000/7345229)*(1000/$length)*100 + 5)/100;
  $fpkmp562 = int($p562{$geneid}*(1000000/7763712)*(1000/$length)*100 + 5)/100;
  
  print OUT "$geneid\t";
  print OUT "$fpkme101\t$fpkme102\t$fpkme111\t$fpkme112\t$fpkme121\t$fpkme122\t$fpkme131\t$fpkme132\t$fpkme141\t$fpkme142\t";
  print OUT "$fpkme151\t$fpkme152\t$fpkme161\t$fpkme162\t$fpkmp01\t$fpkmp02\t$fpkmp141\t$fpkmp142\t$fpkmp561\t$fpkmp562\n";
 }
 else{print "error gene-id match: $_\n";}
}

close OUT;

