#!/bin/bash

if [ $# -eq 0 ]; then
        echo "usage: $0 tmp number_of_genomes_used_in_get_homologues output_dir_for_single_copy_genes";
        exit 1;
        fi
tmp=$1
taxa=$2
dir=$3
for i in *.faa ; do
        FILE=$i; TAXA=$(grep -c '>' $i);
        echo "$FILE     $TAXA"; done > tmp
perl -e '($tmp,$n)=@ARGV; open(ARCH, $tmp); while(<ARCH>){chomp; @c=split(/\t/);if($c[1] == $n){print "$c[0]\t$c[1]\n";}}' $tmp $ta
xa > list.single

mkdir $dir

while read -r line
do
    name="$line"
      cp  $name $dir
done < list.single




