#! /usr/local/perl -w
## merge and count the pausing index
open(INAA,"/media/Project/GRO/count/07_N2A/count/N2A_GRO_seq_GRO_TSS_30_300.txt")||die("Can't open INA:$!\n");
open(INCA,"/media/Project/GRO/count/07_N2A/count/N2A_GRO_seq_GRO_body_301_TTS.txt")||die("Can't open INC:$!\n");
while(<INAA>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$wt1tss30{$1}=$2;}else{print "error1\t$_\n";}}
while(<INCA>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$wt1tts30{$1}=$2;}else{print "error3\t$_\n";}}

open(INAP,"Merged_GROseq_whole_gene_counts_N2A_Jerry_RPKM.txt")||die("Can't open INAP: $!\n");
while(<INAP>)
{
 chomp;
 if(/^(chr[\w\.\-\(\)\+\:]+)\t[\d\.]+\t(\d+)\t([\d\.]+)$/)
 {
  $length_gene{$1}=$2;
  $rpkm{$1}=$3;
 }
 else{print "eror RPKM:$_\n";}
}

open(OUT,">Merged_GROseq_PI30_N2A_RPKM_Length_Jerry.xls")||die("Can't write OUT: $!\n");
print OUT "\t";
print OUT "RPKM_WT1\tLength\tTSS30_WT1\tBODY30_WT1\n";

foreach (keys %wt1tss30)
{
 $id=$_;
 if($id=~/^chr[\w\.\-\+\(\)\:]+\:(\w+)\:[+|-]$/)
 {
  if(($1 eq "protein_coding") or ($1 eq "lincRNA") or ($1 eq "miRNA") or ($1 eq "snRNA") or ($1 eq "snoRNA"))
  {
   print OUT "$_\t";
   print OUT "$rpkm{$_}\t$length_gene{$_}\t";
   print OUT "$wt1tss30{$_}\t$wt1tts30{$_}\n";
  }
 }
}

close OUT;


