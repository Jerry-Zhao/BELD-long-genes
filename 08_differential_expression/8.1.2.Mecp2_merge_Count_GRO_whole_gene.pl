#! /usr/local/perl -w

open(INA,"../Count_all_genes/GROseq/GROseq_WT_cortex_rep1_GRO_whole_gene_Jerry.txt")||die("Can't open INA:$!\n");
open(INB,"../Count_all_genes/GROseq/GROseq_WT_cortex_rep2_GRO_whole_gene_Jerry.txt")||die("Can't open INA:$!\n");
open(INC,"../Count_all_genes/GROseq/GROseq_R106W_cortex_rep1_GRO_whole_gene_Jerry.txt")||die("Can't open INA:$!\n");
open(IND,"../Count_all_genes/GROseq/GROseq_R106W_cortex_rep2_GRO_whole_gene_Jerry.txt")||die("Can't open INA:$!\n");
open(OUT,">Total_GROseq_cortex_whole_gene_Jerry_new.txt")||die("Can't write OUT:$!\n");



while(<INA>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+)\t(\d+)$/)
  {$id=$1; $count=$2; if($id=~/\:(\w+)\:[+|-]$/){if(($1 eq "protein_coding") or ($1 eq "lincRNA") or ($1 eq "miRNA") or ($1 eq "snRNA") or ($1 eq "snoRNA")){$wt1{$id}=$count;$total{$id}=1; $a1++;}}}
  else{print "error1 $_\n";}}
while(<INB>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+)\t(\d+)$/)
  {$id=$1; $count=$2; if($id=~/\:(\w+)\:[+|-]$/){if(($1 eq "protein_coding") or ($1 eq "lincRNA") or ($1 eq "miRNA") or ($1 eq "snRNA") or ($1 eq "snoRNA")){$wt2{$id}=$count;$total{$id}=1; $a2++;}}}
  else{print "error2 $_\n";}}
while(<INC>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+)\t(\d+)$/)
  {$id=$1; $count=$2; if($id=~/\:(\w+)\:[+|-]$/){if(($1 eq "protein_coding") or ($1 eq "lincRNA") or ($1 eq "miRNA") or ($1 eq "snRNA") or ($1 eq "snoRNA")){$r106w1{$id}=$count;$total{$id}=1; $a3++;}}}
  else{print "error3 $_\n";}}
while(<IND>){chomp;if(/^(chr[\w\.\-\+\(\)\:]+)\t(\d+)$/)
  {$id=$1; $count=$2; if($id=~/\:(\w+)\:[+|-]$/){if(($1 eq "protein_coding") or ($1 eq "lincRNA") or ($1 eq "miRNA") or ($1 eq "snRNA") or ($1 eq "snoRNA")){$r106w2{$id}=$count;$total{$id}=1; $a4++;}}}
  else{print "error4 $_\n";}}

print OUT "\tWT1\tWT2\tR106W1\tR106W2\n";
foreach (keys %total)
{
 if($_=~/^chrMT/){print "$_\n";}
 else
 {
 print OUT "$_\t";
 if(exists $wt1{$_}) {print OUT "$wt1{$_}\t";} else{print "not exists $_\n";}
 if(exists $wt2{$_}) {print OUT "$wt2{$_}\t";} else{print "not exists $_\n";}
 if(exists $r106w1{$_}) {print OUT "$r106w1{$_}\t";} else{print "not exists $_\n";}
 if(exists $r106w2{$_}) {print OUT "$r106w2{$_}\n";} else{print "not exists $_\n";}
 }
}

print "Total: $a1\t$a2\t$a3\t$a4\n";

close INA; close INB; close INC; close IND;
close OUT;

