#! /usr/local/perl -w
open(INA,"../02_BELD/BED_BED_Data_length_PI30_ChIP_RPKM_cortex_WT.xls")||die("Can't open INB:$!\n");
open(INB,"../../Count_all_genes/Encode/Expression_19_tissue/Encode_expression_13_tissues_FPKM.xls")||die("Can't open INA:$!\n");
open(OUT,">BELD_expression_13_tissues_FPKM.xls")||die("Can't write OUT:$!\n");
## manually remove duplicates ==> BELD_expression_13_tissues_FPKM_2.xls

while(<INA>)
{
 chomp;
 if(/^(chr\w\w?\:\d+\-\d+\:ENSMUSG\d+\_)([\w\.\-\(\)]+)(\:\w+\:[+|-])\t/)
 {
  $a1++;
  if(exists $beld{$2}){print "error exists gene ID:$_\n";}
  else{$beld{$2}="$1$2$3";}
 }
}

while(<INB>)
{
 chomp;
 if(/^\w+\t([\w\.\-]+)\t([\d\.\-e]+\t.*)$/)
 {
  if(exists $beld{$1})
  {
   $a2++; $unique{$1}=1;
   print OUT "$beld{$1}\t$2\n";
  }
 }
 elsif(/^\s*\tSymbol\t(.*)$/){print OUT "\t$1\n";}
 else{print "error2\t$_\n";}
}

foreach (keys %unique){$a3++;}

print "BELD-genes: $a1\nBELD-has-multiple-Encode-expression:$a2\nBELD-uniquely-has-Encode:$a3\n";



