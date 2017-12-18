#! /usr/local/perl -w
## merge the counts to normalizations

open(INA,"old2017_2/N2A_ChIP_H3K27ac_ChIP_whole_gene_Jerry.txt")||die("Can't open INA:$!\n");
open(OUT,">N2A_H3K27ac_whole_gene_counts_Jerry.txt")||die("Can't write OUT:$!\n");

while(<INA>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA"))
{$k27acrep1{$id}=$4;$total{$id}=1; $a1++;}}else{print "error1 $_\n";}}

print OUT "\tN2A_H3K27ac_rep1\n";

foreach (keys %total)
{
 $a2++;
 print OUT "$_\t";
 print OUT "$k27acrep1{$_}\n";
}

print "Total(protein_coding lincRNA miRNA snRNA snoRNA): $a1 $a2\n";
close OUT;

