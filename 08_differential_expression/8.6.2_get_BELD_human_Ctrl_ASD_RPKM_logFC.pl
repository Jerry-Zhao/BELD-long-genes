#! /usr/local/perl -w
## four mouse genes have multiple human genes ; manually remove some of them from Human_mouse_Ensembl_convert.txt
#ENSG00000284299	ENSMUSG00000058248	Kcnh1	AL590132.1
#ENSG00000283154	ENSMUSG00000027777	Schip1	IQCJ-SCHIP1
#ENSG00000283228	ENSMUSG00000017412	Cacnb4	AC068547.1
#ENSG00000249209	ENSMUSG00000022956	Atp5o	AP000311.1

open(INA,"../02_BELD/BED_BED_Data_length_PI30_ChIP_RPKM_cortex_WT.xls")||die("Can't open INB:$!\n");
open(INB,"../02_BELD/BED_nonBEDlong_Data_length_PI30_ChIP_RPKM_cortex_WT.xls")||die("Can't open INB:$!\n");
open(INC,"/media/Project/SElong/Count_all_genes/PsychENCODE/Human_mouse_Ensembl_convert.txt")||die("Can't open INA:$!\n");
open(IND,"results_edgeR_Human_Ctrl_ASD_RPKM.xls")||die("Can't open INA:$!\n");
open(OUA,">results_edgeR_Human_Ctrl_ASD_RPKM_mouse_BELD_non.xls")||die("Can't write OUT:$!\n");

while(<INA>)
{
 chomp;
 if(/^(chr\w\w?\:\d+\-\d+\:)(ENSMUSG\d+)(\_[\w\.\-\(\)]+\:\w+\:[+|-])\t/)
 {
  $a1++;
  if(exists $beld{$2}){print "error exists gene ID:$_\n";}
  else{$beld{$2}="$1$2$3"; $total{$2}=1;}
 }
}

while(<INB>)
{
 chomp;
 if(/^(chr\w\w?\:\d+\-\d+\:)(ENSMUSG\d+)(\_[\w\.\-\(\)]+\:\w+\:[+|-])\t/)
 {
  $a2++;
  if(exists $nonbeld{$2}){print "error exists gene ID:$_\n";}
  else{$nonbeld{$2}="$1$2$3"; $total{$2}=1;}
 }
}


while(<INC>)
{
 chomp;
 if(/^(ENSG\d+)\t(ENSMUSG\d+)\t[\w\.\-]+\t[\w\.\-\:]+$/)
 {
  if(exists $total{$2})
  {
   $a3++;
   if(exists $homo{$2})
   {
    if($homo{$2} ne $1){print "error $2: two human genes: $1 $homo{$2} $_\n";} 
   }
   else{$homo{$2}=$1;}
  }
 }
 else{print "error2\t$_\n";}
}


print "$a1 $a2 $a3\n";


while(<IND>)
{
 chomp;
# if(/(ENSG\d+)\t([\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+\t[\d\.]+)\t/)
 if(/(ENSG\d+)\t(.*)/)
 {
  $id=$1; $values=$2;
  
  foreach (keys %homo)
  {
   if($id eq $homo{$_})##
   {
    if(exists $beld{$_}){print OUA "$beld{$_}\t$id\t$values\n"; $a4++;}
    elsif(exists $nonbeld{$_}){print OUA "$nonbeld{$_}\t$id\t$values\n"; $a5++;}
    else{print "error wrong $id $homo{$_} \n";}
   }
  }
 }
# elsif(/^\s*(h\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\th\w+\ta\w+\ta\w+\ta\w+\ta\w+\ta\w+\ta\w+\ta\w+\ta\w+\ta\w+\ta\w+\ta\w+\ta\w+\ta\w+\ta\w+\ta\w+\ta\w+\ta\w+\ta\w+\ta\w+\ta\w+\ta\w+\ta\w+\ta\w+\ta\w+\ta\w+)\tc\w+/)
 elsif(/^\s*(logFC.*)$/)
 {
  print OUA "\tHumanID\t$1\n";
 }
 else{print "error4\t$_\n";}
}

print "$a1 $a2 $a3\nBELD-expression: $a4\tnonBELD-expression: $a5\n";



 
