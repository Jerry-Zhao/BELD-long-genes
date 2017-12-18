#! /usr/local/perl -w

#@filenames=("genome_10k10k","genome_2k10k","genome_2k2k","intraChrom_10k10k","intraChrom_2k10k","intraChrom_2k2k");
@filenames=("intraChrom_2k10k");
 
foreach $names (@filenames)
{
open(OUA,">RenLab_HiC_cortex_sigInter_$names\_body_100kbupdown.txt")||die("Can't write OUA:$!\n");
print "Working on sample: $names\n";

my $a1=$a2=0;

@chromo=("chr1","chr2","chr3","chr4","chr5","chr6","chr7","chr8","chr9","chr10","chr11","chr12","chr13","chr14","chr15","chr16","chr17","chr18","chr19","chrX","chrY");
foreach $chromosome (@chromo)
{
print "Working on chromosome: $chromosome\n";

open(INA,"/media/RNA/Genome/Ensembl/exon_intron/Mus_musculus.GRCm38.75.gtf.gene")||die("Can't open INA:$!\n");
open(INB,"Homer/RenLab_HiC_cortex_sigInter_$names.txt")||die("Can't open INB:$!\n");
open(INC,"/media/RNA/Genome/Ensembl/exon_intron/Mus_musculus.GRCm38.75.gtf.gene")||die("Can't open INC:$!\n");

while(<INA>)
{
 chomp;
 if(/^(\w\w?)\t(\w+)\tgene\t(\d+)\t(\d+)\t([+|-])\t(ENSMUSG\d+)\t([\w\.\-\(\)]+)$/)
 {
  if($chromosome eq "chr$1") ## same chromosome
  {
   $a1++; print "Processes gene lines: $a1\n" if($a1%5000==0);

   $start=$3-100000; ## left location of 100kb-up-TSS
   $end=$4+100000;   ## right location of 100kb-down-TTS
   for($i=$start;$i<=$end;$i++){$id="chr$1_$i";$reads{$id}=0;}
  }
 }
 else{print "error1\t$_\n";}
}

while(<INB>)
{
 chomp;
 if(/^\w+\tchr\w\w?\-\d+\t(chr\w\w?)\t(\d+)\t(\d+)\t\+\t[\d\.]+\tchr\w\w?\-\d+\t(chr\w\w?)\t(\d+)\t(\d+)\t\+\t[\d\.]+\t\d+\t([\d\.]+)\t/)
 {
  $total++; print "Processes lines: $total\n" if($total%10000==0);
  if($chromosome eq "$1"){for($i=$2;$i<=$3;$i++){$id="$1_$i";if(exists $reads{$id}){$reads{$id}+=$7;}}} ## Number of interactions for each loci
  if($chromosome eq "$4"){for($i=$5;$i<=$6;$i++){$id="$4_$i";if(exists $reads{$id}){$reads{$id}+=$7;}}} ## Number of interactions for each loci
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
   $a2++;
   if($5 eq "+") ## plus strand
   {
    print OUA "$6_$7";
    
    $start=$3-100000; $end=$3-1; ## 100kb-up-TSS
    for($j=0;$j<1000;$j++)
    {
     $start_bin=$start+$j*100;
     $end_bin=$start+($j+1)*100-1;
     $total_bin=0;
     for($i=$start_bin;$i<=$end_bin;$i++){$id_tmp="chr$1_$i";$total_bin+=$reads{$id_tmp};}
     $mean_bin=$total_bin/100;
     print OUA "\t$mean_bin";
    }

    ### 1000 bins of the gene body
    for($j=0;$j<1000;$j++)
    {
     $start_bin=int( (($3 + (($4-$3+1)/1000)*$j)*10 +5)/10 ); ## round; 4 she 5 ru
     $end_bin= int( (($3 + (($4-$3+1)/1000)*($j+1))*10 +5)/10 )-1;
     if($end_bin<$start_bin){$end_bin=$start_bin;} ## gene length <1kb, some bin is difficulty to split
     
     $total_bin=0;
     for($i=$start_bin;$i<=$end_bin;$i++){$id_tmp="chr$1_$i";$total_bin+=$reads{$id_tmp};}
     $mean_bin=int(100*$total_bin/($end_bin-$start_bin+1)+5)/100; ## mean of the bin
     print OUA "\t$mean_bin";
    }

    $start=$4+1; ## 100kb-down-TTS
    for($j=0;$j<1000;$j++)
    {
     $start_bin=$start+$j*100;
     $end_bin=$start+($j+1)*100-1;
     $total_bin=0;
     for($i=$start_bin;$i<=$end_bin;$i++){$id_tmp="chr$1_$i";$total_bin+=$reads{$id_tmp};}
     $mean_bin=$total_bin/100;
     print OUA "\t$mean_bin";
    }
    print OUA "\n";
   }
   elsif($5 eq "-")
   {
    print OUA "$6_$7";

    $end=$4+100000; ## 1kb-up-TSS
    for($j=0;$j<1000;$j++)
    {
     $end_bin=$end-$j*100;
     $start_bin=$end-($j+1)*100+1;
     $total_bin=0;
     for($i=$start_bin;$i<=$end_bin;$i++){$id_tmp="chr$1_$i";$total_bin+=$reads{$id_tmp};}
     $mean_bin=$total_bin/100;
     print OUA "\t$mean_bin";
    }

    ### 1000 bins of the gene body
    for($j=0;$j<1000;$j++)
    {
     $end_bin=int( (($4 - (($4-$3+1)/1000)*$j)*10 +5)/10 ); ## round; 4 she 5 ru
     $start_bin= int( (($4 - (($4-$3+1)/1000)*($j+1))*10 +5)/10 )+1;
     if($end_bin<$start_bin){$end_bin=$start_bin;}

     $total_bin=0;
     for($i=$start_bin;$i<=$end_bin;$i++){$id_tmp="chr$1_$i";$total_bin+=$reads{$id_tmp};}
     $mean_bin=int(100*$total_bin/($end_bin-$start_bin+1)+5)/100; ## mean of the bin
     print OUA "\t$mean_bin";
    }

    $end=$3-1;## 1kb-down-TTS
    for($j=0;$j<1000;$j++)
    {
     $end_bin=$end-$j*100;
     $start_bin=$end-($j+1)*100+1;
     $total_bin=0;
     for($i=$start_bin;$i<=$end_bin;$i++){$id_tmp="chr$1_$i";$total_bin+=$reads{$id_tmp};}
     $mean_bin=$total_bin/100;
     print OUA "\t$mean_bin";
    }

    print OUA "\n";
   }
  }
 }
 else{print "error3\t$_\n";}
}

undef %reads;

close INC; 
close INA; close INB;
}

close OUA;
print "Total-gene: $a1 $a2 \n";
}


