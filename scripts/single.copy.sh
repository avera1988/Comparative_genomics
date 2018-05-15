#!/bin/bash

if [ $# -eq 0 ]; then
        echo "usage: $0 tmp number_of_genomes_used_in_get_homologues output_dir_for_single_copy_genes";
        exit 1;
        fi
tmp=$1
taxa=$2
dir=$3
echo "obtaining single copy taxa"
for i in *.faa ;
        do

        FILE=$i; TAXA=$(grep -c '>' $i);
        echo -e $FILE'\t'$TAXA;

done > tmp
echo "single copy taxa in list.single"
  perl -e '($tmp,$n)=@ARGV; open(ARCH, $tmp); while(<ARCH>){chomp; @c=split(/\t/);if($c[1]==$n){print "$c[0]\n";}}' tmp $taxa > list.single

#rm tmp
single=$(cat list.single|wc -l)
echo "there are:" $single "single copy orthologues"
echo "new single core dir"
mkdir $dir

while read -r line
do
    name="$line"
      cp  $name $dir
done < list.single
echo "single copy are in " $dir


