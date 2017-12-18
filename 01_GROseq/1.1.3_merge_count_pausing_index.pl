#! /usr/local/perl -w
## merge and count the pausing index
open(INAA,"../../Count_all_genes/GROseq/GROseq_WT_cortex_rep1_GRO_TSS_30_300.txt")||die("Can't open INA:$!\n");
open(INBA,"../../Count_all_genes/GROseq/GROseq_WT_cortex_rep1_GRO_TSS_500_500.txt")||die("Can't open INB:$!\n");
open(INCA,"../../Count_all_genes/GROseq/GROseq_WT_cortex_rep1_GRO_body_301_TTS.txt")||die("Can't open INC:$!\n");
open(INDA,"../../Count_all_genes/GROseq/GROseq_WT_cortex_rep1_GRO_body_501_TTS.txt")||die("Can't open IND:$!\n");
while(<INAA>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$wt1tss30{$1}=$2;}else{print "error1\t$_\n";}}
while(<INBA>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$wt1tss500{$1}=$2;}else{print "error2\t$_\n";}}
while(<INCA>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$wt1tts30{$1}=$2;}else{print "error3\t$_\n";}}
while(<INDA>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$wt1tts500{$1}=$2;}else{print "error4\t$_\n";}}

open(INAB,"../../Count_all_genes/GROseq/GROseq_WT_cortex_rep2_GRO_TSS_30_300.txt")||die("Can't open INA:$!\n");
open(INBB,"../../Count_all_genes/GROseq/GROseq_WT_cortex_rep2_GRO_TSS_500_500.txt")||die("Can't open INB:$!\n");
open(INCB,"../../Count_all_genes/GROseq/GROseq_WT_cortex_rep2_GRO_body_301_TTS.txt")||die("Can't open INC:$!\n");
open(INDB,"../../Count_all_genes/GROseq/GROseq_WT_cortex_rep2_GRO_body_501_TTS.txt")||die("Can't open IND:$!\n");
while(<INAB>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$wt2tss30{$1}=$2;}else{print "error1\t$_\n";}}
while(<INBB>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$wt2tss500{$1}=$2;}else{print "error2\t$_\n";}}
while(<INCB>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$wt2tts30{$1}=$2;}else{print "error3\t$_\n";}}
while(<INDB>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$wt2tts500{$1}=$2;}else{print "error4\t$_\n";}}

open(INAC,"../../Count_all_genes/GROseq/GROseq_R106W_cortex_rep1_GRO_TSS_30_300.txt")||die("Can't open INA:$!\n");
open(INBC,"../../Count_all_genes/GROseq/GROseq_R106W_cortex_rep1_GRO_TSS_500_500.txt")||die("Can't open INB:$!\n");
open(INCC,"../../Count_all_genes/GROseq/GROseq_R106W_cortex_rep1_GRO_body_301_TTS.txt")||die("Can't open INC:$!\n");
open(INDC,"../../Count_all_genes/GROseq/GROseq_R106W_cortex_rep1_GRO_body_501_TTS.txt")||die("Can't open IND:$!\n");
while(<INAC>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$r106w1tss30{$1}=$2;}else{print "error1\t$_\n";}}
while(<INBC>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$r106w1tss500{$1}=$2;}else{print "error2\t$_\n";}}
while(<INCC>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$r106w1tts30{$1}=$2;}else{print "error3\t$_\n";}}
while(<INDC>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$r106w1tts500{$1}=$2;}else{print "error4\t$_\n";}}

open(INAD,"../../Count_all_genes/GROseq/GROseq_R106W_cortex_rep2_GRO_TSS_30_300.txt")||die("Can't open INA:$!\n");
open(INBD,"../../Count_all_genes/GROseq/GROseq_R106W_cortex_rep2_GRO_TSS_500_500.txt")||die("Can't open INB:$!\n");
open(INCD,"../../Count_all_genes/GROseq/GROseq_R106W_cortex_rep2_GRO_body_301_TTS.txt")||die("Can't open INC:$!\n");
open(INDD,"../../Count_all_genes/GROseq/GROseq_R106W_cortex_rep2_GRO_body_501_TTS.txt")||die("Can't open IND:$!\n");
while(<INAD>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$r106w2tss30{$1}=$2;}else{print "error1\t$_\n";}}
while(<INBD>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$r106w2tss500{$1}=$2;}else{print "error2\t$_\n";}}
while(<INCD>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$r106w2tts30{$1}=$2;}else{print "error3\t$_\n";}}
while(<INDD>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$r106w2tts500{$1}=$2;}else{print "error4\t$_\n";}}


 
open(INAE,"../../Count_all_genes/GROseq/Published/GRO_AtT20_GRO_TSS_30_300.txt")||die("Can't open INA:$!\n");
open(INBE,"../../Count_all_genes/GROseq/Published/GRO_AtT20_GRO_TSS_500_500.txt")||die("Can't open INB:$!\n");
open(INCE,"../../Count_all_genes/GROseq/Published/GRO_AtT20_GRO_body_301_TTS.txt")||die("Can't open INC:$!\n");
open(INDE,"../../Count_all_genes/GROseq/Published/GRO_AtT20_GRO_body_501_TTS.txt")||die("Can't open IND:$!\n");
while(<INAE>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$att20tss30{$1}=$2;}else{print "error1\t$_\n";}}
while(<INBE>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$att20tss500{$1}=$2;}else{print "error2\t$_\n";}}
while(<INCE>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$att20tts30{$1}=$2;}else{print "error3\t$_\n";}}
while(<INDE>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$att20tts500{$1}=$2;}else{print "error4\t$_\n";}}

