#! /usr/local/perl -w

open(IN,"../01_GROseq/Data_length_PI_cortex_WT.xls")||die("Can't open INC:$!\n");
open(INA,"../../Count_all_genes/ChIP/Mo_WT_excitatory_H3K27ac_rep1_ChIP_allgene_3kTSS3k.txt")||die("Can't open INA:$!\n");
open(INB,"../../Count_all_genes/ChIP/Mo_WT_excitatory_H3K27ac_rep2_ChIP_allgene_3kTSS3k.txt")||die("Can't open INB:$!\n");
#open(INC,"../../Count_all_genes/ChIP/Mo_WT_excitatory_H3K27me3_rep1_ChIP_allgene_3kTSS3k.txt")||die("Can't open INB:$!\n");
#open(IND,"../../Count_all_genes/ChIP/Mo_WT_excitatory_H3K27me3_rep2_ChIP_allgene_3kTSS3k.txt")||die("Can't open INB:$!\n");
open(INE,"../../Count_all_genes/ChIP/Mo_WT_excitatory_H3K4me1_rep1_ChIP_allgene_3kTSS3k.txt")||die("Can't open INB:$!\n");
open(INF,"../../Count_all_genes/ChIP/Mo_WT_excitatory_H3K4me1_rep2_ChIP_allgene_3kTSS3k.txt")||die("Can't open INB:$!\n");
#open(ING,"count/Mo_WT_excitatory_H3K4me3_rep1_ChIP_allgene_3kTSS3k.txt")||die("Can't open INB:$!\n");
#open(INH,"count/Mo_WT_excitatory_H3K4me3_rep2_ChIP_allgene_3kTSS3k.txt")||die("Can't open INB:$!\n");
#open(INI,"count/Mo_WT_excitatory_input_rep1_ChIP_allgene_3kTSS3k.txt")||die("Can't open INB:$!\n");
#open(INJ,"count/Mo_WT_excitatory_input_rep2_ChIP_allgene_3kTSS3k.txt")||die("Can't open INB:$!\n");
#open(INK,"count/Mo_WT_excitatory_input_rep3_ChIP_allgene_3kTSS3k.txt")||die("Can't open INB:$!\n");
open(INL,"../../Count_all_genes/ChIP/Our_cortex_H3K4me3_rep1_ChIP_allgene_3kTSS3k.txt")||die("Can't open INB:$!\n");
open(INM,"../../Count_all_genes/ChIP/Our_cortex_H3K4me3_rep2_ChIP_allgene_3kTSS3k.txt")||die("Can't open INB:$!\n");
open(INN,"../../Count_all_genes/ChIP/Jan2815_Brian_H3K79me2_uniq_ChIP_allgene_3kTSS3k.txt")||die("Can't open INB:$!\n");
open(INO,"../../Count_all_genes/ChIP/Jan2815_Brian_Pol2_uniq_ChIP_allgene_3kTSS3k.txt")||die("Can't open INB:$!\n");

open(INAA,"../../Count_all_genes/ChIP/ChIP_201707_WT_H3K27ac_rep1_allgene_3kTSS3k.txt")||die("Can't open INA:$!\n");
open(INAB,"../../Count_all_genes/ChIP/ChIP_201707_WT_H3K27ac_rep2_allgene_3kTSS3k.txt")||die("Can't open INB:$!\n");

open(INAC,"../../Count_all_genes/ChIP/ChIP_201707_WT_H3K36me3_rep1_allgene_3kTSS3k.txt")||die("Can't open INA:$!\n");
open(INAD,"../../Count_all_genes/ChIP/ChIP_201707_WT_H3K36me3_rep2_allgene_3kTSS3k.txt")||die("Can't open INB:$!\n");

open(INAE,"../../Count_all_genes/ChIP/ChIP_201707_WT_H3K4me1_rep1_allgene_3kTSS3k.txt")||die("Can't open INA:$!\n");
open(INAF,"../../Count_all_genes/ChIP/ChIP_201707_WT_H3K4me1_rep2_allgene_3kTSS3k.txt")||die("Can't open INB:$!\n");

open(INAG,"../../Count_all_genes/ChIP/ChIP_201707_WT_H3K4me3_rep1_allgene_3kTSS3k.txt")||die("Can't open INA:$!\n");
open(INAH,"../../Count_all_genes/ChIP/ChIP_201707_WT_H3K4me3_rep2_allgene_3kTSS3k.txt")||die("Can't open INB:$!\n");

