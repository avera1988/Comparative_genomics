#!/bin/bash
####################################################################################
#This script runs PROKKA over multiple genomes for annotation an then uses the protein
#predicted for orthologs classification by get_homologues
#At the end it gives you the Core and Pan Genome Matrix for comparative genomics
#Author Arturo Vera
#Dec 2017
#####################################################################################

if [ $# -eq 0 ]; then
        echo "usage: $0 extention_file gen_code num_cpus path_to_comparative_genomics_scripts";
        exit 1;
        fi

term=$1
g_code=$2
cpu=$3
scripts=$4
mkdir annotation
echo "annotation"
cd annotation
ln -s ../*.$term .
for i in *.$term
        do
        perl  $scripts/cambia_seqs_unalinea.pl $i > $i.una
done
for b in *.una ;
        do
        perl -e 'while(<>){chomp; if($_ =~ /^>/){@header=split(/\_/);}else{$seq=$_; print "$header[0]_$header[1]_$header[5]\n$seq\n
";}}' $b > $b.mod
done
for i in *.mod
        do
        a=$(echo $i|cut -d . -f 1);
        prokka --outdir $i.dir --prefix $a.dir --cpu $cpu --locustag $a $i
done
echo "protein annotation in folder: protein"
mkdir protein
 cd protein
 for i in ../*.dir ;
        do
        ln -s $i/*.faa . ;

done
for i in *.faa
        do
        perl  $scripts/cambia_seqs_unalinea.pl $i > $i.una
done

mkdir get_homologues
cd get_homologues
dir=$(pwd)
ln -s ../*una .
echo "Add tax info to header"
for i in *una ;
        do
        a=$(echo $i| awk '{split($0, b, "\\.[0-9]"); print b[1]}');
        mv $i $a.mod.faa;
done
for i in *.mod.faa ;
        do
        a=$(echo $i|awk -F ".mod" '{print $1}');
        perl $scripts/c_header.gethomologes.pl $i $a > $a.mod.fasta ;
done
rm *.mod.faa
cd ..
echo "running Get Homologues"
time get_homologues.pl -d $dir -A -c -t 0 -M -n $cpu
echo "comparing clusters"
compare_clusters.pl -o sample_intersection -d get_homologues_homologues/*axa_algOMCL_e0_/ -m
echo "Obtaining core genome"
parse_pangenome_matrix.pl -m sample_intersection/pangenome_matrix_t0.tab -s

cd sample_intersection
mkdir core
d=$(pwd)
echo "puting all core genome genes in $d/core"
$scripts/while_uniq.sh pangenome_matrix_t0__core_list.txt core
echo "I've finished"