open(INAF,"../../Count_all_genes/GROseq/Published/GRO_Heart_GRO_TSS_30_300.txt")||die("Can't open INA:$!\n");
open(INBF,"../../Count_all_genes/GROseq/Published/GRO_Heart_GRO_TSS_500_500.txt")||die("Can't open INB:$!\n");
open(INCF,"../../Count_all_genes/GROseq/Published/GRO_Heart_GRO_body_301_TTS.txt")||die("Can't open INC:$!\n");
open(INDF,"../../Count_all_genes/GROseq/Published/GRO_Heart_GRO_body_501_TTS.txt")||die("Can't open IND:$!\n");
while(<INAF>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$hearttss30{$1}=$2;}else{print "error1\t$_\n";}}
while(<INBF>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$hearttss500{$1}=$2;}else{print "error2\t$_\n";}}
while(<INCF>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$hearttts30{$1}=$2;}else{print "error3\t$_\n";}}
while(<INDF>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$hearttts500{$1}=$2;}else{print "error4\t$_\n";}}

open(INAG,"../../Count_all_genes/GROseq/Published/GRO_macrophase_rep1_GRO_TSS_30_300.txt")||die("Can't open INA:$!\n");
open(INBG,"../../Count_all_genes/GROseq/Published/GRO_macrophase_rep1_GRO_TSS_500_500.txt")||die("Can't open INB:$!\n");
open(INCG,"../../Count_all_genes/GROseq/Published/GRO_macrophase_rep1_GRO_body_301_TTS.txt")||die("Can't open INC:$!\n");
open(INDG,"../../Count_all_genes/GROseq/Published/GRO_macrophase_rep1_GRO_body_501_TTS.txt")||die("Can't open IND:$!\n");
while(<INAG>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$macro1tss30{$1}=$2;}else{print "error1\t$_\n";}}
while(<INBG>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$macro1tss500{$1}=$2;}else{print "error2\t$_\n";}}
while(<INCG>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$macro1tts30{$1}=$2;}else{print "error3\t$_\n";}}
while(<INDG>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$macro1tts500{$1}=$2;}else{print "error4\t$_\n";}}

open(INAH,"../../Count_all_genes/GROseq/Published/GRO_macrophase_rep2_GRO_TSS_30_300.txt")||die("Can't open INA:$!\n");
open(INBH,"../../Count_all_genes/GROseq/Published/GRO_macrophase_rep2_GRO_TSS_500_500.txt")||die("Can't open INB:$!\n");
open(INCH,"../../Count_all_genes/GROseq/Published/GRO_macrophase_rep2_GRO_body_301_TTS.txt")||die("Can't open INC:$!\n");
open(INDH,"../../Count_all_genes/GROseq/Published/GRO_macrophase_rep2_GRO_body_501_TTS.txt")||die("Can't open IND:$!\n");
while(<INAH>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$macro2tss30{$1}=$2;}else{print "error1\t$_\n";}}
while(<INBH>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$macro2tss500{$1}=$2;}else{print "error2\t$_\n";}}
while(<INCH>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$macro2tts30{$1}=$2;}else{print "error3\t$_\n";}}
while(<INDH>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$macro2tts500{$1}=$2;}else{print "error4\t$_\n";}}

open(INAI,"../../Count_all_genes/GROseq/Published/GRO_MEF_rep1_GRO_TSS_30_300.txt")||die("Can't open INA:$!\n");
open(INBI,"../../Count_all_genes/GROseq/Published/GRO_MEF_rep1_GRO_TSS_500_500.txt")||die("Can't open INB:$!\n");
open(INCI,"../../Count_all_genes/GROseq/Published/GRO_MEF_rep1_GRO_body_301_TTS.txt")||die("Can't open INC:$!\n");
open(INDI,"../../Count_all_genes/GROseq/Published/GRO_MEF_rep1_GRO_body_501_TTS.txt")||die("Can't open IND:$!\n");
while(<INAI>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$mef1tss30{$1}=$2;}else{print "error1\t$_\n";}}
while(<INBI>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$mef1tss500{$1}=$2;}else{print "error2\t$_\n";}}
while(<INCI>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$mef1tts30{$1}=$2;}else{print "error3\t$_\n";}}
while(<INDI>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$mef1tts500{$1}=$2;}else{print "error4\t$_\n";}}

