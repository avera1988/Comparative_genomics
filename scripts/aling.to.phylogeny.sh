#!/bin/bash

cpu=$1
scripts='/home/veraponcedeleon.1/bin/Comparative_genomics/scripts'
multigenome='/home/veraponcedeleon.1/bin/multigenome2blocks/scripts'

for i in *.faa;
	do
	cat $i | perl $scripts/mod.header.for.alin.core.pl|sed 's/ /_/g' > $i.mod;
done
bash $scripts/mafft.sh mod $cpu 
cat *.alin > all.core.alin.fasta
perl $multigenome/merge_seqs.pl all.core.alin.fasta > all.core.alin.fasta.merged
sed 's/*//g' all.core.alin.fasta.merged > all.core.alin.fasta.merged.sinstar
mafft --thread $cpu all.core.alin.fasta.merged.sinstar > all.core.alin.fasta.merged.sinstar.alin.end
$multigenome/Gblocks all.core.alin.fasta.merged.sinstar.alin.end g
