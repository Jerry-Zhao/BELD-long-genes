#! /usr/local/perl -w
## Jerry's ChIP-seq pipeline
## Needed: bowtie  samtools  igvtools
## Needed: Location of the Bowtie-genome folder
$bowtie_genome="/media/RNA/Genome/Bowtie/hg19";
## Needed: Location of the igvtools-genome folder
$igvtools_genome="/home/jerry/igv/genomes/hg19.genome";

print "!!!!!!!\nHi Jerry, a new journey of ChIP-seq analysis has began.\n\n";
print "Please enter the input FASTQ file: donot need '.fastq'\n";
chomp($name=<STDIN>);


print "\n\nbowtie -v 2 -m 1 -p 10\n";
print "Bowtie mapping
   -v 2: up to two mismatch
   -m 1: only report reads that mapped once 
   -p 10: using 10 processors
\n\n";
print "igvtools count -z 5 -w 25 -e 250\n";
print "     -z, num     Specifies the maximum zoom level to precompute.
     -w, num   The window size over which coverage is averaged. Defaults to 25 bp.
     -e, --extFactor num   The read or feature is extended by the specified distance
         in bp prior to counting. This option is useful for chip-seq and rna-seq 
         applications. The value is generally set to the average fragment length 
         of the library minus the average read length.\n\n\n";

print "\n\n Working on the bowtie mapping.\n";
system ("bowtie -v 2 -m 1 -p 3 $bowtie_genome -q $name.fastq -S $name.sam");


print "\n\nWorking on removing the unmapped reads.\n";
open(INA,"$name.sam")||die("Can't open INA: $name.sam $!\n");
open(OUA,">$name\_uniq.sam")||die("Can't write OUA:$!\n");

while(<INA>)
{
 chomp;
 $a1++;
 if(/^@/){print OUA "$_\n";$a2++;}
 elsif(/^([\w\.\-\:\/\#]+)\t\d+\tchr\w+\t/)
 {
  $a3++; $a4++;
  print OUA "$_\n";
 }
 elsif(/^([\w\.\-\:\/\#\s]+)\t4\t\*\t0/)
 {
  $a3++; $a7++;
 }
 else{print "error1\t$_\n";}
}

print "Total-Bowtie output: $a1\t title-lines: $a2\n";
print "Total-reads: $a3\n";
print "Unique-mapped: $a4\n";
print "Un-mapped: $a7\n";

close INA;
close OUA;

system("rm $name.sam");

print "\n\n\nWorking on the samtools.\n";
system("samtools view -bS $name\_uniq.sam >$name.bam");
system("samtools sort $name.bam $name\_sort");
system("samtools index $name\_sort.bam");


my $uniquemapper=`wc -l < $name\_uniq.sam`; ## get the uniquely mapped read number(including 24 header lines)
#print "\nThe total uniquely mapped reads is $uniquemapper -24\n";
$igv_value=int(($uniquemapper - 24)*5/1000000);
#print "The TDF file track value is $igv_value\n";

print "\n\nWorking on the igvtools.\n\n";
system("igvtools count -z 5 -w 25 -e 250 $name\_sort.bam $name\_$igv_value.tdf $igvtools_genome");

print "\n\n\nCongratulation, Jerry. \nYou have finished the ChIP-seq analysis for file $name.fastq\nGo get a beer.\n";


