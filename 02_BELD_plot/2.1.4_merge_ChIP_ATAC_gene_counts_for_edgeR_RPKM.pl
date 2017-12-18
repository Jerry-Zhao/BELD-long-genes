#! /usr/local/perl -w
## merge the counts to normalizations

open(INA,"../../Count_all_genes/ChIP/Mo_WT_excitatory_H3K27ac_rep1_ChIP_whole_gene_Jerry.txt")||die("Can't open INA:$!\n");
open(INB,"../../Count_all_genes/ChIP/Mo_WT_excitatory_H3K27ac_rep2_ChIP_whole_gene_Jerry.txt")||die("Can't open INB:$!\n");
open(INC,"../../Count_all_genes/ChIP/Mo_WT_excitatory_H3K27me3_rep1_ChIP_whole_gene_Jerry.txt")||die("Can't open INB:$!\n");
open(IND,"../../Count_all_genes/ChIP/Mo_WT_excitatory_H3K27me3_rep2_ChIP_whole_gene_Jerry.txt")||die("Can't open INB:$!\n");
open(INE,"../../Count_all_genes/ChIP/Mo_WT_excitatory_H3K4me1_rep1_ChIP_whole_gene_Jerry.txt")||die("Can't open INB:$!\n");
open(INF,"../../Count_all_genes/ChIP/Mo_WT_excitatory_H3K4me1_rep2_ChIP_whole_gene_Jerry.txt")||die("Can't open INB:$!\n");
open(ING,"../../Count_all_genes/ChIP/Mo_WT_excitatory_H3K4me3_rep1_ChIP_whole_gene_Jerry.txt")||die("Can't open INB:$!\n");
open(INH,"../../Count_all_genes/ChIP/Mo_WT_excitatory_H3K4me3_rep2_ChIP_whole_gene_Jerry.txt")||die("Can't open INB:$!\n");

open(INI,"../../Count_all_genes/ChIP/Nex_p_WT_rep1_ATAC_whole_gene_Jerry.txt")||die("Can't open INB:$!\n");
open(INJ,"../../Count_all_genes/ChIP/Nex_p_WT_rep2_ATAC_whole_gene_Jerry.txt")||die("Can't open INB:$!\n");
open(INK,"../../Count_all_genes/ChIP/Nex_p_R106W_rep1_ATAC_whole_gene_Jerry.txt")||die("Can't open INB:$!\n");
open(INL,"../../Count_all_genes/ChIP/Nex_p_R106W_rep2_ATAC_whole_gene_Jerry.txt")||die("Can't open INB:$!\n");

open(OUT,">Merged_ChIP_whole_gene_counts_Jerry.txt")||die("Can't write OUT:$!\n");

while(<INA>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA"))
{$k27acrep1{$id}=$4;$total{$id}=1; $a1++;}}else{print "error1 $_\n";}}
while(<INB>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA"))
{$k27acrep2{$id}=$4;$total{$id}=1; $a2++;}}else{print "error2 $_\n";}}

while(<INC>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA"))
{$k27me3rep1{$id}=$4;$total{$id}=1; $a3++;}}else{print "error3 $_\n";}}
while(<IND>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA"))
{$k27me3rep2{$id}=$4;$total{$id}=1; $a4++;}}else{print "error4 $_\n";}}


while(<INE>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA"))
{$k4me1rep1{$id}=$4;$total{$id}=1; $a5++;}}else{print "error5 $_\n";}}
while(<INF>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA"))
{$k4me1rep2{$id}=$4;$total{$id}=1; $a6++;}}else{print "error6 $_\n";}}

while(<ING>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA"))
{$k4me3rep1{$id}=$4;$total{$id}=1; $a7++;}}else{print "error7 $_\n";}}
while(<INH>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA"))
{$k4me3rep2{$id}=$4;$total{$id}=1; $a8++;}}else{print "error8 $_\n";}}

while(<INI>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA"))
{$wtrep1{$id}=$4;$total{$id}=1; $a9++;}}else{print "error9 $_\n";}}
while(<INJ>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA"))
{$wtrep2{$id}=$4;$total{$id}=1; $a10++;}}else{print "error10 $_\n";}}

while(<INK>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA"))
{$r106wrep1{$id}=$4;$total{$id}=1; $a11++;}}else{print "error11 $_\n";}}
while(<INL>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA"))
{$r106wrep2{$id}=$4;$total{$id}=1; $a12++;}}else{print "error12 $_\n";}}


print OUT "\tH3K27ac_rep1\tH3K27ac_rep2\tH3K27me3_rep1\tH3K27me3_rep2\t";
print OUT "H3K4me1_rep1\tH3K4me1_rep2\tH3K4me3_rep1\tH3K4me3_rep2\t";
print OUT "ATAC_WT_rep1\tATAC_WT_rep2\tATAC_R106W_rep1\tATAC_R106W_rep2\n";

foreach (keys %total)
{
 print OUT "$_\t";
 print OUT "$k27acrep1{$_}\t$k27acrep2{$_}\t$k27me3rep1{$_}\t$k27me3rep2{$_}\t";
 print OUT "$k4me1rep1{$_}\t$k4me1rep2{$_}\t$k4me3rep1{$_}\t$k4me3rep2{$_}\t";
 print OUT "$wtrep1{$_}\t$wtrep2{$_}\t$r106wrep1{$_}\t$r106wrep2{$_}\n";
}

print "Total(protein_coding lincRNA miRNA snRNA snoRNA): $a1 $a2 $a3 $a4 $a5 $a6 $a7 $a8 $a9 $a10 $a11 $a12\n";
close OUT;

