#! /usr/local/perl -w
## merge the counts to normalizations

open(INA,"../../Count_all_genes/GROseq/GROseq_WT_cortex_rep1_GRO_whole_gene_Jerry.txt")||die("Can't open INA;$!\n");
open(INB,"../../Count_all_genes/GROseq/GROseq_WT_cortex_rep2_GRO_whole_gene_Jerry.txt")||die("Can't open INB;$!\n");
open(INC,"../../Count_all_genes/GROseq/GROseq_R106W_cortex_rep1_GRO_whole_gene_Jerry.txt")||die("Can't open INC;$!\n");
open(IND,"../../Count_all_genes/GROseq/GROseq_R106W_cortex_rep2_GRO_whole_gene_Jerry.txt")||die("Can't open IND;$!\n");

open(INE,"../../Count_all_genes/GROseq/Published/GRO_AtT20_GRO_whole_gene.txt")||die("Can't open INA;$!\n");
open(INF,"../../Count_all_genes/GROseq/Published/GRO_Heart_GRO_whole_gene.txt")||die("Can't open INA;$!\n");
open(ING,"../../Count_all_genes/GROseq/Published/GRO_macrophase_rep1_GRO_whole_gene.txt")||die("Can't open INA;$!\n");
open(INH,"../../Count_all_genes/GROseq/Published/GRO_macrophase_rep2_GRO_whole_gene.txt")||die("Can't open INA;$!\n");
open(INI,"../../Count_all_genes/GROseq/Published/GRO_MEF_rep1_GRO_whole_gene.txt")||die("Can't open INA;$!\n");
open(INJ,"../../Count_all_genes/GROseq/Published/GRO_MEF_rep2_GRO_whole_gene.txt")||die("Can't open INA;$!\n");
open(INK,"../../Count_all_genes/GROseq/Published/GRO_mESC_rep1_GRO_whole_gene.txt")||die("Can't open INA;$!\n");
open(INL,"../../Count_all_genes/GROseq/Published/GRO_mESC_rep2_GRO_whole_gene.txt")||die("Can't open INA;$!\n");
open(INM,"../../Count_all_genes/GROseq/Published/GRO_mESC_rep3_GRO_whole_gene.txt")||die("Can't open INA;$!\n");
open(INN,"../../Count_all_genes/GROseq/Published/GRO_primary_neurons_GRO_whole_gene.txt")||die("Can't open INA;$!\n");
open(INO,"../../Count_all_genes/GROseq/Published/GRO_White_Adipose_GRO_whole_gene.txt")||die("Can't open INA;$!\n");

open(OUT,">Merged_GROseq_whole_gene_counts_Jerry.txt")||die("Can't write OUT:$!\n");

while(<INA>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA"))
{$wt1{$id}=$4;$total{$id}=1; $a1++;}}else{print "error1 $_\n";}}
while(<INB>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA"))
{$wt2{$id}=$4;$total{$id}=1; $a2++;}}else{print "error2 $_\n";}}
while(<INC>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA"))
{$r106w1{$id}=$4;$total{$id}=1; $a3++;}}else{print "error3 $_\n";}}
while(<IND>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA"))
{$r106w2{$id}=$4;$total{$id}=1; $a4++;}}else{print "error4 $_\n";}}


while(<INE>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA"))
{$att20{$id}=$4;$total{$id}=1; $a5++;}}else{print "error5 $_\n";}}
while(<INF>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA"))
{$heart{$id}=$4;$total{$id}=1; $a6++;}}else{print "error6 $_\n";}}
while(<ING>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA"))
{$macro1{$id}=$4;$total{$id}=1; $a7++;}}else{print "error7 $_\n";}}
while(<INH>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA"))
{$macro2{$id}=$4;$total{$id}=1; $a8++;}}else{print "error8 $_\n";}}
while(<INI>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA"))
{$mef1{$id}=$4;$total{$id}=1; $a9++;}}else{print "error9 $_\n";}}
while(<INJ>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA"))
{$mef2{$id}=$4;$total{$id}=1; $a10++;}}else{print "error10 $_\n";}}
while(<INK>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA"))
{$esc1{$id}=$4;$total{$id}=1; $a11++;}}else{print "error11 $_\n";}}
while(<INL>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA"))
{$esc2{$id}=$4;$total{$id}=1; $a12++;}}else{print "error12 $_\n";}}
while(<INM>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA"))
{$esc3{$id}=$4;$total{$id}=1; $a13++;}}else{print "error13 $_\n";}}
while(<INN>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA"))
{$primaryneuron{$id}=$4;$total{$id}=1; $a14++;}}else{print "error14 $_\n";}}
while(<INO>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA"))
{$adipose{$id}=$4;$total{$id}=1; $a15++;}}else{print "error15 $_\n";}}

print OUT "\tWT1\tWT2\tR106W1\tR106W2\t";
print OUT "AtT20\tHeart\tMacrophase1\tMacrophase2\tMEF1\tMEF2\tmESC1\tmESC2\tmESC3\tPrimary_neurons\tWhite_Adipose\n";
foreach (keys %total)
{
 print OUT "$_\t";
 print OUT "$wt1{$_}\t$wt2{$_}\t$r106w1{$_}\t$r106w2{$_}\t";
 print OUT "$att20{$_}\t$heart{$_}\t$macro1{$_}\t$macro2{$_}\t$mef1{$_}\t$mef2{$_}\t$esc1{$_}\t$esc2{$_}\t$esc3{$_}\t$primaryneuron{$_}\t$adipose{$_}\n";
}

print "Total(protein_coding lincRNA miRNA snRNA snoRNA): $a1 $a2 $a3 $a4 $a5 $a6 $a7 $a8 $a9 $a10 $a11 $a12 $a13 $a14 $a15\n";
close OUT;

