#! /usr/local/perl -w

#@filenames=("CG_methylated_WT_Nex_p_mC","CG_methylated_WT_Nex_p_hmC","CH_methylated_WT_Nex_p_mC","CH_methylated_WT_Nex_p_hmC");
 
#foreach $names (@filenames)
#{
open(OUA,">WT_Nex_p_mC_5coverage_allgene_body_100k_CH.txt")||die("Can't write OUB:$!\n");
#print "Working on sample: $names\n";

my $a1=$a2=0;


@chromo=("chr1","chr2","chr3","chr4","chr5","chr6","chr7","chr8","chr9","chr10","chr11","chr12","chr13","chr14","chr15","chr16","chr17","chr18","chr19","chrX","chrY");
foreach $chromosome (@chromo)
{
print "Working on chromosome: $chromosome\n";

open(INA,"/media/Project/mC/results/02_mC_hmC/calling_FDR/split/WT_Nex_p_hmC_5coverage.xls.$chromosome")||die("Can't open INA:$!\n");
open(INB,"/media/Project/mC/results/02_mC_hmC/calling_FDR/split/WT_Nex_p_WGBS_5coverage.xls.$chromosome")||die("Can't open INB:$!\n");
open(INC,"/media/RNA/Genome/Ensembl/exon_intron/Mus_musculus.GRCm38.75.gtf.gene")||die("Can't open INC:$!\n");

while(<INA>)
{
 chomp;
 if(/^(chr\w\w?)\t(\d+)\t\-?([\d\.]+)\t(\w+)$/)
 {
  if(($4 eq "CHG") or ($4 eq "CHH"))
  {
   if($chromosome ne $1){print "error wrong chromosome: $chromosome   $_\n";}
   else{$a1++; $hmc{$2}=$3;} ## save the methylated cytosines
  }
  elsif($4 eq "CpG"){}
  else{print "error wrong methylatin context: $_\n";}
 }
 else{print "error1\t$_\n";}
}

while(<INB>)
{
 chomp;
 if(/^(chr\w\w?)\t(\d+)\t\-?([\d\.]+)\t(\w+)$/)
 {
  if(($4 eq "CHG") or ($4 eq "CHH"))
  {
   if($chromosome ne $1){print "error wrong chromosome: $chromosome   $_\n";}
   else
   {
    $a2++; 
    if(exists $hmc{$2})
    {
     if($hmc{$2}>$3){$methy{$2}=0;}## hmC > mC; set mC to 0
     else{$methy{$2}=$3-$hmc{$2};} ## subtract hmC from WGBS
     delete $hmc{$2}; 
    }
    else{$methy{$2}=$3;} ## this cytosine is not hmC
   } ## save the methylated cytosines
  }
  elsif($4 eq "CpG"){}
  else{print "error wrong methylatin context: $_\n";}
 }
 else{print "error2\t$_\n";}
}


while(<INC>)
{
 chomp;
 if(/^(\w\w?)\t(\w+)\tgene\t(\d+)\t(\d+)\t([+|-])\t(ENSMUSG\d+)\t([\w\.\-\(\)]+)$/)
 {
  if($chromosome eq "chr$1") ## same chromosome
  {
   $a3++;
   if($5 eq "+") ## plus strand
   {
    print OUA "chr$1:$3-$4:$6_$7:$2:$5";
    
    $start=$3-100000; 
    ## 2000 bins of the gene upsteeam 10kb
    $mean_bin_up=0; ## if the first bin have 0 count
    for($j=0;$j<2000;$j++)
    {
     $count=$total=0; 
     for($i=$start+50*$j;$i<$start+50*($j+1);$i++) ## each bin 10 bp
     {
      if(exists $methy{$i}){$count++; $total+=$methy{$i};}
     }
     if($count>0){$mean_bin=int(1000*$total/$count+5)/1000; print OUA "\t$mean_bin"; $mean_bin_up=$mean_bin;} ## everage level
     elsif($count==0){print OUA "\t$mean_bin_up";} ## no mC or hmC in this bin; use the up-stream-bin value
     else{print "error count \t$_\n";}
    }

    ### 1000 bins of the gene body
    $mean_bin_up=0; ## if the first bin have 0 count
    for($j=0;$j<1000;$j++)
    {
     $start_bin=int( (($3 + (($4-$3+1)/1000)*$j)*10 +5)/10 ); ## round; 4 she 5 ru
     $end_bin= int( (($3 + (($4-$3+1)/1000)*($j+1))*10 +5)/10 )-1;
     if($end_bin<$start_bin){$end_bin=$start_bin;} ## gene length <1kb, some bin is difficulty to split
     
     $count=$total=0;
     for($i=$start_bin;$i<=$end_bin;$i++)
     {
      if(exists $methy{$i}){$count++; $total+=$methy{$i};}
     }
     if($count>0){$mean_bin=int(1000*$total/$count+5)/1000; print OUA "\t$mean_bin"; $mean_bin_up=$mean_bin;} ## everage level
     elsif($count==0){print OUA "\t$mean_bin_up";} ## no mC or hmC in this bin; use the up-stream-bin value
     else{print "error count \t$_\n";}
    }

    $start=$4+1; 
    ## 2000 bins of the gene downsteeam 10kb
    $mean_bin_up=0; ## if the first bin have 0 count
    for($j=0;$j<2000;$j++)
    {
     $count=$total=0;
     for($i=$start+50*$j;$i<$start+50*($j+1);$i++) ## each bin 10 bp
     {
      if(exists $methy{$i}){$count++; $total+=$methy{$i};}
     }
     if($count>0){$mean_bin=int(1000*$total/$count+5)/1000; print OUA "\t$mean_bin"; $mean_bin_up=$mean_bin;} ## everage level
     elsif($count==0){print OUA "\t$mean_bin_up";} ## no mC or hmC in this bin; use the up-stream-bin value
     else{print "error count \t$_\n";}
    }
    print OUA "\n";
   }
   elsif($5 eq "-")
   {
    print OUA "chr$1:$3-$4:$6_$7:$2:$5";

    $end=$4+100000; 
    ## 2000 bins of the gene upsteeam 10kb
    $mean_bin_up=0; ## if the first bin have 0 count
    for($j=0;$j<2000;$j++)
    {
     $count=$total=0;
     for($i=$end-50*$j;$i>$end-50*($j+1);$i--) ## each bin 10 bp
     {
      if(exists $methy{$i}){$count++; $total+=$methy{$i};}
     }
     if($count>0){$mean_bin=int(1000*$total/$count+5)/1000; print OUA "\t$mean_bin"; $mean_bin_up=$mean_bin;} ## everage level
     elsif($count==0){print OUA "\t$mean_bin_up";} ## no mC or hmC in this bin; use the up-stream-bin value
     else{print "error count \t$_\n";}
    }


    ### 1000 bins of the gene body
    $mean_bin_up=0; ## if the first bin have 0 count
    for($j=0;$j<1000;$j++)
    {
     $end_bin=int( (($4 - (($4-$3+1)/1000)*$j)*10 +5)/10 ); ## round; 4 she 5 ru
     $start_bin= int( (($4 - (($4-$3+1)/1000)*($j+1))*10 +5)/10 )+1;
     if($end_bin<$start_bin){$end_bin=$start_bin;}

     $count=$total=0;
     for($i=$start_bin;$i<=$end_bin;$i++)
     {
      if(exists $methy{$i}){$count++; $total+=$methy{$i};}
     }
     if($count>0){$mean_bin=int(1000*$total/$count+5)/1000; print OUA "\t$mean_bin"; $mean_bin_up=$mean_bin;} ## everage level
     elsif($count==0){print OUA "\t$mean_bin_up";} ## no mC or hmC in this bin; use the up-stream-bin value
     else{print "error count \t$_\n";}
    }

    $end=$3-1;
    ## 2000 bins of the gene downsteeam 10kb
    $mean_bin_up=0; ## if the first bin have 0 count
    for($j=0;$j<2000;$j++)
    {
     $count=$total=0;
     for($i=$end-50*$j;$i>$end-50*($j+1);$i--) ## each bin 10 bp
     {
      if(exists $methy{$i}){$count++; $total+=$methy{$i};}
     }
     if($count>0){$mean_bin=int(1000*$total/$count+5)/1000; print OUA "\t$mean_bin"; $mean_bin_up=$mean_bin;} ## everage level
     elsif($count==0){print OUA "\t$mean_bin_up";} ## no mC or hmC in this bin; use the up-stream-bin value
     else{print "error count \t$_\n";}
    }

    print OUA "\n";
   }
  }
 }
 else{print "error3\t$_\n";}
}

undef %methy;
undef %hmc;

close INA; close INB; close INC;

}

close OUA;
print "Total-WT_Nex_p_hmC_5coverage: $a1\tTotal-WT_Nex_p_WGBS_5coverage: $a2\tTotal-gene: $a3\n";
#}