open(INAI,"../../Count_all_genes/ChIP/ChIP_201707_WT_H3K79me2_rep1_allgene_3kTSS3k.txt")||die("Can't open INA:$!\n");
open(INAJ,"../../Count_all_genes/ChIP/ChIP_201707_WT_H3K79me2_rep2_allgene_3kTSS3k.txt")||die("Can't open INB:$!\n");

open(INAK,"../../Count_all_genes/ChIP/ChIP_201707_WT_H3K9me3_rep1_allgene_3kTSS3k.txt")||die("Can't open INA:$!\n");
open(INAL,"../../Count_all_genes/ChIP/ChIP_201707_WT_H3K9me3_rep2_allgene_3kTSS3k.txt")||die("Can't open INB:$!\n");

open(INAM,"../../Count_all_genes/ChIP/ChIP_201707_WT_H4K16ac_rep1_allgene_3kTSS3k.txt")||die("Can't open INA:$!\n");
open(INAN,"../../Count_all_genes/ChIP/ChIP_201707_WT_H4K16ac_rep2_allgene_3kTSS3k.txt")||die("Can't open INB:$!\n");

open(INAO,"../../Count_all_genes/ChIP/ChIP_201707_WT_H4K20me3_rep1_allgene_3kTSS3k.txt")||die("Can't open INA:$!\n");
open(INAP,"../../Count_all_genes/ChIP/ChIP_201707_WT_H4K20me3_rep2_allgene_3kTSS3k.txt")||die("Can't open INB:$!\n");

open(INAQ,"../../Count_all_genes/ChIP/ChIP_201707_WT_Pol2Ser2p_rep1_allgene_3kTSS3k.txt")||die("Can't open INA:$!\n");
open(INAR,"../../Count_all_genes/ChIP/ChIP_201707_WT_Pol2Ser2p_rep2_allgene_3kTSS3k.txt")||die("Can't open INB:$!\n");

open(INAS,"../../Count_all_genes/ChIP/ChIP_201707_WT_Pol2Ser5p_rep1_allgene_3kTSS3k.txt")||die("Can't open INA:$!\n");
open(INAT,"../../Count_all_genes/ChIP/ChIP_201707_WT_Pol2Ser5p_rep2_allgene_3kTSS3k.txt")||die("Can't open INB:$!\n");

open(INAU,"../../Count_all_genes/ChIP/ChIP_201707_WT_Pol2Total_rep1_allgene_3kTSS3k.txt")||die("Can't open INA:$!\n");
open(INAV,"../../Count_all_genes/ChIP/ChIP_201707_WT_Pol2Total_rep2_allgene_3kTSS3k.txt")||die("Can't open INB:$!\n");

 
open(OUA,">Mo_WT_excitatory_H3K27ac_rep1_3kTSS3k_activeGene.txt")||die("Can't write OUA:$!\n");
open(OUB,">Mo_WT_excitatory_H3K27ac_rep2_3kTSS3k_activeGene.txt")||die("Can't write OUB:$!\n");
#open(OUC,">Mo_WT_excitatory_H3K27me3_rep1_3kTSS3k_activeGene.txt")||die("Can't write OUB:$!\n");
#open(OUD,">Mo_WT_excitatory_H3K27me3_rep2_3kTSS3k_activeGene.txt")||die("Can't write OUB:$!\n");
open(OUE,">Mo_WT_excitatory_H3K4me1_rep1_3kTSS3k_activeGene.txt")||die("Can't write OUB:$!\n");
open(OUF,">Mo_WT_excitatory_H3K4me1_rep2_3kTSS3k_activeGene.txt")||die("Can't write OUB:$!\n");
#open(OUG,">Mo_WT_excitatory_H3K4me3_rep1_3kTSS3k_activeGene.txt")||die("Can't write OUB:$!\n");
#open(OUH,">Mo_WT_excitatory_H3K4me3_rep2_3kTSS3k_activeGene.txt")||die("Can't write OUB:$!\n");
#open(OUI,">Mo_WT_excitatory_input_rep1_3kTSS3k_activeGene.txt")||die("Can't write OUB:$!\n");
#open(OUJ,">Mo_WT_excitatory_input_rep2_3kTSS3k_activeGene.txt")||die("Can't write OUB:$!\n");
#open(OUK,">Mo_WT_excitatory_input_rep3_3kTSS3k_activeGene.txt")||die("Can't write OUB:$!\n");
open(OUL,">Our_cortex_H3K4me3_rep1_3kTSS3k_activeGene.txt")||die("Can't write OUB:$!\n");
open(OUM,">Our_cortex_H3K4me3_rep2_3kTSS3k_activeGene.txt")||die("Can't write OUB:$!\n");
open(OUN,">Our_cortex_H3K79me2_3kTSS3k_activeGene.txt")||die("Can't write OUB:$!\n");
open(OUO,">Our_cortex_Pol2_3kTSS3k_activeGene.txt")||die("Can't write OUB:$!\n");

