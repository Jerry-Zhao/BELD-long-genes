#! /usr/local/perl -w
## merge the counts to normalizations

open(INA,"count/N2A_GRO_seq_GRO_whole_gene_Jerry.txt")||die("Can't open INA;$!\n");
open(OUT,">Merged_GROseq_whole_gene_counts_N2A_Jerry.txt")||die("Can't write OUT:$!\n");

while(<INA>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+\:)(\w+)(\:[+|-])\t(\d+)$/){$id="$1$2$3";if(($2 eq "protein_coding") or ($2 eq "lincRNA") or ($2 eq "miRNA") or ($2 eq "snRNA") or ($2 eq "snoRNA"))
{$wt1{$id}=$4;$total{$id}=1; $a1++;}}else{print "error1 $_\n";}}

print OUT "\tWT1\n";
foreach (keys %total)
{
 $a2++;
 print OUT "$_\t$wt1{$_}\n";
}

print "Total(protein_coding lincRNA miRNA snRNA snoRNA): $a1 $a2\n";
close OUT;

