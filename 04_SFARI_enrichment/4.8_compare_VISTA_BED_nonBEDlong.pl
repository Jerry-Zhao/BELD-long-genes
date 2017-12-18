#! /usr/local/perl -w
#Total-VISTA: 1044
#BED-gene:         185	        VISTA-overlap-BED-enhancer:                 38	Total-length-BELD: 67409664
#nonBEDtotal-gene:         4905	VISTA-overlap-nonBEDtotal-enhancer:        114	Total-length-nonBELD: 238055454

## number of enhancers per 10mb
# BED     = (38/67409664)*10000000    5.637174
# nonBELD = (114/238055454)*10000000  4.7888


open(INA,"VISTA_mouse_enhancer_mm9_1044.txt")||die("Can't open INA:$!\n");
open(INB,"../02_BELD/BED_BED_Data_length_PI30_ChIP_RPKM_cortex_WT.xls")||die("Can't open INC:$!\n");
open(INC,"../02_BELD/BED_nonBEDTotal_Data_length_PI30_ChIP_RPKM_cortex_WT.xls")||die("Can't open IND:$!\n"); 

while(<INA>)
{
 chomp;
 if(/^>Mouse\|(chr\w\w?\:\d+\-\d+)\s+\|\s+element\s+(\d+)\s+/)
 {
  $vista1++;
  $id="mm$2";
  $vista{$id}=$1;
 }
 elsif(/^[A-Za-z\s]+$/){}
 else{print "error1\t$_\n";}
}

my $length_beld_total=$length_nonbeld_total=0;
while(<INB>)
{
 chomp;
 if(/^(chr\w\w?)\:(\d+)\-(\d+)\:ENSMUSG\d+\_[\w\.\-\(\)]+\:\w+\:[+|-]\t/)
 {
  $a1++; 
  $length_beld_total=$length_beld_total + ($3-$2+1); ## total length of BELD genes for normalization
  $chr=$1; $left=$2; $right=$3;
  
  $label=0; 
  foreach (keys %vista)
  {
   if($vista{$_}=~/^(chr\w\w?)\:(\d+)\-(\d+)$/)
   {
    if($1 eq $chr) ## sam chromosome
    {
     if(($2>=$left and $2<=$right) or ($3>=$left and $3<=$right) or ($left>=$2 and $left<=$3) or ($right>=$2 and $right<=$3))
     {
      $label++;
     }
    }
   }
   else{print "error HASH values $vista{$_}\n";}
  }

  if($label>0){$a2+=$label;} ## total number of enhancers 
 }
 else{print "error2\t$_\n";}
}

while(<INC>)
{
 chomp;
 if(/^(chr\w\w?)\:(\d+)\-(\d+)\:ENSMUSG\d+\_[\w\.\-\(\)]+\:\w+\:[+|-]\t/)
 {
  $a3++;
  $length_nonbeld_total=$length_nonbeld_total + ($3-$2+1); ## total length of non-BELD genes for normalization
  $chr=$1; $left=$2; $right=$3;

  $label=0;
  foreach (keys %vista)
  {
   if($vista{$_}=~/^(chr\w\w?)\:(\d+)\-(\d+)$/)
   {
    if($1 eq $chr) ## sam chromosome
    {
     if(($2>=$left and $2<=$right) or ($3>=$left and $3<=$right) or ($left>=$2 and $left<=$3) or ($right>=$2 and $right<=$3))
     {
      $label++;
     }
    }
   }
   else{print "error HASH values $vista{$_}\n";}
  }

  if($label>0){$a4+=$label;} ## total number of enhancers 
 }
 else{print "error3\t$_\n";}
}




print "Total-VISTA: $vista1\n";
print "BED-gene:         $a1\t       VISTA-overlap-BED-gene:        $a2\tTotal-length-BELD: $length_beld_total\n";
print "nonBEDtotal-gene:         $a3\tVISTA-overlap-nonBEDtotal-gene:        $a4\tTotal-length-nonBELD: $length_nonbeld_total\n";