open(INAJ,"../../Count_all_genes/GROseq/Published/GRO_MEF_rep2_GRO_TSS_30_300.txt")||die("Can't open INA:$!\n");
open(INBJ,"../../Count_all_genes/GROseq/Published/GRO_MEF_rep2_GRO_TSS_500_500.txt")||die("Can't open INB:$!\n");
open(INCJ,"../../Count_all_genes/GROseq/Published/GRO_MEF_rep2_GRO_body_301_TTS.txt")||die("Can't open INC:$!\n");
open(INDJ,"../../Count_all_genes/GROseq/Published/GRO_MEF_rep2_GRO_body_501_TTS.txt")||die("Can't open IND:$!\n");
while(<INAJ>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$mef2tss30{$1}=$2;}else{print "error1\t$_\n";}}
while(<INBJ>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$mef2tss500{$1}=$2;}else{print "error2\t$_\n";}}
while(<INCJ>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$mef2tts30{$1}=$2;}else{print "error3\t$_\n";}}
while(<INDJ>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$mef2tts500{$1}=$2;}else{print "error4\t$_\n";}}

open(INAK,"../../Count_all_genes/GROseq/Published/GRO_mESC_rep1_GRO_TSS_30_300.txt")||die("Can't open INA:$!\n");
open(INBK,"../../Count_all_genes/GROseq/Published/GRO_mESC_rep1_GRO_TSS_500_500.txt")||die("Can't open INB:$!\n");
open(INCK,"../../Count_all_genes/GROseq/Published/GRO_mESC_rep1_GRO_body_301_TTS.txt")||die("Can't open INC:$!\n");
open(INDK,"../../Count_all_genes/GROseq/Published/GRO_mESC_rep1_GRO_body_501_TTS.txt")||die("Can't open IND:$!\n");
while(<INAK>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$esc1tss30{$1}=$2;}else{print "error1\t$_\n";}}
while(<INBK>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$esc1tss500{$1}=$2;}else{print "error2\t$_\n";}}
while(<INCK>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$esc1tts30{$1}=$2;}else{print "error3\t$_\n";}}
while(<INDK>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$esc1tts500{$1}=$2;}else{print "error4\t$_\n";}}

open(INAL,"../../Count_all_genes/GROseq/Published/GRO_mESC_rep2_GRO_TSS_30_300.txt")||die("Can't open INA:$!\n");
open(INBL,"../../Count_all_genes/GROseq/Published/GRO_mESC_rep2_GRO_TSS_500_500.txt")||die("Can't open INB:$!\n");
open(INCL,"../../Count_all_genes/GROseq/Published/GRO_mESC_rep2_GRO_body_301_TTS.txt")||die("Can't open INC:$!\n");
open(INDL,"../../Count_all_genes/GROseq/Published/GRO_mESC_rep2_GRO_body_501_TTS.txt")||die("Can't open IND:$!\n");
while(<INAL>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$esc2tss30{$1}=$2;}else{print "error1\t$_\n";}}
while(<INBL>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$esc2tss500{$1}=$2;}else{print "error2\t$_\n";}}
while(<INCL>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$esc2tts30{$1}=$2;}else{print "error3\t$_\n";}}
while(<INDL>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$esc2tts500{$1}=$2;}else{print "error4\t$_\n";}}

open(INAM,"../../Count_all_genes/GROseq/Published/GRO_mESC_rep3_GRO_TSS_30_300.txt")||die("Can't open INA:$!\n");
open(INBM,"../../Count_all_genes/GROseq/Published/GRO_mESC_rep3_GRO_TSS_500_500.txt")||die("Can't open INB:$!\n");
open(INCM,"../../Count_all_genes/GROseq/Published/GRO_mESC_rep3_GRO_body_301_TTS.txt")||die("Can't open INC:$!\n");
open(INDM,"../../Count_all_genes/GROseq/Published/GRO_mESC_rep3_GRO_body_501_TTS.txt")||die("Can't open IND:$!\n");
while(<INAM>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$esc3tss30{$1}=$2;}else{print "error1\t$_\n";}}
while(<INBM>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$esc3tss500{$1}=$2;}else{print "error2\t$_\n";}}
while(<INCM>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$esc3tts30{$1}=$2;}else{print "error3\t$_\n";}}
while(<INDM>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$esc3tts500{$1}=$2;}else{print "error4\t$_\n";}}

