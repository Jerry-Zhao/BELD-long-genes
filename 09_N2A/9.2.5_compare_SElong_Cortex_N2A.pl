#! /usr/local/perl -w

open(INA,"../02_ATAC_ChIP/BED_BED_Data_length_PI30_ChIP_RPKM_cortex_WT.xls")||die("Can't open INA:$!\n");
open(INB,"BED_BED_Data_length_PI30_ChIP_RPKM_N2A.xls")||die("Can't open INB:$!\n");

open(OUT,">Compare_BED_Cortex_N2A.xls")||die("Can't write OUT:$!\n");

while(<INA>)
{
 chomp;
 if(/^(chr[\w\.\-\(\)\+\:]+)\t/)
 {
  $total{$1}=1; 
  $cortex{$1}=1;
  $a1++;
 }
 else{print "error1\t$_\n";}
}

while(<INB>)
{
 chomp;
 if(/^(chr[\w\.\-\(\)\+\:]+)\t/)
 {
  $total{$1}=1; 
  $n2a{$1}=1;
  $a2++;
 }
 else{print "error2\t$_\n";}
}

print OUT "Gene\tCortex\tN2A\n";
foreach (keys %total)
{
 $a3++;
 print OUT "$_\t";
 if(exists $cortex{$_}){print OUT "+\t";}else{print OUT "-\t";}
 if(exists $n2a{$_}){print OUT "+\n";}else{print OUT "-\n";}
}

foreach (keys %cortex){if(exists $n2a{$_}){$a4++;}}

print "Cortex: $a1\nN2A: $a2\nOverlapped: $a4\nMerged: $a3\n"

