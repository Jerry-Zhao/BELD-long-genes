#! /usr/local/perl -w
# remove "NR" and "intergenic"
#Total-GWAS_Catalog_EBI_schizophrenia: 1266-2	 Total-mouse: 37362	 Total-mouse-unique-symbols: 37201	 schizophrenia-Mouse-both-exists: 861	 schizophrenia-no-mouse-gene: 405
#BED-gene:         185	schizophrenia-overlap-BED-gene:        26
#nonBEDlong-gene:         185	schizophrenia-overlap-nonBEDlong-gene:        16

# fisher.test(matrix(c(26,185-26,16,185-16),ncol=2),alternative="greater") #  p-value = 0.06975

#No-mouse-gene: ABCA10    Abca8b
#No-mouse-gene: ARHGAP11B Arhgap11a
#No-mouse-gene: C11orf30  Emsy
#No-mouse-gene: CLTCL1    Cltc
#No-mouse-gene: DDX53     Ddx43
#No-mouse-gene: HLA-A     H2-Q10
#No-mouse-gene: HLA-DRB1  H2-Eb1
#No-mouse-gene: HTR3C     Htr3a
#No-mouse-gene: NAALADL2  Naaladl2
#No-mouse-gene: NXF5      Nxf1
#No-mouse-gene: OR1C1     Olfr374
#No-mouse-gene: OR2M4     Olfr164
#No-mouse-gene: OR52M1    Olfr554
#No-mouse-gene: POT1      Pot1a
#No-mouse-gene: RHOXF1    Rhox10
#No-mouse-gene: SLCO1B3   Slco1b2
#No-mouse-gene: TAF1L     Taf1
#No-mouse-gene: TMLHE     Tmlhe
#No-mouse-gene: ZNF462    Zfp462
#No-mouse-gene: ZNF517    Zfp251
#No-mouse-gene: ZNF559    Gm19428
#No-mouse-gene: ZNF713    Zfp251
#No-mouse-gene: ZNF774    Prdm9



#   Human      Mouse
#   CNTNAP5    Cntnap5a/b/c
#   DIAPH3     Diap3
#   DRD1       Drd1a
#   KIAA2022   C77370

#   NOS2A      Nos2
#   SCN2A      Scn2a1
#   ZNF18      Zkscan6
#   ZNF385B    Zfp385b

#   ZNF407     Zfp407
#   ZNF8       Zfp128
#   ZNF804A    Zfp804a
#   ZNF827     Zfp827

#   C12orf57   Grcc10
#   C15orf43   4933406J08Rik
#   C3orf58    1190002N15Rik
#   CA6        Car6 

open(INA,"/media/RNA/Genome/Ensembl/exon_intron/Mus_musculus.GRCm38.75.gtf.gene")||die("Can't open ING:$!\n");
open(INB,"GWAS_Catalog_EBI_schizophrenia.txt")||die("Can't open INF:$!\n");
open(INC,"../02_BELD/BED_BED_Data_length_PI30_ChIP_RPKM_cortex_WT.xls")||die("Can't open INC:$!\n");
open(IND,"../02_BELD/BED_nonBEDlong_Data_length_PI30_ChIP_RPKM_cortex_WT.xls")||die("Can't open IND:$!\n"); 
 

while(<INA>)
{
 chomp;
 if(/^\w\w?\t\w+\t\w+\t\d+\t\d+\t[+|-]\tENSMUSG\d+\t([\w\.\-\(\)]+)$/)
 {
  $mouse_gene++;
  if(exists $mouse{$1}){print "error exists Mouse gene id: $_\n ";}else{$mouse{$1}=1; $mouse_gene2++;}
 }
 else{print "error-Mouse\t$_\n";}
}

