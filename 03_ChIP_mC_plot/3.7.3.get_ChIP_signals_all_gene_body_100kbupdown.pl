#! /usr/local/perl -w
 
@filenames=("Human_H3K27ac_PFC_1","Human_H3K27ac_PFC_2","Human_H3K27ac_dlPFC_1","Human_H3K27ac_PC_1");
 
foreach $names (@filenames)
{
open(OUA,">$names\_ChIP_allgene_body_100kbupdown.txt")||die("Can't write OUB:$!\n");
print "Working on sample: $names\n";

my $a1=$a2=$a3=$a4=0;


@chromo=("chr1","chr2","chr3","chr4","chr5","chr6","chr7","chr8","chr9","chr10","chr11","chr12","chr13",
         "chr14","chr15","chr16","chr17","chr18","chr19","chr20","chr21","chr22","chrX","chrY");
foreach $chromosome (@chromo)
{
print "Working on chromosome: $chromosome\n";

open(INA,"/media/RNA/Genome/Ensembl/exon_intron/Homo_sapiens.GRCh37.75.gtf.gene")||die("Can't open INB:$!\n");
open(INB,"split/$names\.sam.$chromosome")||die("Can't open INC:$!\n");
open(INC,"/media/RNA/Genome/Ensembl/exon_intron/Homo_sapiens.GRCh37.75.gtf.gene")||die("Can't open IND:$!\n");
 
while(<INA>)
{
 chomp;
 if(/^(\w\w?)\t(\w+)\tgene\t(\d+)\t(\d+)\t([+|-])\t(ENSG\d+)\t([\w\.\-\(\)]+)$/)
 {
  if($chromosome eq "chr$1") ## same chromosome
  {
   $a1++; print "Processes gene lines: $a1\n" if($a1%5000==0);

   $start=$3-100000; ## left location of 1kb-up-TSS
   $end=$4+100000;   ## right location of 1kb-down-TTS
   for($i=$start;$i<=$end;$i++){$id="chr$1_$i";$reads{$id}=0;}
  }
 }
 else{print "error1\t$_\n";}
}

while(<INB>)
{
 chomp;
 if(/^([\w\.\:\-]+)\t(\d+)\t(chr\w\w?)\t(\d+)\t\d+\t(\d+)M\t/)
 {
  if($chromosome eq $3) ## same chromosome
  {
   $total++; print "Processes lines: $total\n" if($total%1000000==0);
   
   if($2 == 0){$str="plus"; $left=$4; $right=$4+250-1;} ## entend to 250 bp for each fragment
   elsif($2 == 16){$str="minus"; $right=$4+$5-1; $left=$right-250+1; }
   else{print "error Strand-FLAG: $_\n";}

   for($i=$left;$i<=$right;$i++){$id="$3_$i";if(exists $reads{$id}){$reads{$id}++;} }
  }
  else{print "error wrong chromosome: $_\n";}
 }
# else{print "error2\t$_\n";}
}

while(<INC>)
{
 chomp;
 if(/^(\w\w?)\t(\w+)\tgene\t(\d+)\t(\d+)\t([+|-])\t(ENSG\d+)\t([\w\.\-\(\)]+)$/)
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
print "Total-gene: $a1 $a2 $a3 $a4\n";
}