open(INAN,"../../Count_all_genes/GROseq/Published/GRO_primary_neurons_GRO_TSS_30_300.txt")||die("Can't open INA:$!\n");
open(INBN,"../../Count_all_genes/GROseq/Published/GRO_primary_neurons_GRO_TSS_500_500.txt")||die("Can't open INB:$!\n");
open(INCN,"../../Count_all_genes/GROseq/Published/GRO_primary_neurons_GRO_body_301_TTS.txt")||die("Can't open INC:$!\n");
open(INDN,"../../Count_all_genes/GROseq/Published/GRO_primary_neurons_GRO_body_501_TTS.txt")||die("Can't open IND:$!\n");
while(<INAN>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$neurontss30{$1}=$2;}else{print "error1\t$_\n";}}
while(<INBN>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$neurontss500{$1}=$2;}else{print "error2\t$_\n";}}
while(<INCN>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$neurontts30{$1}=$2;}else{print "error3\t$_\n";}}
while(<INDN>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$neurontts500{$1}=$2;}else{print "error4\t$_\n";}}

open(INAO,"../../Count_all_genes/GROseq/Published/GRO_White_Adipose_GRO_TSS_30_300.txt")||die("Can't open INA:$!\n");
open(INBO,"../../Count_all_genes/GROseq/Published/GRO_White_Adipose_GRO_TSS_500_500.txt")||die("Can't open INB:$!\n");
open(INCO,"../../Count_all_genes/GROseq/Published/GRO_White_Adipose_GRO_body_301_TTS.txt")||die("Can't open INC:$!\n");
open(INDO,"../../Count_all_genes/GROseq/Published/GRO_White_Adipose_GRO_body_501_TTS.txt")||die("Can't open IND:$!\n");
while(<INAO>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$adiposetss30{$1}=$2;}else{print "error1\t$_\n";}}
while(<INBO>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$adiposetss500{$1}=$2;}else{print "error2\t$_\n";}}
while(<INCO>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$adiposetts30{$1}=$2;}else{print "error3\t$_\n";}}
while(<INDO>){chomp;if(/^(chr[\w\.\-\(\)\:\+]+)\t(\d+)$/){$adiposetts500{$1}=$2;}else{print "error4\t$_\n";}}


