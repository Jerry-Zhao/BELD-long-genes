#! /usr/local/perl -w

#total <- read.table("Data_length_PI30_ChIP_RPKM_cortex_WT.xls",sep="\t",header=T,row.names=1)
#total[1:5,]
#q1000 <- quantile(total$Length,probs=seq(0,1,0.001))
#write.table(q1000,file="Quantiles_1000_actively_expressed_genes_length.txt",sep="\t",quote=F)

open(INA,"Quantiles_1000_actively_expressed_genes_length.txt")||die("Can't open INA:$!\n");
open(INB,"BED_BED_Data_length_PI30_ChIP_RPKM_cortex_WT.xls")||die("Can't open INB:$!\n");
open(INC,"BED_nonBEDTotal_Data_length_PI30_ChIP_RPKM_cortex_WT.xls")||die("Can't open INC:$!\n");
 
open(OUT,">BED_nonBEDlong_Data_length_PI30_ChIP_RPKM_cortex_WT.xls")||die("Can't write OUT:$!\n");

while(<INA>)
{
 chomp;
 if(/^([\d\.]+)%\s+([\d\.]+)$/)
 {
  $ij=$1*10; $quantile{$ij}=$2; 
#  print "$ij\n";
 }
 else{print "error1\t$_\n";}
}

for($i=0;$i<1000;$i++){$beld{$i}=0;} ## initial the BELD hash
while(<INB>)
{
 chomp;
 if(/^(chr\w+\:\d+\-\d+\:ENSMUSG\d+\_[\w\.\-\(\)]+\:\w+\:[+|-])\t[\w\.\-]+\t[\w\.\-]+\t[\w\.\-]+\t[\w\.\-]+\t[\w\.\-]+\t[\w\.\-]+\t[\w\.\-]+\t[\w\.\-]+\t[\w\.\-]+\t[\w\.\-]+\t[\w\.\-]+\t[\w\.\-]+\t[\w\.\-]+\t[\w\.\-]+\t[\w\.\-]+\t(\d+)\t/)
 {
  $a1++;
  for($i=0;$i<1000;$i++)
  {
   $j=$i+1;
   if($2>=$quantile{$i} and $2<$quantile{$j}){$beld{$i}++; $a2++;}
  }
 }
 else{print "error2\t$_\n";}
}

#foreach (sort {$a<=>$b} keys %beld){print "$_\t$beld{$_}\n";}
#print "Total BELD genes: $a1 $a2\n";
 
while(<INC>)
{
 chomp;
 if(/^(chr\w+\:\d+\-\d+\:ENSMUSG\d+\_[\w\.\-\(\)]+\:\w+\:[+|-])\t[\w\.\-]+\t[\w\.\-]+\t[\w\.\-]+\t[\w\.\-]+\t[\w\.\-]+\t[\w\.\-]+\t[\w\.\-]+\t[\w\.\-]+\t[\w\.\-]+\t[\w\.\-]+\t[\w\.\-]+\t[\w\.\-]+\t[\w\.\-]+\t[\w\.\-]+\t[\w\.\-]+\t(\d+)\t/)
 {
  chomp;
  $a3++; $totalnonbeld{$1}=$_;
  for($i=0;$i<1000;$i++)
  {
   $j=$i+1; $id="express$i";
   if($2>=$quantile{$i} and $2<$quantile{$j}){push @$id, $1; $a4++;} ## gnene length 4434882 is not included
  }
 }
 else{print "error3\t$_\n"; print OUT "$_\n";}
}


for($i=999;$i>=0;$i--)
{
 $id2= "express$i"; $nonbeldsize=@$id2;    ## number of nonBELD genes in this bin
 $beldsize = $beld{$i};                    ## number of    BELD genes in this bin
 $j=$i-1; 

 if($nonbeldsize < $beldsize){print "Error bin $i: nonBELD-Number($nonbeldsize) < BELD-Number($beldsize) \n";}
# print "Bin $i :: nonBELD-Number($nonbeldsize)   BELD-Number($beldsize) \n";

# print "working on $i\n";
 if($beldsize > 0 ) ## there are BELDs in this bin
 {
  if($beldsize > $nonbeldsize) ## more DELD genes than nonBELD genes in this bin
  {
   $residule=$beldsize-$nonbeldsize; ## the number-diff of BELD and nonBELD, whcih will be carried to the next bin
   $beld{$j}+=$residule; 

   if($nonbeldsize > 0 ) {foreach (@$id2) {print OUT "$totalnonbeld{$_}\n"; $a5++;}}
  }
  else
  {
   my @items;
   for ( 1 .. $beldsize ){push @items, splice @$id2, rand @$id2, 1;}
   foreach (@items) {print OUT "$totalnonbeld{$_}\n"; $a5++;}
   undef @items;
  }
 }
}

print "BELD $a1 $a2 $a5\nnonBELD: $a3 $a4\n";





