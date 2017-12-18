#! /usr/local/perl -w
## merge and count the pausing index
open(INAA,"../../Count_all_genes/GROseq/GROseq_WT_cortex_rep1_GRO_TSS_30_300.txt")||die("Can't open INA:$!\n");
open(INCA,"../../Count_all_genes/GROseq/GROseq_WT_cortex_rep1_GRO_body_301_TTS.txt")||die("Can't open INC:$!\n");
while(<INAA>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$wt1tss30{$1}=$2;}else{print "error1\t$_\n";}}
while(<INCA>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$wt1tts30{$1}=$2;}else{print "error3\t$_\n";}}

open(INAB,"../../Count_all_genes/GROseq/GROseq_WT_cortex_rep2_GRO_TSS_30_300.txt")||die("Can't open INA:$!\n");
open(INCB,"../../Count_all_genes/GROseq/GROseq_WT_cortex_rep2_GRO_body_301_TTS.txt")||die("Can't open INC:$!\n");
while(<INAB>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$wt2tss30{$1}=$2;}else{print "error1\t$_\n";}}
while(<INCB>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$wt2tts30{$1}=$2;}else{print "error3\t$_\n";}}

open(INAC,"../../Count_all_genes/GROseq/Published/GRO_mESC_rep1_GRO_TSS_30_300.txt")||die("Can't open INA:$!\n");
open(INCC,"../../Count_all_genes/GROseq/Published/GRO_mESC_rep1_GRO_body_301_TTS.txt")||die("Can't open INC:$!\n");
while(<INAC>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$esc1tss30{$1}=$2;}else{print "error1\t$_\n";}}
while(<INCC>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$esc1tts30{$1}=$2;}else{print "error3\t$_\n";}}

open(INAD,"../../Count_all_genes/GROseq/Published/GRO_mESC_rep2_GRO_TSS_30_300.txt")||die("Can't open INA:$!\n");
open(INCD,"../../Count_all_genes/GROseq/Published/GRO_mESC_rep2_GRO_body_301_TTS.txt")||die("Can't open INC:$!\n");
while(<INAD>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$esc2tss30{$1}=$2;}else{print "error1\t$_\n";}}
while(<INCD>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$esc2tts30{$1}=$2;}else{print "error3\t$_\n";}}

open(INAE,"../../Count_all_genes/GROseq/Published/GRO_mESC_rep3_GRO_TSS_30_300.txt")||die("Can't open INA:$!\n");
open(INCE,"../../Count_all_genes/GROseq/Published/GRO_mESC_rep3_GRO_body_301_TTS.txt")||die("Can't open INC:$!\n");
while(<INAE>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$esc3tss30{$1}=$2;}else{print "error1\t$_\n";}}
while(<INCE>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$esc3tts30{$1}=$2;}else{print "error3\t$_\n";}}

open(INAF,"../../Count_all_genes/GROseq/Published/mESC_GRO_Lis_untreated_rep1_GRO_TSS_30_300.txt")||die("Can't open INA:$!\n");
open(INCF,"../../Count_all_genes/GROseq/Published/mESC_GRO_Lis_untreated_rep1_GRO_body_301_TTS.txt")||die("Can't open INC:$!\n");
while(<INAF>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$esc4tss30{$1}=$2;}else{print "error1\t$_\n";}}
while(<INCF>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$esc4tts30{$1}=$2;}else{print "error3\t$_\n";}}

open(INAG,"../../Count_all_genes/GROseq/Published/mESC_GRO_Lis_untreated_rep2_GRO_TSS_30_300.txt")||die("Can't open INA:$!\n");
open(INCG,"../../Count_all_genes/GROseq/Published/mESC_GRO_Lis_untreated_rep2_GRO_body_301_TTS.txt")||die("Can't open INC:$!\n");
while(<INAG>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$esc5tss30{$1}=$2;}else{print "error1\t$_\n";}}
while(<INCG>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$esc5tts30{$1}=$2;}else{print "error3\t$_\n";}}

open(INAH,"../../Count_all_genes/GROseq/Published/mESC_GRO_Young_YY1_GRO_TSS_30_300.txt")||die("Can't open INA:$!\n");
open(INCH,"../../Count_all_genes/GROseq/Published/mESC_GRO_Young_YY1_GRO_body_301_TTS.txt")||die("Can't open INC:$!\n");
while(<INAH>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$esc6tss30{$1}=$2;}else{print "error1\t$_\n";}}
while(<INCH>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$esc6tts30{$1}=$2;}else{print "error3\t$_\n";}}




open(INAP,"Merged_GROseq_whole_gene_counts_Cortex_mESC_Jerry_RPKM.txt")||die("Can't open INAP: $!\n");
while(<INAP>)
{
 chomp;
 if(/^(chr[\w\.\-\(\)\+\:]+)\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t(\d+)\t([\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+)$/)
 {
  $length_gene{$1}=$2;
  $rpkm{$1}=$3;
 }
 else{print "eror RPKM:$_\n";}
}

open(OUT,">Merged_GROseq_PI30_Cortex_mESC_RPKM_Length_Jerry.xls")||die("Can't write OUT: $!\n");
print OUT "\t";
print OUT "RPKM_WT1\tRPKM_WT2\tRPKM_mESC1\tRPKM_mESC2\tRPKM_mESC3\tRPKM_mESC_GRO_Lis_untreated_rep1\tRPKM_mESC_GRO_Lis_untreated_rep2\tRPKM_mESC_GRO_Young_YY1\t";
print OUT "Length\t";
print OUT "TSS30_WT1\tBODY30_WT1\tTSS30_WT2\tBODY30_WT2\tTSS30_mESC1\tBODY30_mESC1\tTSS30_mESC2\tBODY30_mESC2\tTSS30_mESC3\tBODY30_mESC3\t";
print OUT "TSS30_mESC_GRO_Lis_untreated_rep1\tBODY30_mESC_GRO_Lis_untreated_rep1\tTSS30_mESC_GRO_Lis_untreated_rep2\tBODY30_mESC_GRO_Lis_untreated_rep2\tTSS30_mESC_GRO_Young_YY1\tBODY30_mESC_GRO_Young_YY1\n";

foreach (keys %wt1tss30)
{
 $id=$_;
 if($id=~/^chr[\w\.\-\+\(\)\:]+\:(\w+)\:[+|-]$/)
 {
  if(($1 eq "protein_coding") or ($1 eq "lincRNA") or ($1 eq "miRNA") or ($1 eq "snRNA") or ($1 eq "snoRNA"))
  {
   print OUT "$_\t";
   print OUT "$rpkm{$_}\t$length_gene{$_}\t";
#### promoter body raw count
   print OUT "$wt1tss30{$_}\t$wt1tts30{$_}\t$wt2tss30{$_}\t$wt2tts30{$_}\t";
   print OUT "$esc1tss30{$_}\t$esc1tts30{$_}\t$esc2tss30{$_}\t$esc2tts30{$_}\t$esc3tss30{$_}\t$esc3tts30{$_}\t";
   print OUT "$esc4tss30{$_}\t$esc4tts30{$_}\t$esc5tss30{$_}\t$esc5tts30{$_}\t$esc6tss30{$_}\t$esc6tts30{$_}\n";
  }
 }
}

close OUT;