open(INAP,"Merged_GROseq_whole_gene_counts_Jerry_RPKM.txt")||die("Can't open INAP: $!\n");
while(<INAP>)
{
 chomp;
 if(/^(chr[\w\.\-\(\)\+\:]+)\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t(\d+)\t([\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+)$/)
 {
  $length_gene{$1}=$2;
  $rpkm{$1}=$3;
 }
 else{print "eror RPKM:$_\n";}
}

open(OUT,">Merged_GROseq_Pausing_Index_RPKM_Length_Jerry.xls")||die("Can't write OUT: $!\n");
print OUT "\t";
#print OUT "PI30_WT1\tPI30_WT2\tPI30_R106W1\tPI30_R106W2\tPI30_AtT20\tPI30_Heart\tPI30_Macrophase1\tPI30_Macrophase2\tPI30_MEF1\tPI30_MEF2\tPI30_mESC1\tPI30_mESC2\tPI30_mESC3\tPI30_Primary_neurons\tPI30_White_Adipose\t";
#print OUT "PI500_WT1\tPI500_WT2\tPI500_R106W1\tPI500_R106W2\tPI500_AtT20\tPI500_Heart\tPI500_Macrophase1\tPI500_Macrophase2\tPI500_MEF1\tPI500_MEF2\tPI500_mESC1\tPI500_mESC2\tPI500_mESC3\tPI500_Primary_neurons\tPI500_White_Adipose\t";
print OUT "RPKM_WT1\tRPKM_WT2\tRPKM_R106W1\tRPKM_R106W2\tRPKM_AtT20\tRPKM_Heart\tRPKM_Macrophase1\tRPKM_Macrophase2\tRPKM_MEF1\tRPKM_MEF2\tRPKM_mESC1\tRPKM_mESC2\tRPKM_mESC3\tRPKM_Primary_neurons\tRPKM_White_Adipose\t";
print OUT "Length\t";

print OUT "Ds_TSS30_WT1\tDs_BODY30_WT1\tDs_TSS30_WT2\tDs_BODY30_WT2\tDs_TSS30_R106W1\tDs_BODY30_R106W1\tDs_TSS30_R106W2\tDs_BODY30_R106W2\tDs_TSS30_AtT20\tDs_BODY30_AtT20\tDs_TSS30_Heart\tDs_BODY30_Heart\tDs_TSS30_Macrophase1\tDs_BODY30_Macrophase1\tDs_TSS30_Macrophase2\tDs_BODY30_Macrophase2\t";
print OUT "Ds_TSS30_MEF1\tDs_BODY30_MEF1\tDs_TSS30_MEF2\tDs_BODY30_MEF2\tDs_TSS30_mESC1\tDs_BODY30_mESC1\tDs_TSS30_mESC2\tDs_BODY30_mESC2\tDs_TSS30_mESC3\tDs_BODY30_mESC3\tDs_TSS30_Primary_neurons\tDs_BODY30_Primary_neurons\tDs_TSS30_White_Adipose\tDs_BODY30_White_Adipose\t";
print OUT "Ds_TSS500_WT1\tDs_BODY500_WT1\tDs_TSS500_WT2\tDs_BODY500_WT2\tDs_TSS500_R106W1\tDs_BODY500_R106W1\tDs_TSS500_R106W2\tDs_BODY500_R106W2\tDs_TSS500_AtT20\tDs_BODY500_AtT20\tDs_TSS500_Heart\tDs_BODY500_Heart\tDs_TSS500_Macrophase1\tDs_BODY500_Macrophase1\tDs_TSS500_Macrophase2\tDs_BODY500_Macrophase2\t";
print OUT "Ds_TSS500_MEF1\tDs_BODY500_MEF1\tDs_TSS500_MEF2\tDs_BODY500_MEF2\tDs_TSS500_mESC1\tDs_BODY500_mESC1\tDs_TSS500_mESC2\tDs_BODY500_mESC2\tDs_TSS500_mESC3\tDs_BODY500_mESC3\tDs_TSS500_Primary_neurons\tDs_BODY500_Primary_neurons\tDs_TSS500_White_Adipose\tDs_BODY500_White_Adipose\t";

print OUT "TSS30_WT1\tBODY30_WT1\tTSS30_WT2\tBODY30_WT2\tTSS30_R106W1\tBODY30_R106W1\tTSS30_R106W2\tBODY30_R106W2\tTSS30_AtT20\tBODY30_AtT20\tTSS30_Heart\tBODY30_Heart\tTSS30_Macrophase1\tBODY30_Macrophase1\tTSS30_Macrophase2\tBODY30_Macrophase2\t";
print OUT "TSS30_MEF1\tBODY30_MEF1\tTSS30_MEF2\tBODY30_MEF2\tTSS30_mESC1\tBODY30_mESC1\tTSS30_mESC2\tBODY30_mESC2\tTSS30_mESC3\tBODY30_mESC3\tTSS30_Primary_neurons\tBODY30_Primary_neurons\tTSS30_White_Adipose\tBODY30_White_Adipose\t";
print OUT "TSS500_WT1\tBODY500_WT1\tTSS500_WT2\tBODY500_WT2\tTSS500_R106W1\tBODY500_R106W1\tTSS500_R106W2\tBODY500_R106W2\tTSS500_AtT20\tBODY500_AtT20\tTSS500_Heart\tBODY500_Heart\tTSS500_Macrophase1\tBODY500_Macrophase1\tTSS500_Macrophase2\tBODY500_Macrophase2\t";
print OUT "TSS500_MEF1\tBODY500_MEF1\tTSS500_MEF2\tBODY500_MEF2\tTSS500_mESC1\tBODY500_mESC1\tTSS500_mESC2\tBODY500_mESC2\tTSS500_mESC3\tBODY500_mESC3\tTSS500_Primary_neurons\tBODY500_Primary_neurons\tTSS500_White_Adipose\tBODY500_White_Adipose\n";

foreach (keys %wt1tss30)
{
 $id=$_;
 if($id=~/^chr[\w\.\-\+\(\)\:]+\:(\w+)\:[+|-]$/)
 {
  if(($1 eq "protein_coding") or ($1 eq "lincRNA") or ($1 eq "miRNA") or ($1 eq "snRNA") or ($1 eq "snoRNA"))
  {
#   print "working on gene: $_\tLength $length_gene{$_}\n";
   print OUT "$_\t";
 ## Pausing index: density in TSS VS density in rest gene body
 ## TSS: -30 +300
# $pi30_wt1=int((($wt1tss30{$_}/330)/($wt1tts30{$_}/($length_gene{$_}-300)))*100)/100;
# $pi30_wt2=int((($wt2tss30{$_}/330)/($wt2tts30{$_}/($length_gene{$_}-300)))*100)/100;
# $pi30_r106w1=int((($r106w1tss30{$_}/330)/($r106w1tts30{$_}/($length_gene{$_}-300)))*100)/100;
# $pi30_r106w2=int((($r106w2tss30{$_}/330)/($r106w2tts30{$_}/($length_gene{$_}-300)))*100)/100;

# $pi30_att20=int((($att20tss30{$_}/330)/($att20tts30{$_}/($length_gene{$_}-300)))*100)/100;
# $pi30_heart=int((($hearttss30{$_}/330)/($hearttts30{$_}/($length_gene{$_}-300)))*100)/100;
# $pi30_macro1=int((($macro1tss30{$_}/330)/($macro1tts30{$_}/($length_gene{$_}-300)))*100)/100;
# $pi30_macro2=int((($macro2tss30{$_}/330)/($macro2tts30{$_}/($length_gene{$_}-300)))*100)/100;
# $pi30_mef1=int((($mef1tss30{$_}/330)/($mef1tts30{$_}/($length_gene{$_}-300)))*100)/100;
# $pi30_mef2=int((($mef2tss30{$_}/330)/($mef2tts30{$_}/($length_gene{$_}-300)))*100)/100;
# $pi30_esc1=int((($esc1tss30{$_}/330)/($esc1tts30{$_}/($length_gene{$_}-300)))*100)/100;
# $pi30_esc2=int((($esc2tss30{$_}/330)/($esc2tts30{$_}/($length_gene{$_}-300)))*100)/100;
# $pi30_esc3=int((($esc3tss30{$_}/330)/($esc3tts30{$_}/($length_gene{$_}-300)))*100)/100;
# $pi30_neuron=int((($neurontss30{$_}/330)/($neurontts30{$_}/($length_gene{$_}-300)))*100)/100;
# $pi30_adipose=int((($adiposetss30{$_}/330)/($adiposetts30{$_}/($length_gene{$_}-300)))*100)/100;

 ## TSS: -500 +500
# $pi500_wt1=int((($wt1tss500{$_}/1000)/($wt1tts500{$_}/($length_gene{$_}-500)))*100)/100;
# $pi500_wt2=int((($wt2tss500{$_}/1000)/($wt2tts500{$_}/($length_gene{$_}-500)))*100)/100;
# $pi500_r106w1=int((($r106w1tss500{$_}/1000)/($r106w1tts500{$_}/($length_gene{$_}-500)))*100)/100;
# $pi500_r106w2=int((($r106w2tss500{$_}/1000)/($r106w2tts500{$_}/($length_gene{$_}-500)))*100)/100;

# $pi500_att20=int((($att20tss500{$_}/1000)/($att20tts500{$_}/($length_gene{$_}-500)))*100)/100;
# $pi500_heart=int((($hearttss500{$_}/1000)/($hearttts500{$_}/($length_gene{$_}-500)))*100)/100;
# $pi500_macro1=int((($macro1tss500{$_}/1000)/($macro1tts500{$_}/($length_gene{$_}-500)))*100)/100;
# $pi500_macro2=int((($macro2tss500{$_}/1000)/($macro2tts500{$_}/($length_gene{$_}-500)))*100)/100;
# $pi500_mef1=int((($mef1tss500{$_}/1000)/($mef1tts500{$_}/($length_gene{$_}-500)))*100)/100;
# $pi500_mef2=int((($mef2tss500{$_}/1000)/($mef2tts500{$_}/($length_gene{$_}-500)))*100)/100;
# $pi500_esc1=int((($esc1tss500{$_}/1000)/($esc1tts500{$_}/($length_gene{$_}-500)))*100)/100;
# $pi500_esc2=int((($esc2tss500{$_}/1000)/($esc2tts500{$_}/($length_gene{$_}-500)))*100)/100;
# $pi500_esc3=int((($esc3tss500{$_}/1000)/($esc3tts500{$_}/($length_gene{$_}-500)))*100)/100;
# $pi500_neuron=int((($neurontss500{$_}/1000)/($neurontts500{$_}/($length_gene{$_}-500)))*100)/100;
# $pi500_adipose=int((($adiposetss500{$_}/1000)/($adiposetts500{$_}/($length_gene{$_}-500)))*100)/100;

# print OUT "$pi30_wt1\t$pi30_wt2\t$pi30_r106w1\t$pi30_r106w2\t$pi30_att20\t$pi30_heart\t$pi30_macro1\t";
# print OUT "$pi30_macro2\t$pi30_mef1\t$pi30_mef2\t$pi30_esc1\t$pi30_esc2\t$pi30_esc3\t$pi30_neuron\t$pi30_adipose\t";

# print OUT "$pi500_wt1\t$pi500_wt2\t$pi500_r106w1\t$pi500_r106w2\t$pi500_att20\t$pi500_heart\t$pi500_macro1\t$pi500_macro2\t$pi500_mef1\t";
# print OUT "$pi500_mef2\t$pi500_esc1\t$pi500_esc2\t$pi500_esc3\t$pi500_neuron\t$pi500_adipose\t";

#   if(exists $rpkm{$_}){print OUT "$rpkm{$_}\t$length_gene{$_}\t";}else{print "error not exists Length-gene: $_\n";}
   print OUT "$rpkm{$_}\t$length_gene{$_}\t";


#### promoter body: density
   print OUT $wt1tss30{$_}/330,"\t",$wt1tts30{$_}/($length_gene{$_}-300),"\t";
   print OUT $wt2tss30{$_}/330,"\t",$wt2tts30{$_}/($length_gene{$_}-300),"\t";
   print OUT $r106w1tss30{$_}/330,"\t",$r106w1tts30{$_}/($length_gene{$_}-300),"\t";
   print OUT $r106w2tss30{$_}/330,"\t",$r106w2tts30{$_}/($length_gene{$_}-300),"\t";
   print OUT $att20tss30{$_}/330,"\t",$att20tts30{$_}/($length_gene{$_}-300),"\t";
   print OUT $hearttss30{$_}/330,"\t",$hearttts30{$_}/($length_gene{$_}-300),"\t";
   print OUT $macro1tss30{$_}/330,"\t",$macro1tts30{$_}/($length_gene{$_}-300),"\t";
   print OUT $macro2tss30{$_}/330,"\t",$macro2tts30{$_}/($length_gene{$_}-300),"\t";
   print OUT $mef1tss30{$_}/330,"\t",$mef1tts30{$_}/($length_gene{$_}-300),"\t";
   print OUT $mef2tss30{$_}/330,"\t",$mef2tts30{$_}/($length_gene{$_}-300),"\t";
   print OUT $esc1tss30{$_}/330,"\t",$esc1tts30{$_}/($length_gene{$_}-300),"\t";
   print OUT $esc2tss30{$_}/330,"\t",$esc2tts30{$_}/($length_gene{$_}-300),"\t";
   print OUT $esc3tss30{$_}/330,"\t",$esc3tts30{$_}/($length_gene{$_}-300),"\t";
   print OUT $neurontss30{$_}/330,"\t",$neurontts30{$_}/($length_gene{$_}-300),"\t";
   print OUT $adiposetss30{$_}/330,"\t",$adiposetts30{$_}/($length_gene{$_}-300),"\t";

   print OUT $wt1tss500{$_}/1000,"\t",$wt1tts500{$_}/($length_gene{$_}-500),"\t";
   print OUT $wt2tss500{$_}/1000,"\t",$wt2tts500{$_}/($length_gene{$_}-500),"\t";
   print OUT $r106w1tss500{$_}/1000,"\t",$r106w1tts500{$_}/($length_gene{$_}-500),"\t";
   print OUT $r106w2tss500{$_}/1000,"\t",$r106w2tts500{$_}/($length_gene{$_}-500),"\t";
   print OUT $att20tss500{$_}/1000,"\t",$att20tts500{$_}/($length_gene{$_}-500),"\t";
   print OUT $hearttss500{$_}/1000,"\t",$hearttts500{$_}/($length_gene{$_}-500),"\t";
   print OUT $macro1tss500{$_}/1000,"\t",$macro1tts500{$_}/($length_gene{$_}-500),"\t";
   print OUT $macro2tss500{$_}/1000,"\t",$macro2tts500{$_}/($length_gene{$_}-500),"\t";
   print OUT $mef1tss500{$_}/1000,"\t",$mef1tts500{$_}/($length_gene{$_}-500),"\t";
   print OUT $mef2tss500{$_}/1000,"\t",$mef2tts500{$_}/($length_gene{$_}-500),"\t";
   print OUT $esc1tss500{$_}/1000,"\t",$esc1tts500{$_}/($length_gene{$_}-500),"\t";
   print OUT $esc2tss500{$_}/1000,"\t",$esc2tts500{$_}/($length_gene{$_}-500),"\t";
   print OUT $esc3tss500{$_}/1000,"\t",$esc3tts500{$_}/($length_gene{$_}-500),"\t";
   print OUT $neurontss500{$_}/1000,"\t",$neurontts500{$_}/($length_gene{$_}-500),"\t";
   print OUT $adiposetss500{$_}/1000,"\t",$adiposetts500{$_}/($length_gene{$_}-500),"\t";

#### promoter body raw count
   print OUT "$wt1tss30{$_}\t$wt1tts30{$_}\t$wt2tss30{$_}\t$wt2tts30{$_}\t$r106w1tss30{$_}\t$r106w1tts30{$_}\t$r106w2tss30{$_}\t$r106w2tts30{$_}\t";
   print OUT "$att20tss30{$_}\t$att20tts30{$_}\t$hearttss30{$_}\t$hearttts30{$_}\t$macro1tss30{$_}\t$macro1tts30{$_}\t$macro2tss30{$_}\t$macro2tts30{$_}\t";
   print OUT "$mef1tss30{$_}\t$mef1tts30{$_}\t$mef2tss30{$_}\t$mef2tts30{$_}\t$esc1tss30{$_}\t$esc1tts30{$_}\t$esc2tss30{$_}\t$esc2tts30{$_}\t$esc3tss30{$_}\t$esc3tts30{$_}\t";
   print OUT "$neurontss30{$_}\t$neurontts30{$_}\t$adiposetss30{$_}\t$adiposetts30{$_}\t";

   print OUT "$wt1tss500{$_}\t$wt1tts500{$_}\t$wt2tss500{$_}\t$wt2tts500{$_}\t$r106w1tss500{$_}\t$r106w1tts500{$_}\t$r106w2tss500{$_}\t$r106w2tts500{$_}\t";
   print OUT "$att20tss500{$_}\t$att20tts500{$_}\t$hearttss500{$_}\t$hearttts500{$_}\t$macro1tss500{$_}\t$macro1tts500{$_}\t$macro2tss500{$_}\t$macro2tts500{$_}\t";
   print OUT "$mef1tss500{$_}\t$mef1tts500{$_}\t$mef2tss500{$_}\t$mef2tts500{$_}\t$esc1tss500{$_}\t$esc1tts500{$_}\t$esc2tss500{$_}\t$esc2tts500{$_}\t";
   print OUT "$esc3tss500{$_}\t$esc3tts500{$_}\t$neurontss500{$_}\t$neurontts500{$_}\t$adiposetss500{$_}\t$adiposetts500{$_}\n";


  }
 }
}
#print OUT "\t";
#print OUT "PI30_WT1\tPI30_WT2\tPI30_R106W1\tPI30_R106W2\tPI30_AtT20\tPI30_Heart\tPI30_Macrophase1\tPI30_Macrophase2\tPI30_MEF1\tPI30_MEF2\tPI30_mESC1\tPI30_mESC2\tPI30_mESC3\tPI30_Primary_neurons\tPI30_White_Adipose\t";
#print OUT "PI500_WT1\tPI500_WT2\tPI500_R106W1\tPI500_R106W2\tPI500_AtT20\tPI500_Heart\tPI500_Macrophase1\tPI500_Macrophase2\tPI500_MEF1\tPI500_MEF2\tPI500_mESC1\tPI500_mESC2\tPI500_mESC3\tPI500_Primary_neurons\tPI500_White_Adipose\t";
#print OUT "RPKM_WT1\tRPKM_WT2\tRPKM_R106W1\tRPKM_R106W2\tRPKM_AtT20\tRPKM_Heart\tRPKM_Macrophase1\tRPKM_Macrophase2\tRPKM_MEF1\tRPKM_MEF2\tRPKM_mESC1\tRPKM_mESC2\tRPKM_mESC3\tRPKM_Primary_neurons\tRPKM_White_Adipose\t";
#print OUT "Length\t";
#print OUT "TSS30_WT1\tBODY30_WT1\tTSS30_WT2\tBODY30_WT2\tTSS30_R106W1\tBODY30_R106W1\tTSS30_R106W2\tBODY30_R106W2\tTSS30_AtT20\tBODY30_AtT20\tTSS30_Heart\tBODY30_Heart\tTSS30_Macrophase1\tBODY30_Macrophase1\tTSS30_Macrophase2\tBODY30_Macrophase2\t";
#print OUT "TSS30_MEF1\tBODY30_MEF1\tTSS30_MEF2\tBODY30_MEF2\tTSS30_mESC1\tBODY30_mESC1\tTSS30_mESC2\tBODY30_mESC2\tTSS30_mESC3\tBODY30_mESC3\tTSS30_Primary_neurons\tBODY30_Primary_neurons\tTSS30_White_Adipose\tBODY30_White_Adipose\t";
#print OUT "TSS500_WT1\tBODY500_WT1\tTSS500_WT2\tBODY500_WT2\tTSS500_R106W1\tBODY500_R106W1\tTSS500_R106W2\tBODY500_R106W2\tTSS500_AtT20\tBODY500_AtT20\tTSS500_Heart\tBODY500_Heart\tTSS500_Macrophase1\tBODY500_Macrophase1\tTSS500_Macrophase2\tBODY500_Macrophase2\t";
#print OUT "TSS500_MEF1\tBODY500_MEF1\tTSS500_MEF2\tBODY500_MEF2\tTSS500_mESC1\tBODY500_mESC1\tTSS500_mESC2\tBODY500_mESC2\tTSS500_mESC3\tBODY500_mESC3\tTSS500_Primary_neurons\tBODY500_Primary_neurons\tTSS500_White_Adipose\tBODY500_White_Adipose\n";

close OUT;