while(<INB>)
{
 chomp;
 if(/^([A-Z])([\w\.\-\(\)]+)\s*/)
 {

  $first=$1; 
  $others=$2; $others=~tr/A-Z/a-z/;  ## lower case
  $id="$first$others"; ## New gene ID
  
  if($id eq "Cntnap5"){$id="Cntnap5a";}  if($id eq "Diaph3"){$id="Diap3";}  if($id eq "Drd1"){$id="Drd1a";} if($id eq "Kiaa2022"){$id="C77370";}
  if($id eq "Nos2a"){$id="Nos2";}  if($id eq "Scn2a"){$id="Scn2a1";}  if($id eq "Znf18"){$id="Zkscan6";}  if($id eq "Znf385b"){$id="Zfp385b";}
  if($id eq "Znf407"){$id="Zfp407";}  if($id eq "Znf8"){$id="Zfp128";}  if($id eq "Znf804a"){$id="Zfp804a";}  if($id eq "Znf827"){$id="Zfp827";}
  if($id eq "C12orf57"){$id="Grcc10";}  if($id eq "C15orf43"){$id="4933406J08Rik";}  if($id eq "C3orf58"){$id="1190002N15Rik";}  if($id eq "Ca6"){$id="Car6";}

  if($id eq "Abca10"){$id="Abca8b";} if($id eq "Arhgap11b"){$id="Arhgap11a";} if($id eq "C11orf30"){$id="Emsy";} if($id eq "Cltcl1"){$id="Cltc";}
  if($id eq "Ddx53"){$id="Ddx43";} if($id eq "Hla-a"){$id="H2-Q10";} if($id eq "Hla-drb1"){$id="H2-Eb1";} if($id eq "Htr3c"){$id="Htr3a";}
  if($id eq "Naaladl2"){$id="Naaladl2";} if($id eq "Nxf5"){$id="Nxf1";} if($id eq "Or1c1"){$id="Olfr374";} if($id eq "Or2m4"){$id="Olfr164";}
  if($id eq "Or52m1"){$id="Olfr554";} if($id eq "Pot1"){$id="Pot1a";} if($id eq "Rhoxf1"){$id="Rhox10";} if($id eq "Slco1b3"){$id="Slco1b2";}
  if($id eq "Taf1l"){$id="Taf1";} if($id eq "Tmlhe"){$id="Tmlhe";} if($id eq "Znf462"){$id="Zfp462";} if($id eq "Znf517"){$id="Zfp251";}
  if($id eq "Znf559"){$id="Gm19428";} if($id eq "Znf713"){$id="Zfp251";} if($id eq "Znf774"){$id="Prdm9";}
  

  if(exists $sfari{$id}){print "error exists SFARI gene id: $_\n ";}
  else
  {
   $sfari{$id}=$_; $sfari_gene++;
   if(exists $mouse{$id}){$sfari_mouse++;}else{print "No-mouse-gene: $1$2\n"; $sfari_nomouse++;}
  }
 }
 else{print "error-SFARI\t$_\n";$sfari_id=$_;}
}


while(<INC>)
{
 chomp;
 if(/^(chr\w\w?\:\d+\-\d+\:ENSMUSG\d+\_)([\w\.\-\(\)]+)(\:\w+\:[+|-])\t/)
 {
  $a1++;
  if(exists $sfari{$2})
  {
   $a2++; 
  }
 }
 else{print "error1\t$_\n";}
}

while(<IND>)
{
 chomp;
 if(/^(chr\w\w?\:\d+\-\d+\:ENSMUSG\d+\_)([\w\.\-\(\)]+)(\:\w+\:[+|-])\t/)
 {
  $a3++;
  if(exists $sfari{$2})
  {
   $a4++; 
  }
 }
 else{print "error1\t$_\n";}
}



print "Total-GWAS_Catalog_EBI_schizophrenia: $sfari_gene\t Total-mouse: $mouse_gene\t Total-mouse-unique-symbols: $mouse_gene2\t schizophrenia-Mouse-both-exists: $sfari_mouse\t schizophrenia-no-mouse-gene: $sfari_nomouse\n";
print "BED-gene:         $a1\tschizophrenia-overlap-BED-gene:        $a2\n";
print "nonBEDlong-gene:         $a3\tschizophrenia-overlap-nonBEDlong-gene:        $a4\n";