open(OUAA,">ChIP201707_WT_H3K27ac_rep1_3kTSS3k_activeGene.txt")||die("Can't write OUA:$!\n");
open(OUAB,">ChIP201707_WT_H3K27ac_rep2_3kTSS3k_activeGene.txt")||die("Can't write OUA:$!\n");

open(OUAC,">ChIP201707_WT_H3K36me3_rep1_3kTSS3k_activeGene.txt")||die("Can't write OUA:$!\n");
open(OUAD,">ChIP201707_WT_H3K36me3_rep2_3kTSS3k_activeGene.txt")||die("Can't write OUA:$!\n");

open(OUAE,">ChIP201707_WT_H3K4me1_rep1_3kTSS3k_activeGene.txt")||die("Can't write OUA:$!\n");
open(OUAF,">ChIP201707_WT_H3K4me1_rep2_3kTSS3k_activeGene.txt")||die("Can't write OUA:$!\n");

open(OUAG,">ChIP201707_WT_H3K4me3_rep1_3kTSS3k_activeGene.txt")||die("Can't write OUA:$!\n");
open(OUAH,">ChIP201707_WT_H3K4me3_rep2_3kTSS3k_activeGene.txt")||die("Can't write OUA:$!\n");

open(OUAI,">ChIP201707_WT_H3K79me2_rep1_3kTSS3k_activeGene.txt")||die("Can't write OUA:$!\n");
open(OUAJ,">ChIP201707_WT_H3K79me2_rep2_3kTSS3k_activeGene.txt")||die("Can't write OUA:$!\n");

open(OUAK,">ChIP201707_WT_H3K9me3_rep1_3kTSS3k_activeGene.txt")||die("Can't write OUA:$!\n");
open(OUAL,">ChIP201707_WT_H3K9me3_rep2_3kTSS3k_activeGene.txt")||die("Can't write OUA:$!\n");

open(OUAM,">ChIP201707_WT_H4K16ac_rep1_3kTSS3k_activeGene.txt")||die("Can't write OUA:$!\n");
open(OUAN,">ChIP201707_WT_H4K16ac_rep2_3kTSS3k_activeGene.txt")||die("Can't write OUA:$!\n");

open(OUAO,">ChIP201707_WT_H4K20me3_rep1_3kTSS3k_activeGene.txt")||die("Can't write OUA:$!\n");
open(OUAP,">ChIP201707_WT_H4K20me3_rep2_3kTSS3k_activeGene.txt")||die("Can't write OUA:$!\n");

open(OUAQ,">ChIP201707_WT_Pol2Ser2p_rep1_3kTSS3k_activeGene.txt")||die("Can't write OUA:$!\n");
open(OUAR,">ChIP201707_WT_Pol2Ser2p_rep2_3kTSS3k_activeGene.txt")||die("Can't write OUA:$!\n");

open(OUAS,">ChIP201707_WT_Pol2Ser5p_rep1_3kTSS3k_activeGene.txt")||die("Can't write OUA:$!\n");
open(OUAT,">ChIP201707_WT_Pol2Ser5p_rep2_3kTSS3k_activeGene.txt")||die("Can't write OUA:$!\n");

open(OUAU,">ChIP201707_WT_Pol2Total_rep1_3kTSS3k_activeGene.txt")||die("Can't write OUA:$!\n");
open(OUAV,">ChIP201707_WT_Pol2Total_rep2_3kTSS3k_activeGene.txt")||die("Can't write OUA:$!\n");



while(<IN>)
{
 chomp;
 if(/^(chr\w\w?\:\d+\-\d+\:)(ENSM[\w\.\-\(\)]+)(\:\w+\:[+|-])\t/)
 {
  $a1++;
  if(exists $active{$2}){print "error exists gene ID:$_\n";}
  else{$active{$2}="$1$2$3";}
 }
 else{print "error1\t$_\n";}
}

while(<INA>)
{
 chomp;
 if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/)
 {
  if(exists $active{$1}){$a2++; print OUA "$active{$1}\t$2\n";}
 }
 else{print "error2\t$_\n";}
}

while(<INB>)
{
 chomp;
 if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/)
 {
  if(exists $active{$1}){$a3++; print OUB "$active{$1}\t$2\n";}
 }
 else{print "error3\t$_\n";}
}

