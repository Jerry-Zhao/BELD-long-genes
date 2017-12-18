#! /usr/local/perl -w
#Total-transcripts: 54488	BED-overlap: 372	nonBED-overlap: 67
#BED: 185	nonBED: 185
#BED-eRNA: 133	nonBED-eRNA: 44

## Get the antisense transcripts of the non-SE and SE long genes

open(INA,"../02_BELD/BED_BED_Data_length_PI30_ChIP_RPKM_cortex_WT.xls")||die("Can't open INA:$!\n");
open(INB,"../02_BELD/BED_nonBEDlong_Data_length_PI30_ChIP_RPKM_cortex_WT.xls")||die("Can't open INB:$!\n");
open(INC,"Cortex_H3K4me3_peaks.txt")||die("Can't open INC:$!\n");
open(IND,"GROseq_Homer_transcripts.txt")||die("Can't open INC:$!\n");
open(OUT,">BELD_nonBELDlong_GROseq_Homer_transcripts_raw.txt")||die("Can't Write OUT:$!\n");
open(OUB,">BELD_nonBELDlong_GROseq_Homer_transcripts_raw_count.txt")||die("Can't Write OUT:$!\n");
open(OUC,">BELD_BELD_GROseq_Homer_transcripts_ID.txt")||die("Can't Write OUT:$!\n");

while(<INA>)
{
 chomp;
 if(/^(chr\w\w?)\:(\d+)\-(\d+)\:(ENSMUSG\d+\_[\w\.\-\(\)]+)\:\w+\:([+|-])\t/)
 {
  $ida="BED$1$5"; $b1++; $segene{$4}=0;
  if(exists $$ida{$4}){print "error exists BED-ID $_\n";}else{$$ida{$4}=$_;}
 }
 else{print "error1\t$_\n";}
}

while(<INB>)
{
 chomp;
 if(/^(chr\w\w?)\:(\d+)\-(\d+)\:(ENSMUSG\d+\_[\w\.\-\(\)]+)\:\w+\:([+|-])\t/)
 {
  $idb="nonBED$1$5"; $b2++; $nonsegene{$4}=0;
  if(exists $$idb{$4}){print "error exists nonBED-ID $_\n";}else{$$idb{$4}=$_;}
 }
 else{print "error2\t$_\n";}
}

while(<INC>)
{
 chomp;
 if(/^chr[\w\.\-]+\s+(chr\w\w?)\s+(\d+)\s+(\d+)\s+/)
 {
  $chromo=$1;
  $$chromo{$2}=$3;
 }
 else{print "error3\t$_\n";}
}


print OUT "Category\tDepth\tLength\n";
while(<IND>)
{
 chomp;
 if(/^([\w\.\-]+)\s+(\w\w?)\s+(\d+)\s+(\d+)\s+([+|-])\s+([\d\.]+)\s+([\d\.]+)$/)
 {
  $a1++;
  $left=$3; $right=$4; $depth=$6; $length=$7; $chromosome="chr$2"; $line=$_;

  $h3k4=0;
  foreach (keys %$chromosome)
  {
   if(($_>=$left and $_<=$right) or ($$chromosome{$_}>=$left and $$chromosome{$_}<=$right) or ($left>=$_ and $left<=$$chromosome{$_}) or ($right>=$_ and $right<=$$chromosome{$_}))
   {
    $h3k4++;
   }
  }

  if($h3k4==0)  ## not overlap with the H3K4me3 peaks
  {

  if($5 eq "+"){$idc="BEDchr$2-"; $idd="nonBEDchr$2-";} ## antisense eRNAs
  elsif($5 eq "-"){$idc="BEDchr$2+"; $idd="nonBEDchr$2+";}
  else{print "error stradn $_\n";}

  $se_label=$nonse_label=0;

  foreach (keys %$idc)
  {
   if($$idc{$_}=~/(chr\w\w?)\:(\d+)\-(\d+)\:(ENSMUSG\d+\_[\w\.\-\(\)]+)\:\w+\:([+|-])\t/)
   {
    if(($2>=$left and $2<=$right) or ($3>=$left and $3<=$right) or ($left>=$2 and $left<=$3) or ($right>=$2 and $right<=$3))
    {
     $se_label++; $segene{$4}++; ## overlap BED 
    }
   }
   else{print "error BED HASH values: $$idc{$_}\n";}
  }

  foreach (keys %$idd)
  {
   if($$idd{$_}=~/(chr\w\w?)\:(\d+)\-(\d+)\:(ENSMUSG\d+\_[\w\.\-\(\)]+)\:\w+\:([+|-])\t/)
   {
    if(($2>=$left and $2<=$right) or ($3>=$left and $3<=$right) or ($left>=$2 and $left<=$3) or ($right>=$2 and $right<=$3))
    {
     $nonse_label++; $nonsegene{$4}++;  ## overlap nonBED
    }
   }
   else{print "error nonBED HASH values: $$idd{$_}\n";}
  }
 
  if($se_label>0){print OUT "BED\t$depth\t$length\n"; $a2++; print OUC "$line\n";}  
  if($nonse_label>0){print OUT "nonBED\t$depth\t$length\n"; $a3++;}
 
  if(($se_label>0) and ($nonse_label>0)){print "Both-overlap-nonBED-BED: $_\n";}
  }
#  }
 }
 else{print "error4\t$_\n";}
}

print OUB "\tCategory\tCounts\n";
foreach (keys %segene){if($segene{$_}>0){$b3++;} print OUB "$_\tBED\t$segene{$_}\n";}
foreach (keys %nonsegene){if($nonsegene{$_}>0){$b4++;} print OUB "$_\tnonBED\t$nonsegene{$_}\n";}

print "Total-transcripts: $a1\tBED-overlap: $a2\tnonBED-overlap: $a3\n";
print "BED: $b1\tnonBED: $b2\nBED-eRNA: $b3\tnonBED-eRNA: $b4\n";


