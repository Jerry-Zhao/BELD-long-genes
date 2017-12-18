#! /usr/local/perl -w
#print "This file will be the input file of DESeq2/edgeR analysis.\n\n";

@filenames=("GROseq_WT_cortex_rep1","GROseq_WT_cortex_rep2","GROseq_R106W_cortex_rep1","GROseq_R106W_cortex_rep2");
@chromo=("chr1","chr2","chr3","chr4","chr5","chr6","chr7","chr8","chr9","chr10","chr11","chr12","chr13","chr14","chr15","chr16","chr17","chr18","chr19","chrX","chrY");

foreach $sam (@filenames)
{

print "Working on File: $sam\n";

open(OUT,">$sam\_GRO_whole_gene_Jerry.txt")||die("Can't write OUT:$!\n");
 
my $total_reads=$overlap=$others=0;

foreach $chromosome (@chromo)
{
 open(INA,"../Mus_musculus.GRCm38.75.gtf.gene")||die("Can't open INA:$!\n");
 open(INC,"$sam\.sam.$chromosome")||die("Can't open INC:$!\n");
 
 print "Working on chromosome: $chromosome\n";

 while(<INA>)
 {
  chomp;
  if(/^(\w\w?)\t(\w+)\tgene\t(\d+)\t(\d+)\t([+|-])\t(ENSMUSG\d+)\t([\w\.\-\(\)]+)$/)
  {
   $chromosome_gene="chr$1";
   if($chromosome_gene eq $chromosome)
   {
    $total_gene_id++;
    if($5 eq "+") ## plus strand
    {
     $TSS_id="$chromosome_gene:$3-$4:$6_$7:$2:$5";
     $count{$TSS_id}=0;

     for($i=$3;$i<=$4;$i++)
     {
      if(exists $plus{$i}){$plus{$i}.=";;$TSS_id";} ## overlaped regions, more TSS IDs
      else{$plus{$i}=$TSS_id;}
     }
    }
    elsif($5 eq "-")
    {
     $TSS_id="$chromosome_gene:$3-$4:$6_$7:$2:$5";
     $count{$TSS_id}=0;
     
     for($i=$3;$i<=$4;$i++)
     {
      if(exists $minus{$i}){$minus{$i}.=";;$TSS_id";} ## overlaped regions, more TSS IDs
      else{$minus{$i}=$TSS_id;}
     }
    }
   }
  }
  else{print "error1\t$_\n";}
 }


 while(<INC>)
 {
  chomp;
  if(/^([\w\.\:\-]+)\t(\d+)\t(\w\w?)\t(\d+)\t\d+\t(\w+)\t/)
  {

   ### Right strand-specific: + 99/147;  - 163/83
   if($2 == 0){$str="plus"; }
   elsif($2 == 16){$str="minus";}
   else{print "error Strand-FLAG: $_\n";}


   $read_id=$1;
   $chr="chr$3";   ## read mapping chromosome
   if($chr ne $chromosome){print "error wrong sam-chr: $_\n";}

   $start=$4;             ## read mapping start

   $cigar=$5; ## using this to define the end position of the read
    ## M: match   
    ## I: read has insertion compared to the reference genome; no use for gene count
    ## D: read has deletion compared to the genome; useful
    ## H: hard clip of the reads; no use
    ## S: soft clip of the read;  no use
    ## N: skipped region of the genome; useful, intron region
    ## 
    ## End = Start + Ms + Ns + Ds.          

   $total_reads++; ## total reads
   print "Processes lines: $total_reads\n" if($total_reads%1000000==0);

   $label=0; ## first of the pair  
   while($cigar=~/(\d+)([A-Z])/g) 
   {
    if($2 eq "M")
    {
     for ($j=$start; $j<=($start+$1-1); $j++)
     {
      if(exists $$str{$j}) ## read overlap with introns
      {
       $label=1;
       if(exists $name{$read_id}) ## this read already overlap with introns
       {
        if($name{$read_id} =~ /$$str{$j}/){} ## already this intron ID
        else{$name{$read_id}.=";;$$str{$j}";} ## add this intron ID to this reads
       }
       else{$name{$read_id}=$$str{$j};} ## First intron overlap with this read
      }
     }
     $start=$start+$1; ## End of this match 
    }
    elsif(($2 eq "D") or ($2 eq "N")){$start=$start+$1;}## Add the insertion region
   }


   if($label==0){$non_overlap++;}
   elsif($label==1) ## pair mapped to intron
   {
    $overlap++;

    @arraylist=split(/;;/,$name{$read_id});
    foreach (@arraylist){$tmphash{$_}=0;}
    @newlist=keys %tmphash;
     
    foreach (@newlist){$count{$_}++;};
   }
   else{$others++;}
  
   delete $name{$read_id}; ## delete information of this reads from HASH
   foreach (keys %tmphash){delete $tmphash{$_};}
  }
  else{print "error2\t$_\n";}
 }

 foreach (keys %count){print OUT "$_\t$count{$_}\n"; $result++; delete $count{$_};}
 foreach (keys %plus){delete $plus{$_};}
 foreach (keys %minus){delete $minus{$_};}
  
 close INA; close INC;
}

print OUT "####  Total-reads:  $total_reads\n";
print OUT "####  Overlap: $overlap\n";
print OUT "####  Non-overlap: $non_overlap\n";

print "Total-reads: $total_reads\noverlap: $overlap\n";
print "Non-overlap: $non_overlap\nOthers: $others\n";
 
print "Total-genes: $total_gene_id\tResult gene ID: $result\n";

close INA;
close OUT;
}

