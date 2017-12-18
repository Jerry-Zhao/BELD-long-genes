#! /usr/local/perl -w

@filenames=("GROseq_WT_cortex_rep1","GROseq_WT_cortex_rep2","GROseq_R106W_cortex_rep1","GROseq_R106W_cortex_rep2");

foreach $names (@filenames)
{
open(OUA,">../../Count_all_genes/GROseq/$names\_GROseq_body_allgene_sense.txt")||die("Can't write OUB:$!\n");
print "Working on sample: $names\n";

my $a1=$a2=$a3=$a4=0;


@chromo=("chr1","chr2","chr3","chr4","chr5","chr6","chr7","chr8","chr9","chr10","chr11","chr12","chr13","chr14","chr15","chr16","chr17","chr18","chr19","chrX","chrY");
foreach $chromosome (@chromo)
{
print "Working on chromosome: $chromosome\n";

## + strand genes
open(INA,"/media/RNA/Genome/Ensembl/exon_intron/Mus_musculus.GRCm38.75.gtf.gene")||die("Can't open INB:$!\n");
open(INB,"../../Count_all_genes/GROseq/$names\_plus.bedGraph")||die("Can't open INC:$!\n");
open(INC,"/media/RNA/Genome/Ensembl/exon_intron/Mus_musculus.GRCm38.75.gtf.gene")||die("Can't open IND:$!\n");

## - strand genes
open(IND,"/media/RNA/Genome/Ensembl/exon_intron/Mus_musculus.GRCm38.75.gtf.gene")||die("Can't open INB:$!\n");
open(INE,"../../Count_all_genes/GROseq/$names\_minus.bedGraph")||die("Can't open INC:$!\n");
open(INF,"/media/RNA/Genome/Ensembl/exon_intron/Mus_musculus.GRCm38.75.gtf.gene")||die("Can't open IND:$!\n");

### working on the + strand genes
while(<INA>)
{
 chomp;
 if(/^(\w\w?)\t(\w+)\tgene\t(\d+)\t(\d+)\t([+|-])\t(ENSMUSG\d+)\t([\w\.\-\(\)]+)$/)
 {
  if($chromosome eq "chr$1") ## same chromosome
  {
   $a1++; print "Processes gene lines: $a1\n" if($a1%5000==0);
   if($5 eq "+") ## plus strand
   {
    $start=$3-1000; ## Start location of 1kb-up-TSS
    $end=$4+1000;   ## end location of 1kb-down-TTS
    for($i=$start;$i<=$end;$i++){$id="chr$1_$i";$plus{$id}=0;}
   }
  }
 }
 else{print "error1\t$_\n";}
}

while(<INB>)
{
 chomp;
 if(/^(\w\w?)\t(\d+)\t(\d+)\t(\d+)$/)
 {
  if($chromosome eq "chr$1") ## same chromosome
  {
   $total++; print "Processes lines: $total\n" if($total%1000000==0);
   for($i=$2+1;$i<=$3;$i++) ## the bedGraph files, last-line-end-point is the same as the current-line-start-point; left<X<=end -> value
   {
    $id="chr$1_$i";
    if(exists $plus{$id}){$plus{$id}+=$4;}               ## sense of the +strand gene
   }
  }
 }
# else{print "error2\t$_\n";}
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
    
    $start=$3-1000; $end=$3-1; for($i=$start;$i<=$end;$i++){$id="chr$1_$i"; print OUA "\t$plus{$id}";} ## 1kb-up-TSS

    ### 1000 bins of the gene body
    for($j=0;$j<1000;$j++)
    {
     $start_bin=int( (($3 + (($4-$3+1)/1000)*$j)*10 +5)/10 ); ## round; 4 she 5 ru
     $end_bin= int( (($3 + (($4-$3+1)/1000)*($j+1))*10 +5)/10 )-1;
     if($end_bin<$start_bin){$end_bin=$start_bin;} ## gene length <1kb, some bin is difficulty to split
     
     $total_bin=0;
     for($i=$start_bin;$i<=$end_bin;$i++){$id_tmp="chr$1_$i";$total_bin+=$plus{$id_tmp};}
     $mean_bin=int(100*$total_bin/($end_bin-$start_bin+1)+5)/100; ## mean of the bin
     print OUA "\t$mean_bin";
    }

    $start=$4+1; $end=$4+1000; for($i=$start;$i<=$end;$i++){$id="chr$1_$i"; print OUA "\t$plus{$id}";} ## 1kb-down-TTS
    print OUA "\n";
   }
  }
 }
 else{print "error3\t$_\n";}
}

undef %plus;



### working on the - strand genes
while(<IND>)
{
 chomp;
 if(/^(\w\w?)\t(\w+)\tgene\t(\d+)\t(\d+)\t([+|-])\t(ENSMUSG\d+)\t([\w\.\-\(\)]+)$/)
 {
  if($chromosome eq "chr$1") ## same chromosome
  {
   $a3++; print "Processes gene lines: $a1\n" if($a1%5000==0);
   if($5 eq "-")
   {
    $right=$4+1000; ## Start location of 1kb-up-TSS
    $left=$3-1000; ## End/left
    for($i=$left;$i<=$right;$i++){$id="chr$1_$i";$minus{$id}=0;}
   }
  }
 }
 else{print "error4\t$_\n";}
}


while(<INE>)
{
 chomp;
 if(/^(\w\w?)\t(\d+)\t(\d+)\t(\d+)$/)
 {
  if($chromosome eq "chr$1") ## same chromosome
  {
   $total++; print "Processes lines: $total\n" if($total%1000000==0);
   for($i=$2+1;$i<=$3;$i++)
   {
    $id="chr$1_$i";
    if(exists $minus{$id}){$minus{$id}+=$4;}
   }
  }
 }
# else{print "error5\t$_\n";}
}


while(<INF>)
{
 chomp;
 if(/^(\w\w?)\t(\w+)\tgene\t(\d+)\t(\d+)\t([+|-])\t(ENSMUSG\d+)\t([\w\.\-\(\)]+)$/)
 {
  if($chromosome eq "chr$1") ## same chromosome
  {
   $a4++;
   if($5 eq "-")
   {
    print OUA "$6_$7";
 
    $start=$4+1; $end=$4+1000; for($i=$end;$i>=$start;$i--){$id="chr$1_$i"; print OUA "\t$minus{$id}";} ## 1kb-up-TSS

    ### 1000 bins of the gene body
    for($j=0;$j<1000;$j++)
    {
     $end_bin=int( (($4 - (($4-$3+1)/1000)*$j)*10 +5)/10 ); ## round; 4 she 5 ru
     $start_bin= int( (($4 - (($4-$3+1)/1000)*($j+1))*10 +5)/10 )+1;
     if($end_bin<$start_bin){$end_bin=$start_bin;}

     $total_bin=0;
     for($i=$start_bin;$i<=$end_bin;$i++){$id_tmp="chr$1_$i";$total_bin+=$minus{$id_tmp};}
     $mean_bin=int(100*$total_bin/($end_bin-$start_bin+1)+5)/100; ## mean of the bin
     print OUA "\t$mean_bin";
    }

    $start=$3-1000; $end=$3-1; for($i=$end;$i>=$start;$i--){$id="chr$1_$i"; print OUA "\t$minus{$id}";} ## 1kb-down-TTS
 
    print OUA "\n";
   }
  }
 }
 else{print "error6\t$_\n";}
}

undef %minus;
close INC; 
close INA; close INB; close IND;

}

close OUA;
print "Total-gene: $a1 $a2 $a3 $a4\n";
}