#while(<INC>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a4++; print OUC "$active{$1}\t$2\n";}}else{print "error4\t$_\n";}}
#while(<IND>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a5++; print OUD "$active{$1}\t$2\n";}}else{print "error5\t$_\n";}}
while(<INE>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a6++; print OUE "$active{$1}\t$2\n";}}else{print "error6\t$_\n";}}
while(<INF>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a7++; print OUF "$active{$1}\t$2\n";}}else{print "error7\t$_\n";}}
#while(<ING>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a8++; print OUG "$active{$1}\t$2\n";}}else{print "error8\t$_\n";}}
#while(<INH>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a9++; print OUH "$active{$1}\t$2\n";}}else{print "error9\t$_\n";}}
#while(<INI>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a10++; print OUI "$active{$1}\t$2\n";}}else{print "error10\t$_\n";}}
#while(<INJ>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a11++; print OUJ "$active{$1}\t$2\n";}}else{print "error11\t$_\n";}}
#while(<INK>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a12++; print OUK "$active{$1}\t$2\n";}}else{print "error12\t$_\n";}}
while(<INL>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a11++; print OUL "$active{$1}\t$2\n";}}else{print "error11\t$_\n";}}
while(<INM>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a12++; print OUM "$active{$1}\t$2\n";}}else{print "error12\t$_\n";}}
while(<INN>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a13++; print OUN "$active{$1}\t$2\n";}}else{print "error11\t$_\n";}}
while(<INO>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a14++; print OUO "$active{$1}\t$2\n";}}else{print "error12\t$_\n";}}

while(<INAA>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a14++; print OUAA "$active{$1}\t$2\n";}}else{print "error12\t$_\n";}}
while(<INAB>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a14++; print OUAB "$active{$1}\t$2\n";}}else{print "error12\t$_\n";}}

while(<INAC>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a14++; print OUAC "$active{$1}\t$2\n";}}else{print "error12\t$_\n";}}
while(<INAD>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a14++; print OUAD "$active{$1}\t$2\n";}}else{print "error12\t$_\n";}}

while(<INAE>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a14++; print OUAE "$active{$1}\t$2\n";}}else{print "error12\t$_\n";}}
while(<INAF>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a14++; print OUAF "$active{$1}\t$2\n";}}else{print "error12\t$_\n";}}

while(<INAG>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a14++; print OUAG "$active{$1}\t$2\n";}}else{print "error12\t$_\n";}}
while(<INAH>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a14++; print OUAH "$active{$1}\t$2\n";}}else{print "error12\t$_\n";}}

while(<INAI>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a14++; print OUAI "$active{$1}\t$2\n";}}else{print "error12\t$_\n";}}
while(<INAJ>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a14++; print OUAJ "$active{$1}\t$2\n";}}else{print "error12\t$_\n";}}

while(<INAK>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a14++; print OUAK "$active{$1}\t$2\n";}}else{print "error12\t$_\n";}}
while(<INAL>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a14++; print OUAL "$active{$1}\t$2\n";}}else{print "error12\t$_\n";}}

while(<INAM>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a14++; print OUAM "$active{$1}\t$2\n";}}else{print "error12\t$_\n";}}
while(<INAN>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a14++; print OUAN "$active{$1}\t$2\n";}}else{print "error12\t$_\n";}}

while(<INAO>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a14++; print OUAO "$active{$1}\t$2\n";}}else{print "error12\t$_\n";}}
while(<INAP>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a14++; print OUAP "$active{$1}\t$2\n";}}else{print "error12\t$_\n";}}

while(<INAQ>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a14++; print OUAQ "$active{$1}\t$2\n";}}else{print "error12\t$_\n";}}
while(<INAR>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a14++; print OUAR "$active{$1}\t$2\n";}}else{print "error12\t$_\n";}}

while(<INAS>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a14++; print OUAS "$active{$1}\t$2\n";}}else{print "error12\t$_\n";}}
while(<INAT>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a14++; print OUAT "$active{$1}\t$2\n";}}else{print "error12\t$_\n";}}

while(<INAU>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a14++; print OUAU "$active{$1}\t$2\n";}}else{print "error12\t$_\n";}}
while(<INAV>){chomp;if(/^(ENSM[\w\.\-\(\)]+)\t([\d\t\.]+)$/){if(exists $active{$1}){$a14++; print OUAV "$active{$1}\t$2\n";}}else{print "error12\t$_\n";}}


print "Active-gene: $a1 $a2 $a3 $a4 $a5 $a6 $a7 $a8 $a9 $a10 $a11 $a12 $a13 $a14\n";

close INA; close INB; close INC;
close OUA; close OUB;


